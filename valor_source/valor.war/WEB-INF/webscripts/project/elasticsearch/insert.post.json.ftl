<#escape x as jsonUtils.encodeJSONString(x)>
{
	<#if index?exists>
	"index": "${index}",
	"type": "${type}",
	"id": "${id}",
	</#if>
	"resultCode": ${resultCode},
	"resultString": "${resultString}"
}
</#escape>