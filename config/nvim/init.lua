-- init.lua

vim.o.termguicolors = true       -- 24-bit színek
vim.o.number = true               -- sor számok
vim.o.relativenumber = true       -- relatív sor számok
vim.o.expandtab = true            -- tab = space
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.cursorline = true

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

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use({
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "storm"          -- storm, night, day
      vim.g.tokyonight_italic_comments = true
      vim.g.tokyonight_transparent = false
      vim.g.tokyonight_enable_italic = true


      vim.cmd("colorscheme tokyonight-storm")
    end
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
