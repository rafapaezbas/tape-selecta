sudo docker build -t rpaezbas/hyena-radio:0.01 . 
sudo docker run -p 8000:8000/tcp --rm -ti rpaezbas/hyena-radio:0.01 /bin/bash
