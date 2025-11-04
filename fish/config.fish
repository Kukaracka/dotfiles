function fish_prompt -d "Write out the prompt"
    # Минималистичный prompt: user@host ~/path >
    printf '%s@%s %s%s%s > ' \
        $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end


if status is-interactive
    # --- Общие настройки ---
    set fish_greeting  # Без приветствия

    # --- Инициализация внешних инструментов ---
    starship init fish | source

    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # --- Алиасы: переопределения и обёртки ---
    alias clear "printf '\033[2J\033[3J\033[1;1H'"  # Полная очистка экрана
    alias grep='rg'          # ripgrep вместо grep
    alias ls='lsd'           # lsd вместо ls
    # alias pacman='sudo pacman'  # безопаснее: всегда с sudo
    alias q='qs -c ii'       # твоя кастомная команда

    # --- Абревиатуры: сокращения для часто вводимых команд ---
    # Навигация по проектам
    abbr -a dp 'cd ~/Projects/DigitalPassport/'
    abbr -a st 'cd ~/Projects/SkillTracker/'

    # Редактор и окружения
    abbr -a n 'nvim'
    abbr -a sen 'sudo -E nvim'
    abbr -a venv 'source .venv/bin/activate.fish'

    # Пакетный менеджер
    abbr -a spcs  'sudo pacman -S'
    abbr -a spcss  'sudo pacman -Ss'
    abbr -a spcr  'sudo pacman -R'
    abbr -a spcrhn 'sudo pacman -Rhn'
    abbr -a spcsyu 'sudo pacman -Syu'

    # Расширенные варианты ls
    abbr -a la 'ls -a'
    abbr -a l 'ls -l'
    abbr -a lla 'ls -la'
    abbr -a lt 'ls --tree'
end


# --- Завершающие украшения (при старте терминала) ---
pokemon-colorscripts --no-title -s -r | fastfetch \
    -c ~/.config/fastfetch/config-pokemon.jsonc \
    --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

