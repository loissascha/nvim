return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      local palettes = {
        github_dark_default = {
          -- bg0 = '#000000',
          -- bg1 = '#000000',
          -- bg2 = '#000000',
          -- bg3 = '#000000',
          -- bg4 = '#000000',
          -- fg0 = '#000000',
          -- fg1 = '#000000',
          -- fg2 = '#000000',
          -- fg3 = '#000000',
          sel0 = '#ada',
          sel1 = '#ada',
        },
      }
      require('github-theme').setup { palettes = palettes }
      vim.cmd 'colorscheme github_dark_default'
    end,
  },
}
