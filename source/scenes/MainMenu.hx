package scenes;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import ui_objects.MainMenuBackground;

class MainMenu extends FlxState
{
	var background:MainMenuBackground;
	var newGameButton:FlxButton;
	var titleText:FlxText;

	override public function create()
	{
		super.create();

		background = new MainMenuBackground();
		background.screenCenter();
		add(background);

		newGameButton = new FlxButton(0, 0, "New Game", newGame);
		newGameButton.loadGraphic("assets/images/edgy_buttons.png", true, 300, 87);
		newGameButton.label.setFormat("assets/fonts/runescape_uf.ttf", 36, FlxColor.WHITE);
		newGameButton.screenCenter();
		newGameButton.y += 20;
		add(newGameButton);

		titleText = new FlxText(0, 0, 0, "Wise Mystical Tree: THE GAME", 32);
		titleText.setFormat("assets/fonts/runescape_uf.ttf", 48, FlxColor.WHITE);
		titleText.setBorderStyle(SHADOW, FlxColor.GREEN, 1, 1);
		titleText.screenCenter();
		titleText.y -= 60;
		add(titleText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function newGame()
	{
		FlxG.switchState(new PlayState());
	}
}
