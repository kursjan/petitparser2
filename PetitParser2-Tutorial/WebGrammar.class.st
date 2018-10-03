Class {
	#name : #WebGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'document',
		'javascript',
		'elOpen',
		'elContent',
		'elClose',
		'elementName',
		'element',
		'text',
		'jsOpen',
		'jsContent',
		'jsClose',
		'jsString',
		'structuredDocument',
		'comment',
		'any'
	],
	#category : 'PetitParser2-Tutorial'
}

{ #category : #various }
WebGrammar >> any [
	^ #any asPParser
]

{ #category : #various }
WebGrammar >> comment [
	^ '<!--' asPParser, any starLazy, '-->' asPParser
]

{ #category : #various }
WebGrammar >> document [
	^ (javascript sea ==> #second) star
]

{ #category : #element }
WebGrammar >> elClose [
	^ '</' asPParser, elementName match pop, $> asPParser

]

{ #category : #element }
WebGrammar >> elContent [
	^ (javascript / element / text nonEpsilon) star
]

{ #category : #element }
WebGrammar >> elOpen [
	^ $< asPParser, elementName push, any starLazy, $> asPParser ==> #second
]

{ #category : #element }
WebGrammar >> element [
	^ (elOpen, elContent, elClose)
"		memoize;"
		yourself

]

{ #category : #element }
WebGrammar >> elementName [
	^ #word asPParser plus flatten

]

{ #category : #javascript }
WebGrammar >> javascript [
	^ jsOpen, jsContent, jsClose ==> #second
]

{ #category : #javascript }
WebGrammar >> jsClose [
	^ '</script>' asPParser
]

{ #category : #javascript }
WebGrammar >> jsContent [
	^ (jsString / any) starLazy
]

{ #category : #javascript }
WebGrammar >> jsOpen [
	^ '<script>' asPParser
]

{ #category : #javascript }
WebGrammar >> jsString [
	^ $' asPParser, any starLazy, $' asPParser
]

{ #category : #various }
WebGrammar >> start [
	^ structuredDocument 
]

{ #category : #various }
WebGrammar >> structuredDocument [
	^ element sea
]

{ #category : #various }
WebGrammar >> text [
	^ (comment / any) starLazy

]
