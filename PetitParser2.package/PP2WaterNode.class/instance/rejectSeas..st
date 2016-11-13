private
rejectSeas: nodeOrDelegate
	| node |
	node := nodeOrDelegate selfSkipDelegate.
	
	^ node isSea ifTrue: [ node island  ] ifFalse: [ node ]