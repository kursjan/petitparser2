as yet unclassified
getenv: nm
	"Return the value of the given environment variable"
	
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode >
	((Smalltalk respondsTo: #isSmalltalkX) and:[Smalltalk isSmalltalkX]) ifTrue:[
		^ (Smalltalk at: #OperatingSystem) getEnvironment: nm
	] ifFalse:[	
		^ OSPlatform current environment at: nm ifAbsent: nil
	].
	"
	PPCResources getenv: 'HOME'
	"