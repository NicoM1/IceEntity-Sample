package ;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import ice.entity.Entity;
import ice.entity.EntityManager;
import flixel.util.FlxRandom;
import flixel.FlxG;
import ice.group.EntityGroup;
import Std;

class IcicleManager
{
	/*You may create class instances here,
	  unlike standard haxe. But you may never 
	  use a type parameter on the 
	  right of the declaration.*/
	var icicles:FlxTypedGroup<Entity> = new FlxTypedGroup(); 
	
	public function init()
	{
		EntityManager.instance.AddGroup(icicles, "icicles");
		
		for (i in 0...5)
		{
			buildIcicle();
		}
	}
	
	public function update()
	{	
		icicles.forEachDead(respawn);		
	}
	
	public function reload()
	{
		//anything typed here will be run whenever the script is altered
	}
	
	/*Any function in the following block is treated as a standard haxe function,
	  and supports live reloading while the game runs.
	  You MUST place all functions except the above script functions inside of a single
	  block as shown below.*/

	//@
	function buildIcicle()
	{
		var icicle = new Entity("ice");
		
		icicle.scripts.ParseScript("assets/data/scripts/Icicle.hx");
		
		icicles.add(icicle);
		
		respawn(icicle);
	}
	
	function respawn(i:Entity)
	{
		i.alive = true;
		i.y = 0;
		i.x = FlxRandom.intRanged( -i.width, FlxG.width);
		i.y = FlxRandom.intRanged( -300, -i.height);
		
		var type = FlxRandom.intRanged(0, 2);
		
		i.animation.play(Std.string(type));
	}
	//@
}
