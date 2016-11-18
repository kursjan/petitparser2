private
eventsMorph: eventArray
	|   width height canvas morph |
	self filterEvents: eventArray.
	fEntries isEmpty ifTrue: [ ^ (FormCanvas extent: 0@0) form asMorph ].

	width  := (fEntries collect: #position) max min: 4096.
	height := fEntries size min: 65535.
	canvas := FormCanvas extent: width @ height.
	morph := canvas form asMorph.
	
	1 to: height do: [ :index |
		| entry |
		entry := fEntries at: index.
		canvas form 
			colorAt: entry position @ index 
			put: (self colorForEvent: entry event).

"		(entry node == debugResult node) ifTrue: [  
			| color |
			(entry position == ) ifTrue: [  
				color := Color red.
			] ifFalse: [  
				color := Color gray muchLighter.
			].
			canvas line: 1 @ index to: width @ index color: color
		]
"	].

	morph := canvas form asMorph.
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
	^ morph