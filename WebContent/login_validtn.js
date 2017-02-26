function log()
{
	if (document.lg.username.value.trim() == "")
	{
		alert("Please enter a username");
		document.lg.username.focus();
		return false;
	}
	if (document.lg.pass.value.trim() == "")
	{
		alert("Please enter a password");
		document.lg.pass.focus();
		return false;
	}
	return true;
}