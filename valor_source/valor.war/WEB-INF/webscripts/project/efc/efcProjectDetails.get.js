var nodeRef=url.args.nodeRef;
var productId=url.args.productId;
var format=url.args.format;
var connector = remote.connect("alfresco-webscripts");
var webscriptUrl = "/valor/details/project?nodeRef=" + nodeRef;
var data;
//if format parameter add to the webscript call and inject full content
if(format!=null && format!="") {
	webscriptUrl += "&format=" + format;
	data = connector.get(webscriptUrl);
	model.htmlProjectView = data;
} else {
	data = connector.get(webscriptUrl);
	//create json object from data
	var prjData = eval('(' + data + ')');
	//saving the data of the project
	var isEFCProject = prjData["isValorProject"];
	//get the value from the backend
	model.isEFCProject = isEFCProject;

	if (isEFCProject == "true"){
	  //valor project
	  model.project = prjData["project"];
	  model.coordinating = prjData["coordinating"];
	  model.contactPerson = prjData["contactPerson"];
	  model.legalRepresentative = prjData["legalRepresentative"];
	  model.partners = prjData["partners"];
	  model.products = prjData["products"];
	} else {
		model.error = "invalid value for isEFCProject: " + isEFCProject;
	}

	if(productId!=null)
		model.productId=productId;
}