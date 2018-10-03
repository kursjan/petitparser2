"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParserGUI,
	#superclass : #PackageManifest,
	#category : 'PetitParser2-GUI'
}

{ #category : #'code-critics' }
ManifestPetitParserGUI class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2RecordingContext #strategy #false)) #'2016-11-20T12:25:09.424363+01:00') #(#(#RGMethodDefinition #(#PP2RecordingContext #node #false)) #'2016-11-20T12:25:39.65443+01:00') )
]

{ #category : #'code-critics' }
ManifestPetitParserGUI class >> ruleRBSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2RecordingContext #setAsStartState #false)) #'2016-11-20T12:25:18.876407+01:00') )
]
