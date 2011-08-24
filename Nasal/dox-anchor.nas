# ==================================================
# If anchor is down, hold position
# ==================================================

# anchor down
var castAnchor = func{
  var agl = getprop("/position/gear-agl-m");
  if (agl < 4.0){
    var anchor = props.globals.getNode("/controls/anchor", 1);
    var anchorLat = props.globals.getNode("/controls/anchor-lat", 1);
    var anchorLon = props.globals.getNode("/controls/anchor-lon", 1);
    var lat = props.globals.getNode("/position/latitude-deg", 1);
    var lon = props.globals.getNode("/position/longitude-deg", 1);
    # set new position
    anchorLat.setValue(lat.getValue());
    anchorLon.setValue(lon.getValue());
    anchor.setValue(1);
    screen.log.write("Cast Anchor!", 1.0, 0.7, 0.0);
    holdPos();
  }else{
    screen.log.write("Do not cast anchor in flight!", 1.0, 0.0, 0.0);
  }
}

# anchor up
var hoistAnchor = func{
  var anchor = props.globals.getNode("/controls/anchor", 1);
  anchor.setValue(0);
  screen.log.write("Hoist Anchor!", 1.0, 0.7, 0.0);
}

# this function will not end once she is startet at session.
# but if anchor is up, she return at the first if - so ... ;-)
var holdPos = func{
  var anchor = props.globals.getNode("/controls/anchor", 1);
  if (anchor.getValue() == 1){
    var anchorLat = props.globals.getNode("/controls/anchor-lat", 1);
    var anchorLat = anchorLat.getValue();
    setprop("/position/latitude-deg", anchorLat);

    var anchorLon = props.globals.getNode("/controls/anchor-lon", 1);
    var anchorLon = anchorLon.getValue();
    setprop("/position/longitude-deg", anchorLon);
  }
  # Position updated 4 times / sec
  settimer(holdPos, 0);
}

# if somebody want to try take of with anchor, chains will 
setlistener("/instrumentation/airspeed-indicator/true-speed-kt", func(as) {
    var as = getprop("/instrumentation/airspeed-indicator/true-speed-kt");
    var anchor = props.globals.getNode("/controls/anchor", 1);
    if (as > 27 and anchor.getValue() == 1){
      anchor.setValue(0);
      screen.log.write("Anchor chains ruptured!!", 1.0, 0.0, 0.0);
    }
});









