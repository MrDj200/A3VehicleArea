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