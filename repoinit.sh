
token=806154e183fa1a25bf09a656888ce1d99fe2d848

if [ $# -ne 1 ]; then
    echo "Need to specify repo name as argument"
else
    curl -u 'bergsm:806154e183fa1a25bf09a656888ce1d99fe2d848' https://api.github.com/user/repos -d "{\"name\":\"$1\", \"private\":true}"
fi
