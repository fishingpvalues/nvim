-- track.nvim: Enhanced marks with descriptions for tracking code reading
-- GitHub: https://github.com/niuiic/track.nvim
return {
  "niuiic/track.nvim",
  event = "VeryLazy",
  config = function()
    require("track").setup({
      -- Mark highlighting
      mark_hl_group = "WarningMsg",
      mark_icon = "󰍒",

      -- Outline window settings
      win_pos = "left",
      win_size = 30,
      win_title = "Track Marks",

      -- Auto save/load
      enable_auto_save = true,
      enable_auto_load = true,

      -- Storage path for marks
      storage_path = vim.fn.stdpath("data") .. "/track",

      -- Key mappings in outline window
      key = {
        quit = "q",
        open = "<cr>",
        open_split = "s",
        open_vsplit = "v",
        up = "<A-k>",
        down = "<A-j>",
        delete = "d",
        goto_file = "g",
        yank = "y",
      },
    })

    -- Keybindings for track operations
    vim.keymap.set("n", "<leader>tt", function()
      require("track").toggle()
    end, { desc = "[T]rack [T]oggle outline" })

    vim.keymap.set("n", "<leader>ta", function()
      require("track").addMark()
    end, { desc = "[T]rack [A]dd mark" })

    vim.keymap.set("n", "<leader>td", function()
      require("track").deleteMark()
    end, { desc = "[T]rack [D]elete mark" })

    vim.keymap.set("n", "<leader>te", function()
      require("track").editMark()
    end, { desc = "[T]rack [E]dit mark" })

    vim.keymap.set("n", "<leader>tn", function()
      require("track").nextMark()
    end, { desc = "[T]rack [N]ext mark" })

    vim.keymap.set("n", "<leader>tp", function()
      require("track").previousMark()
    end, { desc = "[T]rack [P]revious mark" })

    -- Auto-update marks on file operations
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        pcall(function()
          require("track").save()
        end)
      end,
    })

    -- Create storage directory if needed
    local storage_path = vim.fn.stdpath("data") .. "/track"
    if vim.fn.isdirectory(storage_path) == 0 then
      vim.fn.mkdir(storage_path, "p")
    end
  end,
}
