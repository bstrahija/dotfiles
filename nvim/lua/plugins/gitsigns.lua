return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "|" },
                change = { text = "|" },
                delete = { text = "_" },
                topdelete = { text = "~" },
                changedelete = { text = "~" },
                untracked = { text = "+" },
            },
            signs_staged = {
                add = { text = "|" },
                change = { text = "|" },
                delete = { text = "_" },
                topdelete = { text = "~" },
                changedelete = { text = "~" },
                untracked = { text = "+" },
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            current_line_blame = false,
            on_attach = function(bufnr)
                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = bufnr,
                        desc = desc,
                    })
                end

                map("n", "]h", gitsigns.next_hunk, "Next Hunk")
                map("n", "[h", gitsigns.prev_hunk, "Previous Hunk")
                map("n", "<leader>hs", gitsigns.stage_hunk, "Stage Hunk")
                map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>hr", gitsigns.reset_hunk, "Reset Hunk")
                map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
                map("n", "<leader>hb", gitsigns.blame_line, "Blame Line")
                map("n", "<leader>hB", gitsigns.toggle_current_line_blame, "Toggle Blame")
            end,
        })
    end,
}
