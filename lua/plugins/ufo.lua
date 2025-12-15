-- nvim-ufo: Advanced code folding with SOTA settings
return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufRead",  -- Resolves initial buffer issues
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "UFO: Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "UFO: Close all folds" },
    { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "UFO: Open folds except kinds" },
    { "zm", function() require("ufo").closeFoldsWith() end, desc = "UFO: Close folds with" },
    { "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "UFO: Peek fold" },
  },
  opts = {
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
      default = { "imports", "comment" },
      json = { "array" },
      c = { "comment", "region" },
    },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
    provider_selector = function(bufnr, filetype, buftype)
      -- Use treesitter as primary, fallback to indent
      return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ("  %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end,
  },
  init = function()
    -- Required fold settings
    vim.o.foldcolumn = "1"  -- '0' for no fold column, '1' for minimal
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
} 