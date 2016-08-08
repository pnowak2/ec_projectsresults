<#escape x as (x)?replace('"','""')>
<#if items?? && items?size != 0>
	<#if type=="projectPublicSearch"><#-- retrieve Projects -->
		<#if domain=="eplus">
			<#-- Education -->
ProjectTitle,ProjectDescription,Tags,StartDate,Coverage,GoodPractice,SuccessStory,ProjectCard
<#list items as item>
"${item.title!''}","${item.projectDescription!''}","${item.tags!''}",<#if item.startDate??>"${item.startDate?string('yyyy')}"<#else>""</#if>,"${item.coverage!''}","${item.goodPractice?string!'false'}","${item.successStory?string!'false'}","${item.projectNodeRef}"
</#list>
		<#elseif domain=="ce">
			<#-- Culture -->
ProjectTitle,ProjectDescription,StartDate,Coverage,SuccessStory,ProjectCard
<#list items as item>
"${item.title!''}","${item.projectDescription!''}",<#if item.startDate??>"${item.startDate?string('yyyy')}"<#else>""</#if>,"${item.coverage!''}","${item.successStory?string!'false'}","${item.projectNodeRef}"
</#list>
		<#elseif domain=="efc">
			<#-- Europe for Citizens -->
ProjectTitle,ProjectDescription,Call,Coverage,CoordinatorOrganisationName,ProjectCard
<#list items as item>
"${item.title!''}","${item.projectDescription!''}","${item.call!''}","${item.coverage!''}","${item.coordinatorOrganisationName!''}","${item.projectNodeRef}"
</#list>
		</#if>
	<#else><#-- retrieve Results/Products -->
ResultTitle,ProjectTitle,Typology,ProjectNodeRef,ResultNodeRef
<#list items as item>
<#if item.title??>"${item.title!''}"<#else>"${item.name!''}"</#if>,"${item.projectTitle!'No title'}","${item.typology!''}","${item.projectNodeRef!''}","${item.nodeRef!''}"
</#list>
	</#if>
</#if>
</#escape>