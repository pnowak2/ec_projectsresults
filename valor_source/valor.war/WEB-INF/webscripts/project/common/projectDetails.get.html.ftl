<#if htmlProjectView??>
	${htmlProjectView}
<#else>
	<#import "../../common/controls.lib.ftl" as ctrl>
	<#if isValorProject?string=="true">
		<#include "/project/common/valorProjectDetails.ftl"/>
	<#elseif isValorProject?string=="false">
		<#include "/project/common/eveProjectDetails.ftl"/>
	<#else>
		<#include "/project/common/invalidProjectDetails.ftl"/>
	</#if>
</#if>