package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import specific_ui.MainMenuBackground;
import ui_elements.Popup;

class MainMenu extends FlxState
{
	var background:MainMenuBackground;
	var newGameButton:FlxButton;
	var titleText:FlxText;

	var confirmationPopup:Popup;
	var acceptedPopup:Popup;

	override public function create()
	{
		super.create();

		background = new MainMenuBackground();
		add(background);

		newGameButton = new FlxButton(0, 0, "New Game", newGame);
		newGameButton.loadGraphic("assets/images/edgy_buttons.png", true, 300, 87);
		newGameButton.label.setFormat("assets/fonts/runescape_uf.ttf", 36, FlxColor.WHITE);
		newGameButton.screenCenter();
		newGameButton.y += 20;
		add(newGameButton);

		titleText = new FlxText(0, 0, 0, "Wise Mystical Tree: THE GAME", 32);
		titleText.setFormat("assets/fonts/runescape_uf.ttf", 46, FlxColor.WHITE);
		titleText.setBorderStyle(SHADOW, FlxColor.GREEN, 1, 1);
		titleText.screenCenter();
		titleText.y -= 80;
		add(titleText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (confirmationPopup != null) // Makes sure the popup actually exists (so the game doesn't break)
		{
			if (confirmationPopup.button1Pressed) // If 'Yes' is pressed
			{
				remove(confirmationPopup);
				confirmationPopup = null;
				acceptedPopup = new Popup("Yay!", "Then this is the game for you!");
				acceptedPopup.setButtonsTo1("Wohoo!");
				add(acceptedPopup);
			}
			else if (confirmationPopup.button2Pressed) // If 'No' is pressed
			{
				FlxG.switchState(new Oops());
			}
		}

		if (acceptedPopup != null)
		{
			if (acceptedPopup.button1Pressed)
			{
				FlxG.switchState(new PlayState()); // Goes into the game woooooooooooooo
			}
		}
	}

	function newGame()
	{
		confirmationPopup = new Popup("Hey!", "Are you over 25 and have a computer?");
		confirmationPopup.setButtonsTo2("Yes", "No");
		add(confirmationPopup);
	}
}
