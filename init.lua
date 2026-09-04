vim.g.mapleader = " "         -- Set leader key to space for custom key bindings
vim.g.maplocalleader = " " -- <localleader> defaults to "\" independently of mapleader unless set explicitly -- keep both on spacebar
vim.opt.number = true         -- Display line numbers in the gutter
vim.opt.relativenumber = true -- Display relative line numbers
vim.opt.mouse = "a"           -- Display line numbers in the gutter
-- vim.opt.clipboard = "unnamedplus" -- Enable mouse support in all modes
-- vim.opt.breakindent = true -- Preserve indentation when wrapping lines
vim.opt.undofile = true -- Save undo history to file for persistence across sessions
vim.opt.signcolumn = "yes" -- Always show sign column (prevents layout shift for git/diagnostic signs)
vim.opt.splitright = true -- Open vertical splits to the right of current window
vim.opt.splitbelow = true -- Open horizontal splits below current window
vim.opt.list = true -- Display whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Define how whitespace characters are displayed (tabs, trailing spaces, nbsp)
vim.opt.inccommand = "split" -- Show live preview of substitute commands in split window
vim.opt.cursorline = false -- Highlight the line containing the cursor
vim.opt.scrolloff = 3 -- Keep 3 lines visible above/below cursor when scrolling
vim.opt.updatetime = 250 -- Faster update time for better UX (affects CursorHold, swap file writes)
vim.opt.timeoutlen = 300 -- Time to wait for mapped sequence to complete (milliseconds)
vim.opt.termguicolors = true -- Enable 24-bit RGB colors in the terminal
vim.opt.completeopt = { "menuone", "noselect", "popup" } -- Prevent LSP completion from auto-selecting the first item
vim.opt.backspace = { "indent", "eol", "start" } -- allow backspacing over everything in insert mode
vim.opt.ruler = true -- show the line and column number of the cursor position, separated by a comma
vim.opt.laststatus = 2 -- the value of this option influences when the last window will have a status line
vim.opt.background = "dark"
vim.opt.history = 50
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showfulltag = true
vim.opt.compatible = false
vim.opt.wildmenu = true
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.grepprg = "rg --vimgrep"

-- Filetype-specific indentation settings (override vim-sleuth)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "yaml" },
    callback = function()
        vim.b.sleuth_automatic = 0
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end,
})

vim.pack.add({
    -- Editor behavior
    { src = "https://github.com/tpope/vim-sleuth" },        -- Auto-detect indentation (tabs/spaces)
    { src = "https://github.com/tpope/vim-abolish" },       -- Advanced search/replace with case variants
    { src = "https://github.com/notjedi/nvim-rooter.lua" }, -- Auto-change working directory to project root

    -- Theme and UI
    { src = "https://github.com/EdenEast/nightfox.nvim" },    -- Color scheme
    { src = "https://github.com/akinsho/bufferline.nvim" },   -- Tab/buffer line at the top
    { src = "https://github.com/nvim-lualine/lualine.nvim" }, -- Status line at the bottom
    { src = "https://github.com/j-hui/fidget.nvim" },         -- LSP progress notifications
    { src = "https://github.com/folke/which-key.nvim" },      -- Show available key bindings in popup
    -- solarized theme
    { src = "https://github.com/maxmx03/solarized.nvim" },

    -- Syntax and language support
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },             -- Modern syntax highlighting
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax-aware text objects

    -- Git integration
    { src = "https://github.com/tpope/vim-fugitive" },      -- Git commands within vim
    { src = "https://github.com/sindrets/diffview.nvim" },  -- Enhanced diff viewer
    { src = "https://github.com/f-person/git-blame.nvim" }, -- Show git blame as virtual text
    { src = "https://github.com/lewis6991/gitsigns.nvim" }, -- Git diff signs in gutter

    -- File navigation and search
    { src = "https://github.com/nvim-lua/plenary.nvim" },                        -- Lua utility library (dependency)
    { src = "https://github.com/nvim-telescope/telescope.nvim" },                -- Fuzzy finder (files, text, buffers)
    { src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" }, -- Add args to live_grep
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },                      -- File explorer tree view

    -- LSP (Language Server Protocol)
    { src = "https://github.com/neovim/nvim-lspconfig" },                  -- LSP configuration presets
    { src = "https://github.com/mason-org/mason.nvim" },                   -- Language server installer
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },         -- Bridge mason & lspconfig
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" }, -- Inline LSP diagnostics
    { src = "https://github.com/folke/trouble.nvim" },                     -- Diagnostic list UI

    -- Code completion and AI
    { src = "https://github.com/Saghen/blink.lib" },    -- Required by blink.cmp v2
    { src = "https://github.com/Saghen/blink.cmp" },    -- Completion engine

    { src = "https://github.com/folke/sidekick.nvim" }, -- AI assistant (Claude)

    -- Code formatting
    { src = "https://github.com/stevearc/conform.nvim" }, -- Format-on-save with multiple formatters

    -- Snippets
    { src = "https://github.com/L3MON4D3/LuaSnip" },             -- Snippet engine
    { src = "https://github.com/rafamadriz/friendly-snippets" }, -- Collection of pre-made snippets

    -- flash
    { src = "https://github.com/folke/flash.nvim" },

    -- rust
    { src = "https://github.com/mrcjkb/rustaceanvim" },

    -- GitHub PR review inside nvim (pi-agent-k8s inbox-cli's `inbox review`
    -- opens this via `:Octo pr edit <n>` + `:Octo review start`)
    { src = "https://github.com/pwntester/octo.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- file icons; octo's review file-panel requires this, not just nvim-tree
})

