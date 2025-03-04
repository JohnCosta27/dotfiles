for file in ".config"/*; do
    echo "rsync -av ~/$file .config --delete"
    rsync -av ~/$file .config --delete
done
