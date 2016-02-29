docker run -P --name atom --device /dev/sda1 -v /home/dani/:/home/user -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY atom
