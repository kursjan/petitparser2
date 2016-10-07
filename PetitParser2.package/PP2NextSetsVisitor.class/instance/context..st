caching
context: node
	^ (super context: node) 
		currentNext: currentNext;
		yourself