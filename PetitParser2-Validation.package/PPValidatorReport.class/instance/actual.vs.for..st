events
actual: actual vs: expected for: source
	| entry |

	(actual isPetitFailure and: [ expected isPetitFailure not ]) ifTrue: [ 
		entry := PPValidatorReportEntry new.
		entry actual: #().
		entry expected: expected.
		entries at: source put: entry.
		
		^ self failure: actual forSource: source.
	].

	(actual isPetitFailure and: [ expected isPetitFailure ]) ifTrue: [ 
		entry := PPValidatorReportEntry new.
		entry expected: #().
		entry actual: #().
		entries at: source put: entry.
		
		^ self
	].

	(actual isPetitFailure not and: [ expected isPetitFailure ]) ifTrue: [ 
		entry := PPValidatorReportEntry new.
		entry expected: #().
		entry actual: actual.
		entries at: source put: entry.
		
		^ self
	].

	"
		both are ok
	"
	entry := PPValidatorReportEntry new.
	entry expected: expected.
	entry actual: actual.
	entries at: source put: entry