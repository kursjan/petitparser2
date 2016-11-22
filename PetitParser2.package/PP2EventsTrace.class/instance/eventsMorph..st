as yet unclassified
eventsMorph: eventArray
	| limit width height canvas morph heightIndex highlightStart highlightStop highlightColor |
	limit := self limit: eventArray.
	width  := (entries collect: #position) max min: 4096.
	height := limit min: 65535.
	canvas := FormCanvas extent: width @ height.
	morph := canvas form asMorph.
	heightIndex := 0.
	fEntries := OrderedCollection new.
	
	highlightStart := Stack with: SmallInteger maxVal.
	highlightStop := Stack with: SmallInteger maxVal.
	highlightColor := Color red muchLighter muchLighter.
	
	self interval do: [ :index |
		| entry |
		entry := entries at: index.

		(eventArray isNil or: [eventArray includes: entry event]) ifTrue: [ 
			fEntries addLast: entry.
			heightIndex := heightIndex + 1.
			
			(entry isInvocation and: [ 
			(entry node == self selectionNode) and: [ 
			(entry position == self selectionPosition) and: [ 
			(entry ~= self selection) ] ] ] ) ifTrue: [  
				highlightStart push: entry start.
				highlightStop push: entry stop.
				highlightColor := highlightColor darker.
			].
			index > highlightStop top ifTrue: [ 
				highlightColor := highlightColor lighter.
				highlightStop pop. 
				highlightStart pop 
			].

			(highlightStart top <= index and: [ highlightStop top >= index]) ifTrue: [  
				canvas line: 1 @ heightIndex to: width @ heightIndex color: highlightColor
			].

			(self selectionStart <= index and: [ self selectionStop >= index]) ifTrue: [  
				| color |
				color := Color yellow muchLighter.
				canvas line: 1 @ heightIndex to: width @ heightIndex color: color
			].


			canvas form 
				colorAt: entry position @ heightIndex 
				put: (self colorForEvent: entry event).
		]
	].

	morph := canvas form asMorph.
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
		
	^ morph