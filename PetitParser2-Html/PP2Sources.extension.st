Extension { #name : #PP2Sources }

{ #category : #'*PetitParser2-Html' }
PP2Sources >> htmlAllUrl [
	^ 'html-src.zip'
]

{ #category : #'*PetitParser2-Html' }
PP2Sources >> htmlSample [
	^ '<!DOCTYPE html>
<!-- saved from url=(0026)https://www.wikipedia.org/ -->
<html lang="mul" dir="ltr" class="js-enabled">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Wikipedia</title>
	<meta name="description" content="Wikipedia is a free online encyclopedia, created and edited by volunteers around the world and hosted by the Wikimedia Foundation.">
	<!--[if gt IE 7]-->
	<script>document.documentElement.className = document.documentElement.className.replace( /(^|\s)no-js(\s|$)/, "$1js-enabled$2" );</script>
	<!--[endif]-->
</head>
<body id="www-wikipedia-org">
	<h1 class="central-textlogo" style="font-variant: small-caps" alt="WikipediA" title="Wikipedia">
		<img src="./Wikipedia_files/Wikipedia_wordmark.png" srcset="portal/wikipedia.org/assets/img/Wikipedia_wordmark@1.5x.png 1.5x" width="174" height="30" alt="WikipediA" title="Wikipedia">
		<strong id="js-localized-slogan" class="localized-slogan" style="visibility: visible;">The Free Encyclopedia</strong>
	</h1>
	<div id="mydiv">
		Hi there!
	</div>
	<script>alert("All scripts ends with: ''</script>''...")</script>
	<!-- <p>obsolete conentent</p> -->
</body>
</html>'
]

{ #category : #'*PetitParser2-Html' }
PP2Sources >> htmlSourcesAll [
	^ self cachedValue: #htmlSourcesAll ifAbsentPut: [ 
		(self downloadUI: self htmlAllUrl) allFiles collect: [ :f | f contents ]
	]
]
