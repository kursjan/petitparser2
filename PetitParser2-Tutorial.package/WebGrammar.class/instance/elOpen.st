element
elOpen
	^ $< asPParser, elementName push, any starLazy, $> asPParser ==> #second