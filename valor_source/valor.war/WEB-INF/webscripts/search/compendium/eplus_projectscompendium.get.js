var connector = remote.connect("alfresco-webscripts");
var webscriptUrl = "/valor/projectsCompendiumUuid?domain=eplus";
var response = connector.get(webscriptUrl);
var data = jsonUtils.toObject(response);
model.compendia = data.compendia;
