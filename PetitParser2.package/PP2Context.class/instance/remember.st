memoization
remember
	^ PP2ContextMemento new
		stream: stream;
		position: position;
		properties: self propertiesCopy;
		yourself.
