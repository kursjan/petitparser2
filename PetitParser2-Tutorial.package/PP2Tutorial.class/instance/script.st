accessing
script
| js jsSea document jsString any |
any := #any asPParser.
jsString := $' asPParser, any starLazy, $' asPParser.
js := '<script>' asPParser, ((jsString / any) starLazy) flatten, '</script>' asPParser
	 ==> #second.

jsSea := js sea ==> #second.
document := jsSea star.
^ document