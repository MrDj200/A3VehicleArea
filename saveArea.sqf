if (isServer) then
{
	_allStuff = entities [[],["Man"]] inAreaArray saveArea;

	//hint str(allStuff);

	_saveArray = [];

	{
		_tempArray = [];
		_tempArray pushBack (typeOf _x); // 0. Type of the object
		_tempArray pushBack (getPos _x); // 1. Position
		_tempArray pushBack (getDir _x); // 2. Rotation
		_tempArray pushBack (fuel _x); // 3. fuel
		_tempArray pushBack (getAllHitPointsDamage _x); //4. Damage
		_tempArray pushBack (getObjectTextures _x); // 5. Textures

			_allCargo = [];
			_allCargo pushBack (getItemCargo _x);
			_allCargo pushBack (getMagazineCargo _x);
			_allCargo pushBack (getWeaponCargo _x);
			_allCargo pushBack (getBackpackCargo _x);

		_tempArray pushBack (_allCargo); // 6. Inventory


		_tempAnimArray = [];
		_tempAnimNamesArray = (animationNames _x);
		for "_i" from 0 to (count _tempAnimNamesArray) - 1 step 1 do
		{		
			_tempAnimArray pushBack (_x animationSourcePhase (_tempAnimNamesArray select _i));
		};
		_tempArray pushBack (_tempAnimArray); // 7. Animations


		_tempArray pushBack (getForcedFlagTexture _x);
		_tempArray pushBack (getPlateNumber _x);

		_saveArray pushBack _tempArray;
	}forEach _allStuff;

	profileNamespace setVariable ["PersistentArea", _saveArray];
	hint "Saving done!";

}