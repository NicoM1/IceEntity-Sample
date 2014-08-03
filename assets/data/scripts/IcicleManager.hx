package ;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import ice.entity.Entity;
import ice.entity.EntityManager;
import flixel.util.FlxRandom;
import flixel.FlxG;
import ice.group.EntityGroup;

class IcicleManager
{
	
	var icicles:FlxTypedGroup<Entity> = new FlxTypedGroup(); 
	/*You may create class instances here,
	  unlike standard haxe. But you may never 
	  use a type parameter on the 
	  right of the declaration.*/
	
	public function init()
	{
		EntityManager.instance.AddGroup(icicles, "icicles");
		buildIcicle();
	}
	
	public function update()
	{	
		icicles.forEachDead(respawn);
		
	}
	
	public function reload()
	{
		
	}
	
	/*Any function in the following block is treated as a standard haxe function,
	  and supports live reloading while the game runs.
	  You MUST place all functions except the above script functions inside of a single
	  block as shown below.*/

	//@
	function buildIcicle()
	{
		var icicle = new Entity("ice");
		
		icicle.makeGraphic(10, 20);
		
		icicle.x = FlxRandom.intRanged( -icicle.width, FlxG.width);
		icicle.y = -icicle.height;
		
		icicle.scripts.ParseScript("assets/data/scripts/Icicle.hx");
		
		icicles.add(icicle);
	}
	
	function respawn(i:Entity)
	{
		i.alive = true;
		i.y = 0;
		i.x = FlxRandom.intRanged( -icicle.width, FlxG.width);
		icicle.y = -icicle.height;
	}
	//@
}