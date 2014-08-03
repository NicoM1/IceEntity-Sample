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
	var dying:Bool = false;
	var killIce:Bool = false;
	
	public function init()
	{
		owner.loadGraphic("assets/images/Icicles.png", true, 12, 20);
		
		//loadAnimation() gives you access to the same fancy system used in xml declarations
		owner.loadAnimation("0", "0", 1);
		owner.loadAnimation("1", "1", 1);
		owner.loadAnimation("2", "2", 1);
		owner.loadAnimation("smash", "3-5");
	}
	
	public function update()
	{
		if (owner.animation.finished)
		{
			owner.y += speed * FlxG.elapsed;
		}
		
		if (owner.y + owner.height > FlxG.height || killIce)
		{
			if (!dying)
			{
				owner.animation.play("smash");
				dying = true;
			}
			if (owner.animation.finished)
			{
				owner.alive = false;
				dying = false;
			}
		}
	}
}