-- Load all optional packages before any require() calls
for _, pkg in ipairs({
    "solarized.nvim", "nightfox.nvim",
    "nvim-treesitter", "nvim-treesitter-textobjects",
    "plenary.nvim", "telescope.nvim", "telescope-live-grep-args.nvim",
    "nvim-tree.lua", "nvim-rooter.lua",
    "bufferline.nvim", "lualine.nvim", "fidget.nvim", "which-key.nvim",
    "tiny-inline-diagnostic.nvim", "sidekick.nvim", "trouble.nvim", "flash.nvim",
    "LuaSnip", "friendly-snippets",
    "mason.nvim", "mason-lspconfig.nvim", "nvim-lspconfig",
    "blink.lib", "blink.cmp",
    "conform.nvim",
    "gitsigns.nvim", "git-blame.nvim", "diffview.nvim", "vim-fugitive",
    "rustaceanvim", "vim-sleuth", "vim-abolish",
    "octo.nvim", "nvim-web-devicons",
}) do
    vim.cmd.packadd(pkg)
end

-- ============================================================================
-- THEME
-- ============================================================================

-- Apply the carbonfox color scheme
-- vim.cmd.colorscheme("carbonfox")
require("solarized").setup({
    transparent = {
        enabled = true,
    }
})
vim.cmd.colorscheme("solarized")

-- ============================================================================
-- PLUGIN CONFIGURATION
-- ============================================================================

-- Treesitter v1.0: install parsers (async); highlighting is built into Neovim
require("nvim-treesitter").install({
    "lua", "vim", "vimdoc", "python", "javascript", "typescript",
    "rust", "go", "bash", "markdown", "json", "yaml", "toml", "terraform", "hcl",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function() pcall(vim.treesitter.start) end,
})

-- Textobjects: config options (lookahead, jump marks, etc.)
require("nvim-treesitter-textobjects").setup({
    select = { lookahead = true },
    move = { set_jumps = true },
})

-- Textobjects: select keymaps
local to_select = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "af", function() to_select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "if", function() to_select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() to_select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() to_select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "aa", function() to_select.select_textobject("@parameter.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ia", function() to_select.select_textobject("@parameter.inner", "textobjects") end)

