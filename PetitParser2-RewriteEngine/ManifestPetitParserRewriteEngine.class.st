"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPetitParserRewriteEngine,
	#superclass : #PackageManifest,
	#category : 'PetitParser2-RewriteEngine'
}

{ #category : #'code-critics' }
ManifestPetitParserRewriteEngine class >> ruleGRGuradGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2CreateParseNode #printOn: #false)) #'2017-08-14T21:20:52.094107+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParserRewriteEngine class >> ruleOverridesDeprecatedMethodRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2PatternParseNode #name #false)) #'2017-08-08T08:03:54.770654+02:00') #(#(#RGMethodDefinition #(#PP2PatternToken #name #false)) #'2017-08-08T08:04:00.663846+02:00') )
]

{ #category : #'code-critics' }
ManifestPetitParserRewriteEngine class >> ruleRBGuardingClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PP2CreateParseNode #printOn: #false)) #'2017-08-14T21:20:56.294073+02:00') )
]
