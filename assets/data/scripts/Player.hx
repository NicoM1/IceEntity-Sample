package ;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxColor;
import ice.entity.Entity;
import ice.entity.EntityManager;
import Math;
import flixel.FlxObject;

class Player
{
	//#
	var owner:Entity;
	//#
	
	var speed:Float = 100;
	var drag:Float = speed * 3;
	var max:Float = 100;
	
	var icicles:FlxTypedGroup<Entity> = EntityManager.instance.GetGroup("icicles");
	
	public function init() 
	{ 
		owner.y = FlxG.height - owner.height;
	}
	
	public function update()
	{
		handleInput();
		
		for (i in icicles.members)
		{
			if (i.alive)
			{
				if (i.overlaps(owner))
				{
					i.scripts.scripts[0].interp.variables.set("killIce", true); //THIS IS UGLY, a better solution will be coming soon!!
					die();
				}
			}
		}
	}
	
	public function reload()
	{
		
	}
	
	//@
	function handleInput()
	{
		var moved:Bool = false;
		if (owner.alive)
		{			
			if (FlxG.keys.pressed.LEFT && owner.velocity.x > -max)
			{
				moved = true;
				if (owner.facing != FlxObject.LEFT)
				{
					owner.facing = FlxObject.LEFT;
					owner.velocity.x = -owner.velocity.x / 3;
				}
				owner.velocity.x -= speed * FlxG.elapsed;
			}
			if (FlxG.keys.pressed.RIGHT && owner.velocity.x < max)
			{
				moved = true;
				if (owner.facing != FlxObject.RIGHT)
				{
					owner.facing = FlxObject.RIGHT;
					owner.velocity.x = -owner.velocity.x / 3;
				}
				owner.velocity.x += speed * FlxG.elapsed;
			}
		}
		
		if (!moved)
		{
			if (owner.velocity.x > 0)
			{
				owner.velocity.x = Math.max(0, owner.velocity.x - drag * FlxG.elapsed);
			}
			else if (owner.velocity.x < 0)
			{
				owner.velocity.x = Math.min(0, owner.velocity.x + drag * FlxG.elapsed);
			}
		}
	}
	
	function die()
	{
		owner.alive = false;
	}
	//@
}