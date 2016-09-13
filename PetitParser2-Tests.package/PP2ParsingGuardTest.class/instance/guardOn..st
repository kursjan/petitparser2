as yet unclassified
guardOn: parser
	| guard |
	guard := PP2ParsingGuard on: parser.
	guard classification: (Array new: 255 withAll: true).
	guard retval: (PP2Failure message: 'ooups').
	^ guard
