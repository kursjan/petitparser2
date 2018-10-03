"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParser,
	#superclass : #PackageManifest,
	#category : 'PetitParser2'
}

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'PP2CompositeNode class' #newStartingAt: #true)) #'2016-10-24T14:28:46.455507+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBEquivalentSuperclassMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2InMemoryContext #position #false)) #'2016-10-07T18:25:00.082204+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBIfTrueReturnsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2RecognizerContext #= #false)) #'2016-09-13T08:14:53.299834+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2InMemoryContext #position #false)) #'2016-10-07T18:25:03.188553+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBTemporaryVariableCapitalizationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PP2AdaptableGrammar)) #'2016-09-03T17:12:25.309317+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParser class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PP2SeaOptimizationVisitor)) #'2016-10-31T11:33:08.539255+01:00') #(#(#RGClassDefinition #(#PP2PushMemoization)) #'2016-11-06T14:33:18.377189+01:00') #(#(#RGClassDefinition #(#PP2PopMemoization)) #'2016-11-06T14:33:41.427177+01:00') )
]
