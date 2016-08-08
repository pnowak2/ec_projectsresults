<#if page.properties["style"]?? && page.properties["style"]=="eplus">
	<#assign platformName = msg("page.eplus.title") />
<#elseif page.properties["style"]?? && page.properties["style"]=="ce">
	<#assign platformName = msg("page.ce.title") />
<#elseif page.properties["style"]?? && page.properties["style"]=="efc">
	<#assign platformName = msg("page.efc.title") />
<#else>
	<#assign platformName = "" />
</#if>

<#if page.title??>
	<title>${platformName} - ${msg(page.title)!page.title?html}</title>
<#elseif asset?? && asset.name != 'index.html'>
	<title>${platformName} - ${asset.title!asset.name?html}</title>
	<#if asset.description??>
    <meta name="description" content="${asset.description?html}"/>
	</#if>
<#elseif section?? && section.id != webSite.id>
	<title>${platformName} - ${(section.title!section.name)?html}</title>
	<#if section.description??>
    <meta name="description" content="${section.description?html}"/>
	</#if>
<#else>
	<title>${(webSite.title!context.page.id)?html}</title>
	<#if webSite.description??>
    <meta name="description" content="${webSite.description?html}"/>
	</#if>
</#if>
