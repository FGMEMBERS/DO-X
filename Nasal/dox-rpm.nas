# ==================================================
# Averaged RPM of all engines locked in (clutch on)
# ==================================================

var updateRPM = func {

# rpm left and right default 'off':

  var rpmL = 0;
  var rpmR = 0;

  var rpm0 = getprop("/engines/engine[0]/rpm");
  var rpm1 = getprop("/engines/engine[1]/rpm");
  var rpm2 = getprop("/engines/engine[2]/rpm");
  var rpm3 = getprop("/engines/engine[3]/rpm");
  var rpm4 = getprop("/engines/engine[4]/rpm");
  var rpm5 = getprop("/engines/engine[5]/rpm");
  var rpm6 = getprop("/engines/engine[6]/rpm");
  var rpm7 = getprop("/engines/engine[7]/rpm");
  var rpm8 = getprop("/engines/engine[8]/rpm");
  var rpm9 = getprop("/engines/engine[9]/rpm");
  var rpm10 = getprop("/engines/engine[10]/rpm");
  var rpm11 = getprop("/engines/engine[11]/rpm");

  rpmL = (rpm0 + rpm2 + rpm4 + rpm6 + rpm8 + rpm10);
  if (rpmL == 0) rpmL = 0.1;
  rpmL = rpmL/6;

  rpmR = (rpm1 + rpm3 + rpm5 + rpm7 + rpm9 + rpm11);
  if (rpmL == 0) rpmL = 0.1;
  rpmR = rpmR/6;

# Save RPM settings

  setprop("engines/engine[0]/averagerpm", rpmL);
  setprop("engines/engine[1]/averagerpm", rpmR);


# RPM updated 8 times / sec

  settimer(updateRPM, .125);
}

updateRPM();
