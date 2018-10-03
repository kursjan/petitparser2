Class {
	#name : #PP2HtmlHeaderGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #accessing }
PP2HtmlHeaderGrammarTest >> parserClass [
	^ PP2HtmlHeaderGrammar 
]

{ #category : #tests }
PP2HtmlHeaderGrammarTest >> testHeader [
	self parse: '<head>foobar</head>' rule: #header to: 'foobar'
]

{ #category : #tests }
PP2HtmlHeaderGrammarTest >> testHtmlFragment [
	self parse: '<html><head>foobar</head></html>' rule: #htmlFragment to: 'foobar' end: 25
]

{ #category : #tests }
PP2HtmlHeaderGrammarTest >> testHtmlFragmentNoHeader [
	self fail: '<html><body>foobar</body></html>' rule: #htmlFragment
]

{ #category : #'tests-integration' }
PP2HtmlHeaderGrammarTest >> testZincClientIntegration [
	| byteStream stream |
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.

	result := PP2HtmlHeaderGrammar new parse: stream.
	
	self assert: stream atEnd not.
	self assert: (result includesSubstring: 'Pharo')
]
