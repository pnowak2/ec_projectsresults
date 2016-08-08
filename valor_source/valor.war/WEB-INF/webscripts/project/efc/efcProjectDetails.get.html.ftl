<#if htmlProjectView??>
	${htmlProjectView}
<#else>
	<#import "../../common/controls.lib.ftl" as ctrl>
	<#if isEFCProject?string=="true">
		<#include "/project/efc/efcProjectDetails.ftl"/>
	<#else>
		This project type is not supported
	</#if>
</#if>