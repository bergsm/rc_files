
token=806154e183fa1a25bf09a656888ce1d99fe2d848

if [ $# -ne 1 ]; then
    echo "Need to specify repo name as argument"
else
    curl -u 'bergsm:806154e183fa1a25bf09a656888ce1d99fe2d848' https://api.github.com/user/repos -d "{\"name\":\"$1\", \"private\":true}"
fi

mkdir $1
cd $1

git init

echo "README for $1" >> README

git add -A
git commit -m "Initial commit"
git remote add origin git@github.com:bergsm/$1
git push -u origin master
