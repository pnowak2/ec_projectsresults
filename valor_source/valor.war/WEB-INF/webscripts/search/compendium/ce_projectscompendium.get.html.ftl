<h2>Creative Europe and Former Programmes Projects Overview</h2>

<p>Here you can find an overview of projects funded by the European Commission under the Creative Europe programme and it's predecessor programmes.</p>

<p>You can download the following Excel files, so that you can apply your own filtering and sorting, and to gather different statistics about the projects.</p>

<style>
	ul.creativeEuropeProjectsCompendiaList { margin:0; padding:2em 0; }
	ul.creativeEuropeProjectsCompendiaList li img { display:inline-block; vertical-align:middle; }
	ul.creativeEuropeProjectsCompendiaList li a { display:inline-block; vertical-align:baseline; }
	.lastUpdated { font-size:smaller; display:inline-block; vertical-align:baseline; }
</style>

<ul class="creativeEuropeProjectsCompendiaList">
<#list compendia as compendium>
	<#if compendium.uuid?url?has_content>
		<li><img alt="" src="${url.context}/valor/img/excel-icon-26px.png"/> <a href="${url.context}/proxy/alfresco-webscripts/api/node/content/workspace/SpacesStore/${compendium.uuid?url}/${compendium.filename?url}" target="document">${compendium.title}</a> &nbsp;&nbsp;&nbsp; <span class="lastUpdated">(last updated: ${compendium.modifiedDate})</span></li>
	</#if>
</#list>
</ul>

<div style="height:300px"></div>
