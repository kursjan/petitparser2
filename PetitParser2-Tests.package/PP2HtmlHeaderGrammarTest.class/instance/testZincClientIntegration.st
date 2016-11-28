tests-integration
testZincClientIntegration
	| byteStream stream |
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.

	result := PP2HtmlHeaderGrammar new parse: stream.
	
	self assert: stream atEnd not.
	self assert: (result includesSubstring: 'Pharo')