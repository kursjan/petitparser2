validation
validateBlocking
	| time sources |

	Transcript cr; show: 'Validating: ', self name.
	report := PPValidatorReport new.
	report parserName: self name.
	
	time := [
		sources := self sources.
		report sources: sources.
		
		Transcript cr.
		sources withIndexDo: [ :source :index | 
		[ 
			((index % ((sources size // 50) max: 1)) = 0) ifTrue: [ Transcript show: '-' ].
			(self validateSource: source report: report).
		] on: Error do: [ :err | 
			report error: err forSource: source.
			silent ifFalse: [ err signal ]
		]
	]] timeToRun.

	report time: time.
	report printOnStream: Transcript.
	
"
	Transcript cr; show: 'Validated in: ', time asMilliseconds asString.
	Transcript cr; show: 'sucesses: ', successes asString.
	Transcript cr; show: 'failures: ', failures size asString.
	Transcript cr; show: 'timeouts: ', timeouts size asString.
	Transcript cr; show: 'errors: ', errors size asString.	
"