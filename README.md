## Content:
*This dockerfile image includes:
 +base:  dockerfile/ubuntu-desktop (vncserver pre-installed)
 +firefox esr
 +ruby193
 +watir v5.0 (plus all required dep gems that came/require it)
 +minitest and minitest-reporters
 +xvfb and headless (for headless operation in watir)

#### To connect to the VNC server, run:
  *./vncviewer.sh
  +(vncpassword is Hello!23)

#### NOTE: you can also enter and execute CMD inside the container with:
  *docker exec -it vncffwatir /bin/bash
  +docker exec -it vncffwatir ruby /tmp/test/google_regression_test.rb 
