<#escape x as jsonUtils.encodeJSONString(x)>
{
"total" : "${total}",
"items": [
	<#if items?? && items?size != 0>
		<#list items as item>
		{
			"itemsCount": "${item.total}",
			"group" : "${item.group!""}",
			
		<#if item.typeClustering=="country">
			"type" : "cluster",
		<#else>	
			
			<#if item.total==1>
				"type" : "marker",
				"title" : "${item.title!""}",
				"goodPractice" : ${item.goodPractice?string("true", "false")},
				"successStory" : ${item.successStory?string("true", "false")},
				"programme" : "${item.programme!""}",
				"actionType" : "${item.actionType!""}",
				"coordinator" : "${item.coordinator!""}",
				"id" : "${item.nodeRef!""}",
				"countries": "${item.countries!""}",
			<#else>
				"type" : "cluster",
			</#if>
			
		</#if>
		"lat" : "${item.latitude!""}",
			"lon" : "${item.longitude!""}"
		}<#if item_has_next>,</#if>
		</#list>
	</#if>
]}
</#escape>