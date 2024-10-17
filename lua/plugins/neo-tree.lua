return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
      { '<leader>nr', ':Neotree toggle show buffers right<CR>', { desc = 'Neotree show buffers right' } },
      { '<leader>nl', ':Neotree toggle show buffers left<CR>', { desc = 'Neotree show buffers right' } },
      { '<leader>ng', ':Neotree float git_status<CR>', { desc = 'Neotree show git status' } },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
}