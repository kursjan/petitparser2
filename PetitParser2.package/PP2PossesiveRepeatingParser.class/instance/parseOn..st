as yet unclassified
parseOn: startContext
	| currentContext elements index  previousContext |
	elements := OrderedCollection new.
	"
		JK: Use index to allow for continuations. When the context is restored from the continuation,
		the collection is not restored. We can either use immutable collections or keept track of index
		and manage the collection elements on our own.
	"
	index := 1.
	currentContext := startContext.
	
	[ index <= min ] whileTrue: [
		(currentContext := parser parseWithContext:  currentContext) isPetit2Failure 
			ifTrue: [ ^ currentContext ].
		elements at: index ifAbsentPut: currentContext value.
		index := index + 1.
	].

	[ index <= max ] whileTrue: [
		previousContext := currentContext.
	 	(currentContext := parser parseWithContext:  currentContext) isPetit2Failure
			ifTrue: [ ^ previousContext success: (elements copyFrom: 1 to: (index - 1)) asArray ].
		
		elements at: index ifAbsentPut: currentContext value.
		index := index + 1.
	].

	^ currentContext success: (elements copyFrom: 1 to: index - 1) asArray