-- Textobjects: move keymaps
local to_move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "]f", function() to_move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]c", function() to_move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[f", function() to_move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[c", function() to_move.goto_previous_start("@class.outer", "textobjects") end)

local telescope_actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
require("telescope").setup({
    defaults = {
        -- Disable preview by default for faster performance
        preview = false,
        mappings = {
            i = {
                ['<C-u>'] = false, -- Disable Telescope's default mapping to use standard CLI behavior
                ["<S-Down>"] = telescope_actions.cycle_history_next,
                ["<S-Up>"] = telescope_actions.cycle_history_prev,
            },
        },
    },
    pickers = {
        -- Color scheme selector with preview enabled
        colorscheme = {
            enable_preview = true,
            theme = "ivy",
            layout_config = {
                height = 10,
            },
        },
        -- Live text search across project
        live_grep = {
            theme = "ivy",
            preview = true,
            hidden = true, -- Include hidden files in search
            layout_strategy = "vertical",
            layout_config = {
                width = { padding = 0 },
                height = 120,
            },
        },
        -- File finder
        find_files = {
            theme = "ivy",
            hidden = true, -- Include hidden files
            layout_config = {
                height = 15,
            },
        },
        -- Open buffer list
        buffers = {
            theme = "ivy",
            layout_config = {
                height = 10,
            },
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- Enable automatic quoting of search terms
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                },
            },
        },
    },
})
-- Telescope: Fuzzy finder for files, text, buffers, etc.
require("telescope").load_extension("live_grep_args")

-- NvimTree: File explorer
require("nvim-tree").setup({
    -- Sync tree root with current working directory
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        -- Auto-update tree root when changing files
        update_root = true,
    },
    filters = {
        -- Show git ignored files
        git_ignored = false,
        -- Show dotfiles
        dotfiles = false,
    },
    view = {
        width = 50,
    },
})

-- GitHub PR review (`:Octo pr edit <n>` + `:Octo review start` / `:Octo pr
-- list`) -- uses the `gh` CLI's own auth, same as this project's other `gh`
-- usage.
require("octo").setup({
    -- Use the REAL on-disk file (a normal `file://` buffer, full LSP incl.
    -- go-to-definition/references across the whole project) for the right
    -- (new/PR) side of a review diff, instead of octo's virtual `octo://`
    -- scratch buffer -- but only when locally checked out on the PR's own
    -- branch (`octo.utils.in_pr_branch`), which is exactly what `gh pr
    -- checkout`/`inbox review` already does before opening the review. The
    -- left (base/old) side stays virtual (buftype=nofile, no real file to
    -- back it against) -- that's fine, it's the pre-change version anyway.
    use_local_fs = true,

    default_merge_method = "squash",
    default_delete_branch = true, -- optional, matches repos with auto-delete on
})

-- NvimRooter: Auto-change working directory to project root
require("nvim-rooter").setup()

-- Bufferline: Tab-like buffer list at top of window
require("bufferline").setup()

-- Lualine: Status line at bottom of window
require("lualine").setup({})

-- Fidget: LSP progress notifications
require("fidget").setup({
    notification = {
        window = {
            align = "top",
            border = "rounded",
        },
        timer = {
            figdet_decay = 5000,
        }
    },
})

require("tiny-inline-diagnostic").setup({
    preset = "minimal",
    options = {
        virt_texts = {
            priority = 10480,
        },
    },
})
vim.diagnostic.config({ virtual_text = false })

-- Sidekick: Claude AI assistant integration
require("sidekick").setup({
    -- Disable NES emulator feature
    nes = { enabled = false },
    cli = {
        -- Disable terminal multiplexer
        mux = { enabled = false }
    }
})

-- ============================================================================
-- SNIPPETS
-- ============================================================================

-- LuaSnip: Snippet engine
local luasnip = require("luasnip")

