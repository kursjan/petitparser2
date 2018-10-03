Extension { #name : #TPP2Context }

{ #category : #'*PetitParser2-GUI' }
TPP2Context >> allowsDebug [
	^ self stream isBuffered not
]

{ #category : #'*PetitParser2-GUI' }
TPP2Context >> gtGlobals: composite [
	<gtInspectorPresentationOrder: 50>
	
	composite table
		title: 'Globals';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context globals ifNil: [ Dictionary new ]) associations ]


]

{ #category : #'*PetitParser2-GUI' }
TPP2Context >> gtProperties: composite [
	<gtInspectorPresentationOrder: 50>
	
	composite table
		title: 'Properties';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context properties ifNil: [ Dictionary new ]) associations ]


]

{ #category : #'*PetitParser2-GUI' }
TPP2Context >> gtResultIn: composite [
	<gtInspectorPresentationOrder: 20>
	
	composite text
		title: 'Result';
		display: [ :ctx |  ctx returnValue ];
		act: [ :p :ctx | ctx returnValue inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		act: [ :p :ctx | ctx returnValue explore ] icon: GLMUIThemeExtraIcons glamorousSearch entitled: 'Explore'.


]

{ #category : #'*PetitParser2-GUI' }
TPP2Context >> gtText: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | 
			| printStream |
			printStream := WriteStream on: String new.
			context stream asPetit2Stream printOn: printStream position: self position.
			printStream contents
	]

]
