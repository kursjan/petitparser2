instance creation
onClass: aClass source: aString protocols: anArray
	^ self new
		setClass: aClass;
		setSource: aString;
		setProtocols: anArray;
		yourself