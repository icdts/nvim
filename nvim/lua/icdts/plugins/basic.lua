return {
  {
  'catppuccin/nvim' ,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- git integrations
  'tpope/vim-fugitive',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- indentation guides
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}, },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}
