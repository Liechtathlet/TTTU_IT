docker run -P --name ionide --device /dev/sda1 -v /home/dani/:/home/user/remote -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY ionide
