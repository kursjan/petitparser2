as yet unclassified
parseOn: startContext
	| currentContext elements previousContext |

	elements := OrderedCollection new.
	currentContext := startContext.
	
	[ elements size < min ] whileTrue: [
		(currentContext := parser parseWithContext:  currentContext) isPetit2Failure 
			ifTrue: [ ^ currentContext ].
		elements addLast: currentContext value.
	].

	[ elements size < max ] whileTrue: [
		previousContext := currentContext.
	 	(currentContext := parser parseWithContext:  currentContext) isPetit2Failure
			ifTrue: [ ^ previousContext success: elements  asArray ].
		
		elements addLast: currentContext value.
	].

	^ currentContext success: elements asArray