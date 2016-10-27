parsing
parseOn: context

	| awr bwr ir memento |
	memento := context remember.
	node reset: context.
	
	(bwr := node beforeWater parseOn: context) isPetit2Failure ifTrue: [
		^ bwr
	].

	(ir := node island parseOn: context) isPetit2Failure ifTrue: [  
		context restore: memento.
		^ PP2Failure message: 'island not found' context: context
	].

	(awr := node afterWater parseOn: context) isPetit2Failure ifTrue: [  
		context restore: memento.
		^  PP2Failure message: 'boundary not found' context: context
	].

	^ Array with: bwr with: ir with: awr