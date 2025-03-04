for file in ".config"/*; do
    echo $file
    echo "rsync -av ~/$file .config/$file --delete"
done
