memoization
remember
	^ PP2ContextMemento new
		stream: self;
		position: position;
		properties: self propertiesCopy;
		yourself.
