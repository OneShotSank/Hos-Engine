package state;

#if desktop
import data.dependency.Discord.DiscordClient;
#end
import data.Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import data.*;

class OptionsMenu extends MusicBeatState
{
	var controlshites:data.Controls;

	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var optionShit:Array<Options> = [
		new Downscroll(),
		new Middlescroll(),
		new DadNotesDamage(),
		new IconFade(),
		new Splash(),
		new Optimization(),
		new Antialiasing(),
		new Hitsounds()
	];

	var curSelected:Int = 0;

	public function new()
	{
		super();

		#if desktop
			DiscordClient.changePresence("In the options", null);
		#end

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFF71fd89;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		for (i in 0...optionShit.length)
		{
			var optionText:Alphabet = new Alphabet(0, (70 * i) + 30, optionShit[i].getOptions(), true, false);
			optionText.isMenuItem = true;
			optionText.targetY = i;

			grpMenuShit.add(optionText);

		}

		changeSelection();
	}

	function changeSelection(change:Int = 0)
	{
		if (change != 0) 
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		
		curSelected += change;
		
		if (curSelected < 0)
			curSelected = optionShit.length - 1;
		else if (curSelected >= optionShit.length)
			curSelected = 0;
		
		var bullShit:Int = 0;
		
		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;
		
			item.alpha = 0.6;
		
			if (item.targetY == 0)
				item.alpha = 1;
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UP_P)
			changeSelection(-1);

		if (controls.DOWN_P)
			changeSelection(1);

		if (controls.BACK)
		{
			FlxG.switchState(new state.MainMenuState());
		}

		if (controls.ACCEPT)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

			if (optionShit[curSelected].onPress()) 
			{
				grpMenuShit.remove(grpMenuShit.members[curSelected]);

				var haxewantsthis:Alphabet = new Alphabet(0, (70 * curSelected) + 30, optionShit[curSelected].getOptions(), true, false);
				haxewantsthis.isMenuItem = true;
				grpMenuShit.add(haxewantsthis);
			}

			FlxG.save.flush();
		}
	}
}

class Options
{
	private var text:String;
	
	public function new()
	{
		text = updateOptions();
	}

	private function updateOptions():String 
	{ 
		return throw "yes"; 
	}

	public final function getOptions():String
	{
		return text;
	}

	public function onPress():Bool 
	{ 
		return throw "hi "; 
	}
}

class Downscroll extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.downScroll = !FlxG.save.data.downScroll;
		text = updateOptions();
		return true;
	}
	private override function updateOptions():String {
		return FlxG.save.data.downScroll ? "Downscroll" : "Upscroll";
	}
}

class Middlescroll extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.middleScroll = !FlxG.save.data.middleScroll;
		text = updateOptions();
		return true;
	}
	private override function updateOptions():String {
		return FlxG.save.data.middleScroll ? "Middlescroll On" : "Middlescroll Off";
	}
}

class DadNotesDamage extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.dadNotesDamage = !FlxG.save.data.dadNotesDamage;
		text = updateOptions();
		return true;
	}
	private override function updateOptions():String {
		return FlxG.save.data.dadNotesDamage ? "Dad notes damage On" : "Dad notes damage Off";
	}
}

class Antialiasing extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.antialiasing = !FlxG.save.data.antialiasing;
		text = updateOptions();
		return true;
	}
	private override function updateOptions():String {
		return FlxG.save.data.antialiasing ? "Antialiasing On" : "Antialiasing Off";
	}
}

class IconFade extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.iconFade = !FlxG.save.data.iconFade;
		text = updateOptions();
		return true;
	}

	private override function updateOptions():String {
		return FlxG.save.data.iconFade ? "Fade Icons On" : "Fade Icons Off";
	}
}

class Optimization extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.maxOptimization = !FlxG.save.data.maxOptimization;
		text = updateOptions();
		return true;
	}

	private override function updateOptions():String {
		return FlxG.save.data.maxOptimization ? "Max Optimization On" : "Max Optimization Off";
	}
}

class Hitsounds extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.hitsound = !FlxG.save.data.hitsound;
		text = updateOptions();
		return true;
	}

	private override function updateOptions():String {
		return FlxG.save.data.hitsound ? "Hitsounds On" : "Hitsounds Off";
	}
}

class Splash extends Options
{
	public override function onPress():Bool
	{
		FlxG.save.data.splash = !FlxG.save.data.splash;
		text = updateOptions();
		return true;
	}

	private override function updateOptions():String {
		return FlxG.save.data.splashes ? "Note Splashes On" : "Note Splashes Off";
	}
}