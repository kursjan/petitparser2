parsing
parseOn: context

	| awr bwr ir memento |
	memento := self remember: context.
	node reset: context.
	
	(bwr := node beforeWater parseOn: context) isPetit2Failure ifTrue: [
		^ bwr
	].

	(ir := node island parseOn: context) isPetit2Failure ifTrue: [  
		self restore: context from: memento.
		^ PP2Failure message: 'island not found' context: context
	].

	(awr := node afterWater parseOn: context) isPetit2Failure ifTrue: [  
		self restore: context from: memento.
		^  PP2Failure message: 'boundary not found' context: context
	].

	^ Array with: bwr with: ir with: awr