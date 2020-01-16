#pick a random mp3 file under /home/music
song=$(find /home/music -name *.mp3 | shuf -n 1);
#write mp3 tag information to status.json
mp3info -p '{"title": "%t","artist": "%a" ,"category": "'${genre}'"}' "$song" > /home/info.json
#echo the info
echo $song;
