parsing
parseOn: context
	| start memento startWaterPosition |
	memento := context remember.
	start := context position.
	startWaterPosition := context waterPosition.
	
	"Recursive Water case"
	(context waterPosition = context position) ifTrue: [  ^ '' ].
	
	[
		context waterPosition: context position.
		(node boundary parseOn: context) isPetit2Failure 
	] whileTrue: [  
		(node waterToken parseOn: context) isPetit2Failure ifTrue: [  
			context restore: memento.
			context waterPosition: startWaterPosition.
			^ PP2Failure message: 'water boundary not found' context: context.
		].
	].

	^ context copyFrom: start + 1 to: context position