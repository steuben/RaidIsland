

#include "assmanCommons.hpp"

// HEADLINE
 class titleHome : titleBarText
  {
	text = " BLUFOR ASSMAN";
  };

  
// SUBLINES
  class subtitleH1_support_artillery : subtitleH1
  {
	text = "ARTILLERY SUPPORT";
	x = 0.415; y = 0.28;
	
  };
  
  class subtitleH1_support_air : subtitleH1
  {
	text = "AIR SUPPORT";
	x = 0.71; y = 0.28;
	
  };
  
  class subtitleH1_support_satscan : subtitleH1
  {
	text = "ADVANCED ASSETS";
	x = 0.415; y = 0.4435;
	
  };





// BUTTONS

 class btn_reqFiremission:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.42;
    y = 0.37;
	
	text = "MC BATTERY";
	action = "if (supportMCASBusy) exitWith {hint ""ASSET BUSEY""}; if (!supportMCAS) then {[0, player] execVM ""extras\supportSquad\arty.sqf""; assmanStart = false; closeDialog 0};   if (supportMCAS) then { closeDialog 0; _ok = createDialog ""uiAssmanDismissMortars""; };"	
  };
  
  class btn_reqSatscan:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.42;
    y = 0.533;
	
	text = "SATSCAN";
	action = "[] execVM ""extras\surveillance\satelliteScan.sqf""; assmanStart = false; closeDialog 0;"	
  };

  class btn_reqAirsupport:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.714;
    y = 0.37;
	
	text = "CAS 'MANATEE'";
	action = "if (supportCASBusy) exitWith {hint ""ASSET BUSEY""}; if (!supportCAS) then {[0, player] execVM ""extras\supportSquad\CAS.sqf""; assmanStart = false; closeDialog 0};   if (supportCAS) then { closeDialog 0; _ok = createDialog ""uiAssmanDismissCAS""; };"	
  };
  
  class btn_reqCarpetbomb:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.714;
    y = 0.46;
	
	text = "CARPET BOMBER";
	action = "[player] execVM ""extras\carpetBomber\carpetInit.sqf""; assmanStart = false; closeDialog 0;"	
  };
  
  
  class btn_reqAirtransport:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.714;
    y = 0.55;
	
	text = "PAT 'ELVIS'";
	action = "if (supportELVISBusy) exitWith {hint ""ASSET BUSEY""}; if (!supportELVIS) then {[0, player] execVM ""extras\supportSquad\elvis.sqf""; assmanStart = false; closeDialog 0};   if (supportELVIS) then { closeDialog 0; _ok = createDialog ""uiAssmanDismissELVIS""; };"	
  };
  
  
  
 