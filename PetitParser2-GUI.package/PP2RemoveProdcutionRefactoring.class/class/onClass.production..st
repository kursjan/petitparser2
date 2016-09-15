instance creation
onClass: aClass production: aSelector
	^ self new
		setClass: aClass;
		setProduction: aSelector;
		yourself