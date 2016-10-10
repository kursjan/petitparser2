removing
removeKey: key fromBuffer: buffer
	| memento promise |
	memento := buffer at: key.

	promise := PP2MementoPromise new
		parser: memento;
		limit: memento contextMemento;
		buffer: buffer;
		yourself.

	^ buffer at: key put: promise