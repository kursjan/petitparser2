"
Validator compares the output of the parser with a reference implementation.

It is used to validte optimization features of PP2.
"
Class {
	#name : #PP2Validator,
	#superclass : #Object,
	#instVars : [
		'report',
		'silent'
	],
	#category : 'PetitParser2-Validation-Core'
}

{ #category : #validation }
PP2Validator >> actualForSource: source [
	self subclassResponsibility
]

{ #category : #reporting }
PP2Validator >> compactReportTo: filename [
	| file |
	file := FileStream forceNewFileNamed: filename.
	self report printCompactOnStream: file.
	file close.
]

{ #category : #validation }
PP2Validator >> expectedForSource: source [
	self subclassResponsibility
]

{ #category : #utilities }
PP2Validator >> fileContents: filename [
	^ (FileStream fileNamed: filename) contents
]

{ #category : #initialization }
PP2Validator >> initialize [
	super initialize.
	
	silent := true
]

{ #category : #accessing }
PP2Validator >> name [
	self subclassResponsibility
]

{ #category : #accessing }
PP2Validator >> report [
	^ report
]

{ #category : #utilities }
PP2Validator >> showDiffForSource: source [
	| actual expected |
	actual := self actualForSource: source.
	expected := self expectedForSource: source.
	
	(DiffMorph 
		from: (actual joinUsing: Character lf) 
		to: (expected joinUsing: Character lf)) openInWindow
]

{ #category : #accessing }
PP2Validator >> silent [
	^ silent
]

{ #category : #accessing }
PP2Validator >> silent: aBoolean [
	^ silent := aBoolean
]

{ #category : #accessing }
PP2Validator >> sources [
	self subclassResponsibility
]

{ #category : #accessing }
PP2Validator >> timeout [
	^ 30 asDuration
]

{ #category : #transcript }
PP2Validator >> transcriptCr [
	self silent ifTrue: [ ^ self ].
	
	Transcript cr.
]

{ #category : #transcript }
PP2Validator >> transcriptShow: text [
	self silent ifTrue: [ ^ self ].
	
	Transcript show: text.
]

{ #category : #validation }
PP2Validator >> validate [
	[ self validateBlocking ] fork
]

{ #category : #validation }
PP2Validator >> validateBlocking [
	| time sources |

	self transcriptCr; transcriptShow: 'Validating: ', self name.
		
	report := PP2ValidatorReport new.
	report parserName: self name.
	
	time := [
		sources := self sources.
		report sources: sources.
		
		self transcriptCr.
		sources withIndexDo: [ :source :index | 
		[ 
			((index % ((sources size // 50) max: 1)) = 0) ifTrue: [ self transcriptShow: '-' ].
			(self validateSource: source report: report).
		] on: Error do: [ :err | 
			report error: err forSource: source.
			silent ifFalse: [ err signal ]
		]
	]] timeToRun.

	report time: time.
	self transcriptShow: report asString
]

{ #category : #validation }
PP2Validator >> validateSource: source report: aPPValidatorReport [
	| expected actual |
	[
		[ expected := self expectedForSource: source. ] on: PP2SkipValidation do: [ ^ self ].
	] on: NotFound do: [ 
		"Dunno why, but expected source not found just skip..."
		^ self
	].
	
	[
		[  actual := self actualForSource: source. ] on: PP2SkipValidation do: [  ^ self ]
	] valueWithin: self timeout onTimeout: [ 
		actual := #().
		report timeout: source.
	].

	aPPValidatorReport actual: actual vs: expected for: source
	

]
