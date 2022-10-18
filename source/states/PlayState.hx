package states;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var stunningGameplay:FlxText;

	override public function create()
	{
		super.create();

		stunningGameplay = new FlxText(0, 0, 0, "(pretend this is the game)", 14);
		stunningGameplay.screenCenter();
		add(stunningGameplay);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
