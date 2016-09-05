converting
asEventMorph: eventArray
	|   width height canvas morph |
	self filterFrom: lastStreamIndex + 1 to: events size events: eventArray.
	
	width  := readLimit + 1 min: 4096.
	height := fPositions size min: 32768.
	canvas := FormCanvas extent: width @ height.
	
	self contents keysAndValuesDo: [ :index :char |
		char isSeparator 
			ifFalse: [ canvas line: index @ 1 to: index @ height color: Color paleYellow lighter ] 	].
			
			
	1 to: height do: [ :index |
			canvas form 
				colorAt: (fPositions at: index) @ index 
				put: (self colorForEvent: (fEvents at: index)) ].
	morph := canvas form asMorph.
	
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
	^ morph