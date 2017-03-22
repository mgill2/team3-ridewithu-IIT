function formhash(form, password) {
	//this function creates hidden element that will be used to send password across the server
	//rather than plain text
	var p = document.createElement("input");

	form.appendChild(p);
	p.name = "p";
	p.type = "hidden";
	p.value = hex_sha512(password.value);

	//now making sure that password wont sent as plaintext
	password.value = "";

	form.submit();
}