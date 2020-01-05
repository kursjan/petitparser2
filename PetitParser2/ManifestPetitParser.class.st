"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParser,
	#superclass : #PackageManifest,
	#category : #'PetitParser2-Manifest'
}

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2RecordingContext #node #false)) #'2019-12-21T17:44:58.79148+01:00') #(#(#RGMethodDefinition #(#PP2RecordingContext #strategy #false)) #'2019-12-21T17:45:12.398818+01:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2Node #optimize #false)) #'2020-01-05T15:57:22.927177+01:00') )
]
