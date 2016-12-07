accessing
script
| js jsSea document jsString any |
jsString := $' asPParser, #any asPParser starLazy, $' asPParser.
any := #any asPParser.
js := '<script>' asPParser, ((jsString / any) starLazy) flatten, '</script>' asPParser
	 ==> #second.

jsSea := js sea ==> #second.
document := jsSea star.
^ document