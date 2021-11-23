package data;

class HosEngineData
{
    public static function initSave()
    {
        if (FlxG.save.data.middleScroll ==  null)
            FlxG.save.data.middleScroll = false;
        if (FlxG.save.data.downScroll ==  null)
            FlxG.save.data.downScroll = false;
        if (FlxG.save.data.maxOptimization ==  null)
            FlxG.save.data.maxOptimization = false;
        if (FlxG.save.data.dadNotesDamage == null)
            FlxG.save.data.dadNotesDamage = false;
        if (FlxG.save.data.antialiasing == null)
            FlxG.save.data.antialiasing = true;
        if (FlxG.save.data.iconFade == null)
            FlxG.save.data.iconFade = false;
        if (FlxG.save.data.dfjk == null)
            FlxG.save.data.dfjk = false;
        if (FlxG.save.data.botPlay == null)
            FlxG.save.data.botPlay = false;
        if (FlxG.save.data.hitsound == null)
            FlxG.save.data.hitsound = false;
        if (FlxG.save.data.splash == null)
            FlxG.save.data.splash = false;
    }
}