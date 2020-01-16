sudo docker build -t rpaezbas/hyena-radio:0.01 . 
sudo docker run -p 8000:8000/tcp -p 3000:3000/tcp -v $(pwd)/music:/home/music --rm -ti rpaezbas/hyena-radio:0.01 /bin/bash
