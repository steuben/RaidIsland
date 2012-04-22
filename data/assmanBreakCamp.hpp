

#include "assmanCommons.hpp"

// HEADLINE

  class titleBreakCamp : titleBarText
  {
	text = "CAMP";
  };
  

// BUTTONS
  
    
  class btn_breakCamp:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.46;
    y = 0.48;
	
	h = 0.1;
    w = 0.395;
	
	font = "EtelkaMonospaceProBold";
    sizeEx = 0.054;
	
	text = "BREAK CAMP";
	action = "[0, player] execVM ""extras\spawnCamp\breakCamp.sqf""; closeDialog 0;"	
  };
  