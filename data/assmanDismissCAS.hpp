

#include "assmanCommons.hpp"

// HEADLINE

  class titleDismissCAS : titleBarText
  {
	text = " CAS MANATEE";
  };
  

// BUTTONS
  
  class btn_dismissCAS:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.46;
    y = 0.48;
	
	h = 0.1;
    w = 0.395;
	
	font = "EtelkaMonospaceProBold";
    sizeEx = 0.054;
	
	text = "DISMISS MANATEE";
	action = "[0, player] execVM ""extras\supportSquad\CASClear.sqf""; closeDialog 0; _ok = createDialog ""uiAssmanStart"";"	
  };
  