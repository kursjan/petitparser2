Class {
	#name : #PP2CreateParseNode,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'nodeName',
		'nodeClass'
	],
	#category : 'PetitParser2-RewriteEngine-Nodes'
}

{ #category : #'as yet unclassified' }
PP2CreateParseNode class >> on: aNode [
	^ (super on: aNode)
		nodeName: aNode name;
		yourself
]

{ #category : #visiting }
PP2CreateParseNode >> accept: visitor [
	^ visitor visitCreateParseNode: self
]

{ #category : #initialization }
PP2CreateParseNode >> initialize [
	super initialize.
	
	nodeClass := PP2ParseNode
]

{ #category : #accessing }
PP2CreateParseNode >> nodeClass [
	^ nodeClass
]

{ #category : #accessing }
PP2CreateParseNode >> nodeClass: aClass [
	nodeClass := aClass
]

{ #category : #accessing }
PP2CreateParseNode >> nodeName [
	^ nodeName
]

{ #category : #accessing }
PP2CreateParseNode >> nodeName: anObject [
	nodeName := anObject
]

{ #category : #initialization }
PP2CreateParseNode >> resetStrategy [
	strategy := PP2CreateParseNodeStrategy on: self
]
