instance creation
onClass: aClass rename: anOldSelector to: aNewSelector
	^ self new
		setClass: aClass;
		setOldProduction: anOldSelector;
		setNewProduction: aNewSelector;
		yourself