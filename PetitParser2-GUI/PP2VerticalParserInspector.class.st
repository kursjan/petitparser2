Class {
	#name : #PP2VerticalParserInspector,
	#superclass : #PP2ParserInspector,
	#category : 'PetitParser2-GUI-Browser'
}

{ #category : #'private building' }
PP2VerticalParserInspector >> browserStructureFor: browser [
	browser
		row: #sample;
		row: #inspectors
]
