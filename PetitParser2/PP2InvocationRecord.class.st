Class {
	#name : #PP2InvocationRecord,
	#superclass : #PP2EventRecord,
	#instVars : [
		'start',
		'stop',
		'debugResult'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #accessing }
PP2InvocationRecord >> debugResult [
	^ debugResult
]

{ #category : #accessing }
PP2InvocationRecord >> debugResult: anObject [
	debugResult := anObject
]

{ #category : #testing }
PP2InvocationRecord >> isInvocation [
	^ true
]

{ #category : #accessing }
PP2InvocationRecord >> start [
	^ start
]

{ #category : #accessing }
PP2InvocationRecord >> start: anObject [
	start := anObject
]

{ #category : #accessing }
PP2InvocationRecord >> stop [
	^ stop
]

{ #category : #accessing }
PP2InvocationRecord >> stop: anObject [
	stop := anObject
]
