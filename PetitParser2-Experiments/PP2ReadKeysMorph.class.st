"
Open me, try typing and check the transcript. I will be happy when you enter 'petit'.

This is a demonstration of PP2AsyncStream and capabilities of PP2 to work on streams that are not completely in memory.
"
Class {
	#name : #PP2ReadKeysMorph,
	#superclass : #Morph,
	#instVars : [
		'keyStream',
		'parser',
		'outputStream'
	],
	#category : 'PetitParser2-Experiments-Streaming'
}

{ #category : #initialization }
PP2ReadKeysMorph >> close [
	keyStream close
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> handlesKeyboard: evt [
	^ true
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> handlesMouseDown: evt [
	^ true
]

{ #category : #initialization }
PP2ReadKeysMorph >> initialize [
	super initialize.
	
	keyStream := PP2AsyncStream new.
	outputStream := Transcript.
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> keyStroke: anEvent [
	outputStream nextPutAll: 'event: ', anEvent asString, String cr.
	
	keyStream queueChar: anEvent keyCharacter.
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> mouseDown: evt [
 	self takeKeyboardFocus
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> openInWorld [
	super openInWorld.
	self startParsing.
]

{ #category : #'as yet unclassified' }
PP2ReadKeysMorph >> outputStream: aStream [
	outputStream := aStream
]

{ #category : #initialize }
PP2ReadKeysMorph >> startParsing [
	parser := 
		(('petit' asPParser ==> [ :literal | 
				GrowlMorph openWithLabel: '"petit" detected' contents: '' ]) / 
		  #any asPParser
		) star. 
	
	[ 	
		Transcript crShow: 'parsing'. 
		parser parse: keyStream. 
		Transcript crShow: 'parsing finished' 
	] fork.
]

{ #category : #'event handling' }
PP2ReadKeysMorph >> takesKeyboardFocus [
	^ true
]
