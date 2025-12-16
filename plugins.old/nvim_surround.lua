-- nvim-surround: Add/change/delete surrounding delimiter pairs
-- GitHub: https://github.com/kylechui/nvim-surround
return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
      surrounds = {
        ["("] = {
          add = { "( ", " )" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a)" })
          end,
          delete = "^(. (.-).)$",
          change = {
            target = "^(.)(.*)(.)" .. "$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        [")"] = {
          add = { "(", ")" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a)" })
          end,
          delete = "^(.)(.*)(.)" .. "$",
          change = {
            target = "^(. (.-).)$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        ["{"] = {
          add = { "{ ", " }" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a}" })
          end,
          delete = "^(. (.-).)$",
          change = {
            target = "^(.)(.*)(.)" .. "$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        ["}"] = {
          add = { "{", "}" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a}" })
          end,
          delete = "^(.)(.*)(.)" .. "$",
          change = {
            target = "^(. (.-).)$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        ["["] = {
          add = { "[ ", " ]" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a]" })
          end,
          delete = "^(. (.-).)$",
          change = {
            target = "^(.)(.*)(.)" .. "$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        ["]"] = {
          add = { "[", "]" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a]" })
          end,
          delete = "^(.)(.*)(.)" .. "$",
          change = {
            target = "^(. (.-).)$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        ["<"] = {
          add = { "< ", " >" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a>" })
          end,
          delete = "^(. (.-).)$",
          change = {
            target = "^(.)(.*)(.)" .. "$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
        [">"] = {
          add = { "<", ">" },
          find = function()
            return require("nvim-surround.queries").get_selection({ motion = "a>" })
          end,
          delete = "^(.)(.*)(.)" .. "$",
          change = {
            target = "^(. (.-).)$",
            replacement = function(matches)
              return { matches[1], matches[2], matches[3] }
            end,
          },
        },
      },
      indent_lines = false,
      move_cursor = "begin",
    })
  end,
}
