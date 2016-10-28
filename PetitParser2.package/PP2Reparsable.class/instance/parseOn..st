parsing
parseOn: context
	| memento mementoPromise |
	Halt if: [ Sensor shiftPressed  ].
	
	mementoPromise := buffer at: context position ifAbsentPut: [ 
		PP2MementoPromise new
			position: context position;
			buffer: buffer;
			yourself
	].

	memento := mementoPromise resolveFor: strategy in: context.
	context restore: memento contextMemento.

	^ memento returnValue
	
	"
		The code might be a bit of magic, because it handles 'reparses':
			1) In case of the first parse, a MementoPromise is crated and immediately resolved.
			2) In case of a reparse after a change in input, an PP2InputChange puts a mementoPromise 
				to the buffer with a limit. If parser during the resolve does not fit the limit, an
				exception is raised and reparse fails.
	"
	
