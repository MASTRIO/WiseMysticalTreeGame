package ui_objects;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

using flixel.util.FlxSpriteUtil;

class MainMenuBackground extends FlxTypedGroup<FlxSprite>
{
	// Controls how long each image stays on screen for, and how quickly they transition
	static inline var IMAGE_VISIBLE_TIME:Float = 5.0;
	static inline var TRANSITION_TIME:Float = 6.0;

	var background_1:FlxSprite;
	var background_2:FlxSprite;

	var restart_loop:Bool = true;

	var backgrounds:Array<String> = [
		AssetPaths.wise_mystical_tree_lore__png,
		AssetPaths.the_wise_mystical_council__png,
		AssetPaths.the_man_the_myth_the_legend__png
	];
	var current_background_1:Int = 0;
	var current_background_2:Int = 0;

	public function new()
	{
		super();

		background_1 = new FlxSprite();
		background_1.loadGraphic(backgrounds[current_background_1]);
		background_1.screenCenter();
		add(background_1);

		background_2 = new FlxSprite();
		background_2.loadGraphic(backgrounds[current_background_2]);
		background_2.screenCenter();
		background_2.alpha = 0;
		add(background_2);
	}

	override function update(elapsed:Float)
	{
		// background animation loop
		if (restart_loop)
		{
			restart_loop = false;

			// Set new bacground for background 2
			current_background_2++;
			if (current_background_2 > 2)
				current_background_2 = 0;
			background_2.loadGraphic(backgrounds[current_background_2]);
			background_2.screenCenter();
			// Thought this would put background 1 in front of background 2 (spoiler alert: it doesn't)
			background_1.loadGraphic(backgrounds[current_background_1]);

			FlxTween.tween(background_1, {alpha: 255}, IMAGE_VISIBLE_TIME, {ease: FlxEase.backOut, onComplete: transition_to_2});
		}

		super.update(elapsed);
	}

	function transition_to_2(_)
	{
		// WHY DOESN'T IT TRANSITION CORRECTLY AHHHHHHHHH
		FlxTween.tween(background_2, {alpha: 255}, TRANSITION_TIME, {ease: FlxEase.backOut});
		FlxTween.tween(background_1, {alpha: 0}, TRANSITION_TIME, {ease: FlxEase.backOut, onComplete: image_2});
	}

	function image_2(_)
	{
		// Set new background for background 1
		current_background_1++;
		if (current_background_1 > 2)
			current_background_1 = 0;
		background_1.loadGraphic(backgrounds[current_background_1]);
		background_1.screenCenter();
		// Still doesn't work 😔
		background_2.loadGraphic(backgrounds[current_background_2]);

		FlxTween.tween(background_2, {alpha: 255}, IMAGE_VISIBLE_TIME, {ease: FlxEase.backOut, onComplete: transition_to_1});
	}

	function transition_to_1(_)
	{
		// WHYYYYYYYYYYYYYYYYYYYYY
		FlxTween.tween(background_1, {alpha: 255}, TRANSITION_TIME, {ease: FlxEase.backOut});
		FlxTween.tween(background_2, {alpha: 0}, TRANSITION_TIME, {ease: FlxEase.backOut, onComplete: restart_animation});
	}

	// The most incredible function in the entire world
	// 5/5 would function again
	function restart_animation(_)
	{
		restart_loop = true;
	}
}
