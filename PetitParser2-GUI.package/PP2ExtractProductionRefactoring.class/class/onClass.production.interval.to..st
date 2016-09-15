instance creation
onClass: aClass production: aSelector interval: anInterval to: aTargetSelector
	^ (self extract: anInterval from: aSelector in: aClass)
		setTargetProduction: aTargetSelector;
		yourself