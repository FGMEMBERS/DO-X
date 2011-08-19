# ==================================================
# Start up engine by engine
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


var startEngines = func{

  var r0 = getprop("engines/engine[0]/running");
  var r1 = getprop("engines/engine[1]/running");
  var r2 = getprop("engines/engine[2]/running");
  var r3 = getprop("engines/engine[3]/running");
  var r4 = getprop("engines/engine[4]/running");
  var r5 = getprop("engines/engine[5]/running");
  var r6 = getprop("engines/engine[6]/running");
  var r7 = getprop("engines/engine[7]/running");
  var r8 = getprop("engines/engine[8]/running");
  var r9 = getprop("engines/engine[9]/running");  
  var r10 = getprop("engines/engine[10]/running");
  var r11 = getprop("engines/engine[11]/running");

  if(!r4) {
    var magnetos = props.globals.getNode("/controls/engines/engine[4]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[4]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[4]/rpm", 600);
    setprop("engines/engine[4]/mixture", 1.0);
    return
  }
  if(!r5) {
    var magnetos = props.globals.getNode("/controls/engines/engine[5]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[5]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[5]/rpm", 600);
    setprop("engines/engine[5]/mixture", 1.0);
    return
  }
  if(!r10) {
    var magnetos = props.globals.getNode("/controls/engines/engine[10]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[10]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[10]/rpm", 600);
    setprop("engines/engine[10]/mixture", 1.0);
    return
  }
  if(!r11) {
    var magnetos = props.globals.getNode("/controls/engines/engine[11]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[11]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[11]/rpm", 600);
    setprop("engines/engine[11]/mixture", 1.0);
    return
  }
  if(!r2) {
    var magnetos = props.globals.getNode("/controls/engines/engine[2]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[2]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[2]/rpm", 600);
    setprop("engines/engine[2]/mixture", 1.0);
    return
  }
  if(!r3) {
    var magnetos = props.globals.getNode("/controls/engines/engine[3]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[3]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[3]/rpm", 600);
    setprop("engines/engine[3]/mixture", 1.0);
    return
  }
  if(!r8) {
    var magnetos = props.globals.getNode("/controls/engines/engine[8]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[8]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[8]/rpm", 600);
    setprop("engines/engine[8]/mixture", 1.0);
    return
  }
  if(!r9) {
    var magnetos = props.globals.getNode("/controls/engines/engine[9]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[9]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[9]/rpm", 600);
    setprop("engines/engine[9]/mixture", 1.0);
    return
  }
  if(!r0) {
    var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[0]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[0]/rpm", 600);
    setprop("engines/engine[0]/mixture", 1.0);
    return
  }
  if(!r1) {
    var magnetos = props.globals.getNode("/controls/engines/engine[1]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[1]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[1]/rpm", 600);
    setprop("engines/engine[1]/mixture", 1.0);
    return
  }
  if(!r6) {
    var magnetos = props.globals.getNode("/controls/engines/engine[6]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[6]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[6]/rpm", 600);
    setprop("engines/engine[6]/mixture", 1.0);
    return
  }
  if(!r7) {
    var magnetos = props.globals.getNode("/controls/engines/engine[7]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[7]/cutoff", 1);
    magnetos.setValue(1);
    cutoff.setValue(0);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[7]/rpm", 600);
    setprop("engines/engine[7]/mixture", 1.0);
    return
  }
}


var stopEngines = func{

  var r0 = getprop("engines/engine[0]/running");
  var r1 = getprop("engines/engine[1]/running");
  var r2 = getprop("engines/engine[2]/running");
  var r3 = getprop("engines/engine[3]/running");
  var r4 = getprop("engines/engine[4]/running");
  var r5 = getprop("engines/engine[5]/running");
  var r6 = getprop("engines/engine[6]/running");
  var r7 = getprop("engines/engine[7]/running");
  var r8 = getprop("engines/engine[8]/running");
  var r9 = getprop("engines/engine[9]/running");  
  var r10 = getprop("engines/engine[10]/running");
  var r11 = getprop("engines/engine[11]/running");

  if(r7) {
    var magnetos = props.globals.getNode("/controls/engines/engine[7]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[7]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[7]/rpm", 50);
    setprop("engines/engine[7]/mixture", 0);
    return
  }
  if(r6) {
    var magnetos = props.globals.getNode("/controls/engines/engine[6]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[6]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[6]/rpm", 50);
    setprop("engines/engine[6]/mixture", 0);
    return
  }
  if(r1) {
    var magnetos = props.globals.getNode("/controls/engines/engine[1]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[1]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[1]/rpm", 50);
    setprop("engines/engine[1]/mixture", 0);
    return
  }
  if(r0) {
    var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[0]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[0]/rpm", 50);
    setprop("engines/engine[0]/mixture", 0);
    return
  }
  if(r9) {
    var magnetos = props.globals.getNode("/controls/engines/engine[9]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[9]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[9]/rpm", 50);
    setprop("engines/engine[9]/mixture", 0);
    return
  }
  if(r8) {
    var magnetos = props.globals.getNode("/controls/engines/engine[8]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[8]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[8]/rpm", 50);
    setprop("engines/engine[8]/mixture", 0);
    return
  }
  if(r3) {
    var magnetos = props.globals.getNode("/controls/engines/engine[3]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[3]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[3]/rpm", 50);
    setprop("engines/engine[3]/mixture", 0);
    return
  }
  if(r2) {
    var magnetos = props.globals.getNode("/controls/engines/engine[2]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[2]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[2]/rpm", 50);
    setprop("engines/engine[2]/mixture", 0);
    return
  }
  if(r11) {
    var magnetos = props.globals.getNode("/controls/engines/engine[11]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[11]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[11]/rpm", 50);
    setprop("engines/engine[11]/mixture", 0);
    return
  }
  if(r10) {
    var magnetos = props.globals.getNode("/controls/engines/engine[10]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[10]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[10]/rpm", 50);
    setprop("engines/engine[10]/mixture", 0);
    return
  }
  if(r5) {
    var magnetos = props.globals.getNode("/controls/engines/engine[5]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[5]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[5]/rpm", 50);
    setprop("engines/engine[5]/mixture", 0);
    return
  }
  if(r4) {
    var magnetos = props.globals.getNode("/controls/engines/engine[4]/magnetos", 1);
    var cutoff = props.globals.getNode("/controls/engines/engine[4]/cutoff", 1);
    magnetos.setValue(0);
    cutoff.setValue(1);
    magnetos.setAttribute("writable", 0);
    cutoff.setAttribute("writable", 0);
    setprop("engines/engine[4]/rpm", 50);
    setprop("engines/engine[4]/mixture", 0);
    return
  }
}
