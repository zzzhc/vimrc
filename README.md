# zzzhc's vimrc for rails developer

## install

### copy vimrc to ~/.vimrc

``` sh
cp vimrc ~/.vimrc
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
