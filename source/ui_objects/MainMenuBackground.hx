package ui_objects;

import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class MainMenuBackground extends FlxSprite
{
	var play_animation:Bool = true;

	var backgrounds:Array<String> = [
		AssetPaths.wise_mystical_tree_lore__png,
		AssetPaths.the_wise_mystical_council__png,
		AssetPaths.the_man_the_myth_the_legend__png
	];
	var current_background:Int = 0;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic(backgrounds[current_background]);
	}

	override function update(elapsed:Float)
	{
		// background animation loop
		if (play_animation)
		{
			play_animation = false;
			FlxTween.tween(this, {alpha: 0}, 6.0, {ease: FlxEase.backInOut, onComplete: resetAnimation});
		}

		super.update(elapsed);
	}

	function resetAnimation(_)
	{
		// Reset the animation with a new graphic
		current_background++;
		if (current_background > 2)
		{
			current_background = 0;
		}

		loadGraphic(backgrounds[current_background]);
		screenCenter();

		alpha = 255;
		play_animation = true;
	}
}