-- Load friendly-snippets (VSCode-style snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Load custom snippets from ~/.config/snippet
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/snippet" } })

-- LuaSnip configuration
luasnip.setup({
    -- Update snippets in real-time as you type
    update_events = "TextChanged,TextChangedI",
    -- Delete snippet text when jumping to next placeholder
    delete_check_events = "TextChanged",
})

-- ============================================================================
-- LSP (LANGUAGE SERVER PROTOCOL)
-- ============================================================================

-- Don't let LSP clients (ts_ls in particular) attach to virtual buffers from
-- plugins that use a fake URI scheme instead of a real file path --
-- octo.nvim's review panel (`octo://repo/review/...`) and fugitive's blob
-- buffers (`fugitive:///real/path/.git//<sha>/file.ts`) both hit this: the
-- buffer gets a real filetype (typescript/etc.) so LSP tries to attach, but
-- root_dir/node_modules resolution fails loudly ("Could not find a valid
-- TypeScript installation") because the buffer isn't backed by a real file
-- on disk the LSP can walk up from. Matches any `<scheme>://` bufname
-- generically rather than special-casing each plugin one at a time.
-- This alone isn't enough for ts_ls: its own root_dir (lspconfig's
-- `lsp/ts_ls.lua`) NEVER returns nil -- it falls back to `getcwd()` when no
-- marker is found, so it always calls `on_dir(...)` and starts the client
-- unconditionally. That means the failed `initialize` RPC ("Could not find
-- a valid TypeScript installation") happens BEFORE `LspAttach` ever fires --
-- too late for the autocmd above to prevent the loud error. Wrap ts_ls's
-- own root_dir so it refuses to start at all for virtual-scheme buffers,
-- falling through to the real logic otherwise.
do
    local ts_ls_default_root_dir = vim.lsp.config['ts_ls'].root_dir
    vim.lsp.config('ts_ls', {
        root_dir = function(bufnr, on_dir)
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("^%a+://") then
                return -- virtual buffer (octo://, fugitive://, ...) -- don't start ts_ls
            end
            ts_ls_default_root_dir(bufnr, on_dir)
        end,
    })
end

-- Disabled: this used to be a generic backstop for the ts_ls virtual-buffer
-- problem described above, detaching ANY LSP client from ANY buffer whose
-- name matches `<scheme>://...` right after it attaches. That's too broad --
-- it also nukes perfectly good clients (pyright, lua_ls, etc.) that attach
-- fine to virtual buffers like octo.nvim's `octo://repo/review/...` review
-- panel, which is why `gd`/textDocument/definition stopped working there
-- ("not supported by any server activated for this buffer" -- because the
-- client was attached, then immediately detached). The targeted ts_ls
-- root_dir wrap above already prevents ts_ls specifically from attaching to
-- virtual buffers, so this blanket detach shouldn't be needed anymore.
-- Left here (disabled) in case some other server needs the same treatment
-- ts_ls got -- re-enable/scope-narrow if a similar loud-error symptom shows
-- up for another LSP client on octo://, fugitive://, etc. buffers.
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local bufname = vim.api.nvim_buf_get_name(args.buf)
--         if bufname:match("^%a+://") then
--             vim.lsp.buf_detach_client(args.buf, args.data.client_id)
--         end
--     end,
-- })

-- Mason: Install and manage language servers
require("mason").setup()

-- Mason-LSPConfig: Bridge between Mason and LSP
require("mason-lspconfig").setup({
    -- Automatically install these language servers
    ensure_installed = { "lua_ls", "pyright", "ts_ls", "buf_ls", "marksman", "helm_ls" },
})

vim.lsp.config('pyright', {
    settings = {
        python = {
            analysis = {
                ignore = { "**/venv/**", "**/.venv/**" },
                diagnosticMode = "workspace",
            },
        },
        pyright = {
            disableTaggedHints = true,
        },
        exclude = { "**/*.pyi" }
    },
})

-- Configure Lua language server with nvim runtime path awareness
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                -- Make language server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

-- -- Enable remaining LSP servers with default config
-- vim.lsp.enable("pyright")
-- vim.lsp.enable("ts_ls")
-- vim.lsp.enable("buf_ls")
-- vim.lsp.enable("marksman")
-- vim.lsp.enable("helm_ls")

-- ============================================================================
-- AUTO-COMPLETION
-- ============================================================================

-- Blink.cmp: Completion engine
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        -- Tab behavior: navigate completion menu or jump to next snippet placeholder
        ["<Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.snippet_forward()
                else
                    return cmp.select_next()
                end
            end,
            "fallback"
        },
        -- Shift-Tab: navigate up in menu or jump to previous snippet placeholder
        ["<S-Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.snippet_backward()
                else
                    return cmp.select_prev()
                end
            end,
            "fallback"
        },
        -- Accept completion with Enter
        ["<CR>"] = { "accept", "fallback" },
    },
    -- Snippet configuration
    snippets = {
        expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
        active = function(filter)
            if filter and filter.direction then
                return require("luasnip").jumpable(filter.direction)
            end
            return require("luasnip").in_snippet()
        end,
        jump = function(direction) require("luasnip").jump(direction) end,
    },
    -- Use pure Lua fuzzy matching (faster)
    fuzzy = { implementation = "lua" },
    sources = {
        -- Enable snippets with high priority
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            snippets = {
                score_offset = -10, -- Lower priority: appears after LSP property completions
            },
        },
    },
})

