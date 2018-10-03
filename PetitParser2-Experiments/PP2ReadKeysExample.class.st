"
Parses a keyboard input stream. The parser is very simple: it detect occurences of 'petit' in the input stream and shows a notifiaction. Start with:

PP2ReadKeysExample example

Note that we do not store stream of keyboard characters and do not re-parser on every keystroke. We just read stream and proceed as the characters come.
"
Class {
	#name : #PP2ReadKeysExample,
	#superclass : #StandardWindow,
	#instVars : [
		'textArea',
		'keyMorph',
		'stream'
	],
	#category : 'PetitParser2-Experiments-Streaming'
}

{ #category : #'as yet unclassified' }
PP2ReadKeysExample class >> example [
	<example>
	"Start typing into the window. You will see that the parser is happy when you write 'petit' :) "
	self new open
]

{ #category : #'morphic ui' }
PP2ReadKeysExample >> buildWindow [
	self addMorph: textArea fullFrame: (LayoutFrame new topFraction: 0.2).
					
	self addMorph: keyMorph fullFrame: LayoutFrame identity.
]

{ #category : #'open/close' }
PP2ReadKeysExample >> close [
	keyMorph close.
	super close
		
]

{ #category : #accessing }
PP2ReadKeysExample >> contents [
	^ stream contents
]

{ #category : #initialize }
PP2ReadKeysExample >> initialize [
	super initialize.
	
	stream := String new writeStream.

	keyMorph := PP2ReadKeysMorph new.
	textArea := self textMorph.
	keyMorph outputStream: self.
	
	self buildWindow.
]

{ #category : #'stream mimicry' }
PP2ReadKeysExample >> nextPutAll: aString [
	stream nextPutAll: aString.
	self changed: #contents.
]

{ #category : #'open/close' }
PP2ReadKeysExample >> open [
	super open.
	keyMorph takeKeyboardFocus.
	keyMorph startParsing.
	
]

{ #category : #'morphic ui' }
PP2ReadKeysExample >> textMorph [
	| textMorph |
	textMorph := RubPluggableTextMorph new
		beWrapped;
		getTextSelector: #contents;
		on: self;
		yourself.
	textMorph hasUnacceptedEdits: false.
	self nextPutAll: 'Keep focus on the blue area and start typing.
		- as you type, parsing is happening (the input is NOT reparsed with every key stroke!)
		- whenever the "petit" sequence is recognized, the info morph appears
'.
	^ textMorph
]
