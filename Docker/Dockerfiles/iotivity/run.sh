sudo docker run -ti --name iotivity -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v /home/dani/Development:/home/developer/Development dbru/iotivity:v0 /bin/bash

#sudo docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix dbru/prodoffice:v0 /bin/bash

# sudo docker run -t -i dbru/prodoffice:v0 /bin/bash
