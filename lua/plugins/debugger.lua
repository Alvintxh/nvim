return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			----------------------------------------
			-- 基础插件初始化
			----------------------------------------
			require("mason").setup()

			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			-- 打开/关闭 dap-ui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			----------------------------------------
			-- mason-nvim-dap：安装 & 基础适配
			----------------------------------------
			require("mason-nvim-dap").setup({
				-- 这里写要安装的 adapter 名字（Mason 里看到的那一列）
				ensure_installed = {
					"python", -- debugpy
					"codelldb", -- C/C++/Rust
				},
				automatic_installation = true,
				handlers = {
					-- 默认 handler（大部分语言直接用就行）
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,

					-- Python 单独调一下，用 nvim-dap-python
					python = function(_)
						-- debugpy 在 mason 里的路径（如果你自定义了 mason 路径，这里要改）
						local debugpy_python = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

						-- 用这个 python 解释器启动 debugpy
						require("dap-python").setup(debugpy_python)

						-- 也可以顺便设置一下默认配置（不写也行，dap-python 有默认）
						-- local dap = require("dap")
						-- dap.configurations.python = {
						--   {
						--     type = "python",
						--     request = "launch",
						--     name = "Launch file",
						--     program = "${file}",
						--     console = "integratedTerminal",
						--   },
						-- }
					end,
				},
			})

			----------------------------------------
			-- C / C++ / Rust 使用 codelldb
			----------------------------------------
			-- mason 会在 data/mason/bin 里放一层 shim，直接用就行
			local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}

			-- C / C++
			dap.configurations.c = {
				{
					name = "Launch C/C++ file",
					type = "codelldb",
					request = "launch",
					program = function()
						-- 这里手动输入编译好的可执行文件路径
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c

			-- Rust
			dap.configurations.rust = {
				{
					name = "Launch Rust binary",
					type = "codelldb",
					request = "launch",
					program = function()
						-- 简单猜一下 cargo build 之后的默认路径
						local cwd = vim.fn.getcwd()
						local cargo_toml = cwd .. "/Cargo.toml"
						if vim.fn.filereadable(cargo_toml) == 1 then
							local crate = vim.fn.fnamemodify(cwd, ":t")
							local exe = cwd .. "/target/debug/" .. crate
							if vim.fn.filereadable(exe) == 1 then
								return exe
							end
						end
						-- 找不到就手输
						return vim.fn.input("Path to executable: ", cwd .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			----------------------------------------
			-- 快捷键（自己改成喜欢的）
			----------------------------------------
			local map = vim.keymap.set

			map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
			map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
			map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
			map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "DAP Conditional Breakpoint" })

			map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
			map("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
		end,
	},
}
