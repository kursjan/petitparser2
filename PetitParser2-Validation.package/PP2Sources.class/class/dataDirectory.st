as yet unclassified
dataDirectory
	DataDirectory isNil ifTrue:[
		| dirFromEnv |
		
		dirFromEnv := self getenv: 'PP2_SOURCES'.
		dirFromEnv notNil ifTrue:[
			[
				self dataDirectory: dirFromEnv.
				^ DataDirectory.
			] on: Error do:[:ex|
				"Do nothing, fall through and use default"
			]
		].
		self dataDirectory: self dataDirectoryDefault 
	].
	^ DataDirectory 
	"
	PPResources dataDirectory
	"
	