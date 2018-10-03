Class {
	#name : #PP2TextHighlighter,
	#superclass : #Object,
	#instVars : [
		'parser',
		'attributeMapper'
	],
	#category : 'PetitParser2-GUI-Highlighting'
}

{ #category : #public }
PP2TextHighlighter >> addAttribute: aTextAttribute for: anElementString [ 
	| attributes |
	attributes := self attributeMapper 
		at: anElementString asSymbol 
		ifAbsentPut: [ OrderedCollection new ].
	attributes add: aTextAttribute
]

{ #category : #accessing }
PP2TextHighlighter >> attributeMapper [ 
	"returns a dictionary with keys corresponding to parser names and 
	values corresponding to a collection of TextAttributes"
	^ attributeMapper
]

{ #category : #accessing }
PP2TextHighlighter >> attributeMapper: aDictionary [ 
	attributeMapper := aDictionary
]

{ #category : #public }
PP2TextHighlighter >> bold: anElementString [
	self addAttribute: TextEmphasis bold for: anElementString
]

{ #category : #public }
PP2TextHighlighter >> color: anElementString with: aColor [
	self addAttribute: (TextColor new color: aColor) for: anElementString
]

{ #category : #public }
PP2TextHighlighter >> highlight: aString [
	| text highlighter |
	text := aString asText.
	highlighter := parser transform: [ :p |
		attributeMapper at: p name
			ifPresent: [ :attributes | 
				p token ==> [ :token | 
					attributes do: [:each |
						text 
							addAttribute: each 
							from: token start 
							to: token stop ].
					token ] ]
			ifAbsent: [ p ] ].
	highlighter optimize parse: text.
	^ text
]

{ #category : #initialization }
PP2TextHighlighter >> initialize [
	parser := #any asParser.
	attributeMapper := Dictionary new
]

{ #category : #accessing }
PP2TextHighlighter >> parser [
	^ parser
]

{ #category : #accessing }
PP2TextHighlighter >> parser: aParser [
	parser := aParser
]
