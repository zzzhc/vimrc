# zzzhc's vimrc for rails developer

## install

### clone vimrc

``` sh
git clone git://github.com/zzzhc/vimrc.git
cd vimrc
```

### link vimrc to ~/.vimrc

``` sh
ln -sf `pwd`/vimrc ~/.vimrc
```

### get vundle

``` sh
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
```

### link macros to ~/.vim/bundle/vundle

``` sh
ln -s `pwd`/macros ~/.vim/bundle/vundle/
```

### install vim scripts

Launch `vim`, run `:BundleInstall`

## customize

puts your own vimrc to ~/.vim/.vimrc, ~/.vimrc will source it.

## bundle list

* [supertab](https://github.com/ervandew/supertab)
* [Ack](https://github.com/mileszs/ack.vim)
* [CtrlP](https://github.com/kien/ctrlp.vim)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [vim-abolish](https://github.com/tpope/vim-abolish)
* [vim-rails](https://github.com/zzzhc/vim-rails)
* [vim-rake](https://github.com/tpope/vim-rake)
* [vim-bundler](https://github.com/tpope/vim-bundler)
* [zencoding](https://github.com/mattn/zencoding-vim)
* [snipmate](https://github.com/ervandew/snipmate.vim)
* [railscasts-theme](https://github.com/jpo/vim-railscasts-theme)
* FuzzyFinder
* a
* project
* matchit
* vcscommand
* Align

## tips

### notice

* color scheme is [railscasts theme](https://github.com/jpo/vim-railscasts-theme)
* All trailing white spaces will be removed when saving file
* Tab is expanded to `2` spaces
* Using `:cstag` instead of the default :tag behavior
* Backup is disabled
* autoindent is on
* autochdir is off, use \cd to switch current window's directory to editing file's

### shortcuts

* `\t` search file under current directory, like textmate's Command+t
* `<F2>` toggle NERDTree
* `<F3>` grep recursive
* `<F4>` toggle TagList
* `<F5>` VCSBlame
* `<F6>` find tags
* `<F7>` find buffers
* `<F8>` find files
* `<Ctrl + s>` save
* `<Ctrl + insert>` copy
* `<Shift + insert>` paste
* `tt` open new tab
* `td` close current tab
* `tn` move to next tab
* `tp` move to previous tab
* [mac only] `command + number` switch tab

### align code
* in visual mode, `ah` aligh code by =>
* in visual mode, `ae` aligh code by =


### rails fuf

when you open a rails project, below abbrs is set for fuzzy find files

* `r`: search under project root
* `cc`: search under config
* `a`: search under app
* `c`: search under app/controllers
* `m`: search under app/models
* `v`: search under app/views
* `h`: search under app/helpers
* `j`: search under public/javascripts and app/assets/javascripts
* `ss`: search under public/stylesheets and app/assets/stylesheets
* `s`: search under spec
* `p`: search under vendor/plugins

