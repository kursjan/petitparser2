private building
sampleIn: composite
	(composite text)
		title: 'Sample';
		display: [:parser :sample | sample ifNil: [''] ];
		allowNil;
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $s
			entitled: 'Parse (s)'
			with: [ :presentation :parser | 
				| input context result |
				input := presentation text asString.
				context := PP2RecordingContext new.
				result := (parser deoptimize; debug: input withContext: context) value.
				
				(presentation pane port: #context) value: context.
				result 
			];
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousSpawn
			on: $o
			entitled: 'Parse Optimized (o)'
			with: [ :presentation :parser | 
				| input context result |
				input := presentation text asString.
				context := PP2RecordingContext new.
				result := (parser optimize; debug: input withContext: context) value.
				
				(presentation pane port: #context) value: context.
				result 
			]
