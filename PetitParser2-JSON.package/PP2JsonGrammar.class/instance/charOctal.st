primitives
charOctal
	^ '\u' asPParser , (#hex asPParser min: 4 max: 4)