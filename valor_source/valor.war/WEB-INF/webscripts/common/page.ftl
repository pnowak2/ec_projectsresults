<#macro templateBody>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "/common/head.ftl"/> 
    <#include "/common/title.ftl"/>   
</head>
<body class="euShortContent">

<a id="top-page" name="top-page"></a>
<div class="layout layout-noleft layout-noright" id="layout"> 
  <!--HEADER-->
  <#if page.properties["style"]?? && page.properties["style"]=="eplus">
      <#include "/common/header.eplus.ftl"/>
  <#elseif page.properties["style"]?? && page.properties["style"]=="ce">
      <#include "/common/header.ce.ftl"/>
  <#elseif page.properties["style"]?? && page.properties["style"]=="efc">
      <#include "/common/header.efc.ftl"/>
  </#if>
  <div class="layout-body">
    <div class="layout-wrapper">
      <div class="layout-wrapper-reset"> 
        
        <!--CENTRAL COLUMN-->
        <div class="layout-content">
          <div id="body-wrapper">
            <#if page.properties["style"]?? && page.properties["style"]=="eplus">
                <#include "/common/menu.eplus.ftl"/>
            <#elseif page.properties["style"]?? && page.properties["style"]=="ce">
                <#include "/common/menu.ce.ftl"/>
            <#elseif page.properties["style"]?? && page.properties["style"]=="efc">
                <#include "/common/menu.efc.ftl"/>
            </#if>

            <#nested>
          </div>
		<!--/CENTRAL COLUMN-->
		</div>
		<!--/class="layout-wrapper"-->
      </div>
     <!--/class="layout-wrapper-reset"-->
    </div>
  <!--/class="layout-body"-->
  </div> 		
  <!-- FOOTER -->
  <#if page.properties["style"]?? && page.properties["style"]=="eplus">
      <#include "/common/footer.eplus.ftl"/>
  <#elseif page.properties["style"]?? && page.properties["style"]=="ce">
      <#include "/common/footer.ce.ftl"/>
  <#elseif page.properties["style"]?? && page.properties["style"]=="efc">
      <#include "/common/footer.efc.ftl"/>
  </#if>
<#include "/common/init.ftl"/> 
</body>
</html>
</#macro>