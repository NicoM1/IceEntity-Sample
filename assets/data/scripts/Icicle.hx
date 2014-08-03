package ;
import flixel.FlxG;
import ice.entity.Entity;
import flixel.util.FlxRandom;
import Std;

class Icicle
{
	//This special block allows you to declare variables that are stripped out by the parser.
	//Now you can get completion for variables like "owner" without messing up the script.
	
	//#
	var owner:Entity;
	//#
	
	var speed:Float = 100;
	
	public function init()
	{
		owner.loadGraphic("assets/images/Icicles.png", true, 12, 20);
		owner.animation.add("0", [0], 1, false);
		owner.animation.add("1", [1], 1, false);
		owner.animation.add("2", [2], 1, false);
		
		var type = FlxRandom.intRanged(0, 3);
		
		owner.animation.play(Std.string(type));
	}
	
	public function update()
	{
		owner.y += speed * FlxG.elapsed;
		
		if (owner.y > FlxG.height)
		{
			owner.alive = false;
		}
	}
}