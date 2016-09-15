instance creation
openOn: aClass
	"Less glamorous versions of Glamour do not work with the new browser, fall back to the old one in this case."
	
	(self superclass canUnderstand: #compose)
		ifFalse: [ ^ PPDrabBrowser new openOn: aClass ].
	^ self new openOn: aClass