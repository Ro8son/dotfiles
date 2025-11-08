vim.lsp.enable('gopls')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
vim.diagnostic.config({ virtual_lines = true })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		--if not client then return end
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		--vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

		vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert', 'fuzzy', 'popup' }
		vim.keymap.set('i', '<C-Space>', function()
			vim.lsp.completion.get()
		end, { buffer = args.buf, desc = 'Trigger LSP completion' })
		vim.keymap.set('i', '<Tab>', function() 
			return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>' end, { expr = true })
		vim.keymap.set('i', '<S-Tab>', function() 
			return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>' end, { expr = true })
		vim.keymap.set('i', '<Return>', function() 
			return vim.fn.pumvisible() == 1 and '<C-y>' or '<Return>' end, { expr = true })
	end,
})
