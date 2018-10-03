Class {
	#name : #PP2CsNode,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'stackId'
	],
	#category : 'PetitParser2-Context'
}

{ #category : #visiting }
PP2CsNode >> accept: visitor [
	self subclassResponsibility 
]

{ #category : #initialization }
PP2CsNode >> resetStrategy [
	self subclassResponsibility 
]

{ #category : #accessing }
PP2CsNode >> stackId [
	^ stackId ifNil: [ #defaultStack ] ifNotNil: [ stackId ]
]

{ #category : #accessing }
PP2CsNode >> stackId: id [
	^ stackId := id
]
