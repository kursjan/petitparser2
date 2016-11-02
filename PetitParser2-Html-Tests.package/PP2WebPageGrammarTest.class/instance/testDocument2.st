tests - document
testDocument2
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<meta content="origin" name="referrer">

	<body>
		<script type="text/javascript">alert("hello world")</script>
	</body>
</html>'.
	
	self parse: input rule: #document