private
eventsMorph: eventArray
	|   width height canvas morph |
	self filterEvents: eventArray.
	fPositions isEmpty ifTrue: [ ^ (FormCanvas extent: 0@0) form asMorph ].

	width  := fPositions max min: 4096.
	height := fPositions size min: 65535.
	canvas := FormCanvas extent: width @ height.
	morph := canvas form asMorph.
	
	1 to: height do: [ :index |
			canvas form 
				colorAt: (fPositions at: index) @ index 
				put: (self colorForEvent: (fEvents at: index)) ].
	morph := canvas form asMorph.
	
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
	^ morph