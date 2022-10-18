package ui_elements;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Popup extends FlxTypedGroup<FlxSprite>
{
	var popupSprite:FlxSprite;
	var titleText:FlxText;
	var descriptionText:FlxText;

	var optionButton1:FlxButton;
	var optionButton2:FlxButton;

	public var button1Pressed:Bool = false;
	public var button2Pressed:Bool = false;

	public function new(title:String, description:String)
	{
		super();

		popupSprite = new FlxSprite().makeGraphic(400, 250, FlxColor.WHITE);
		popupSprite.loadGraphic("assets/images/ui/popup_background.png");
		popupSprite.screenCenter();
		add(popupSprite);

		titleText = new FlxText(0, 0, 0, title, 28);
		titleText.setFormat("assets/fonts/runescape_uf.ttf", 28, FlxColor.WHITE);
		titleText.setBorderStyle(SHADOW, FlxColor.BLACK, 2, 1);
		// titleText.screenCenter();
		titleText.y = 130;
		titleText.x = 135;
		add(titleText);

		descriptionText = new FlxText(0, 0, 0, description, 17);
		descriptionText.setFormat("assets/fonts/runescape_uf.ttf", 17, FlxColor.BLACK);
		descriptionText.y = 175;
		descriptionText.x = 130;
		add(descriptionText);
	}

	public function delete(parentState:FlxState)
	{
		parentState.remove(this);
	}

	public function setButtonsTo1(buttonText:String)
	{
		optionButton1 = new FlxButton(0, 0, buttonText, option1Pressed);
		optionButton1.loadGraphic("assets/images/ui/popup_button_long.png", true, 382, 35);
		optionButton1.label.setFormat("assets/fonts/runescape_uf.ttf", 20, FlxColor.BLACK);
		optionButton1.screenCenter();
		optionButton1.y += 98;
		add(optionButton1);
	}

	public function setButtonsTo2(button1Text:String, button2Text:String)
	{
		optionButton1 = new FlxButton(0, 0, button1Text, option1Pressed);
		optionButton1.loadGraphic("assets/images/ui/popup_button.png", true, 189, 35);
		optionButton1.label.setFormat("assets/fonts/runescape_uf.ttf", 20, FlxColor.BLACK);
		optionButton1.screenCenter();
		optionButton1.x -= 96;
		optionButton1.y += 98;
		add(optionButton1);

		optionButton2 = new FlxButton(0, 0, button2Text, option2Pressed);
		optionButton2.loadGraphic("assets/images/ui/popup_button.png", true, 189, 35);
		optionButton2.label.setFormat("assets/fonts/runescape_uf.ttf", 20, FlxColor.BLACK);
		optionButton2.screenCenter();
		optionButton2.x += 96;
		optionButton2.y += 98;
		add(optionButton2);
	}

	function option1Pressed()
	{
		button1Pressed = true;
	}

	function option2Pressed()
	{
		button2Pressed = true;
	}
}
