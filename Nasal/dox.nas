# DO X 
#
#	set up menu dialogs
#
# stolen from Gary Neely aka 'Buckaroo's Lockheed 1049h


DoxMain = {};

DoxMain.new = func {
  obj = { parents : [DoxMain]
        };
  obj.init();
  return obj;
}

# global variables in dox namespace, for call by XML
DoxMain.instantiate = func {
   globals.dox.menusystem = Menu.new();
}

DoxMain.init = func {
   me.instantiate();
}

DOXL = setlistener("/sim/signals/fdm-initialized", func {
  thedox = DoxMain.new();
  removelistener(DOXL);
  }
);

# Lights interior on/off
var interiorLights = func {
  var p = getprop("/controls/lighting/panel");
  var n = getprop("/controls/lighting/navigationcabin");
  var e = getprop("/controls/lighting/engineerpanel");
  var r = getprop("/controls/lighting/radiocabin");
  var h = getprop("/controls/lighting/helpenginecabin");

  if (p == 0) {
    setprop("/controls/lighting/panel",1);
  }else{
    setprop("/controls/lighting/panel",0);
  }

  if (n == 0) {
    setprop("/controls/lighting/navigationcabin",1);
  }else{
    setprop("/controls/lighting/navigationcabin",0);
  }

  if (e == 0) {
    setprop("/controls/lighting/engineerpanel",1);
  }else{
    setprop("/controls/lighting/engineerpanel",0);
  }

  if (r == 0) {
    setprop("/controls/lighting/radiocabin",1);
  }else{
    setprop("/controls/lighting/radiocabin",0);
  }

  if (h == 0) {
    setprop("/controls/lighting/helpenginecabin",1);
  }else{
    setprop("/controls/lighting/helpenginecabin",0);
  }
  
}

