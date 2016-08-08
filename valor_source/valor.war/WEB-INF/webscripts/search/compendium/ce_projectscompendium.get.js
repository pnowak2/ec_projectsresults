var connector = remote.connect("alfresco-webscripts");
var webscriptUrl = "/valor/projectsCompendiumUuid?domain=ce";
var response = connector.get(webscriptUrl);
var data = jsonUtils.toObject(response);
model.compendia = data.compendia;
