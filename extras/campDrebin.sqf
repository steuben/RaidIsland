
[-2, {gnrf_drebinFlagPole removeAction gnrf_buildDrebin_Act;}] call CBA_fnc_globalExecute;

_classArray = ["Land_fort_bagfence_long","Land_fortified_nest_small_EP1","Land_fort_bagfence_round","Land_fort_bagfence_corner","Land_fort_bagfence_long","Land_fort_bagfence_long","Land_fort_bagfence_long","Land_fort_bagfence_corner","Land_fort_bagfence_round","Land_fortified_nest_small_EP1","Land_fort_bagfence_long","Land_fort_bagfence_long","Land_fort_bagfence_long","BAF_GMG_Tripod_D","TOW_TriPod","M2StaticMG","USLaunchers_EP1","USLaunchers_EP1","Land_CamoNetVar_NATO_EP1","Land_Fort_Watchtower_EP1","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","Land_HBarrier_large","USVehicleBox","USVehicleBox","MASH_EP1","Land_Teapot_EP1","Land_Water_pipe_EP1","PowGen_Big_EP1","FlagCarrierUSArmy_EP1","USBasicWeapons_EP1","USLaunchers_EP1","USSpecialWeapons_EP1","BAF_IEDBox","Fort_Barracks_USMC"];
_posArray = [[4020.04,4685.52,30.7307],[4018.26,4688.25,30.3003],[4013.6,4689.45,30.3307],[4011.73,4694.15,29.6039],[4009.54,4696.55,29.6422],[4006.65,4697.59,29.7826],[4003.91,4698.72,29.9442],[4000.62,4698.85,30.2432],[3995.87,4697.5,31.0428],[3991.83,4700.49,30.8052],[3988.3,4699.96,31.411],[3985.36,4700.19,31.7877],[4022.36,4683.75,31.0855],[4007.82,4691.26,30.4336],[4004.41,4693.03,30.3097],[4001.05,4695.37,30.4852],[3989.59,4698.86,31.488],[4015.18,4687.05,30.5242],[4003.91,4692.09,30.3351],[3996.94,4677.49,32.8204],[3998.38,4660.14,33.7154],[3998.38,4660.14,33.7154],[3998.38,4660.14,33.7154],[4005.77,4656.49,33.6436],[3983.7,4666.5,36.0712],[3970.65,4673.04,38.0156],[3970.65,4673.04,38.0156],[3962.5,4675.36,38.5843],[3953.91,4674.39,39.0854],[4013.03,4651.8,34.5742],[4013.03,4651.8,34.5742],[4019.07,4645.9,35.6647],[4019.07,4645.9,35.6647],[4001.19,4654.15,33.5074],[4004.38,4652.22,33.6427],[3963.94,4670.31,38.7576],[3963.09,4672.21,38.692],[3963.57,4672.29,38.6566],[3967.52,4640.17,36.6891],[3973.6,4650.4,37.0987],[3993.17,4674.35,33.479],[3997.6,4672.53,32.973],[3998.36,4676.81,32.605],[3995.07,4678.78,32.9168],[3967.62,4648.16,37.5]];
_dirArray = [218.555,219.308,220.888,206.762,203.315,199.631,202.025,120.099,190.546,189.87,185.167,184.509,219.355,28.1975,27.9824,27.7154,27.3143,343.449,206.18,116.895,28.7312,28.7312,28.7312,27.9648,28.3665,25.1223,25.1223,10.949,340.527,39.1293,39.1293,53.2098,53.2098,68.3359,27.5914,184.335,118.147,110.021,113.468,100.017,100.936,203.375,202.898,202.354,286.222];
_vectorArray = [[-0.0319694,0.177063,0.98368],[0.0123743,0.141064,0.989923],[0.0297549,0.12398,0.991839],[0.047175,0.106765,0.993164],[0.086499,0.12357,0.988559],[0.0914017,0.123516,0.988124],[0.096586,0.096586,0.990627],[0.0892799,0.0892799,0.991997],[0.108693,0.108693,0.988115],[0.109018,0.0768081,0.991068],[0.137795,0.110728,0.984252],[0.0987726,0.120996,0.987727],[-0.0319554,0.179443,0.983249],[0.0644759,0.109113,0.991936],[0.0596252,0.0944062,0.993747],[0.0941088,0.099062,0.990621],[0.130646,0.103531,0.986009],[0.0296866,0.141013,0.989563],[0.0596252,0.0944062,0.993747],[0.157666,0.0640524,0.985413],[0.0970214,0.0199021,0.995083],[0.0970214,0.0199021,0.995083],[0.0970214,0.0199021,0.995083],[-0.0622758,0.0572936,0.996413],[0.233348,0.0145837,0.972284],[0.098858,0.113687,0.988586],[0.098858,0.113687,0.988586],[0.0992636,0.0694849,0.992632],[0.0124963,0.0199939,0.999722],[-0.145921,0.00247376,0.989293],[-0.145921,0.00247376,0.989293],[-0.191386,0.00981488,0.981466],[-0.191386,0.00981488,0.981466],[-0.00999175,0.0374722,0.999248],[-0.0673259,0.0249361,0.997419],[0.07719,0.0448205,0.996009],[0.0771812,0.0473046,0.995894],[0.0771812,0.0473046,0.995894],[0.0722115,-0.0522907,0.996018],[0,0,1],[0.159959,0.0738267,0.984359],[0.116283,0.0841191,0.989648],[0.101754,0.064527,0.992715],[0.157666,0.0640524,0.985413],[0.109114,-0.0644754,0.991936]];

for '_i' from 0 to 44 do {  
	
	_class = _classArray select _i;  
    _pos = _posArray select _i;  
    _dir = _dirArray select _i;  
	_vector = _vectorArray select _i; 
	_obj = _class createVehicle _pos;  
	_obj setDir _dir; 	
	_obj setPosASL _pos;  
	_obj setVectorUp _vector; 
};   

_statics = [4033.06,4665.04] nearObjects ["StaticWeapon", 50];

for "_i" from 0 to (count _statics)-1 do {
	
	_target = _statics select _i;
	_mag = (getArray (configFile >> "CfgVehicles" >> typeOf _target >> "Turrets" >> "MainTurret" >> "magazines")) select 0;
	
	_target setVehicleAmmo 0;
	{_target addMagazine _mag} forEach [1,2,3,4];			
};

//mash becomes repawn point
_mash = ([4033.06,4665.04] nearObjects ["MASH_EP1", 150]) select 0;
if (!isNull _mash) then {gnrf_respawnInfo set [count gnrf_respawnInfo, [getPos _mash, 0]]}; 
publicVariable "gnrf_respawnInfo";

//create officer
_grp = Creategroup WEST;
_pos = [3972.88,4647.61,37.1893];
gnrf_drebinOfficer = _grp createUnit ["USMC_Soldier_Officer", [0,0,0], [], 10, "FORM"];
gnrf_drebinOfficer setPosASL _pos;
gnrf_drebinOfficer setGroupId ["2nd-Platoon-PC"];
publicVariable "gnrf_drebinOfficer";

["gnrf_clientExecute", [[], "spawn", "gnrf_counterAttack_Act"]] call CBA_fnc_globalEvent;

[-1, {titleText ["Receive new orders at the barracks", "PLAIN"];}] call CBA_fnc_globalExecute;




