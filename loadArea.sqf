if (isServer) then
{
	saveArray = profileNamespace getVariable "PersistentArea";

	{
		deleteVehicle _x;
	}forEach (entities [[],["Man"]] inAreaArray saveArea);

	uiSleep(0.1);

	{
		_tempObj = (_x select 0) createVehicle (_x select 1); // type, pos
		_tempObj setDir (_x select 2); // Rotation
		_tempObj setFuel (_x select 3); // fuel

		// DAMAGE:
		if(count (_x select 4) != 0) then
			{
			_tempHitPointNames = (_x select 4) select 0;
			_tempHitPointDamage = (_x select 4) select 2;
			
			{
				_tempObj setHitPointDamage [_x, _tempHitPointDamage select _forEachIndex, false];
			}forEach (_tempHitPointNames);
		};
		/////////

		// TEXTURES
			{
				_tempObj setObjectTextureGlobal [_forEachIndex, _x]; // Textures
			}forEach (_x select 5);
		/////////

		// CARGO:
			_allItems = _x select 6;

			_itemCargo = _allItems select 0;
			_magCargo = _allItems select 1;
			_weaponCargo = _allItems select 2;
			_backpackCargo = _allItems select 3;

			clearItemCargoGlobal _tempObj;
			clearMagazineCargoGlobal _tempObj;
			clearWeaponCargoGlobal _tempObj;
			clearBackpackCargoGlobal _tempObj;

			uiSleep(0.2);

			//hint str(_itemCargo select 0);

			{
				_tempObj addItemCargoGlobal [(_itemCargo select 0 select _forEachIndex), (_itemCargo select 1 select _forEachIndex)];
				//hint str(_itemCargo select 0 select _forEachIndex);
			}forEach (_itemCargo select 0);

			{
				_tempObj addMagazineCargoGlobal [(_magCargo select 0 select _forEachIndex), (_magCargo select 1) select _forEachIndex];
			}forEach (_magCargo select 0);

			{
				_tempObj addWeaponCargoGlobal [(_weaponCargo select 0 select _forEachIndex), (_weaponCargo select 1) select _forEachIndex];
			}forEach (_weaponCargo select 0);

			{
				_tempObj addBackpackCargoGlobal [(_backpackCargo select 0 select _forEachIndex), (_backpackCargo select 1) select _forEachIndex];
			}forEach (_backpackCargo select 0);

		////////

		// Animations: 
			_tempAnimArrayNames = animationNames _tempObj;

			{
				_tempObj animateSource [_tempAnimArrayNames select _forEachIndex, _x, true];
			}forEach (_x select 7);

		///////////////

		_tempObj forceFlagTexture (_x select 8);
		_tempObj setPlateNumber (_x select 9);

	}forEach saveArray;

	hint "Loading done!";

}