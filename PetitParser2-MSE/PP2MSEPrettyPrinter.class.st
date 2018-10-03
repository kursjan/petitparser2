Class {
	#name : #PP2MSEPrettyPrinter,
	#superclass : #PP2MSEArrayParser,
	#instVars : [
		'stream'
	],
	#category : 'PetitParser2-MSE'
}

{ #category : #'as yet unclassified' }
PP2MSEPrettyPrinter class >> ignoredNames [ 
	^ super ignoredNames , #(stream)
]

{ #category : #'as yet unclassified' }
PP2MSEPrettyPrinter >> element [ 
	^ super element 
	
	==> [:token | stream cr; nextPutAll: token printString ]
]

{ #category : #'as yet unclassified' }
PP2MSEPrettyPrinter >> elements [
	^ super elements 
	
	==> [:token | stream contents ]
]

{ #category : #'as yet unclassified' }
PP2MSEPrettyPrinter >> initialize [ 
	super initialize.   
	stream := String new writeStream.
]
