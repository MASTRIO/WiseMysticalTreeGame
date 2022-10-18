package states;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Oops extends FlxState
{
	var bigChungusIsThatYou:FlxText; // nvm it's not big chungus 😔

	override public function create()
	{
		super.create();

		bigChungusIsThatYou = new FlxText(0, 0, 0, "oops", 16);
		bigChungusIsThatYou.setFormat("assets/fonts/runescape_uf.ttf", 16, FlxColor.RED);
		bigChungusIsThatYou.screenCenter();
		add(bigChungusIsThatYou);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
