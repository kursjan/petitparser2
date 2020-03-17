"
An abstract class representing a result of context change analysis.
"
Class {
	#name : #PP2CcResult,
	#superclass : #Object,
	#classInstVars : [
		'Instance'
	],
	#category : 'PetitParser2-Analysis'
}

{ #category : #'instance creation' }
PP2CcResult class >> change [
	^ PP2CcChange instance
]

{ #category : #'instance creation' }
PP2CcResult class >> instance [
	Instance isNil ifTrue: [  
		Instance := self new
	].

	^ Instance
]

{ #category : #'instance creation' }
PP2CcResult class >> noChange [
	^ PP2CcDoesNotChange instance
]

{ #category : #'instance creation' }
PP2CcResult class >> pop [
	^ PP2CcPop instance
]

{ #category : #'instance creation' }
PP2CcResult class >> push [
	^ PP2CcPush instance
]

{ #category : #testing }
PP2CcResult >> isContextChange [
	self subclassResponsibility 
]

{ #category : #testing }
PP2CcResult >> isContextPop [
	^ false
]

{ #category : #testing }
PP2CcResult >> isContextPush [
	^ false
]

{ #category : #testing }
PP2CcResult >> isNotContextChange [
	^ self isContextChange not
]

{ #category : #testing }
PP2CcResult >> isUnknownChange [
	^ false
]
