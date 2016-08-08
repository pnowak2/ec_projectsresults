<#escape x as jsonUtils.encodeJSONString(x)>
{
"iTotalRecords": "${total?string?replace(",","")?replace(".","")}",
"iTotalDisplayRecords": "${total?string?replace(",","")?replace(".","")}",
"took" : "${took} ms",
"aaData": [
	<#if items?? && items?size != 0>
		<#if type=="projectPublicSearch"><#-- retrieve Projects -->
			<#if domain=="eplus">
				<#list items as item>
                ["${item.projectNodeRef}", "${item.title!''}", "${item.projectDescription!''}", "${item.tags!''}", <#if item.startDate??>"${item.startDate?string('yyyy')}"<#else>""</#if>, "${item.coverage!''}", "${item.goodPractice?string!'false'}", "${item.successStory?string!'false'}"]
					<#if item_has_next>,</#if>
				</#list>
			<#elseif domain=="ce">
				<#list items as item>
				<#-- Culture -->
                ["${item.projectNodeRef}", "${item.title!''}", "${item.projectDescription!''}", <#if item.startDate??>"${item.startDate?string('yyyy')}"<#else>""</#if>, "${item.coverage!''}", "${item.successStory?string!'false'}"]
					<#if item_has_next>,</#if>
				</#list>
			<#elseif domain=="efc">
				<#list items as item>
				<#-- Europe for Citizen -->
                ["${item.projectNodeRef}", "${item.title!''}", "${item.projectDescription!''}", "${item.call!''}", "${item.coverage!''}", "${item.coordinatorOrganisationName!''}"]
					<#if item_has_next>,</#if>
				</#list>
			</#if>
		<#else><#-- retrieve Results/Products -->
			<#list items as item>
            ["${item.projectNodeRef!''}", "${item.nodeRef!''}", <#if item.title??>"${item.title!''}"<#else>"${item.name!''}"</#if>, "${item.projectTitle!'No title'}", "${item.typology!''}"]
				<#if item_has_next>,</#if>
			</#list>
		</#if>
	</#if>
]
}
</#escape>