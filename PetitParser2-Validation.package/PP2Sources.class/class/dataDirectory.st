as yet unclassified
dataDirectory
	DataDirectory isNil ifTrue:[
		| dirFromEnv |
		
		dirFromEnv := self getenv: 'PETITCOMPILER_DATA_DIRECTORY'.
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
	