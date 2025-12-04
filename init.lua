vim.g.mapleader = " " -- Set leader key to space for custom key bindings
vim.opt.number = true -- Display line numbers in the gutter
vim.opt.mouse = "a"   -- Display line numbers in the gutter
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
    { src = "https://github.com/Saghen/blink.cmp" }, -- Completion engine
    -- { src = "https://github.com/zbirenbaum/copilot.lua" },         -- GitHub Copilot integration
    -- { src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" }, -- Copilot Chat
    { src = "https://github.com/folke/sidekick.nvim" }, -- AI assistant (Claude)

    -- Code formatting
    { src = "https://github.com/stevearc/conform.nvim" }, -- Format-on-save with multiple formatters

    -- { src = "https://github.com/milanglacier/minuet-ai.nvim" }, -- minuet code completion

    -- flash
    { src = "https://github.com/folke/flash.nvim" },

    -- rust
    { src = "https://github.com/mrcjkb/rustaceanvim" },
})

-- ============================================================================
-- THEME
-- ============================================================================

-- Apply the carbonfox color scheme
vim.cmd.colorscheme("carbonfox")

-- ============================================================================
-- PLUGIN CONFIGURATION
-- ============================================================================

-- Treesitter: Syntax highlighting and code parsing
require("nvim-treesitter.configs").setup({
    -- Install parsers for these languages
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "rust",
        "go",
        "bash",
        "markdown",
        "json",
        "yaml",
        "toml",
        "terraform",
        "hcl",
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    -- Enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- Enable incremental selection
    incremental_selection = {
        enable = true,
    },
    -- Text objects for selecting and navigating code structures
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj
            keymaps = {
                -- Functions
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                -- Classes
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                -- Parameters/arguments
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- Add to jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
        },
    },
    ignore_install = {},
    modules = {}
})

require("telescope").setup({
    defaults = {
        -- Disable preview by default for faster performance
        preview = false,
        mappings = {
            i = {
                ['<C-u>'] = false, -- Disable Telescope's default mapping to use standard CLI behavior
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

-- ============================================================================
-- COPILOT & AI ASSISTANTS
-- ============================================================================

-- GitHub Copilot: AI code suggestions
-- require("copilot").setup({
--     suggestion = {
--         enabled = true,
--         -- Automatically show suggestions while typing
--         auto_trigger = true,
--         -- Don't auto-accept suggestions (manual with Ctrl-\)
--         accept = false,
--         keymap = {
--             accept = "<M-l>",      -- Alt+l to accept suggestion
--             accept_word = "<M-w>", -- Alt+w to accept word
--             accept_line = "<M-e>", -- Alt+e to accept line
--             next = "<M-]>",        -- Alt+] for next suggestion
--             prev = "<M-[>",        -- Alt+[ for previous suggestion
--             dismiss = "<C-]>",     -- Ctrl+] to dismiss
--         },
--     },
--     panel = {
--         -- Disable Copilot panel UI
--         enabled = false,
--     },
--     -- Enable Copilot for all file types
--     filetypes = {
--         markdown = true,
--         help = true,
--         html = true,
--         javascript = true,
--         typescript = true,
--         ["*"] = true,
--     },
-- })

-- Configure CopilotChat
-- require("CopilotChat").setup({
--     -- Optional: customize settings
--     debug = false,
--     window = {
--         layout = 'vertical', -- 'vertical', 'horizontal', 'float'
--         width = 0.4,
--     },
-- })

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
-- LSP (LANGUAGE SERVER PROTOCOL)
-- ============================================================================

-- Mason: Install and manage language servers
require("mason").setup()

-- Mason-LSPConfig: Bridge between Mason and LSP
require("mason-lspconfig").setup({
    -- Automatically install these language servers
    ensure_installed = { "lua_ls", "pyright", "buf_ls", "marksman", "helm_ls" },
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
        -- Navigate completion menu with Tab/Shift-Tab
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        -- Accept completion with Enter
        ["<CR>"] = { "accept", "fallback" },

        -- minuet integration
        -- ['<A-y>'] = require('minuet').make_blink_map(),
    },
    -- Use pure Lua fuzzy matching (faster)
    fuzzy = { implementation = "lua" },
    -- sources = {
    --     -- Enable minuet for autocomplete
    --     default = { 'lsp', 'path', 'buffer', 'snippets', 'minuet' },
    --     -- For manual completion only, remove 'minuet' from default
    --     providers = {
    --         minuet = {
    --             name = 'minuet',
    --             module = 'minuet.blink',
    --             async = true,
    --             -- Should match minuet.config.request_timeout * 1000,
    --             -- since minuet.config.request_timeout is in seconds
    --             timeout_ms = 3000,
    --             score_offset = 50, -- Gives minuet higher priority among suggestions
    --         },
    --     },
    -- },
    -- -- Control whether to prefetch or not
    -- completion = { trigger = { prefetch_on_insert = false } },
})
-- require('minuet').setup({
--     provider = 'claude',
-- })

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
-- copilot accept suggestions
-- vim.keymap.set("i", "<C-\\>", require("copilot.suggestion").accept, { desc = "Accept Copilot suggestion" })

-- CopilotChat keybindings (works in both normal and visual mode)
-- vim.keymap.set({ "n", "v" }, '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
-- vim.keymap.set({ "n", "v" }, '<leader>cq', ':CopilotChat ', { desc = 'Ask Copilot' })
-- vim.keymap.set({ "n", "v" }, '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Explain code' })
-- vim.keymap.set({ "n", "v" }, '<leader>cr', ':CopilotChatReview<CR>', { desc = 'Review code' })
-- vim.keymap.set({ "n", "v" }, '<leader>cf', ':CopilotChatFix<CR>', { desc = 'Fix code' })
-- vim.keymap.set({ "n", "v" }, '<leader>co', ':CopilotChatOptimize<CR>', { desc = 'Optimize code' })
-- vim.keymap.set({ "n", "v" }, '<leader>cd', ':CopilotChatDocs<CR>', { desc = 'Generate docs' })
-- vim.keymap.set({ "n", "v" }, '<leader>ct', ':CopilotChatTests<CR>', { desc = 'Generate tests' })

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
vim.keymap.set('n', '<leader>gs', ':G status<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gc', ':G commit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gpull', ':G pull<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gpush', ':G push<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gl', ':G log<CR>', { noremap = true, silent = true })

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
vim.keymap.set({ "n", "x", "o" }, "<leader>ft", function() require("flash").treesitter() end,
    { desc = "Flash: Jump to treesitter node" })
vim.keymap.set("o", "<leader>fr", function() require("flash").remote() end,
    { desc = "Flash: Remote operation" })
vim.keymap.set({ "o", "x" }, "<leader>fR", function() require("flash").treesitter_search() end,
    { desc = "Flash: Treesitter search" })
vim.keymap.set({ "c" }, "<c-s>", function() require("flash").toggle() end,
    { desc = "Flash: Toggle in command mode" })
