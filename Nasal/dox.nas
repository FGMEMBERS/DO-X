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


# Change view to 
var changeView = func (n){
  var actualView = props.globals.getNode("/sim/current-view/view-number", 1);
  if (actualView.getValue() == n){
    actualView.setValue(0);
  }else{
    actualView.setValue(n);
  }
}
