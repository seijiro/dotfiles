#/bin/sh

cd $HOME/dotfiles

for item in `ls -al | awk '{print $9}' | grep '^\...' | grep -v '.git$'` | grep -v '\#'

do
    if [ -L "$HOME/$item" ]; then
        mv "${HOME}/${item}" "${HOME}/${item}.org"
    fi

    ln -s "`pwd`/$item" "$HOME"
    echo "set ${item}"
done

if [ -L "/usr/local/tools" ];then
    echo '/usr/local/toolsが既に存在します'
else
    ln -s ~/dotfiles/tools /usr/local
fi


