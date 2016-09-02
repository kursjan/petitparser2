initialization
initialize
	super initialize.
	
	anythingClassification := (Array new: 255 withAll: true).
	guarded := Stack with: anythingClassification.
	