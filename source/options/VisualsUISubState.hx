package options;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuals and UI';
		rpcTitle = 'Tweaking the Visuals & UI'; //for Discord Rich Presence

		var option:Option = new Option('Camera Zooms', "If unchecked, the camera won't zoom in on a beat hit.", 'camZooms', 'bool', true);
	addOption(option);

		var option:Option = new Option('Flashing Lights', "Uncheck this if you're sensitive to flashing lights!", 'flashing', 'bool', true);
	addOption(option);

	#if !mobile
		var option:Option = new Option('FPS Counter', 'If unchecked, hides FPS Counter.', 'showFPS', 'bool', true);
	addOption(option);
	option.onChange = onChangeFPSCounter;
	#end

		var option:Option = new Option('Glow CPU Strums', "If disabled, the CPU's Notes will no longer glow once the CPU hits them", 'lightcpustrums', 'bool', true);
	addOption(option);

		var option:Option = new Option('Hide HUD', 'If checked, hides most HUD elements.', 'hideHud', 'bool', false);
	addOption(option);

		var option:Option = new Option('Note Splashes', "If unchecked, hitting \"Sick!\" notes won't show particles.", 'noteSplashes', 'bool', true);
	addOption(option);
	
		var option:Option = new Option('Score Text Zoom on Hit', "If unchecked, disables the Score text zooming\neverytime you hit a note.", 'scoreZoom', 'bool', true);
	addOption(option);     

		var option:Option = new Option('Health Bar Opacity',
			'How much opaque should the health bar and icons be.',
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Lane Opacity',
			"How much opaque should your Lane Underlay be.",
			'underlay',
			'float',
		true);
		option.displayFormat = '%v';
		option.scrollSpeed = 100;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.minValue = 0;
		option.maxValue = 1;
		addOption(option);

		var option:Option = new Option('Strumline Opacity',
			"How much opaque should your Notes' Strumline be?.",
			'strumLineAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		//addOption(option); // god I need to actually code this stupid thing in. - Gui iago

			var option:Option = new Option('Time Bar:', "What should the Time Bar display?", 'timeBarType', 'string', 'Time Left',
		['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

			var option:Option = new Option('Time Bar Style:', "What should the Time Bar look like?", 'timeBarUi', 'string', 'Psych Engine',
		['Psych Engine', 'Kade Engine'/*, 'Only Text'*/]);
		addOption(option);

			var option:Option = new Option('Judgement Counters:', "In which position should the Judgement Counters be?", 'judgCounters', 'string', 'Left',
		['Left', 'Info', 'Disabled']);
		addOption(option);

			var option:Option = new Option('Judgement Skin:', "What should your Judgements look like?", 'uiSkin', 'string', 'Bedrock',
		['Classic', 'Bedrock'/*, 'Score'*/]);
		addOption(option);

			var option:Option = new Option('Note Skin:', "Funny Notes, going up and down, How should they look like?", 'noteSkin', 'string', 'Default',
		['Default', 'Circle', 'Bar'/*, 'Diamond', 'Square'*/]);
		option.showNotes = true;
		option.onChange = onChangeNoteSkin;
		addOption(option);

			var option:Option = new Option('Watermark Style:', "What should the watermarks on the bottom left corner show?", 'watermarkPreferences', 'string', 'Both',
		['Both', 'Only Bedrock', 'Only Psych', 'Only Song', 'All', 'Nothing']);
		addOption(option);

		super();
	}

	function onChangeNoteSkin()
	{
		updateNotes();
	}

	/*function onChangeJudgSkin()
	{
		updateJudgements();
	}*/

	#if !mobile
	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}
	#end
}
