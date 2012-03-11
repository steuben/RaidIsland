

#include "assmanCommons.hpp"

// HEADLINE

  class titleDismissELVIS : titleBarText
  {
	text = "AIR TRANSPORT ELVIS";
  };
  

// BUTTONS
  
  class btn_dismissELVIS:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.46;
    y = 0.48;
	
	h = 0.1;
    w = 0.395;
	
	font = "EtelkaMonospaceProBold";
    sizeEx = 0.054;
	
	text = "DISMISS ELVIS";
	action = "[0, player] execVM ""extras\supportSquad\ELVISClear.sqf""; closeDialog 0; _ok = createDialog ""uiAssmanStart"";"	
  };
  