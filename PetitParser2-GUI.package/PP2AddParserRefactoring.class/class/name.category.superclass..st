instance creation
name: aString category: aSymbol superclass: aClass
	^ self new
		setName: aString;
		setCategory: aSymbol;
		setSuperclass: aClass;
		yourself