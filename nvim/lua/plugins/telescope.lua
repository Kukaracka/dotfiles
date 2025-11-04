return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ss", LazyVim.pick("lsp_document_symbols"), desc = "Goto Symbol" },
    { "<leader>sS", LazyVim.pick("lsp_workspace_symbols"), desc = "Goto Symbol (Workspace)" },
  },
}
