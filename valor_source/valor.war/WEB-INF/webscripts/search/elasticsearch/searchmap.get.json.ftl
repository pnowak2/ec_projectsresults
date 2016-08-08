<#escape x as jsonUtils.encodeJSONString(x)>
{
"iTotalRecords": "${total?string?replace(",","")?replace(".","")}",
"took" : "${took} ms",
"aaData": [
	<#if items?? && items?size != 0>
			<#if domain=="efc">
				<#-- Europe for Citizen -->
                <#list items?keys as key>
					[
					<#list items[key] as project>
						["${project.projectNodeRef}", "${project.latitude!''}", "${project.longitude!''}", "${project.title!''}", "${project.projectDescription!''}", "${project.level2!''}", "${project.coordinatorOrganisationName!''}"]
						<#if project_has_next>,</#if>
					</#list>
					]
					<#if key_has_next>,</#if>
				</#list>
			</#if>
	</#if>
]
}
</#escape>