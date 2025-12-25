-- ========================================================================== --
--                               ALAP BEÁLLÍTÁSOK                             --
-- ========================================================================== --

-- Leader billentyű beállítása a Szóközre (nagyon hasznos gyorsbillentyűkhöz)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true           -- Sorok számozása
opt.relativenumber = true   -- Relatív sorszámok (könnyebb ugrálni)
opt.mouse = "a"             -- Egér használatának engedélyezése
opt.ignorecase = true       -- Keresésnél ne számítson a kis/nagybetű...
opt.smartcase = true        -- ...kivéve ha nagybetűt is írsz
opt.termguicolors = true    -- 24-bites színek engedélyezése (kell a Tokyo Night-hoz)
opt.tabstop = 4             -- Egy Tab 4 szóköznek felel meg
opt.shiftwidth = 4          -- Automatikus behúzás mértéke
opt.expandtab = true        -- Tab helyett szóközöket használjon
opt.clipboard = "unnamedplus" -- Rendszer vágólap használata (ha van támogatás)
opt.cursorline = true       -- Aktuális sor kiemelése

-- ========================================================================== --
--                           LAZY.NVIM TELEPÍTÉSE                             --
-- ========================================================================== --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
--                            PLUGINEK BEÁLLÍTÁSA                             --
-- ========================================================================== --

require("lazy").setup({
  -- 1. A TOKYO NIGHT TÉMA
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Választható: storm, night, moon, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  },

  -- 2. STATUS LINE (Az alsó információs sáv)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "tokyonight" } })
    end,
  },

 -- 3. SZINTAKSIS KIEMELÉS (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Megpróbáljuk betölteni a modult, ha még nem érhető el, nem dobunk hibát rögtön
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then
          return
      end

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "python", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- 4. FÁJLKERESŐ (Telescope) - Kell hozzá a 'fzf' vagy 'ripgrep' a gépedre
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fájl keresése" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Szöveg keresése" },
    },
  },

  -- 5. FÁJLKEZELŐ (Nvim-tree)
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Fájlkezelő ki/be" },
    },
  },
})