-- ============================================================================
-- CODE FORMATTING
-- ============================================================================

-- Conform: Format code on save
require("conform").setup({
    -- Define formatters for each file type
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
    },
    -- Automatically format on save
    format_on_save = {
        timeout_ms = 500,
        -- Use LSP formatter if conform formatter not available
        lsp_format = "fallback",
    },
})

require("trouble").setup({})

-- Flash: Enhanced motion plugin for jumping to locations
require("flash").setup({
    -- Standard search mode settings
    search = {
        multi_window = true, -- Search across all visible windows
        mode = "exact",      -- Use exact matching
        wrap = true,         -- Wrap around document edges
        incremental = true,  -- Don't use incremental search
    },
    -- Jump label configuration
    label = {
        uppercase = false,                        -- Use lowercase labels only
        rainbow = { enabled = false, shade = 5 }, -- Disable rainbow coloring
    },
    -- Modes configuration
    modes = {
        -- Standard jump mode
        search = {
            enabled = false,
        },
        -- Character-based jump (like f/F/t/T)
        char = {
            enabled = false,
            jump_labels = true, -- Show labels after first match
            multi_line = true,  -- Allow jumping across lines
        },
        -- Treesitter-based jumping
        treesitter = {
            labels = "asdfghjklqwertyuiopzxcvbnm",
            jump = { pos = "range" },
        },
    },
})

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================

-- Show Telescope buffer list, sorted by most recently used
local list_buffers = function()
    require("telescope.builtin").buffers({
        sort_lastused = true,
        ignore_current_buffer = true,
    })
end

-- Reload Neovim configuration without restarting
local reload_configuration = function()
    local vim_rc = os.getenv("MYVIMRC")
    print("Reloading configuration from: " .. vim_rc)
    vim.cmd.luafile(vim_rc)
end

local sidekick_toggle = function()
    require("sidekick.cli").toggle({ filter = { installed = true } })
end

local sidekick_send = function()
    require("sidekick.cli").send({ msg = "{this}", filter = { installed = true } })
end


local themes = require('telescope.themes')
local telescope_lsp_refs = function()
    require('telescope.builtin').lsp_references(themes.get_ivy({
        preview = true,
        hidden = true,
        layout_strategy = "vertical",
        layout_config = {
            height = vim.o.lines,  -- maximally available lines
            width = vim.o.columns, -- maximally available columns
            prompt_position = "bottom",
            preview_height = 0.8
        },
    }))
end

-- ============================================================================
-- NOTIFICATIONS
-- ============================================================================

-- Use Fidget for all vim notifications
vim.notify = require("fidget.notification").notify

-- ============================================================================
-- KEY MAPPINGS
-- ============================================================================

