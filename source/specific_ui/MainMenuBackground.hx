package specific_ui;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

using flixel.util.FlxSpriteUtil;

class MainMenuBackground extends FlxTypedGroup<FlxSprite>
{
	// Controls how long each image stays on screen for, and how quickly they transition
	// values probably need tweaking
	static inline var IMAGE_VISIBLE_TIME:Float = 5.0;
	static inline var TRANSITION_TIME:Float = 6.0;

	var background1:FlxSprite;
	var background2:FlxSprite;

	var restartLoop:Bool = true;

	var backgrounds:Array<String> = [
		AssetPaths.wise_mystical_tree_lore__png,
		AssetPaths.the_wise_mystical_council__png,
		AssetPaths.the_man_the_myth_the_legend__png
	];
	var currentBackground1:Int = 0;
	var currentBackground2:Int = 0;

	public function new()
	{
		super();

		background1 = new FlxSprite();
		background1.loadGraphic(backgrounds[currentBackground1]);
		background1.screenCenter();
		add(background1);

		background2 = new FlxSprite();
		background2.loadGraphic(backgrounds[currentBackground2]);
		background2.screenCenter();
		background2.alpha = 0;
		add(background2);
	}

	override function update(elapsed:Float)
	{
		// background animation loop
		if (restartLoop)
		{
			restartLoop = false;

			// Set new bacground for background 2
			currentBackground2++;
			if (currentBackground2 > 2)
				currentBackground2 = 0;
			background2.loadGraphic(backgrounds[currentBackground2]);
			background2.screenCenter();
			// Thought this would put background 1 in front of background 2 (spoiler alert: it doesn't)
			background1.loadGraphic(backgrounds[currentBackground1]);

			FlxTween.tween(background1, {alpha: 255}, IMAGE_VISIBLE_TIME, {ease: FlxEase.backOut, onComplete: transition_to_2});
		}

		super.update(elapsed);
	}

	function transition_to_2(_)
	{
		// WHY DOESN'T IT TRANSITION CORRECTLY AHHHHHHHHH
		FlxTween.tween(background2, {alpha: 255}, TRANSITION_TIME, {ease: FlxEase.backOut});
		FlxTween.tween(background1, {alpha: 0}, TRANSITION_TIME, {ease: FlxEase.backOut, onComplete: image_2});
	}

	function image_2(_)
	{
		// Set new background for background 1
		currentBackground1++;
		if (currentBackground1 > 2)
			currentBackground1 = 0;
		background1.loadGraphic(backgrounds[currentBackground1]);
		background1.screenCenter();
		// Still doesn't work 😔
		background2.loadGraphic(backgrounds[currentBackground2]);

		FlxTween.tween(background2, {alpha: 255}, IMAGE_VISIBLE_TIME, {ease: FlxEase.backOut, onComplete: transition_to_1});
	}

	function transition_to_1(_)
	{
		// WHYYYYYYYYYYYYYYYYYYYYY
		FlxTween.tween(background1, {alpha: 255}, TRANSITION_TIME, {ease: FlxEase.backOut});
		FlxTween.tween(background2, {alpha: 0}, TRANSITION_TIME, {ease: FlxEase.backOut, onComplete: restart_animation});
	}

	// The most incredible function in the entire world
	// 5/5 would function again
	function restart_animation(_)
	{
		restartLoop = true;
	}
}
