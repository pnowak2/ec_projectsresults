//TODO delevop a general function to extract filter values   
//TODO delevop a validator to enable searchButton if at least one filter is used
	    
//process multiple values and clean up the none value in multiselect option control
function processMultipleValues( value )
{
	//check if has value(s)
	if(value!=null)
		//check if value is [none] only
		if(value.join()=="[none]")
			return "";
		else//if the control has values ensure [none] is not used
			return value.join(";").replace("[none];","");
	else
		return "";
}
	
//process simple value and clean up the none value in non-multiselect option control
function processSimpleValue( value )
{
	//check if has value(s)
	if(value!=null)
		//check if value is [none] only
		if(value=="[none]")
			return "";
		else//if the control has non-none value use it as is
			return $.trim(value);
	else
		return "";
}	

//funtion to encode and create query url parameters
function EncodeQueryData(url, data)
{
   var ret = [];
   for (var d in data)
      ret.push(encodeURIComponent(d) + "=" + encodeURIComponent(data[d]));
   return url + "&" + ret.join("&");
}