<#if content??>
	<#list content as page>
	${page}</br>
	</#list>
<#elseif projects??>
	<#list projects as project>
		<a href="/programmes/erasmus-plus/projects/eplus-project-details-page/?nodeRef=${project[0]}&format=html">${project[1]}</a></br>
	</#list>
</#if>