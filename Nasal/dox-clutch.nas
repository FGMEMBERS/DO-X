# ==================================================
# Before pilot can start with throttle,
# the clutch must set in the engineer panel
# ==================================================

# Les moteurs numérotés vue de dessus 
#
#              avant
#              |   | 
#  gauche 0 2  4   5 3 1 droite
#         6 8 10  11 9 7
#              |   |
#               \ /
#             arrière
#                |

print("Geladen: dox-clutch.nas");


#############  Scrollfunktion am Engineerpanel fuer einzelne Gashebel ###############

var engControl = func(scale,eng,ctrl) {
    var clutch = getprop("/engines/engine["~eng~"]/clutch");
    if (clutch == 0) {
      var prop1="controls/engines/engine["~eng~"]/"~ctrl;
      var val1=getprop(prop1) + (scale);
      if(val1 >1.0) val1 = 1.0;
      if(val1 < 0.0) val1 = 0.0;
      setprop(prop1,val1);
    }
}

############# Testscript:  Aus Nasal Console aufrufbar via dox.switchClutch();
var rpm_down = func(eng){
  setprop("engines/engine["~eng~"]/rpm", 0);
  settimer(rpm_down,10);
}

var switchClutch = func(eng){
  var status = getprop("engines/engine["~eng~"]/running");
  var r1 = getprop("engines/engine["~eng~"]/rpm");
  var mix = getprop("engines/engine["~eng~"]/mixture");
  var magnetos = getprop("/controls/engines/engine["~eng~"]/magnetos");

	  if (status){
      setprop("engines/engine["~eng~"]/rpm", 0);
      setprop("engines/engine["~eng~"]/mixture", 0);
      setprop("engines/engine["~eng~"]/mp-inhg", 0);
      setprop("engines/engine["~eng~"]/mp-osi", 0);
      setprop("/controls/engines/engine["~eng~"]/magnetos", 0);
      setprop("/controls/engines/engine["~eng~"]/cutoff", 1);
      screen.log.write("WARNING: One Engine off!", 1.0, 0.7, 0.0);
    }
    else {
      setprop("engines/engine["~eng~"]/rpm", 300);
      setprop("engines/engine["~eng~"]/mixture", 1);
      setprop("/controls/engines/engine["~eng~"]/magnetos", 1);
      setprop("/controls/engines/engine["~eng~"]/cutoff", 0);
    }
  }

var switchClutch = func{
  var status = getprop("engines/engine["~arg[0]~"]/running");
  var r1 = getprop("engines/engine["~arg[0]~"]/rpm");
  var magnetos = props.globals.getNode("/controls/engines/engine["~arg[0]~"]/magnetos", 1);
  var cutoff = props.globals.getNode("/controls/engines/engine["~arg[0]~"]/cutoff", 1);
  var mpinhg = props.globals.getNode("engines/engine["~arg[0]~"]/mp-inhg", 1);
  var mposi = props.globals.getNode("engines/engine["~arg[0]~"]/mp-osi", 1);

	  if (status == 1){
      r1 = 10;
      mix = 0.0;
      magnetos.setValue(0);
      mpinhg.setValue(0);
      mposi.setValue(0);
      cutoff.setValue(1);
      magnetos.setAttribute("writable", 0);
      cutoff.setAttribute("writable", 0);
      mpinhg.setAttribute("writable", 0);
      mposi.setAttribute("writable", 0);
    }
    else {
      r1 = 300;
      mix = 1.0;
      magnetos.setAttribute("writable", 1);
      cutoff.setAttribute("writable", 1);
      mpinhg.setAttribute("writable", 1);
      mposi.setAttribute("writable", 1);
      magnetos.setValue(1);
      cutoff.setValue(0);
    }
    setprop("engines/engine["~arg[0]~"]/rpm", r1);
    setprop("engines/engine["~arg[0]~"]/mixture", mix);
  }

############## Warning messages for the pilot, when clutch was setting ##########
setlistener("/engines/engine[0]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Outer larboard front-engine -> unlocked", 1.0, 0.7, 0.0);
    }else{
      screen.log.write("Outer larboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[1]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Outer starboard front-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Outer starboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[2]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Middle larboard front-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Middle larboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[3]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Middle starboard front-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Middle starboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[4]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Inner larboard front-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Inner larboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[5]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Inner starboard front-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Inner starboard front-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[6]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Outer larboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Outer larboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[7]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Outer starboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Outer starboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[8]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Middle larboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Middle larboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[9]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Middle starboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Middle starboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[10]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Inner larboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Inner larboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});
setlistener("/engines/engine[11]/clutch", func(clutch) {
    var clutch = clutch.getValue();
    if (clutch == 0){
      screen.log.write("Inner starboard back-engine -> unlocked", 1.0, 0.1, 0.1);
    }else{
      screen.log.write("Inner starboard back-engine -> locked", 0.7, 1.0, 0.7);
    }
});

#var engControl = func(scale,eng,ctrl) {
    # auskommentierte Zeilen sind mit Shift Taste unterstuetzt.
    #var shft = getprop("devices/status/keyboard/shift");
    #var amt = getprop("/devices/status/mice/mouse/accel-y");
    #var eng2 =1-eng;
    #var prop1="controls/engines/engine["~eng~"]/"~ctrl;
    #var prop2="controls/engines/engine["~eng2~"]/"~ctrl;

    #var val1=getprop(prop1) + (scale);
    #if(val1 >1.0) val1 = 1.0;
    #if(val1 < 0.0) val1 = 0.0;
    #setprop(prop1,val1);

    #if(!shft){
    #   var val2=getprop(prop2) + (amt * scale);
    #   if(val2 >1.0) val2 = 1.0;
    #   if(val2 < 0.0) val2 = 0.0;
    #   setprop(prop2,val2);
    #   }
#}

# Ask for the clutch setting and give out the warning
#setlistener("/engines/engine[0]/clutch", func(clutch) {
#    var clutch = clutch.getValue();
#
#    if (clutch == 0){
#      print("Vorderer Backbord-Motor aussen wurde ausgekuppelt.");
#      screen.log.write("Outer larboard front-engine -> unlocked", 1.0, 0.1, 0.1);
#        var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);
#        var cutoff = props.globals.getNode("/controls/engines/engine[0]/cutoff", 1);
#        magnetos.setValue(0);
#        cutoff.setValue(1);
#        magnetos.setAttribute("writable", 0);
#        cutoff.setAttribute("writable", 0);
#    }else{
#      print("Vorderer Backbord-Motor aussen eingekuppelt.");
#      screen.log.write("Outer larboard front-engine -> locked", 0.7, 1.0, 0.7);
#        var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);
#        var cutoff = props.globals.getNode("/controls/engines/engine[0]/cutoff", 1);
#        magnetos.setAttribute("writable", 1);
#        cutoff.setAttribute("writable", 1);
#        magnetos.setValue(1);
#        cutoff.setValue(0);
#    }
#});
