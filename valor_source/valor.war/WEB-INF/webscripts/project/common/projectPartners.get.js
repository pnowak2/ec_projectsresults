var projectId=args.projectId;

var connector = remote.connect("alfresco-webscripts");
var webscriptUrl = "/valor/details/projectCoordinatorPartners?projectId=" + projectId;

var data = connector.get(webscriptUrl);
var prjData = eval('(' + data + ')');

model.total = prjData["total"];
model.coordinator = prjData["coordinator"];
model.partners = prjData["partners"];