Class {
	#name : #PP2AddParserRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'superclass',
		'name',
		'cateogry'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2AddParserRefactoring class >> name: aString category: aSymbol [
	^ self name: aString category: aSymbol superclass: PP2CompositeNode
]

{ #category : #'instance creation' }
PP2AddParserRefactoring class >> name: aString category: aSymbol superclass: aClass [
	^ self new
		setName: aString;
		setCategory: aSymbol;
		setSuperclass: aClass;
		yourself
]

{ #category : #preconditions }
PP2AddParserRefactoring >> preconditions [
	^ self checkCompositeParser2: superclass
]

{ #category : #initialization }
PP2AddParserRefactoring >> setCategory: aSymbol [
	cateogry := aSymbol asSymbol
]

{ #category : #initialization }
PP2AddParserRefactoring >> setName: aString [
	name := aString
]

{ #category : #initialization }
PP2AddParserRefactoring >> setSuperclass: aClass [
	superclass := self classObjectFor: aClass
]

{ #category : #accessing }
PP2AddParserRefactoring >> startProductionSource [
	^ 'start
	^ self shouldBeImplemented'
]

{ #category : #transforming }
PP2AddParserRefactoring >> transform [
	self performComponentRefactoring: (RBAddClassRefactoring
		model: self model
		addClass: name
		superclass: superclass
		subclasses: #()
		category: cateogry).
	(self classObjectFor: name)
		compile: self startProductionSource
		classified: #(accessing)
]
