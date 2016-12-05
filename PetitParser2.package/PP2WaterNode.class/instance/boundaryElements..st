accessing
boundaryElements: collectionOrElement
	| elements |
	elements := collectionOrElement isCollection ifTrue: [ collectionOrElement ] ifFalse: [ OrderedCollection with: collectionOrElement ].
	"
		#rejectXYZ are optimizations. 
		
		This is kind of design issue, but I need to make seas at least a bit useable
		in in non-optimized mode as well.
	"
	elements := elements collect: [:e | self rejectSeas: e ].
	elements := elements collect: [:e | self rejectPossessive: e ].
	elements := elements collect: [:e | self nonEpsilon: e ].
	elements := elements collect: #and.
		
	boundary := (PP2ChoiceNode withAll: elements).
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]