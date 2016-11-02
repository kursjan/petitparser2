tests - document
testDocument3
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<meta content="origin" name="referrer">

	<body>
		<div>foobar</div>
		<div>bar<span>baz</span></div>
	</body>
</html>'.
	
	self parse: input rule: #document