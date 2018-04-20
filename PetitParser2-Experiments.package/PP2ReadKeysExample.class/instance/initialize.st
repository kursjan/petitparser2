initialize
initialize
	super initialize.
	
	stream := String new writeStream.

	keyMorph := PP2ReadKeysMorph new.
	textArea := self textMorph.
	keyMorph outputStream: self.
	
	self buildWindow.