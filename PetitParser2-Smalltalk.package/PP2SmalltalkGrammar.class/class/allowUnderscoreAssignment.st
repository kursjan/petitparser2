testing
allowUnderscoreAssignment
	^ (Scanner respondsTo: #allowUnderscoreAsAssignment) and: [ Scanner allowUnderscoreAsAssignment ]