docker run -t -i -P --name vso-code --device /dev/dri -v /home/dani/:/home/user/remote -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY vso-code /bin/bash
