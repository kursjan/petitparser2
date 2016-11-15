private
eventsMorph: eventArray
	|   width height canvas morph |
	self filterEvents: eventArray.
	
	width  := fPositions max min: 4096.
	height := fPositions size min: 32768.
	canvas := FormCanvas extent: width @ height.
	
	1 to: height do: [ :index |
			canvas form 
				colorAt: (fPositions at: index) @ index 
				put: (self colorForEvent: (fEvents at: index)) ].
	morph := canvas form asMorph.
	
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
	^ morph