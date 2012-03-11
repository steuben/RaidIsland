class uiAssmanStart 
{

  idd = -1;
  movingEnable = true;
  controlsBackground[] = {"bgShape","titleHome"};
  controls[] = {"btn_reqFiremission","btn_reqAirsupport","btn_reqAirtransport","btn_reqCarpetbomb","btn_reqSatscan","subtitleH1_support_artillery","subtitleH1_support_air","subtitleH1_support_satscan", "btn_close"};
  objects[] = {};
  
  #include "assmanStart.hpp"
};

class uiAssmanDismissMortars 
{

  idd = -1;
  movingEnable = true;
  controlsBackground[] = {"bgShape","titleBarText"};
  controls[] = {"titleDismissMortars","btn_backToStart","btn_dismissMortars","btn_close"};
  objects[] = {};
  
  #include "assmanDismissMortars.hpp"
};

class uiAssmanDismissCAS 
{

  idd = -1;
  movingEnable = true;
  controlsBackground[] = {"bgShape","titleBarText"};
  controls[] = {"titleDismissCAS","btn_backToStart","btn_dismissCAS","btn_close"};
  objects[] = {};
  
  #include "assmanDismissCAS.hpp"
}; 

class uiAssmanDismissELVIS 
{

  idd = -1;
  movingEnable = true;
  controlsBackground[] = {"bgShape","titleBarText"};
  controls[] = {"titleDismissELVIS","btn_backToStart","btn_dismissELVIS","btn_close"};
  objects[] = {};
  
  #include "assmanDismissELVIS.hpp"
}; 