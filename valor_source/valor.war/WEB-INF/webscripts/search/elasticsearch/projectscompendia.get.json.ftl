<#escape x as jsonUtils.encodeJSONString(x)>
{
"iTotalRecords": "${total?string?replace(",","")?replace(".","")}",
"iTotalDisplayRecords": "${total?string?replace(",","")?replace(".","")}",
"took" : "${took} ms",
"projectNodeRefs": [
	<#if items?? && items?size != 0>
		<#list items as item>
			"${item.projectNodeRef}"<#if item_has_next>,</#if>
		</#list>
	</#if>
]
}
</#escape>