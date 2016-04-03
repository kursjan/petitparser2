accessing
name
	"Answer the production name of the receiver."
	
	^ self propertyAt: #name ifAbsent: [ nil ]