This is a dockerfile with:
 -base:  dockerfile/ubuntu-desktop (vncserver pre-installed)
 -firefox v31
 -ruby193
 -watir v5.0 (plus all required dep gems that came/require it)
 -minitest and minitest-reporters
 -xvfb and headless (for headless operation in watir)

NOTE: you can also docker exec -it vncffwatir /bin/bash
  to run firefox and ruby /tmp/test/google_regression_test.rb  inside the container

