if (controls.BACK)
    {
        selectedSomethin = true;
        FlxG.sound.play(Paths.sound('cancelMenu'));
        MusicBeatState.switchState(new TitleState());
        //Main Menu Back Animations
        FlxTween.tween(FlxG.camera, {zoom: 5}, 0.8, {ease: FlxEase.expoIn});
        FlxTween.tween(bg, {angle: 45}, 0.8, {ease: FlxEase.expoIn});
        FlxTween.tween(magenta, {angle: 45}, 0.8, {ease: FlxEase.expoIn});
        FlxTween.tween(bg, {alpha: 0}, 0.8, {ease: FlxEase.expoIn});
        FlxTween.tween(magenta, {alpha: 0}, 0.8, {ease: FlxEase.expoIn});
    }

    if (controls.ACCEPT)
    {
        if (optionShit[curSelected] == 'donate')
        {
            CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
        }
        else
        {
            selectedSomethin = true;
            FlxG.sound.play(Paths.sound('confirmMenu'));

            if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

            menuItems.forEach(function(spr:FlxSprite)
            {
                if (curSelected != spr.ID)
                {
                    //Main Menu Select Animations
                    FlxTween.tween(FlxG.camera, {zoom: 5}, 0.8, {ease: FlxEase.expoIn});
                    FlxTween.tween(bg, {angle: 45}, 0.8, {ease: FlxEase.expoIn});
                    FlxTween.tween(magenta, {angle: 45}, 0.8, {ease: FlxEase.expoIn});
                    FlxTween.tween(bg, {alpha: 0}, 0.8, {ease: FlxEase.expoIn});
                    FlxTween.tween(magenta, {alpha: 0}, 0.8, {ease: FlxEase.expoIn});
                    FlxTween.tween(spr, {alpha: 0}, 0.4, {
                        ease: FlxEase.quadOut,
                        onComplete: function(twn:FlxTween)
                        {
                            spr.kill();
                        }
                    });
                }
                else
                {
                    FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
                    {
                        var daChoice:String = optionShit[curSelected];

                        switch (daChoice)
                        {
                            case 'story_mode':
                                MusicBeatState.switchState(new StoryMenuState());
                            case 'freeplay':
                                MusicBeatState.switchState(new FreeplayState());
                            #if MODS_ALLOWED
                            case 'mods':
                                MusicBeatState.switchState(new ModsMenuState());
                            #end
                            case 'awards':
                                MusicBeatState.switchState(new AchievementsMenuState());
                            case 'credits':
                                MusicBeatState.switchState(new CreditsState());
                            case 'options':
                                MusicBeatState.switchState(new options.OptionsState());
                        }
                    });
                }
            });
        }
    }