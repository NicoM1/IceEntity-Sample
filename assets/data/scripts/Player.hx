package ;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxColor;
import ice.entity.Entity;
import ice.entity.EntityManager;
import Math;

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
		owner.makeGraphic(20, 20, FlxColor.BLUE);
		owner.y = FlxG.height - owner.height;
	}
	
	public function update()
	{
		handleInput();
		
		for (i in icicles.members)
		{
			if (i.overlaps(owner))
			{
				die();
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
				owner.velocity.x -= speed * FlxG.elapsed;
			}
			if (FlxG.keys.pressed.RIGHT && owner.velocity.x < max)
			{
				moved = true;
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