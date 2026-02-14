return {
  "mikesmithgh/kitty-scrollback.nvim",
  lazy = true,
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  event = { "User KittyScrollbackLaunch" },
  config = function()
    require('kitty-scrollback').setup({
      -- Добавляем кастомные бинды
      keymaps = function(ksb, ksb_api)
        -- Изменяем поведение 'y' в визуальном режиме
        vim.keymap.set('v', 'y', function()
          ksb_api.yank_to_clipboard() -- Только копируем в буфер
          -- ksb_api.close_window()   -- Раскомментируйте, если хотите, чтобы окно закрывалось после копирования
        end, { buffer = ksb.bufid, desc = 'Yank to clipboard only' })
      end,
      -- Ваши текущие настройки
      myconfig = {
        kitty_get_text = {
          ansi = true,
        },
      }
    })
  end,
}
