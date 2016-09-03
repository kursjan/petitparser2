events
actual: actual vs: expected for: source
	| entry |

	(actual isPetit2Failure and: [ expected isPetit2Failure not ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry actual: #().
		entry expected: expected.
		entries at: source put: entry.
		
		^ self failure: actual forSource: source.
	].

	(actual isPetit2Failure and: [ expected isPetit2Failure ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry expected: #().
		entry actual: #().
		entries at: source put: entry.
		
		^ self
	].

	(actual isPetit2Failure not and: [ expected isPetit2Failure ]) ifTrue: [ 
		entry := PP2ValidatorReportEntry new.
		entry expected: #().
		entry actual: actual.
		entries at: source put: entry.
		
		^ self
	].

	"
		both are ok
	"
	entry := PP2ValidatorReportEntry new.
	entry expected: expected.
	entry actual: actual.
	entries at: source put: entry