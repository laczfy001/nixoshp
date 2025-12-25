-- init.lua

---------------------------
-- 1️⃣ Alapvető beállítások
---------------------------
vim.o.termguicolors = true       -- 24-bit színek
vim.o.number = true               -- sor számok
vim.o.relativenumber = true       -- relatív sor számok
vim.o.expandtab = true            -- tab = space
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.cursorline = true

---------------------------
-- 2️⃣ Packer telepítése
---------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

---------------------------
-- 3️⃣ Pluginok
---------------------------
require("packer").startup(function(use)
  -- Packer önmaga
  use "wbthomason/packer.nvim"

  -- Tokyonight Theme
  use({
    "folke/tokyonight.nvim",
    config = function()
      -- Tokyonight beállítások
      vim.g.tokyonight_style = "storm"          -- storm, night, day
      vim.g.tokyonight_italic_comments = true
      vim.g.tokyonight_transparent = false
      vim.g.tokyonight_enable_italic = true

      -- Színséma aktiválása
      vim.cmd("colorscheme tokyonight-storm")
    end
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

---------------------------
-- 4️⃣ Extra tipp root fájlok mentéséhez
---------------------------
-- Ha root jog kell egy fájl mentéséhez:
-- :w !sudo tee %
