as yet unclassified
parseOn: context
	| returnValue contextMemento memento |

	memento := buffer at: context position ifAbsentPut: [  
		returnValue := strategy parseOn: context.
		contextMemento := context remember.
		
		PP2Memento new
			returnValue: returnValue;
			contextMemento: contextMemento;
			yourself
	].

	context restore: memento contextMemento.
	^ memento returnValue