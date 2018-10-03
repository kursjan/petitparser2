"
Parser that can extract HTML headers from an html file without downloading the whole file. Try with:

PP2HtmlHeaderGrammar example

The example starts a  ZincClient in streaming mode and utilizes PP2 capabilities to work on streams. It reads the stream up until the end of a header or until start of a body.
"
Class {
	#name : #PP2HtmlHeaderGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'headerStart',
		'bodyStart',
		'header',
		'htmlFragment'
	],
	#category : 'PetitParser2-Examples'
}

{ #category : #example }
PP2HtmlHeaderGrammar class >> example [
	| byteStream stream |
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.

	^ PP2HtmlHeaderGrammar new optimize parse: stream
]

{ #category : #rules }
PP2HtmlHeaderGrammar >> bodyStart [
	^ '<body' asPParser

]

{ #category : #rules }
PP2HtmlHeaderGrammar >> header [
	^ '<head>' asPParser, #any asPParser starLazy, '</head>' asPParser
	
	map: [ :_begin :_content :_end |
		(_content inject: (WriteStream on: '') into: [ :stream :char | stream nextPut: char. stream ]) 			contents
	]

]

{ #category : #rules }
PP2HtmlHeaderGrammar >> headerStart [
	^ '<head' asPParser
]

{ #category : #rules }
PP2HtmlHeaderGrammar >> htmlFragment [
	^ (#any asPParser starLazy: (headerStart / bodyStart)), header ==> #second
]

{ #category : #accessing }
PP2HtmlHeaderGrammar >> start [
	^ htmlFragment
]
