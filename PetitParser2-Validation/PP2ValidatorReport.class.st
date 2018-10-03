Class {
	#name : #PP2ValidatorReport,
	#superclass : #Object,
	#instVars : [
		'time',
		'sources',
		'failures',
		'timeouts',
		'errors',
		'entries',
		'parserName'
	],
	#category : 'PetitParser2-Validation-Core'
}

{ #category : #events }
PP2ValidatorReport >> actual: actual vs: expected for: source [
	| entry |

	(actual isPetit2Failure and: [ expected isPetit2Failure not ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry actual: #().
		entry expected: expected.
		entries at: source put: entry.
		
		^ self failure: actual forSource: source.
	].

	(actual isPetit2Failure and: [ expected isPetit2Failure ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry expected: #().
		entry actual: #().
		entries at: source put: entry.
		
		^ self
	].

	(actual isPetit2Failure not and: [ expected isPetit2Failure ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry expected: #().
		entry actual: actual.
		entries at: source put: entry.
		
		^ self
	].

	"
		both are ok
	"
	entry := PP2ValidatorReportEntry new.
	entry expected: expected.
	entry actual: actual.
	entries at: source put: entry
]

{ #category : #converting }
PP2ValidatorReport >> asString [
	| stream |
	stream := '' writeStream.
	self printOnStream: stream.
	^ stream contents
]

{ #category : #events }
PP2ValidatorReport >> error: error forSource: source [
	errors add: (error -> source).
]

{ #category : #accessing }
PP2ValidatorReport >> errors [
	^ errors
]

{ #category : #events }
PP2ValidatorReport >> failure: failure forSource: source [
	failures add: (failure -> source)
]

{ #category : #stats }
PP2ValidatorReport >> failureRate [
	^ ((timeouts size + failures size) / sources size) asFloat
]

{ #category : #accessing }
PP2ValidatorReport >> failures [
	^ failures
]

{ #category : #initialization }
PP2ValidatorReport >> initialize [
	entries := Dictionary new.
	failures := OrderedCollection new.
	timeouts := OrderedCollection new.
	errors := OrderedCollection new.
]

{ #category : #accessing }
PP2ValidatorReport >> parserName [
	^ parserName
]

{ #category : #accessing }
PP2ValidatorReport >> parserName: aString [
	parserName := aString
]

{ #category : #stats }
PP2ValidatorReport >> precision [
	| truePositives falsePositives |
	truePositives := entries  inject: 0 into: [ :sum :e | sum + e truePositives size ].
	falsePositives := entries values inject: 0 into: [ :sum :e | sum + e falsePositives size ].
	
	^ truePositives / (truePositives + falsePositives) asFloat
	
]

{ #category : #printing }
PP2ValidatorReport >> printCompactOnStream: stream [
	stream nextPutAll: self parserName; tab.
	stream nextPutAll: self precision asString; tab.
	stream nextPutAll: self recall asString; tab.
	stream nextPutAll: self failureRate asString; tab.
	stream nextPutAll: self timePerSource asString; tab.
	
	stream nextPutAll: failures size asString; tab.
	stream nextPutAll: timeouts size asString; tab.
	stream nextPutAll: errors size asString; cr.
	stream flush.

]

{ #category : #printing }
PP2ValidatorReport >> printOnStream: stream [
	stream cr; nextPutAll: 'Validated in: ', time asMilliSeconds asString, 'ms on ', sources  size asString, ' files'.
	stream cr; nextPutAll: 'precision: ', (self precision printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'recall: ', (self recall printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'total elements: ', (self total asString).
	stream cr; nextPutAll: 'failure rate: ', (self failureRate printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'average time: ', (self timePerSource printShowingDecimalPlaces: 3), 'ms'.
	
	stream cr; nextPutAll: 'failures: ', failures size asString.
	stream cr; nextPutAll: 'timeouts: ', timeouts size asString.
	stream cr; nextPutAll: 'errors: ', errors size asString.
	stream flush.

]

{ #category : #stats }
PP2ValidatorReport >> recall [
	| truePositives falseNegatives |
	truePositives := entries values inject: 0 into: [ :sum :e | sum + e truePositives size ].
	falseNegatives := entries values inject: 0 into: [ :sum :e | sum + e falseNegatives size ].

	^ truePositives / (truePositives + falseNegatives) asFloat
	
]

{ #category : #accessing }
PP2ValidatorReport >> sources [
	^ sources
]

{ #category : #accessing }
PP2ValidatorReport >> sources: anObject [
	sources := anObject
]

{ #category : #accessing }
PP2ValidatorReport >> time: aTime [
	time := aTime
]

{ #category : #stats }
PP2ValidatorReport >> timePerSource [
	^ (time asMilliSeconds / sources size) asFloat
]

{ #category : #events }
PP2ValidatorReport >> timeout: source [
	timeouts add: source
]

{ #category : #accessing }
PP2ValidatorReport >> timeouts [
	^ timeouts
]

{ #category : #stats }
PP2ValidatorReport >> total [
	^ entries values inject: 0 into: [ :sum :e | sum + e expected size ].	
]
