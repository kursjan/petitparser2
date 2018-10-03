"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParserSmalltalkTests,
	#superclass : #PackageManifest,
	#category : 'PetitParser2-Smalltalk-Tests'
}

{ #category : #'code-critics' }
ManifestPetitParserSmalltalkTests class >> ruleRBMethodHasNoTimeStampRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PP2SmalltalkParserTests_Optimized)) #'2016-09-06T15:00:54.597054+02:00') )
]
