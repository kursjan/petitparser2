element
elOpen
	^ $< asPParser, elementName push, #any asPParser starLazy, $> asPParser ==> #second