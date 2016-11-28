example
example
	| byteStream stream |
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.

	^ PP2HtmlHeaderGrammar new optimize parse: stream