# ==============================================================================
# Antenne switch for Radio Direction Finder RDF or Automatic Direction Finder ADF
# ==============================================================================

############### Set always the right position of the RDF Aerial #################
var rdfAerialPos = func{
  var state = getprop("/instrumentation/rdf/power-on");
  var adfState = getprop("/instrumentation/adf[0]/power-btn");
  var adfRange = getprop("/instrumentation/adf[0]/in-range");

  if (state == 1){
    var rdfDeg = getprop("/instrumentation/rdf/rotation-deg");
    var adfDeg = getprop("/instrumentation/adf/indicated-bearing-deg");
    var adfVol = props.globals.getNode("/instrumentation/adf[0]/volume-norm", 1);
    # calculate the difference between manuel aerial setting / rdf and 
    # automatic direction deg from FG / adf to set the volume of beacon morse code
    var rotDiff = abs(adfDeg - rdfDeg);
    if (rotDiff > 180){
      rotDiff = abs(360 - rotDiff);
    }

    # set volume in headset
    if(rotDiff < 1){
      adfVol.setValue(1);
    }elsif(rotDiff < 3){
      adfVol.setValue(0.7);
    }elsif(rotDiff < 6){
      adfVol.setValue(0.5);
    }elsif(rotDiff < 9){
      adfVol.setValue(0.3);
    }elsif(rotDiff < 18){
      adfVol.setValue(0.2);
    }elsif(rotDiff < 36){
      adfVol.setValue(0.14);
    }elsif(rotDiff < 72){
      adfVol.setValue(0.09);
    }else{
      adfVol.setValue(0.06);
    }

    #screen.log.write("Ergebnis:" ~rotDiff, 1.0, 0.1, 0.1);  #for debug only

  }elsif(adfState == 1 and adfRange == 1){
    var rdfDeg = getprop("/instrumentation/adf[0]/indicated-bearing-deg");
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
    var controlVol = getprop("/instrumentation/adf[0]/volume-norm");

    # if the volume of the adf signal is not 0.2 or higher, there is no signal in range
    if (controlVol >= 0.2) {

      var newRdfDeg = rdfDeg;
      if (rdfDeg > 180){
        newRdfDeg = abs(360 - rdfDeg);
      }
      headCorrection = int(newRdfDeg);

      if (rdfDeg > 180 and rdfDeg < 360){
        screen.log.write("Heading correction "~headCorrection~" degree to larboard", 1.0, 0.1, 0.1);
      }elsif(rdfDeg > 0 and rdfDeg < 180){
        screen.log.write("Heading correction "~headCorrection~" degree to starboard", 1.0, 0.1, 0.1);
      }elsif(rdfDeg == 180){
        screen.log.write("Heading correction 180 degree", 1.0, 0.1, 0.1);
      }elsif(rdfDeg == 0){
        var ndbIdent = " - " ~ getprop("/instrumentation/adf[0]/ident");
        screen.log.write("Hold this heading. NDB"~ndbIdent~" is straight ahead.", 1.0, 0.1, 0.1);
      }
    }else{
        screen.log.write("Nonviable calculation. Please search a viable NDB-signal in range.", 1.0, 0.1, 0.1);
    }


}


############### The Radio Officer can fit on the headset #########################
var fitHeadset = func{

  var avionicsVol = props.globals.getNode("/sim/sound/avionics/volume", 1);
  var effectsVol = props.globals.getNode("/sim/sound/effects/volume", 1);
  var adfAudible = props.globals.getNode("/instrumentation/adf[0]/ident-audible", 1);
  var adfVol = props.globals.getNode("/instrumentation/adf[0]/volume-norm", 1);
  var effectsVol = props.globals.getNode("/sim/sound/effects/volume", 1);
  var fitheadset = props.globals.getNode("/instrumentation/rdf/fit-headset", 1);

  if (fitheadset.getValue() == 1){
    fitheadset.setValue(0);
    avionicsVol.setValue(0.6);
    effectsVol.setValue(0.6);
    adfAudible.setValue("");
    adfVol.setValue(0.05);
  }else{
    fitheadset.setValue(1);
    avionicsVol.setValue(1);
    effectsVol.setValue(0.08);
    adfAudible.setValue("true");
    adfVol.setValue(0.7);
  }
};



