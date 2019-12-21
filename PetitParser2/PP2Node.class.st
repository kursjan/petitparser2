"
Base class for all the nodes of PP2.
"
Class {
	#name : #PP2Node,
	#superclass : #Object,
	#traits : 'TPP2Properties',
	#classTraits : 'TPP2Properties classTrait',
	#instVars : [
		'properties',
		'strategy',
		'memoizationStrategy'
	],
	#classInstVars : [
		'spaceTrimmer'
	],
	#category : #'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2Node class >> named: aString [
	^ self new name: aString
]

{ #category : #'instance creation' }
PP2Node class >> new [
	"for compatibility reasons with Smalltalk/X"
	^ self basicNew 
		initialize
]

{ #category : #operators }
PP2Node >> , anotherParser [
	^ PP2SequenceNode with: self with: anotherParser
]

{ #category : #operators }
PP2Node >> / aParser [ 
	"Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice)."
	
	^ PP2ChoiceNode with: self with: aParser
]

{ #category : #comparing }
PP2Node >> = anotherNode [
	^ self equals: anotherNode visitedSet: IdentitySet new
	
	"	
		Note: should not be really overriden by children, try to 
				override #equals:, unless you know what you are doing, 
				of course :)
	"

]

{ #category : #operators }
PP2Node >> ==> aBlock [
	"Answer a new parser that performs aBlock as action handler on success."

	^ PP2ActionNode on: self block: aBlock
]

{ #category : #operators }
PP2Node >> >==> aBlock [
	"
		Make sure that the block does not perform any functional changes, otherwise all the optimizations break.
	
		Use #>=> if you need to do functional changes.
	"
	^ (PP2WrappingNode on: self block: aBlock)
		functionalChanges: false;
		yourself
]

{ #category : #operators }
PP2Node >> >=> aBlock [
	"Answer a new parser that performs aBlock as action handler on success."

	^ PP2WrappingNode on: self block: aBlock
]

{ #category : #visiting }
PP2Node >> accept: aPP2ParserVisitor [
	self subclassResponsibility 
]

{ #category : #optimizations }
PP2Node >> addParent: value [
	self parents add: value
]

{ #category : #'optimizations - warnings' }
PP2Node >> addWarning: warning [
	self warnings add: warning.
	
	"Transcript crShow: warning"
]

{ #category : #'optimizations - caching' }
PP2Node >> allCaches [
	^ self propertyAt: #allCaches ifAbsent: [
		self collectCaches
	]
]

{ #category : #enumerating }
PP2Node >> allNodes [
"	^ PP2ChildrenVisitor new visit: self"

	"faster version than visitor:"
	| result |
	result := OrderedCollection new.
	self allNodesDo: [ :parser | result addLast: parser ].
	^ result
]

{ #category : #enumerating }
PP2Node >> allNodesDo: aBlock [
	^ self allNodesDo: aBlock seen: IdentitySet new
]

{ #category : #enumerating }
PP2Node >> allNodesDo: aBlock seen: aSet [
	"
		Iterate over all the parse nodes of the receiver, do not visit the ones contained in aSet.
	"

	(aSet includes: self) ifTrue: [ ^ self ].
	aSet add: self.
	
	aBlock value: self.
	self children do: [ :each | each allNodesDo: aBlock seen: aSet ]
]

{ #category : #reparsing }
PP2Node >> allReparsables [
	^ self propertyAt: #allReparsables ifAbsentPut: [
		self collectReparsables
	]
]

{ #category : #'optimizations - warnings' }
PP2Node >> allWarnings [
	| warnings |
	warnings := Dictionary new.
	self allNodesDo: [ :node | 
		node warnings do: [ :w | warnings at: node put: w ]
	].
	^ warnings
]

{ #category : #operators }
PP2Node >> and [
	^ PP2AndNode on: self
]

{ #category : #reparsing }
PP2Node >> applyChange: change [
	change updateParser: self
]

{ #category : #converting }
PP2Node >> asPParser [
	^ self
]

{ #category : #parsing }
PP2Node >> changeStrategy: aPP2Strategy [
	"
		Contrary to the #strategy:, I do not assert the identity equivalence of the node.
		This means you can you the same strategy with multiple nodes, as long as the nodes
		are equivalent (i.e. nodeOne = node2)
	"
	self assert: (aPP2Strategy node = self).
	strategy := aPP2Strategy
]

{ #category : #accessing }
PP2Node >> childAt: index [
	^ self children at: index
]

{ #category : #accessing }
PP2Node >> children [
	^ #()
]

{ #category : #comparing }
PP2Node >> childrenEqual: anotherNode visitedSet: visitedSet [
	"
		Invokes the comparison function on all children, while passing the visited
		set to avoid infinite loops.
	"
	self children size = anotherNode children size ifFalse: [ ^ false ].
	
	self children with: anotherNode children do: [ :child :anotherChild |
		(child equals: anotherChild visitedSet: visitedSet) ifFalse: [ ^ false ]
	].
	^ true
]

{ #category : #comparing }
PP2Node >> childrenHash: visitedSet [
	| hash |
	hash := '' hash.
	self children do: [ :child |
		hash := hash bitXor: (child hash: visitedSet)
	].
	^ hash
]

{ #category : #'optimizations - caching' }
PP2Node >> collectCaches [
	| caches |
	caches := IdentitySet new. 
	self allNodesDo: [ :c | c strategies do: [ :s | s isCache ifTrue: [ caches add: s ] ] ].
	^ caches asArray

]

{ #category : #reparsing }
PP2Node >> collectReparsables [
	| reparsables |
	reparsables := IdentitySet new. 
	self allNodesDo: [ :c | c strategies do: [ :s | s isReparsable ifTrue: [ reparsables add: s ] ] ].
	^ reparsables asArray

]

{ #category : #'analysis - context' }
PP2Node >> contextChanges [
	^ self propertyAt: #contextChanges ifAbsent: [  
		PP2ContextChangesVisitor new visit: self
	]
]

{ #category : #'analysis - context' }
PP2Node >> contextChanges: aPP2CaResult [
	self assert: (aPP2CaResult isKindOf: PP2CcResult).
	^ self propertyAt: #contextChanges put: aPP2CaResult
]

{ #category : #accessing }
PP2Node >> debug: input [
	^ self 
		enableDebug enableRecording 
		parse: input withContext: PP2RecordingContext new
]

{ #category : #debugging }
PP2Node >> debug: input withContext: startContext [
	^ self enableDebug parse: input withContext: startContext

]

{ #category : #debugging }
PP2Node >> debugAdaptableWithContext: context [
	^ self enableDebug parseAdaptableWithContext: context
]

{ #category : #operators }
PP2Node >> def: node [
	"Redefine the receiver as the argument 'node'. This method is useful when defining recursive parsers: instantiate a PP2UnresolvedNode and later redefine it with another one."

	^ self becomeForward: (node name: self name)
]

{ #category : #'operators - convenience' }
PP2Node >> delimitedBy: aParser [
	"Answer a new parser that parses the receiver one or more times, separated and possibly ended by aParser."
	
	^ (self separatedBy: aParser) , (aParser optional) ==> [ :node |
		node second isNil
			ifTrue: [ node first ]
			ifFalse: [ node first copyWith: node second ] ]
]

{ #category : #optimizations }
PP2Node >> deoptimize [
	self isOptimized ifFalse: [ ^ self ].
	self allNodesDo: [ :node | node resetStrategies ].
	self unsetOptimized.
]

{ #category : #copying }
PP2Node >> duplicate [
	^ self transform: [ :node | node copy ]
]

{ #category : #debugging }
PP2Node >> enableDebug [
	self allNodesDo: [ :child | child strategy: child strategy debug ]
]

{ #category : #debugging }
PP2Node >> enableRecording [
	| parent |
	self allNodesDo: [ :node | 
		parent := node.
		node strategies do: [ :s | 
			parent := self switchToRecording: s parent: parent.
		]
	].

	"The caches has been changed to their recording equivalents, the info needs to be updated"
	self refreshCaches.

]

{ #category : #operators }
PP2Node >> end [
	"
		$a asPParser end parse: 'a'.
		$a asPParser end parse: 'ab'.
		
	"
	^ PP2EndNode on: self
]

{ #category : #comparing }
PP2Node >> equals: anotherNode visitedSet: visitedSet [
	self == anotherNode ifTrue: [ ^ true ].
	
	"
		Manages visited set in order to avoid inifinite loops, I don't see much reasons to
		override this method.
	"
	(visitedSet includes: self) ifTrue: [ ^ true ].
	(visitedSet add: self).

	(self localEquals: anotherNode) ifFalse: [ ^ false ].	
	(self childrenEqual: anotherNode visitedSet: visitedSet) ifFalse: [ ^ false ].
	
	^ true
]

{ #category : #'analysis - first' }
PP2Node >> firstProductionSet [
	^ self propertyAt: #firstProductionSet ifAbsent: [
		PP2FirstSetVisitor productionSet visit: self
	]
]

{ #category : #'analysis - first' }
PP2Node >> firstSeasOrTerminalsSet [
	^ self propertyAt: #firstSeasOrTerminals ifAbsent: [
		PP2FirstSetVisitor seasOrTerminalsSet visit: self
	]
]

{ #category : #'analysis - first' }
PP2Node >> firstSet [
	^ self propertyAt: #firstSet ifAbsent: [
		PP2FirstSetVisitor firstSet visit: self
	]
]

{ #category : #operators }
PP2Node >> flatten [
	^ PP2FlattenNode on: self
]

{ #category : #'operators - mapping' }
PP2Node >> foldLeft: aBlock [
	"Answer a new parser that that folds the result of the receiver from left-to-right into aBlock. The argument aBlock must take two or more arguments."
	
	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ self ==> [ :nodes |
		args at: 1 put: nodes first.
		2 to: nodes size by: size - 1 do: [ :index |
			args
				replaceFrom: 2 to: size with: nodes startingAt: index;
				at: 1 put: (aBlock valueWithArguments: args) ].
		args first ]
]

{ #category : #'operators - mapping' }
PP2Node >> foldRight: aBlock [
	"Answer a new parser that that folds the result of the receiver from right-to-left into aBlock. The argument aBlock must take two or more arguments."

	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ self ==> [ :nodes |
		args at: size put: nodes last.
		nodes size - size + 1 to: 1 by: 1 - size do: [ :index |
			args
				replaceFrom: 1 to: size - 1 with: nodes startingAt: index;
				at: size put: (aBlock valueWithArguments: args) ].
		args at: size ]
]

{ #category : #'optimizations - caching' }
PP2Node >> forbidCache [
	^ self propertyAt: #cacheAllowed put: false
]

{ #category : #testing }
PP2Node >> hasName [
	^ self name isNil not
]

{ #category : #comparing }
PP2Node >> hash [
	^ self hash: IdentitySet new
]

{ #category : #comparing }
PP2Node >> hash: visitedSet [
	"
		Manages visited set in order to avoid inifinite loops, I don't see much reasons to
		override this method.
	"
	(visitedSet includes: self) ifTrue: [ ^ '' hash ].
	(visitedSet add: self).

	^ self localHash bitXor: (self childrenHash: visitedSet)
]

{ #category : #initialization }
PP2Node >> initialize [
	self resetStrategies
]

{ #category : #testing }
PP2Node >> isAdaptable [
	^ false
]

{ #category : #'optimizations - caching' }
PP2Node >> isCacheForbidden [
	(self hasProperty: #cacheAllowed) ifTrue: [ 
		^ (self propertyAt: #cacheAllowed) not
	].
	^ false
]

{ #category : #'analysis - context' }
PP2Node >> isContextFree [
	^ self isContextSensitive not
]

{ #category : #'analysis - context' }
PP2Node >> isContextSensitive [
	^ self propertyAt: #isContextSensitive ifAbsent: [  
		PP2ContextSensitivityVisitor new visit: self
	]
]

{ #category : #testing }
PP2Node >> isDebugging [
	^ self strategies anySatisfy: [ :s | s isDebugging ]
]

{ #category : #testing }
PP2Node >> isEOI [
	^ false
]

{ #category : #testing }
PP2Node >> isEpsilon [
	^ false
]

{ #category : #'analysis - first' }
PP2Node >> isFirstSetTerminal [
	^ self isTerminal
]

{ #category : #testing }
PP2Node >> isJustDelegate [
	^ false
]

{ #category : #testing }
PP2Node >> isMemoized [
	^ self strategies anySatisfy: [ :s | s isMemoized ]
]

{ #category : #'analysis - abstract simulation' }
PP2Node >> isNullable [
	"
		I return true, if parser ALWAYS can accept epsilon and I NEVER fail.
		
		Use #acceptsEpsilon if it can accept epsilon, but it can fail as well.
	"
	^ self propertyAt: #isNullable ifAbsent: [ 
		PP2IsNullableVisitor new visit: self
	]
]

{ #category : #'analysis - abstract simulation' }
PP2Node >> isNullable: aBoolean [
	self propertyAt: #isNullable put: aBoolean
]

{ #category : #optimizations }
PP2Node >> isOptimized [
	^ self propertyAt: #optimized ifAbsent: false
]

{ #category : #testing }
PP2Node >> isPetit2Parser [
	^ true
]

{ #category : #testing }
PP2Node >> isProduction [
	^ self name notNil
]

{ #category : #testing }
PP2Node >> isRepeating [
	^ false
]

{ #category : #testing }
PP2Node >> isSea [
	^ false
]

{ #category : #testing }
PP2Node >> isTerminal [
	^ self children isEmpty
]

{ #category : #testing }
PP2Node >> isToken [
	^ false
]

{ #category : #testing }
PP2Node >> isTrimming [
	^ false
]

{ #category : #testing }
PP2Node >> isTrimmingToken [
	^ false
]

{ #category : #operators }
PP2Node >> islandInSea [
	^ self sea ==> #second
]

{ #category : #comparing }
PP2Node >> localEquals: anotherNode [
	"
		This method is supposed to be overriden by children
	"

	self == anotherNode ifTrue: [ ^ true ].
	self class == anotherNode class ifFalse: [ ^ false ].
	
	"
		JK: properties? Most probably not, they can contain first/follow etc.
		Cherrypick manually the ones you care about.
	"
	self name = anotherNode name ifFalse: [ ^ false ].

	"JK: strategy? Probably not"
	^ true
]

{ #category : #comparing }
PP2Node >> localHash [
	"
		This method is supposed to be overriden by children
	"

	^ self class hash bitXor: self name hash
]

{ #category : #operators }
PP2Node >> map: block [
	^ PP2MappingNode on: self block: block
]

{ #category : #optimizations }
PP2Node >> markNoRecognizer [
	((self hasProperty: #recognizer) and: [ self propertyAt: #recognizer ]) ifTrue: [  
		self warnShouldNotBeShared. 
	].
	self propertyAt: #recognizer put: false
]

{ #category : #optimizations }
PP2Node >> markRecognizer [
	((self hasProperty: #recognizer) and: [ (self propertyAt: #recognizer) not ]) ifTrue: [  
		self warnShouldNotBeShared. 
	].

	self propertyAt: #recognizer ifAbsentPut: true
]

{ #category : #'operators - context' }
PP2Node >> match [
	^ PP2MatchNode on: self
]

{ #category : #parsing }
PP2Node >> matches: anObject [
	"Answer if anObject can be parsed by the receiver."
	
	^ (self parseContext: anObject) isPetit2Failure not
]

{ #category : #accessing }
PP2Node >> memoizationStrategy [
	^ memoizationStrategy
]

{ #category : #accessing }
PP2Node >> memoizationStrategy: anObject [
	memoizationStrategy := anObject
]

{ #category : #'optimizations - caching' }
PP2Node >> memoize [
	self propertyAt: #memoize put: true
]

{ #category : #'operators - repeating' }
PP2Node >> min: aMinInteger max: aMaxInteger [
	"Answer a new parser that parses the receiver at least aMinInteger and at most aMaxInteger times."
	
	^ self star 
		min: aMinInteger; 
		max: aMaxInteger;
		yourself
]

{ #category : #accessing }
PP2Node >> name [
	"Answer the production name of the receiver."
	
	^ self propertyAt: #name ifAbsent: [ nil ]
]

{ #category : #accessing }
PP2Node >> name: aString [
	self propertyAt: #name put: aString
]

{ #category : #operators }
PP2Node >> negate [
	"Answer a new parser consumes any input token but the receiver."
	
	^ self not , #any asPParser ==> #second
]

{ #category : #'analysis - next' }
PP2Node >> nextSetIn: root [
	^ root nextSets at: self
]

{ #category : #'analysis - next' }
PP2Node >> nextSets [
	^ self propertyAt: #nextSets ifAbsent: [  
		(PP2NextSetsVisitor new )
			visit: self;
			nextSets.
	]
]

{ #category : #operators }
PP2Node >> nonEpsilon [
	^ PP2NonEpsilonNode on: self
]

{ #category : #operators }
PP2Node >> not [
	^ PP2NotNode on: self
]

{ #category : #optimizations }
PP2Node >> optimize [
	self isOptimized ifTrue: [ ^ self ].
	
	PP2SeaOptimizationVisitor new doPass: self.
	
	PP2SpecializingVisitor new doPass: self.

	PP2RecognizerVisitor new doPass: self.

	"
		Pre-compute isNullable and firstSet properties
	"
	PP2IsNullableCache new doPass: self.
	PP2FirstSetCache new doPass: self.

	"
		Should be called before CommonPrefix. Both do caching, but trimming is tailored to the
		whitespace handling in PP2 and has more suitable cache.
	"
	PP2TrimmingCacheVisitor new doPass: self.

	"Use packrat parsing"
	PP2PackratVisitor new doPass: self.

	"Cache the intermediate results for the Guard and Common Prefix visitors"
	PP2AllNodesCache new doPass: self.
	PP2FirstProductionSetCache new doPass: self.
	PP2CommonPrefixVisitor new doPass: self.
	
	PP2GuardVisitor new doPass: self.
	
	PP2BypassVisitor new doPass: self.
	
	"
		TODO(JanKurs): hack to inject reparsable visitor from experiments.
	"
	(Smalltalk at: #PP2ReparsableVisitor ifAbsent: nil) ifNotNil: [ :reparsableVisitor |
		reparsableVisitor new doPass: self.
	].
	
	"Inject CF memoizations when possible"
	PP2ContextChangesCache new doPass: self.
	PP2ContextSensitivityCache new doPass: self.
	PP2ContextMemoizationVisitor new doPass: self.
	
	self propertyAt: #allCaches put: self collectCaches.
	self setOptimized.
]

{ #category : #operators }
PP2Node >> optional [
	^ PP2OptionalNode on: self
]

{ #category : #optimizations }
PP2Node >> parent: value [
	self parents add: value
]

{ #category : #optimizations }
PP2Node >> parents [
	^ self propertyAt: #parents ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #parsing }
PP2Node >> parse: input [
	^ (self parseContext: input) returnValue
]

{ #category : #parsing }
PP2Node >> parse: anObject onError: aBlock [
	"Parse anObject with the receiving parser and answer the parse-result or answer the result of evaluating aBlock. Depending on the number of arguments of the block it is simply evaluated, evaluated with the failure object, or evaluated with the error message and position."
	
	| result |
	result := self parse: anObject.
	result isPetit2Success ifTrue: [ ^ result ].
	
	(aBlock numArgs = 0) ifTrue: [ ^ aBlock value ].
	(aBlock numArgs = 1) ifTrue: [ ^ aBlock value: result ].
	^ aBlock value: result message value: result position
]

{ #category : #parsing }
PP2Node >> parse: input withContext: startContext [
	^ self parseAdaptable: input withContext: startContext

]

{ #category : #'parsing - adaptable' }
PP2Node >> parseAdaptable: input [
	^ self parseAdaptableWithContext: input asPetit2Stream asPetit2Context
]

{ #category : #'parsing - adaptable' }
PP2Node >> parseAdaptable: input withContext: context [
	context stream: input asPetit2Stream.
	context position: 0.
	context parser: self.

	^ self parseAdaptableWithContext: context
	

]

{ #category : #'parsing - adaptable' }
PP2Node >> parseAdaptableWithContext: context [
	| returnValue |
	context parser: self.
	self resetCaches.
	
	context startMemento: context remember.
	returnValue := self parseOn: context.

	^ returnValue isPetit2Success ifTrue: [ 
		context returnValue: returnValue 
	] ifFalse: [ 
		returnValue 
			setContext: context;
			yourself 
	]
]

{ #category : #parsing }
PP2Node >> parseContext: input [
	^ self parseAdaptable: input
]

{ #category : #'parsing - adaptable' }
PP2Node >> parseOn: context [
	^ strategy parseOn: context 
]

{ #category : #parsing }
PP2Node >> parseWithContext: startContext [
	^ self parseAdaptableWithContext: startContext

]

{ #category : #operators }
PP2Node >> plus [
	^ (PP2PossesiveRepeatingNode on: self)
		min: 1;
		yourself
]

{ #category : #'operators - context' }
PP2Node >> pop [
	^ PP2PopNode on: self
]

{ #category : #copying }
PP2Node >> postCopy [
	"JK: I am not sure, if this works properly for optimized version!"
	super postCopy.
	
	properties := properties copy.
	strategy := strategy copy.
	strategy node: self
]

{ #category : #printing }
PP2Node >> printOn: aStream [
	super printOn: aStream.
	
	self name isNil ifFalse: [ 
		aStream nextPut: $(.
		self name printOn: aStream.
		aStream nextPut: $).
	] ifTrue: [  
		aStream nextPut: $#.
		aStream nextPutAll: self identityHash asString
	]
]

{ #category : #'accessing - properties' }
PP2Node >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2Node >> properties: anObject [
	^ properties := anObject 
]

{ #category : #'operators - context' }
PP2Node >> push [
	^ PP2PushNode on: self
]

{ #category : #optimizations }
PP2Node >> recognizer [
	^ self propertyAt: #recognizer
]

{ #category : #'optimizations - caching' }
PP2Node >> refreshCaches [
	^ self propertyAt: #allCaches put: self collectCaches
]

{ #category : #optimizations }
PP2Node >> reparsable [
	self propertyAt: #reparsable put: true
]

{ #category : #reparsing }
PP2Node >> reparseWithContext: context [
	^ self reparseAdaptableWithContext: context
]

{ #category : #transforming }
PP2Node >> replace: node with: anotherNode [
	"Replace the references of the receiver pointing to aParser with anotherParser."
]

{ #category : #'optimizations - caching' }
PP2Node >> resetCaches [
	self isOptimized ifFalse: [ ^ self ].
	self allCaches do: [ :cache | cache reset ].
	
]

{ #category : #initialization }
PP2Node >> resetMemoizationStrategy [
	memoizationStrategy := PP2CSMemoization new
]

{ #category : #'optimizations - caching' }
PP2Node >> resetNonReparsableCaches [
	self isOptimized ifFalse: [ ^ self ].
	self allCaches reject: [:e | e isReparsable ] thenDo: [ :cache | cache reset ].
	
]

{ #category : #initialization }
PP2Node >> resetStrategies [
	self resetStrategy.
	self resetMemoizationStrategy.
]

{ #category : #initialization }
PP2Node >> resetStrategy [
	self subclassResponsibility
]

{ #category : #operators }
PP2Node >> sea [
	^ PP2SeaNode on: self
]

{ #category : #operators }
PP2Node >> sea: waterToken [
	^ (PP2SeaNode on: self)
		waterToken: waterToken;
		yourself
]

{ #category : #accessing }
PP2Node >> selfSkipDelegate [
	^ self isJustDelegate ifTrue: [  self child ] ifFalse: [	^ self ]

]

{ #category : #'operators - convenience' }
PP2Node >> separatedBy: aParser [
	"Answer a new parser that parses the receiver one or more times, separated by aParser."
	
	^ (PP2SequenceNode with: self with: (PP2SequenceNode with: aParser with: self) star) ==> [ :nodes |
		| result |
		result := Array new: 2 * nodes second size + 1.
		result at: 1 put: nodes first.
		nodes second 
			keysAndValuesDo: [ :index :pair | result replaceFrom: 2 * index to: 2 * index + 1 with: pair startingAt: 1 ].
		result ]
]

{ #category : #optimizations }
PP2Node >> setOptimized [
	^ self allNodesDo: [ :node | node propertyAt: #optimized put: true ]
]

{ #category : #'optimizations - caching' }
PP2Node >> shouldCache [
	^ self propertyAt: #cacheAllowed ifAbsent: [ ^ false ]
]

{ #category : #'optimizations - caching' }
PP2Node >> shouldMemoize [
	^ self propertyAt: #memoize ifAbsent: false
]

{ #category : #operators }
PP2Node >> star [
	^ (PP2PossesiveRepeatingNode on: self)
		min: 0;
		yourself
]

{ #category : #operators }
PP2Node >> starLazy [
	^ ((#epsilon asPParser sea)
		waterToken: self)
	map: [:_before :_epsilon :_after | 
		"return just before water, because island is nil and after water is empty"
		_before
	] 
]

{ #category : #operators }
PP2Node >> starLazy: predicate [
	^ (predicate not, self) star
]

{ #category : #accessing }
PP2Node >> strategies [
	^ strategy allChildren
]

{ #category : #accessing }
PP2Node >> strategy [
	^ strategy
]

{ #category : #accessing }
PP2Node >> strategy: aPP2Strategy [
	(strategy == aPP2Strategy) ifTrue: [ ^ self ].
	self assert: aPP2Strategy node == self.
	strategy := aPP2Strategy
]

{ #category : #recording }
PP2Node >> switchToRecording: toBeSwitched parent: nodeOrStrategy [
	| recordingStrategy |
	recordingStrategy := toBeSwitched recording.
	recordingStrategy == toBeSwitched ifTrue: [ ^ toBeSwitched ].
	nodeOrStrategy strategy: recordingStrategy.

	^ recordingStrategy 
]

{ #category : #operators }
PP2Node >> times: anInteger [
	"Answer a new parser that parses the receiver exactly anInteger times."
	
	^ (PP2PossesiveRepeatingNode on: self)
		min: anInteger;
		max: anInteger;
		yourself
]

{ #category : #operators }
PP2Node >> token [
	^ PP2CreateTokenNode on: self
]

{ #category : #operators }
PP2Node >> token: tokenClass [
	^ (PP2CreateTokenNode on: self)
		tokenClass: tokenClass;
		yourself
]

{ #category : #transforming }
PP2Node >> transform: aBlock [
	^ self transform: aBlock suchThat: [ :node | true ]
]

{ #category : #transforming }
PP2Node >> transform: aBlock suchThat: predicate [
	^ PP2TransformVisitor new
		block: aBlock;
		predicate: predicate;
		visit: self
]

{ #category : #'operators-trimming' }
PP2Node >> trim [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trimSpaces
]

{ #category : #'operators-trimming' }
PP2Node >> trim: aParser [
	"Answer a new parser that consumes and ignores aParser repeatedly before and after the receiving parser."
	
	^ (PP2TrimmingNode on: self)
		trimmer: aParser;
		yourself
]

{ #category : #'operators-trimming' }
PP2Node >> trimBlanks [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #blank asPParser star
]

{ #category : #'operators-trimming' }
PP2Node >> trimLeft [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trimSpacesLeft
]

{ #category : #'operators-trimming' }
PP2Node >> trimRight [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trimSpacesRight
]

{ #category : #'operators-trimming' }
PP2Node >> trimSpaces [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #space asPParser star
]

{ #category : #'operators-trimming' }
PP2Node >> trimSpacesLeft [
	"Answer a new parser that consumes spaces before the receiving parser."
	
	^ (#space asPParser star, self) ==> #second
]

{ #category : #'operators-trimming' }
PP2Node >> trimSpacesRight [
	"Answer a new parser that consumes spaces after the receiving parser."
	
	^ (self, #space asPParser star) ==> #first
]

{ #category : #optimizations }
PP2Node >> unsetOptimized [
	^ self allNodesDo: [ :node | node propertyAt: #optimized put: false ]
]

{ #category : #'optimizations - warnings' }
PP2Node >> warnActionInToken [
	"
		(($a asParser2, $b asParser2) ==> [ :e | e second ] token) optimize
	"
	| warning |
	warning := self asString, ' is in token, there shouldnt be actions in tokens. but it might be necessary, I admit :('.
	
	self addWarning: warning.

]

{ #category : #'optimizations - warnings' }
PP2Node >> warnDifferentTrimmer [
	"give user feedback about this issues"
]

{ #category : #'optimizations - warnings' }
PP2Node >> warnShouldNotBeShared [
	"give user feedback about this issues"
	| warning |
	warning := self asString, ' should not be shared, because it cannot be optimized'.	
	self addWarning: warning.

]

{ #category : #'optimizations - warnings' }
PP2Node >> warnings [
	^ self propertyAt: #warnings ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #accessing }
PP2Node >> withoutDebugStrategy [
	^ strategy withoutDebugStrategy
]

{ #category : #operators }
PP2Node >> wrapped [
	^ PP2DelegateNode on: self
]

{ #category : #operators }
PP2Node >> | aParser [
	"Answer a new parser that either parses the receiver or aParser. Fail if both pass or fail (exclusive choice, unordered choice)."

	^ (self not , aParser) / (aParser not , self) ==> #second
]
