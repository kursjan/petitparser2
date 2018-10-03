Class {
	#name : #PP2Sources,
	#superclass : #TestResource,
	#instVars : [
		'cache'
	],
	#classVars : [
		'DataDirectory'
	],
	#category : 'PetitParser2-Validation-Core'
}

{ #category : #'as yet unclassified' }
PP2Sources class >> downloadUrl [
	^ 'http://scg.unibe.ch/download/jk/sources/'
]

{ #category : #seas }
PP2Sources >> aIslandOfSize: size [
	| collection |
	collection := String new: size.
	
	1 to: size do: [ :index |
	 		collection at: index put: $. .	
	].

	collection at: size atRandom put: $a.
	^ collection
]

{ #category : #seas }
PP2Sources >> aIslandSourcesBenchmarking [
	^ self cachedValue: #aIslandSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]
]

{ #category : #seas }
PP2Sources >> aIslandSourcesComplexity [
	^ self cachedValue: #aIslandSourcesComplexity ifAbsentPut: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]
]

{ #category : #seas }
PP2Sources >> aIslandSourcesProfiling [
	^ self cachedValue: #aIslandSourcesProfiling ifAbsentPut: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 100*1000
	]
]

{ #category : #seas }
PP2Sources >> aIslandsOfSize: size [
	| collection |
	collection := String new: size.
	
	1 to: size do: [ :index |
		(10 atRandom == 1) ifTrue: [ 
			collection at: index put: $a.
		] ifFalse: [ 
	 		collection at: index put: $. .	
		]
	].
	^ collection
]

{ #category : #seas }
PP2Sources >> aIslandsSourcesBenchmarking [
	^ self cachedValue: #aIslandsSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]
]

{ #category : #seas }
PP2Sources >> aIslandsSourcesComplexity [
	^ self cachedValue: #aIslandsSourcesComplexity ifAbsentPut: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 100*1000
	]
]

{ #category : #seas }
PP2Sources >> aIslandsSourcesProfiling [
	^ self cachedValue: #aIslandsSourcesProfiling ifAbsentPut: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 2*1000
	]
]

{ #category : #seas }
PP2Sources >> blockIslandsOfSize: size [
	| stream |
	stream := WriteStream on: (String new: size).
	self blockIslandsOfSize: size stream: stream.
	self assert: (stream size - size) == 0.
	^ stream contents

]

{ #category : #seas }
PP2Sources >> blockIslandsOfSize: size stream: stream [
	| index rand |
	index := 0.
	rand := Random new.
	
	[index < size] whileTrue: [ 
 		((size - index >= 2) and: [(rand next < 0.1)]) ifTrue: [  
			| subSize |
			subSize := (0 max: (size - index - 2)).
			subSize > 0 ifTrue: [ subSize := rand nextInt: subSize ].
			stream nextPut: ${.
			self blockIslandsOfSize: subSize stream: stream.
			stream nextPut: $}.
			index := index + subSize  + 2.
		] ifFalse: [ 
			stream nextPut: $. .
			index := index + 1.
		].
	]
]

{ #category : #seas }
PP2Sources >> blockIslandsSourcesBenchmarking [
	^ self cachedValue: #blockIslandsSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]
]

{ #category : #seas }
PP2Sources >> blockIslandsSourcesComplexity [
	^ self cachedValue: #blockIslandsSourcesComplexity ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 50*1000
	]
]

{ #category : #seas }
PP2Sources >> blockIslandsSourcesProfiling [
	^ self cachedValue: #blockIslandsSourcesProfiling ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 3 max: 2*1000
	]
]

{ #category : #seas }
PP2Sources >> blockIslandsSourcesTesting [
	^ self cachedValue: #blockIslandsSourcesTesting ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 1*1000
	]
]

{ #category : #caching }
PP2Sources >> cachedValue: key ifAbsentPut: block [
	^ cache at: key ifAbsentPut: block
]

{ #category : #download }
PP2Sources >> download: zipFile [
	zipFile asFileReference exists ifFalse: [ 
		ZnClient new
			url: self class downloadUrl, zipFile;
			signalProgress: true;
			downloadTo: FileSystem workingDirectory.
	].
	^  (FileSystem zip: zipFile asFileReference) open workingDirectory
]

{ #category : #download }
PP2Sources >> downloadUI: zipFile [
	zipFile asFileReference exists ifFalse: [ 
		UIManager default informUserDuring: [ :bar |
			bar label: 'Downloading ...'.
			[ ZnClient new
				url: self class downloadUrl, zipFile;
				signalProgress: true;
				downloadTo: FileSystem workingDirectory ]
			on: HTTPProgress 
			do: [ :progress |
				progress isEmpty ifFalse: [ 
					bar current: progress percentage.
					progress total ifNotNil: [ :aTotalNumber |
						bar label: 'Downloading ' ] ].
				progress resume ] 
		]	
	].
	^  (FileSystem zip: zipFile asFileReference) open workingDirectory
]

{ #category : #expressions }
PP2Sources >> expressionOfSize: size [
	| stream |
	stream := WriteStream on: (String new: size * 5).
	self expressionOfSize: size stream: stream.
	^ stream contents
]

{ #category : #expressions }
PP2Sources >> expressionOfSize: size stream: stream [
	| index rand |
	index := 0.
	rand := Random new.
	
	[index < size] whileTrue: [ 
 		(rand next < 0.1) ifTrue: [  
			| subSize |
			subSize := rand nextInt: (size - index - 1) + 1.
			stream nextPutAll: ' ('.
			self expressionOfSize: subSize stream: stream.
			stream nextPutAll: ') '.
			index := index + subSize.
		] ifFalse: [ 
			stream nextPutAll: (rand nextInt: 100) asString.
			index := index + 1.
		].
	
		(index < size) ifTrue: [ 
 			(rand next < 0.5) 
				ifTrue: [  stream nextPutAll: ' + ' ] 
				ifFalse: [ stream nextPutAll: ' * ' ]
		]
	]
]

{ #category : #expressions }
PP2Sources >> expressionSourcesBenchmarking [
	^ self cachedValue: #expressionSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 10 max: 200.
	].
	

]

{ #category : #expressions }
PP2Sources >> expressionSourcesComplexity [
	^ self cachedValue: #expressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	

]

{ #category : #expressions }
PP2Sources >> expressionSourcesProfiling [
	^ self cachedValue: #expressionSourcesProfiling ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 1 max: 100.
	].
	

]

{ #category : #expressions }
PP2Sources >> expressionSourcesVerification [
	^ self cachedValue: #expressionSourcesVerification ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 500 amount: 1 max: 500.
	].
	

]

{ #category : #utility }
PP2Sources >> files: files withExtension: extension [
	^ files select: [ :f | f extension = extension ] 
]

{ #category : #micro }
PP2Sources >> idsSourcesBenchmarking [
	"
		PPValidatorSources current idsSourcesBenchmarking.
	"
	^ self cachedValue: #idsSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #loremIpsum: steps: 50 amount: 1 max: 200*1000
	]
]

{ #category : #expressions }
PP2Sources >> indentExpressionOfSize: size [
	| stream |
	stream := WriteStream on: (String new: size * 5).
	self indentExpressionOfSize: size stream: stream indent: 0 limit: size.
	^ stream contents
]

{ #category : #expressions }
PP2Sources >> indentExpressionOfSize: size stream: stream indent: indent limit: limit [
	| index rand |
	index := 0.
	rand := Random new.

	[index < size] whileTrue: [ 
 		(index ~= 0 and: [ indent < 500 and: [ rand next < 0.1]] ) ifTrue: [  
			| subSize |
			subSize := rand nextInt: (size - index - 1) + 1.

			stream nextPut: Character cr.
			(indent + 1) timesRepeat: [ stream nextPutAll: '    ' ].

			self indentExpressionOfSize: subSize stream: stream indent: (indent + 1) limit: limit.

			stream nextPut: Character cr.
			indent timesRepeat: [ stream nextPutAll: '    ' ].

			index := index + subSize.
		] ifFalse: [ 
			stream nextPutAll: (rand nextInt: 100) asString.
			index := index + 1.
		].
	
		(index < size) ifTrue: [ 
 			(rand next < 0.5) 
				ifTrue: [  stream nextPutAll: '+' ] 
				ifFalse: [ stream nextPutAll: '*' ]
		]
	]
]

{ #category : #expressions }
PP2Sources >> indentExpressionSourcesBenchmarking [
	^ self cachedValue: #indentExpressionSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 3 max: 200.
	].
	

]

{ #category : #expressions }
PP2Sources >> indentExpressionSourcesComplexity [
	^ self cachedValue: #indentExpressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	

]

{ #category : #expressions }
PP2Sources >> indentExpressionSourcesProfiling [
	^ self cachedValue: #indentExpressionSourcesProfiling ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 1 max: 50.
	].
	

]

{ #category : #expressions }
PP2Sources >> indentExpressionSourcesVerification [
	^ self cachedValue: #indentExpressionSourcesVerification ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 1 max: 50.
	].
	

]

{ #category : #initialization }
PP2Sources >> initialize [
	super initialize.
	cache := IdentityDictionary new
]

{ #category : #utility }
PP2Sources >> inputs: selector steps: steps amount: amount max: max [
	| input size step |
	input := OrderedCollection new.
	step := max // steps.
	
	1 to: steps do: [ :index |
		size := step * index.
		amount timesRepeat: [ 
			input add: (self perform: selector with: size).
		]
	].

	^ input
]

{ #category : #expressions }
PP2Sources >> ll1expressionSourcesBenchmarking [
	^ self cachedValue: #ll1expressionSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	

]

{ #category : #expressions }
PP2Sources >> ll1expressionSourcesComplexity [
	^ self cachedValue: #ll1expressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 200 amount: 1 max: 10*1000.
	].
	

]

{ #category : #expressions }
PP2Sources >> ll1indentExpressionSourcesBenchmarking [
	^ self cachedValue: #ll1indentExpressionSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 3 max: 500.
	].
	

]

{ #category : #expressions }
PP2Sources >> ll1indentExpressionSourcesComplexity [
	^ self cachedValue: #ll1indentExpressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 200 amount: 1 max: 5*1000.
	].
	

]

{ #category : #utility }
PP2Sources >> loremIpsum [
	^ 'Lorem ipsum dolor sit amet  consectetur adipiscing elit  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua  Ut enim ad minim veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur  Excepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum'
]

{ #category : #utility }
PP2Sources >> loremIpsum: size [
	"Return a mostly random multi-paragraph filler string of the specified size.
	The result is pure ASCII, uses CR for newlines and no dots and newlines."
	
	"
	PPValidatorSources new loremIpsum: 2048
	"
	
	| words out |
	words := (self loremIpsum findTokens: ' ') collect: #asLowercase.
	(out := LimitedWriteStream on: (String new: size withAll: Character space))
		setLimit: size - 2 
		limitBlock: [ 
			^ out originalContents 
				at: size put: Character cr; 
				yourself ].
	[ 
		out << self loremIpsum; cr; cr.
		5 atRandom timesRepeat: [
			15 atRandom timesRepeat: [
	 			out << words atRandom capitalized.
				20 atRandom timesRepeat: [ out space; << words atRandom ].
				out space ].
			out cr; cr ] ] repeat
]

{ #category : #utility }
PP2Sources >> readDirectory: directory [
	| file |

	( (Smalltalk respondsTo: #isSmalltalkX) and:[ Smalltalk isSmalltalkX ] ) ifTrue:[ 
		file := self class dataDirectory asFilename / directory.
		file exists ifFalse:[  
			self error: 'Directory does not exist'.
		].
		^ (file recursiveDirectoryContentsAsFilenames select:[:each | each isRegularFile ]) asSortedCollection 
	] ifFalse:[ 
		"Assuming Pharo..."
		ZnClient new
			url: 'http://scg.unibe.ch/download/jk/sources/smalltalk-src-selected.zip';
			signalProgress: true;
			downloadTo: FileSystem workingDirectory.
		file := (FileSystem zip: 'smalltalk-src-selected.zip' asFileReference) open workingDirectory.

"		file := self class dataDirectory download
		file := self class dataDirectory asFileReference / directory.
		file exists ifFalse: [ 
			self error: 'Directory', directory asString, ' does not exist'.
		].
"		^ file allFiles asSortedCollection 
	]

	"Modified: / 10-05-2015 / 07:54:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #utility }
PP2Sources >> selectEvenly: n fromFiles: collection [
	^ self selectEvenly: n fromFiles: collection thatSatisfy: [ :e | true ]
]

{ #category : #utility }
PP2Sources >> selectEvenly: n fromFiles: collection thatSatisfy: aBlock [
	| set step index size sorted |
	set := IdentitySet new.	
	step := 65537.
	index := 0.
	size := collection size.
	sorted := collection sort.
	self assert: collection atRandom isFile.
	
	[set size = n] whileFalse: [ 
		index := ((index + step) % size).
		(aBlock value: (sorted at: (index + 1) )) ifTrue: [ 
			set add: (sorted at: (index + 1)).
		].
	].

	^ set asOrderedCollection sorted collect: [ :file | file contents ]
]
