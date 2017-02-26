function up()
{
	var email = document.my.email.value;
	atpos = email.indexOf("@");
	dotpos= email.lastIndexOf(".");
	if (document.my.cat.value == "cat")
	{
		alert("Please select a category");
		document.my.cat.focus();
		return false;
	}
	if(document.my.user_name.value.trim() == "" || document.my.user_name.value == null)
	{
		alert("please enter a username");
		document.my.user_name.focus();
		return false;
	}
	if(document.my.pass.value.trim() == "" || document.my.pass.value == null)
	{
		alert("please enter a password");
		document.my.pass.focus();
		return false;
	}
	if(!(document.my.pass.value == (document.my.pass2.value)))
	{
		alert("Your pass word didn't match");
		document.my.pass2.focus();
		return false;
	}
	if(atpos<1 || (dotpos-atpos)<2)
	{
		alert("please enter a valid email");
		document.my.email.focus();
		return false;
	}
	if (document.my.sex.value == null)
	{
		alert("please select a gender");
		document.my.pass2.focus();
		return false;
	}
	else
		return( true );
}