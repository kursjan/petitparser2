accessing
scriptWithoutString
	| source js jsSea document |
source := PP2Sources current htmlSample.
js := '<script>' asPParser, #any asPParser starLazy flatten, '</script>' asPParser
	==> #second.
jsSea := js sea ==> #second.
document := jsSea star.
^ document