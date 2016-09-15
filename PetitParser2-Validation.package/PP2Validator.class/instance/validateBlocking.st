validation
validateBlocking
	| time sources |

	self transcriptCr; transcriptShow: 'Validating: ', self name.
		
	report := PP2ValidatorReport new.
	report parserName: self name.
	
	time := [
		sources := self sources.
		report sources: sources.
		
		self transcriptCr.
		sources withIndexDo: [ :source :index | 
		[ 
			((index % ((sources size // 50) max: 1)) = 0) ifTrue: [ self transcriptShow: '-' ].
			(self validateSource: source report: report).
		] on: Error do: [ :err | 
			report error: err forSource: source.
			silent ifFalse: [ err signal ]
		]
	]] timeToRun.

	report time: time.
	self transcriptShow: report asString