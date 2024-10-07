pushd ~

directories=("Videos" "Documents" "Pictures")
for dir in "${directories[@]}"; do
    rsync -avH "./$dir" zh3586@zh3586.rsync.net:"$dir"
done

popd
