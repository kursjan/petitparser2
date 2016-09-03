private
upToPosition: readPosition
	[position < (readPosition) and: [ stream atEnd not ]] whileTrue: [  
		self uncheckedNext
	]