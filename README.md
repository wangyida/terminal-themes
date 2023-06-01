# Terminal Theme Configuration

A dark theme for terminal related panels, especially on Mac, such as vim, shell and tmux.

[Cross-platform dark theme](https://wangyida.github.io/terminal-themes/) authored by [Yida Wang](https://wangyida.github.io/)

**Environments**: Linux/Unix platform

![teasor](images/themes.png)

## Installation
### Configuration download
```sh
git clone https://github.com/wangyida/terminal-themes.git
cd terminal-themes
```
For machines which support true color, [Base16 for Shells](https://github.com/chriskempson/base16) could be installed in advance
```sh
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

### ZSH setups
```sh
cp ./zshrc ~/.zshrc
```
Once zsh is installed, `oh-my-zsh` could be installed via
```sh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
Then zsh syntax highlighting tool could be downloaded by
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Finally set it up by `source`
```sh
source ~/.zshrc
```

### VIM setups
Set up [Vundle] for package management:
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
```sh
cp ./vimrc ~/.vimrc
source ~/.vimrc
```
To install Plugins, launch `vim` and run `:PluginInstall`

The IR_BLACK theme could be adopted by
```sh
base16_irblack
```

## Font

### A typeface designed for source code

Hack is designed to be a workhorse typeface for code. It has deep roots in the libre, open source typeface community and expands upon the contributions of the [Bitstream Vera](https://www.gnome.org/fonts/) &amp; [DejaVu](http://dejavu-fonts.org/wiki/Main_Page) projects.  The project is in active development.  We welcome your input and contributions.

![hack_font](images/hack-specimen-2.png)

## Editors

### VIM

Some themes in vim might not be available when the terminal supports true color, but you have not define this in **.vimrc**, In April Vim merged [patch 7.4.1799](https://groups.google.com/forum/#!topic/vim_dev/mAhjlVqpKts), which appears to simplify settings for using true colors in the terminal. After upgrading to this patch, users simply had to include set termguicolors in their vimrc to get true colors in the terminal– the one caveat being that it has to be a terminal like iTerm2 that also supports “true colors”.

You should define this for Iterm:
```sh
" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif
```

So vim will be something like this:
![vim](images/vim_dracula.png)

It also works well with editing with [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), here is a python version for it.
![python_lint](images/python_lint.png)

### Tmux

![tmux](images/tmux.png)

### iTerm

You should have a test for determing whether the specific terminal like **iTerm** supports true color or not by executing:

```perl
perl test.pl
```
and the results will be something like this:
![iterm](images/true_color_test.png)

Here we can use the embeded function 

```bash
imgcat
``` 
in iTerm for perviewing images in terminal.
![imgcat](images/imgcat.png)

### ipython 

This theme also works for iPython kernels
![ipython](images/ipython.png)

### Atom

![atom](images/atom.png)

# NVidia related setups

## Environment setup

plausible hardwares are 3090

## tiny-cuda-nn
`Python 3.8+` is needed

### Promblems

`ld: cannot find -lcuda`

```bash
ln -s /usr/lib/x86_64-linux-gnu/libcuda.so miniconda3/envs/<env_path>/lib/libcuda.so
```

Note that the libcuda.so must from the Nvidia Driver Lib, not Cuda Lib
Correct: Nvidia Driver Lib: `/usr/lib/i386-linux-gnu/libcuda.so`
Wrong: Cuda lib: `<cuda_home>/lib64/stubs/libcuda.so`

## nerfacc
The [sampling strategy](https://www.nerfacc.com/en/latest/methodology/sampling.html) supplemented by nerfacc is widely adopted.
Problem: `RuntimeError: CUDA error: invalid configuration argument`. Sometimes we need to ensure that [nerfacc](https://www.nerfacc.com/en/latest/) builds the CUDA code on the first run (JIT) if we install with `pip install nerfacc`, messages below shall be shown.
```bash
( ●    ) NerfAcc: Setting up CUDA (This may take a few minutes)
```
Otherwise a safe way to use the lastest nerfacc is building from source
```bash
pip install git+https://github.com/KAIR-BAIR/nerfacc.git
```


## nvdiffrast
```bash
/home/yidaw/anaconda3/bin/pip3 install git+https://github.com/NVlabs/nvdiffrast.git
```

## Huggingface
Problem: `SSLError: HTTPSConnectionPool(host='huggingface.co', port=443)`.
Solution: using `CURL_CA_BUNDLE=''` to bypass ssl verification from `requests`. However, this is now deemed a bug (which it arguably should be) and from requests=2.28 onwards, where `CURL_CA_BUNDLE=''` is no longer supported. It could be solved by downgrading `requests` version to 2.27.1
```bash
pip install requests==2.27.1
```
so that `CURL_CA_BUNDLE = ''` can be functional in terminal, otherwise it does not work
or embed the following codes in the python script
```python
import os
os.environ['CURL_CA_BUNDLE'] = ''
```

## bitsandbytes
Requirements Python >=3.8. Linux distribution (Ubuntu, MacOS, etc.) + CUDA > 10.0.

(Deprecated: CUDA 10.0 is deprecated and only CUDA >= 11.0) will be supported with release 0.39.0)
In case CUDA version does not match with the installed bitsandbytes
```sh
CUDA_VERSION=114 make cuda11x
python setup.py install
```
