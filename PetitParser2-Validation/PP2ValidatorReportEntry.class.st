Class {
	#name : #PP2ValidatorReportEntry,
	#superclass : #Object,
	#instVars : [
		'expected',
		'actual'
	],
	#category : 'PetitParser2-Validation-Core'
}

{ #category : #accessing }
PP2ValidatorReportEntry >> actual [
	^ actual
]

{ #category : #accessing }
PP2ValidatorReportEntry >> actual: anObject [
	actual := anObject
]

{ #category : #accessing }
PP2ValidatorReportEntry >> expected [
	^ expected
]

{ #category : #accessing }
PP2ValidatorReportEntry >> expected: anObject [
	expected := anObject
]

{ #category : #stats }
PP2ValidatorReportEntry >> falseNegatives [
	^ expected select: [ :e | (actual includes: e) not ].

]

{ #category : #stats }
PP2ValidatorReportEntry >> falsePositives [
	^ actual select: [ :e | (expected includes: e) not ].

]

{ #category : #testing }
PP2ValidatorReportEntry >> isPerfect [
	^ self precision = 1 and: [ self recall = 1 ]
]

{ #category : #stats }
PP2ValidatorReportEntry >> precision [
	( actual isEmpty) ifTrue: [ ^ 1 ].
	
	^ self truePositives size / (self truePositives size + self falsePositives size) asFloat
	
]

{ #category : #printing }
PP2ValidatorReportEntry >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: (self precision  printShowingDecimalPlaces: 2).
	aStream nextPutAll: ', '.
	aStream nextPutAll: (self recall  printShowingDecimalPlaces: 2).
	aStream nextPut: $).

]

{ #category : #stats }
PP2ValidatorReportEntry >> recall [
	(expected isEmpty) ifTrue: [ ^ 1 ].
	^ self truePositives size / (self truePositives size + self falseNegatives size) asFloat
]

{ #category : #printing }
PP2ValidatorReportEntry >> showStringDiff [
	(DiffMorph 
		from: (actual joinUsing: Character lf) 
		to: (expected joinUsing: Character lf)) openInWindow
]

{ #category : #stats }
PP2ValidatorReportEntry >> truePositives [
	^ actual select: [ :e | (expected includes: e) ].

]
