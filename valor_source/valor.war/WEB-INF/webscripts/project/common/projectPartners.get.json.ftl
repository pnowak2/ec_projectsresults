<#escape x as jsonUtils.encodeJSONString(x)>
{
	<#assign total = partners?size + 1>
    "total": ${total},
	"coordinator": {
        "name": "${coordinator.name!''}",
        "type": "${coordinator.type!''}",
        "role": "Project Coordinator",
		"address": "${coordinator.address!''}",
        "website": "${coordinator.website!''}",
        "lat": "${coordinator.lat!''}",
        "lng": "${coordinator.lng!''}"
        }
		<#if partners?exists>
	,"partners": [
		<#list partners as partner>
	    {
	        "name": "${partner.name!''}",
	        "type": "${partner.type!''}",
	        "role": "Project Partner",
			"address": "${partner.address!''}",
	        "website": "${partner.website!''}",
	    	"lat": "${partner.lat!''}",
	    	"lng": "${partner.lng!''}"
	    }
			<#if partner_has_next>,</#if>
		</#list>
        ]
		</#if>
}
</#escape>  