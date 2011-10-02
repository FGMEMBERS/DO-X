# ===================================
# Radio Direction Finder RDF settings
# ===================================
var mymod = func(x,y){
  var res = x/y;
  var resInt = int(res);
  var resSmall = y * resInt;
  return x - resSmall;
}

var indiBearingDeg = func(a,b){
  var diff = b-a;
  var newAngle = 0.0;
  if(diff > 180)
  {
      newAngle = mymod((diff + 180),360) - 180;
  }
  elsif(diff < -180)
  {
      newAngle = mymod((diff - 180),360) + 180;
  }
  else
  {
      newAngle = mymod(diff, 360);
  }
  return (360 - newAngle);
};

# Switch on/off
var clickRdfSwitch = func{
    var nav = props.globals.getNode("/instrumentation/nav/power-btn", 1);
    var adf = props.globals.getNode("/instrumentation/adf/power-btn", 1);
    var rdf = props.globals.getNode("/instrumentation/rdf/power-on", 1);

    if(rdf.getValue()){
      rdf.setValue(0);
      adf.setValue(0);
      nav.setValue(1);  # we need it always for correct afn2 working
    }else{
      rdf.setValue(1);
      adf.setValue(1);
      nav.setValue(1);
    }
}

############### Set always the right position of the RDF Aerial #################
var rdfAerialPos = func{
  var state = getprop("/instrumentation/rdf/power-on");
  var freqSel = getprop("/instrumentation/rdf/frequency-select-knob"); # 0 = NDB, 1 = VOR or ILS
  var adfState = getprop("/instrumentation/adf/power-btn");
  var navState = getprop("/instrumentation/nav/power-btn");
  var adfRange = getprop("/instrumentation/adf/in-range");
  var navRange = getprop("/instrumentation/nav/in-range");

  if (state == 1){
    var rdfDeg = getprop("/instrumentation/rdf/rotation-deg");

    if(freqSel == 1){
      var aircraftDirDeg = getprop("/orientation/heading-magnetic-deg");
      var dirDeg = getprop("/instrumentation/nav/heading-deg");
      var indiDeg = indiBearingDeg(dirDeg,aircraftDirDeg);
      var vol = props.globals.getNode("/instrumentation/nav/volume", 1);
      setprop("/instrumentation/adf/volume-norm", 0);
      #screen.log.write("IndiDeg aus VOR" ~indiDeg, 1.0, 0.1, 0.1);  #for debug only

    }else{
      var indiDeg = getprop("/instrumentation/adf/indicated-bearing-deg");
      var vol = props.globals.getNode("/instrumentation/adf/volume-norm", 1);
      setprop("/instrumentation/nav/volume", 0);
      #screen.log.write("IndiDeg aus NDB" ~indiDeg, 1.0, 0.1, 0.1);  #for debug only
    }

    # calculate the difference between manuel aerial setting / rdf and 
    # automatic direction deg from FG / adf to set the volume of beacon morse code
    var rotDiff = abs(indiDeg - rdfDeg);
    if (rotDiff > 180){
      rotDiff = abs(360 - rotDiff);
    }

    # set volume in headset
    if(rotDiff < 0.5){
      vol.setValue(1);
    }elsif(rotDiff < 3){
      vol.setValue(0.7);
    }elsif(rotDiff < 6){
      vol.setValue(0.5);
    }elsif(rotDiff < 9){
      vol.setValue(0.3);
    }elsif(rotDiff < 18){
      vol.setValue(0.2);       # do not change this, its the control volume in rdfNavInfo()
    }elsif(rotDiff < 36){
      vol.setValue(0.14);
    }elsif(rotDiff < 72){
      vol.setValue(0.09);
    }else{
      vol.setValue(0.06);
    }

    #screen.log.write("Ergebnis:" ~rotDiff, 1.0, 0.1, 0.1);  #for debug only

  }elsif(adfState == 1 and adfRange == 1){
    var rdfDeg = getprop("/instrumentation/adf/indicated-bearing-deg");
  }else{
    var rdfDeg = 90;
  }

  setprop("/instrumentation/rdf/rotation-deg", rdfDeg);
  settimer(rdfAerialPos, 0);
};

#fire it up
rdfAerialPos();


# if state of RDF change, set the Aerial on 0 deg
setlistener("/instrumentation/rdf/power-on", func {
    setprop("/instrumentation/rdf/rotation-deg", 0);
});

############### Show the course correction deg ###################################
var rdfNavInfo = func {
    var rdfDeg = getprop("/instrumentation/rdf/rotation-deg");
    var freqSel = getprop("/instrumentation/rdf/frequency-select-knob"); # 0 = NDB, 1 = VOR or ILS
    var text2 = "";
    if(freqSel == 1){
      var controlVol = getprop("/instrumentation/nav/volume");
      var text = getprop("/instrumentation/nav/nav-id");
      var dmeInRange = getprop("/instrumentation/dme/in-range");
      if(dmeInRange == 1){
        var dmeDistance = int(getprop("/instrumentation/dme/indicated-distance-nm"));
        text2 = "Distance "~dmeDistance~"nm";
      }
    }else{
      var controlVol = getprop("/instrumentation/adf/volume-norm");
      var text = getprop("/instrumentation/adf/ident");
    }


    # if the volume of the adf signal is not 0.2 or higher, there is no signal in range
    if (controlVol >= 0.2) {

      var newRdfDeg = rdfDeg;
      if (rdfDeg > 180){
        newRdfDeg = abs(360 - rdfDeg);
      }
      headCorrection = int(newRdfDeg);

      if (rdfDeg > 180 and rdfDeg < 360){
        screen.log.write(text~" -> "~headCorrection~" degree to larboard", 1.0, 0.1, 0.1);
      }elsif(rdfDeg > 0 and rdfDeg < 180){
        screen.log.write(text~" -> "~headCorrection~" degree to starboard", 1.0, 0.1, 0.1);
      }elsif(rdfDeg == 180){
        screen.log.write(text~" on 180 degree", 1.0, 0.1, 0.1);
      }elsif(rdfDeg == 0){
        screen.log.write("Hold this heading. Beacon - "~text~" is straight ahead.", 1.0, 0.1, 0.1);
      }
      
      if(text2 != ""){
        screen.log.write(text2, 1.0, 0.1, 0.1);
      }
    }else{
        screen.log.write("Nonviable calculation. Please first find a viable signal in range.", 1.0, 0.1, 0.1);
    }
}


