//get parameters
var start=url.args.start;
var end=url.args.end;
//init variables
var webscriptUrl;
var data;
var result;
var pages = [];

var connector = remote.connect("valor-webscripts");
if(start!=null && start!="") {// && end!=null && end!="") {
	webscriptUrl = "/es/search?index=eplus&indexTypeShow=projectPublicSearch&searchType=matchAll&indexTypeSearch=projectPublicSearch&iDisplayStart=" + start;
	data = connector.get(webscriptUrl);
	result = eval('(' + data + ')');
	var projects = result["aaData"];
	model.projects = projects;
} else {
	webscriptUrl = "/es/search?index=eplus&indexTypeShow=projectPublicSearch&searchType=matchAll&indexTypeSearch=projectPublicSearch&counter=true&iDisplayStart=0";
	data = connector.get(webscriptUrl);
	//create json object from data
	result = eval('(' + data + ')');
	var count = result["iTotalRecords"];
	pages = [];
	if(count>0 && count>9) {
		//create "pages" elements
		for(var i=0;i<=count/10;i++) {
			pages.push("<a href=\"?start=" + (i*10) +"\">Page" + i + "</a>");
		}
	} else {
		pages.push("<a href=\"?start=10\">Page1</a>");
	}
	
	model.content = pages;
}