return {
    'w0rp/ale',
    config = function()
        vim.g.ale_fix_on_save = 1
        vim.g.ale_linters = {
            --python = {'flake8', 'black', 'mypy'},
            python = {'black', 'mypy'},
            c = {'clang', 'clangtidy'},
            cpp = {'clang', 'clangtidy'},
            bash = {'shellcheck'},
            rust = {'cargo', 'rls'},
        }
        vim.g.ale_fixers = {
            python = {'black'},
            c = {'clang-format', 'clangtidy'},
            cpp = {'clang-format', 'clangtidy'},
            bash = {'shfmt'},
            rust = {'rustfmt'},
        }
        vim.g.ale_sign_error = '✗'
        vim.g.ale_sign_warning = '⚠'
        vim.g.ale_sign_info = 'ℹ'
        vim.g.ale_sign_style_error = '✗'
        vim.g.ale_sign_style_warning = '⚠'
        vim.g.ale_sign_style_info = 'ℹ'
        vim.g.ale_echo_msg_error_str = '✗'
        vim.g.ale_echo_msg_warning_str = '⚠'
        vim.g.ale_echo_msg_info_str = 'ℹ'
        vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
        vim.g.ale_lint_on_insert_leave = 1
        vim.g.ale_lint_on_insert = 0
        vim.g.ale_lint_on_text_changed = 'never'
        vim.g.ale_lint_on_enter = 0
        vim.g.ale_lint_on_filetype_changed = 0
        vim.g.ale_lint_on_save = 0
        vim.g.ale_lint_on_cursor_hold = 0
        vim.g.ale_lint_on_cursor_moved = 0
        vim.g.ale_lint_on_insert = 0
        vim.g.ale_rust_cargo_use_clippy = 1
        vim.g.ale_completion_enabled = 1
    end
}
