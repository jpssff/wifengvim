# wifeng vimfiles

## windows gvim

* 将代码检出到gvim安装目录下

    git clone https://github.com/jpssff/wifengvim.git
    cd wifengvim
    cp -r vimfiles /path/to/gvim/vimfiles

* 修改gvim安装目录下`_vimrc`文件内容为:
    
    source $vim/vimfiles/_vimrc
    

## linux vim

* 检出代码

    git clone https://github.com/jpssff/wifengvim.git
    cd wifengvim
    mv ~/.vim ~/.vim.bak
    cp -r vimfiles ~/.vim
    
* 修改`~/.vimrc`内容为：

    source ~/.vim/_vimrc
