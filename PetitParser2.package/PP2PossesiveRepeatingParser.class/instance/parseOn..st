as yet unclassified
parseOn: startContext
	| context elements index  |
	elements := OrderedCollection new.
	"
		JK: Use index to allow for continuations. When the context is restored from the continuation,
		the collection is not restored. We can either use immutable collections or keept track of index
		and manage the collection elements on our own.
	"
	index := 1.
	context := startContext.
	
	[ index <= min ] whileTrue: [
		(context := parser parseWithContext:  context) isPetit2Failure 
			ifTrue: [ ^ context ].
		elements at: index ifAbsentPut: context value.
		index := index + 1.
	].

	[ index <= max ] whileTrue: [
	 	(context := parser parseWithContext:  context) isPetit2Failure
			ifTrue: [ ^ context success: (elements copyFrom: 1 to: (index - 1)) asArray ].
		
		elements at: index ifAbsentPut: context value.
		index := index + 1.
	].

	^ context success: (elements copyFrom: 1 to: index - 1) asArray