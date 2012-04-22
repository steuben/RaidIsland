
// STANDARD BUTTON

class ButtonControlContent 
  {
    idc = -1;
    type = 1;
    style = 2;
    moving = false;
	
    x = 0.45;
    y = 0.4;
    h = 0.07;
    w = 0.18;
	
    font = "EtelkaMonospaceProBold";
    sizeEx = 0.026;
    
    action = ""
    
    default = false;
    colorText[] = {1,1,1,1};
    colorFocused[] = {0.7, 0.7, 0.4,1};
    colorShadow[] = {0.8,0.8,0.8,0};
    colorBorder[] = {0.5,0.5,0.5,1}; 
    colorBackground[] = {0.6, 0.6, 0.3,1};
    colorBackgroundActive[] = {0.2,0.2,0.1,1};
    colorDisabled[] = {0.6,0.6,0.6,1};
    colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
    borderSize = 0.000;
    offsetX = 0.005;
    offsetY = 0.005;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    soundEnter[] = {"",0,1}; // NoSound
    soundPush[] = {"",0,1}; // NoSound
    soundClick[] = {"",0,1}; // NoSound
    soundEscape[] = {"",0,1}; // NoSound
	
	text = "";
	
  };
  
  
 
 // BACK TO MAIN MENU - BUTTON 
  
  class btn_backToStart:ButtonControlContent 
  {
    
	idc = -1;
    type = 1;
	
    x = 0.46;
    y = 0.36;
	
	h = 0.1;
    w = 0.395;
	
	font = "EtelkaMonospaceProBold";
    sizeEx = 0.054;
	
	text = "MAIN MENU";
	action = "closeDialog 0; _ok = createDialog ""uiAssmanStart"";"	
  };
  
 
// CLOSE BUTTON
  
  class btn_close 
  {
    
	idc = -1;
    type = 1;
    style = 2;
    moving = false;
	
    x = 0.78;
    y = 0.20;
    h = 0.08;
    w = 0.14;
	
    font = "EtelkaMonospaceProBold";
    sizeEx = 0.026;
	
    action = "assmanStart = false; closeDialog 0;"	
    
    default = false;
    colorText[] = {1,1,1,1}; // white
    colorFocused[] = {0.5, 0.5, 0.5,0}; 
    colorShadow[] = {0.8,0.8,0.8,0}; 
    colorBorder[] = {0,0.0,0.0,0}; 
    colorBackground[] = {0, 0, 0,0};
    colorBackgroundActive[] = {0,0,0,0}; 
    colorDisabled[] = {0.6,0.6,0.6,1};
    colorBackgroundDisabled[] = {0.3,0.3,0.3,0};
    borderSize = 0.000;
    offsetX = 0.000;
    offsetY = 0.000;
    offsetPressedX = 0.000;
    offsetPressedY = 0.000;
    soundEnter[] = {"",0,1}; 
    soundPush[] = {"",0,1}; 
    soundClick[] = {"",0,1}; 
    soundEscape[] = {"",0,1};
	
	text = "CLOSE [X]";
	
  };
  
 


 
// BG CLASSES 
 

  // MAIN BG 
  class bgShape 
  {
	idc = -1;
	type =  0 ;  
	style = 0; 
	moving = true;
	colorText[] = { 0, 0, 0, 1 };
	colorBackground[] = { 0.4, 0.4, 0.3, 0.6 };
	font = "EtelkaMonospaceProBold";
	sizeEx = 0.023;
	x = 0.4; y = 0.2;
	w = 0.515;  h = 0.55;
	text = "";
  };
  
  class bgShape2
  {
	idc = -1;
	type =  0 ;  
	style = 0; 
	moving = true;
	colorText[] = { 0, 0, 0, 1 };
	colorBackground[] = { 0.4, 0.4, 0.3, 0.6 };
	font = "EtelkaMonospaceProBold";
	sizeEx = 0.023;
	x = 0.4; y = 0.2;
	w = 0.515;  h = 0.57;
	text = "";
  };
  
  
  // TITLE BAR
  class titleBarText 
  {
	idc = -1;
	type =  0 ;
	style = 0;
	moving = true;
	colorText[] = { 0.8, 0.8, 0.3, 1 };
	colorBackground[] = { 0.2, 0.2, 0.2, 1 };
	font = "EtelkaMonospaceProBold";
	sizeEx = 0.043;
	x = 0.4; y = 0.2;
	w = 0.515;  h = 0.08;
	text = "";
  };
  
  
  // SUBLINE
  class subtitleH1 
  {
	idc = -1;
	type =  0 ;
	style = 0; 
	moving = true;
	colorText[] = { 1, 1, 1, 1 };
	colorBackground[] = { 0.2, 0.2, 0.2, 0 };
	font = "Zeppelin33";
	sizeEx = 0.03;
	x = 0.4; y = 0.32;
	w = 0.3;  h = 0.1;
	text = "";
  };
  

  
  