-- General editor shortcuts
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Unhighlight search word" })
vim.keymap.set('n', '<leader>1', 'yypVr=', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', 'yypVr-', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', 'o> NOTE: ', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", function()
    vim.opt.number = true
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

-- Window navigation (Ctrl + hjkl)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- File and buffer navigation
-- vim.keymap.set("n", "<C-a>", vim.cmd.NvimTreeFindFileToggle, { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeFindFileToggle, { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, { desc = "Cmd+P" })
vim.keymap.set("n", "<leader>b", list_buffers, { desc = "List buffers" })

-- Plugin management
vim.keymap.set("n", "<F5>", vim.pack.update, { desc = "Update plugins" })

-- AI assistants

-- sidekick
vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", sidekick_toggle, { desc = "Sidekick toggle" })
vim.keymap.set({ "n", "t", "i", "x" }, "<c-_>", sidekick_send, { desc = "Sidekick send" })

vim.keymap.set("n", "<leader>rg",
    require("telescope").extensions.live_grep_args.live_grep_args,
    { desc = "Live grep with args" }
)

-- Leader key shortcuts (Space + ...)
-- vim.keymap.set("n", "<leader>rg", require("telescope.builtin").live_grep, { desc = "[R]ip[G]rep" })
vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit, { desc = "[G]it [D]iff" })
vim.keymap.set('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gc', ':G commit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gpull', ':G pull<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gpush', ':G push<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gl', ':G log --oneline<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ge', ':Gedit<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nvr", reload_configuration, { desc = "Reload configuration" })
vim.keymap.set('n', '<leader>nve', ':e ~/.config/nvim/init.lua<CR>', { desc = 'Edit Neovim config' })
-- vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol,
--     { noremap = true, silent = true, desc = "List symbols in file" })
vim.keymap.set("n", "<leader>ls", function()
    require('telescope.builtin').lsp_document_symbols({
        symbols = { "function", "method", "class", "struct", "interface" }
    })
end, { noremap = true, silent = true, desc = "List functions/methods" })
-- this doesn't seem to work
-- vim.keymap.set('n', '<leader>le', vim.diagnostic.setqflist, { desc = 'Load diagnostics to quickfix' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP: Rename symbol' })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { noremap = true, silent = true, desc = "Go to definition" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "List references" })
vim.keymap.set("n", "gr", telescope_lsp_refs, { noremap = true, silent = true, desc = "List references" })
vim.keymap.set('n', '<leader>lt', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols({
        symbols = { 'function', 'method', 'class', 'struct', 'interface' }
    })
end, { desc = 'Workspace symbols (no variables)' })

-- trouble config
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Toggle diagnostics" })
vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Trouble: Buffer diagnostics" })
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble: Symbols" })
vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "Trouble: LSP definitions/references" })
vim.keymap.set("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble: Location list" })
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble: Quickfix list" })

-- Flash navigation keybindings
vim.keymap.set({ "n", "x", "o" }, "<leader>fs", function() require("flash").jump() end,
    { desc = "Flash: Jump to location" })
vim.keymap.set({ "n", "x", "o" }, "<leader>fr", function() require("flash").jump({ search = { forward = false } }) end,
    { desc = "Flash: Jump to location in reverse" })
vim.keymap.set({ "n", "x", "o" }, "<leader>ft", function() require("flash").treesitter() end,
    { desc = "Flash: Jump to treesitter node" })
vim.keymap.set("o", "<leader>fr", function() require("flash").remote() end,
    { desc = "Flash: Remote operation" })
vim.keymap.set({ "o", "x" }, "<leader>fR", function() require("flash").treesitter_search() end,
    { desc = "Flash: Treesitter search" })
vim.keymap.set({ "c" }, "<c-s>", function() require("flash").toggle() end,
    { desc = "Flash: Toggle in command mode" })

-- Custom keybindings
local insert_today_date = function()
    local today = os.date("%Y-%m-%d")             -- Get today's date in YYYY-MM-DD format
    today = tostring(today)
    vim.api.nvim_put({ today }, 'l', false, true) -- Insert date at the current cursor position
end
vim.keymap.set({ "n" }, "<leader>dt", insert_today_date, { desc = "Insert today's date" })

-- rust keybindings
vim.keymap.set({ "n", "v", "x" }, "<leader>rrd", "<cmd>RustLsp renderDiagnostic<cr>",
    { desc = "Rustacean render diagnostic" })
vim.keymap.set({ "n", "v", "x" }, "<leader>rca", "<cmd>RustLsp codeAction<cr>", { desc = "Rustacean code action" })

-- spell
vim.opt.spellfile = "~/.config/nvim/spell/custom.utf-8.add"

-- ============================================================================
-- LOCAL MACHINE-SPECIFIC CONFIGURATION
-- ============================================================================

-- Attempt to load local machine-specific configuration
local init_file = vim.fn.stdpath('config') .. '/local/init.lua'
if vim.fn.filereadable(init_file) == 1 then
    dofile(init_file)
else
    -- print('local/init.lua not found or not readable at: ' .. init_file)
end
