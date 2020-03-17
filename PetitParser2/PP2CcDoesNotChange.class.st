Class {
	#name : #PP2CcDoesNotChange,
	#superclass : #PP2CcResult,
	#category : 'PetitParser2-Analysis'
}

{ #category : #'as yet unclassified' }
PP2CcDoesNotChange >> isContextChange [
	^ false
]

{ #category : #'as yet unclassified' }
PP2CcDoesNotChange >> isNotContextChange [
	^ true
]
