-- vim-fugitive: Git integration for Neovim
return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = {
    { "<leader>gs", "<cmd>Git<CR>", desc = "Git: Status" },
    { "<leader>ga", ":Git add ", desc = "Git: Add (type file)" },
    { "<leader>gA", "<cmd>Git add .<CR>", desc = "Git: Add All" },
    { "<leader>gc", ":Git commit -m \"", desc = "Git: Commit (type message)" },
    { "<leader>gp", "<cmd>Git push<CR>", desc = "Git: Push" },
    { "<leader>gP", "<cmd>Git pull<CR>", desc = "Git: Pull" },
    { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git: Blame" },
    { "<leader>gL", "<cmd>Git log<CR>", desc = "Git: Log" },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git: Diff Split" },
    { "<leader>gj", "<cmd>diffget //3<CR>", desc = "Git: Get Right (merge)" },
    { "<leader>gf", "<cmd>diffget //2<CR>", desc = "Git: Get Left (merge)" },
  },
}
