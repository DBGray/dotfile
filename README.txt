Installation:

    git clone git://github.com/DBGray/dotfile.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/bashrc ~/.bashrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule update --init

Follow the powerline install directions:
I had to:
 cd ~/.vim/bundle/powerline/
 sudo python setup.py install

 cp -r ~/.vim/bundle/powerline-fonts/* ~/.fonts
 cp ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.fonts
 fc-cache -vf ~/.fonts
 cp bundle/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
 mkdir ~/.config/powerline
 cp -R /path/to/powerline/config_files/* ~/.config/powerline

I then restarted SUSE and set terminal font to a Powerline supported font.
I *think* this is what got powerline to work.


