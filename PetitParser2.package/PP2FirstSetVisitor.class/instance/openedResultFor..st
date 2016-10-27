loop control
openedResultFor: context
	context node isSea ifTrue: [ 
		^ super openedResultFor: context
	].


	"
		JK: I am not 100% sure, but this should never happen. If this happens, the grammar
		    contains an infinite loop.
	"
	self error: 'There seems to be a left recursive loop in your grammar!'