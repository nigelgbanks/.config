search () {
    find . -regex ".*\.\(php\|inc\|test\|module\|install\|info\)" -exec grep -H $@ {} \;
}
mecp () {
    scp $@ ${SSH_CLIENT%% *}:~/Downloads;
}
find_and_replace() {
    search $1 | cut -d ":" -f 1 | xargs perl -i -p -e "s/$1/$2/g"
}
