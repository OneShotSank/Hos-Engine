package data;

import flixel.FlxSprite;
import flixel.FlxG;
import openfl.utils.Assets as OpenFlAssets;
import data.*;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var char:String = '';
	public var isPlayer:Bool = false;
	public var isOldIcon:Bool = false;
 
	public var sprTracker:FlxSprite;
 
	public function new(?char:String = "bf", ?isPlayer:Bool = false)
	{
		super();
		this.char = char;
		this.isPlayer = isPlayer;
 
		isPlayer = isOldIcon = false;
		changeIcon(char);
		scrollFactor.set();
	}
 
	public function swapOldIcon()
	{
		(isOldIcon = !isOldIcon) ? changeIcon("bf-old") : changeIcon(char);
	}
 
	public function changeIcon(char:String)
	{
		if (char != 'bf-pixel' && char != 'bf-old')
			char = char.split("-")[0];

		if (char == 'senpai' || char == 'spirit')
		{
			antialiasing = false;
		}
 
		if (!OpenFlAssets.exists(Paths.image('icons/icon-' + char)))
		{
			char = 'face';
		}
		loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);

		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
	}
 
	override function update(elapsed:Float)
	{
		super.update(elapsed);
 
		if (sprTracker != null)
		{
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
		}
	}
}