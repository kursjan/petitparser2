"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParserTests,
	#superclass : #PackageManifest,
	#category : 'PetitParser2-Tests'
}

{ #category : #'code-critics' }
ManifestPetitParserTests class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PP2BufferStreamTest)) #'2016-04-02T11:47:21.362841+02:00') #(#(#RGClassDefinition #(#PP2DirectParseTest)) #'2016-04-03T14:06:27.898033+02:00') )
]
