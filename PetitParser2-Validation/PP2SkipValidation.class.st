"
If there is something wrong with the validation, throw this error. The PPValidator will skip validation for this source.
"
Class {
	#name : #PP2SkipValidation,
	#superclass : #Notification,
	#instVars : [
		'reason'
	],
	#category : 'PetitParser2-Validation-Core'
}

{ #category : #'instance creation' }
PP2SkipValidation class >> reason: aString [
	^ self new
		reason: aString;
		yourself
]

{ #category : #accessing }
PP2SkipValidation >> reason [
	^ reason
]

{ #category : #accessing }
PP2SkipValidation >> reason: aString [
	reason := aString
]
