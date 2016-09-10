" Gotta be first
set nocompatible
set modeline

filetype on

" Set the runtimepath for Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Load all user vimconfig files. scripts are globbed lexicographically
" and can therefore be prefixed numerically.
for f in split(glob('~/.dotfiles.d/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor
