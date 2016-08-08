<#macro selfhidingtextfield field label link>
 
 <#if link?? && link == "true">
   	<#if field?starts_with("http") || field?starts_with("https") || field?starts_with("ftp")>
     		<#assign fieldValue=field?html?replace("((http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?\\^=%&:\\/~\\+#]*[\\w\\-\\@?\\^=%&\\/~\\+#])?)", "<a href=\"$1\" target=\"_blank\">$1</a>", "r")>
    <#elseif field?starts_with("www")>
     		<#assign fieldValue=field?html?replace("([\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?\\^=%&:\\/~\\+#]*[\\w\\-\\@?\\^=%&\\/~\\+#])?)", "<a href=\"http://$1\" target=\"_blank\">$1</a>", "r")>
    <#else>
     		<#assign fieldValue=field?html>      
    </#if>
 <#else>
    <#if field?is_number>
       <#assign fieldValue=field?c>
    <#else>
       <#assign fieldValue=field?html>
    </#if>
 </#if>
 
 <#if fieldValue?trim?has_content>
 	<!--#assign field="<p>"+field?replace("\n", "</p><p>")+"</p>"-->
 	<#--assign linebreaks = fieldValue?matches("\n")>
 	linebreaks: ${linebreaks?size}-->
 	<div class="field">
 		<#if label?has_content><span class="label">${label?html}: </span></#if><span class="value">
 		<#--if linebreaks?has_content?size > 1><p></#if-->
 		<#--${fieldValue?replace("\n(\s*)$^(\s*)\n", "</p><p>", "m")}-->
 		${fieldValue?replace("\n", "<br />")}
 		<#--if linebreaks?has_content?size > 1></p></#if-->
 		</span>
 	</div>
 	
 <#else>
	
 </#if>
</#macro>
 

<#macro confidentialdata field label confidential>
	<#assign fieldValue=field?html>

	<#if confidential == "false">
    <div class="field">
		<#if label?has_content><span class="label">${label?html}: </span></#if><span class="value">
			<#if fieldValue?trim?has_content && fieldValue != "">
				${fieldValue?replace("\n", "<br />")}
			</#if>
 		</span>
    </div>
	</#if>
</#macro>
 
<#macro selfhidingflagfield field label>
 	<#assign fieldValue=field?html>
 	
  	<#if fieldValue != "">
 	 <div class="field">
 		<#if label?has_content><span class="label">${label?html}: </span></#if><span class="value"><@showflag vcardcountry="${fieldValue}" /></span>
 	 </div>
 	 <#else>

 	 </#if>
 </#macro>
 
 
<#macro selfhidingtagfield field label>
 	 <#if field != "">
 	 <div class="field">
 		<#if label?has_content><span class="label">${label?html}: </span></#if>
 	 	         		
         <#assign tagValues=field?string?split(" | ")>
         <#list tagValues as tag>
	         <#assign fieldValue=tag?html>
	         <#if fieldValue != "">
					<span class="tags-value">${fieldValue}</span>
			 </#if>
	     </#list>
	     	
	  </div>  
	  </#if>
</#macro>
 
 
 // This is format ISO 3166-1 alpha-2 (2 characters).
<#macro showflag vcardcountry>
	<#if vcardcountry?string != "" && vcardcountry?contains(",")>
		<#assign values=vcardcountry?split(",")>
	<#elseif vcardcountry?string != "" && vcardcountry?contains("|")>
		<#assign values=vcardcountry?split("|")>
	<#else>
		<#assign values=[vcardcountry]>
	</#if>
	
  <#list values as element>	
	  <#if element?trim?length==2>
	   <#-- To be able to show on mouse-over the country we need to specify a blank transparant image. Currently this image is not found -->
	   <img class="flag ${element?lower_case}" src="${url.context}/valor/images/blank.png" onload="resolveCountryCode('${element?trim}')" />
	  <#else>
	   ${element}
	  </#if>
  </#list>
</#macro>
