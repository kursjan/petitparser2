visiting
visitPossesiveRepeating: parser
	| previousContext elements index |

	"
		JK: Use index to allow for continuations. When the context is restored from the continuation,
		the collection is not restored. We can either use immutable collections (but we do not) or
		we can keept track of index and manage the collection elements on our own.
	"
	
	index := 0.
	elements := OrderedCollection new.
	
	[ index < parser min ] whileTrue: [
	 	(self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ currentContext ].
		index := index + 1.
		elements at: index ifAbsentPut: currentContext value.
	].

	[ index < parser max ] whileTrue: [
		previousContext := currentContext.
	 	(self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ previousContext success: (elements copyFrom: 1 to: index) asArray ].
		index := index + 1.
		elements at: index ifAbsentPut: currentContext value.
	].

	^ currentContext success: elements asArray
