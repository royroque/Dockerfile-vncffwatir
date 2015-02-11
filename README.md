This is a dockerfile with:
 -base:  dockerfile/ubuntu-desktop (vncserver pre-installed)

 -firefox ESR: v31

 -ruby193

 -watir v5.0 (plus all required dep gems that came/require it)

 -selenium-webdriver 2.42.0

 -minitest and minitest-reporters

 -xvfb and headless (for headless operation in watir)


NOTE: to connect to container through vncviewer, see/execute start_vncviewer.sh (when prompted, password is Hello!23)
NOTE: you can then run the sample test: ruby test/google_test_regression.rb

