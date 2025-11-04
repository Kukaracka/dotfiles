return {
  "akinsho/toggleterm.nvim",
  version = "*",
  shell = "/usr/bin/fish",
  opts = {
    -- общие настройки
    size = 20,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved", -- варианты: 'single', 'double', 'shadow', 'curved'
      width = 120,
      height = 30,
      winblend = 3,
    },
  },
}
