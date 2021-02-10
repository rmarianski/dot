source "%val{config}/plugins/plug.kak/rc/plug.kak"

# set-option buffer=%val{config}/kakrc indentwidth 2
set-option global grepcmd ag

plug "kak-lsp/kak-lsp" do %{
    cargo install --locked --force --path .
}

plug alexherbo2/prelude.kak
plug alexherbo2/connect.kak commit 625375f %{
  require-module connect
  require-module connect-lf
  require-module connect-fzf

  hook global RuntimeError "\d+:\d+: '\w+' (.*): is a directory" %{
      evaluate-commands %sh{
        directory=$kak_hook_param_capture_1
        echo lf $directory
      }
  }

  map global user h ": connect-terminal <ret>" -docstring "Spawn a connected terminal"
}

# eval %sh{kak-lsp --kakoune -s $kak_session}
map global lsp n ': lsp-find-error --include-warnings<ret>' -docstring 'find next warning or error'
map global lsp l ': lsp-enable<ret>' -docstring 'enable lsp for the whole session'
map global lsp R ': lsp-rename-prompt<ret>' -docstring 'rename symbol under cursor'
hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
    lsp-enable-window
    set-option global lsp_insert_spaces true
    map window user -docstring "lsp user mode" l ':enter-user-mode lsp<ret>'
}
hook global KakEnd .* lsp-exit

colorscheme solarized-dark
set-option global incsearch true
set-option global tabstop 4
set-option global indentwidth 4
add-highlighter global/ regex '\h*$' 0:red,red # highlight trailing whitespace

map global user f ': fzf-files <ret>' -docstring 'find files with fzf'
define-command find -menu -params 1 -shell-script-candidates %{ ag -g '' --ignore "$kak_opt_ignored_files" } %{ edit %arg{1} }
define-command mkdir %{ nop %sh{ mkdir -p $(dirname $kak_buffile) } }

declare-user-mode grep
map global user g ':enter-user-mode grep<ret>' -docstring 'enter grep mode'
map global grep g ':grep ' -docstring 'run grep'
map global grep p ': grep-next-match<ret>' -docstring 'run grep-previous-match'
map global grep n ': grep-next-match<ret>' -docstring 'run grep-next-match'
map global grep l ': edit -existing *grep* <ret>' -docstring 'show grep results'

map global user c ':comment-line<ret>' -docstring 'comment line'
