-- esqueleto.nvim: File templates and skeletons for new files
-- GitHub: https://github.com/cvigilv/esqueleto.nvim
return {
  "cvigilv/esqueleto.nvim",
  event = { "BufNewFile" },
  config = function()
    require("esqueleto").setup({
      patterns = {
        "LICENSE",
        "README",
        "python",
        "lua",
        "javascript",
        "typescript",
        "rust",
        "go",
        "c",
        "bash",
        "html",
        "css",
      },
      -- Use templates from the skeletons directory
      directories = {
        vim.fn.stdpath("config") .. "/skeletons",
      },
    })

    -- Create skeletons directory if it doesn't exist
    local skeletons_dir = vim.fn.stdpath("config") .. "/skeletons"
    if vim.fn.isdirectory(skeletons_dir) == 0 then
      vim.fn.mkdir(skeletons_dir, "p")
    end
  end,
}
