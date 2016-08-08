<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="en" http-equiv="Content-Language">
<#if page.properties["style"]??>
	<#if page.properties["style"]=="eplus">
		<meta content="The Erasmus+ Project Results is the single information point on European education, training, culture and youth projects" name="description">
		<meta content="EUROPA/SITE_NAME" name="reference">
		<meta content="DG/UNIT" name="creator">
		<meta content="DD/MM/YYYY" name="date">
		<meta content="Numeric code from the alphabetical classification list common to all the institutions" name="classification">
		<meta content="One or more of the commission specific keywords + European Comission, European Union, EU" name="keywords">
	<#elseif page.properties["style"]=="ce">
		<meta content="Here you can find project information and results of projects supported by the European Commission under the current Creative Europe programme and under the previous Culture 2007-2013 programme." name="description">
		<meta content="EUROPA/SITE_NAME" name="reference">
		<meta content="DG/UNIT" name="creator">
		<meta content="DD/MM/YYYY" name="date">
		<meta content="Numeric code from the alphabetical classification list common to all the institutions" name="classification">
		<meta content="One or more of the commission specific keywords + European Comission, European Union, EU" name="keywords">
	</#if>
</#if>
<!--RESPONSIVE-->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- VALOR OOTB CSS and JS -->
<link href="${url.context}/valor/css/index.css" type="text/css" rel="stylesheet" />

<!--[if IE 6]>
    <link href="${url.context}/valor/css/ie6.css" type="text/css" rel="stylesheet" />

    <script src="${url.context}/valor/js/dd_belated_png.js"></script>
    <script>DD_belatedPNG.fix('#logo a, .h-box-1 img, .h-box-2 img, .brochure img, .slide-txt');</script>  
<![endif]-->

<!-- jQuery -->
<script type="text/javascript" src="${url.context}/valor/js/jquery-1.10.2.min.js"></script>

<!-- Datatable component and countries flags script -->
<script type="text/javascript" src="${url.context}/valor/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${url.context}/valor/js/countries.js"></script>

<!-- Styles for Datatable component and countries flags -->
<link href="${url.context}/valor/css/result_table_jui.css" type="text/css" rel="stylesheet" />
<link href="${url.context}/valor/css/flags.css" type="text/css" rel="stylesheet" />

<!-- Try to import in the pages that need the components - ONLY for get countries flags -->
<script type="text/javascript" src="${url.context}/valor/js/yui-common-min.js"></script>

<!-- jQWidgets core and globalization tools -->
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/globalization/globalize.js"></script>

<!-- add one of the jQWidgets styles -->
<link rel="stylesheet" href="${url.context}/valor/js/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="${url.context}/valor/js/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
<link rel="stylesheet" href="${url.context}/valor/js/jqwidgets/styles/jqx.bootstrap.css" type="text/css" />

<!-- Mini Calendar -->
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxdatetimeinput.js"></script>
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxcalendar.js"></script>
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxtooltip.js"></script>

<!--TEMPLATE CSS-->
<link href="http://ec.europa.eu/wel/template-2012/stylesheets/ec.css" media="all" rel="stylesheet" type="text/css">
<link href="http://ec.europa.eu/wel/template-2013/stylesheets/ec-content.css" media="all" rel="stylesheet" type="text/css">
<link href="http://ec.europa.eu/wel/components/2013/stylesheets/ec-components-only.css" media="all" rel="stylesheet" type="text/css">

<!--TEMPLATE AND COMPONENTS JS-->
<script src="http://ec.europa.eu/wel/template-2012/scripts/ec.js" type="text/javascript"></script>
<script src="http://ec.europa.eu/wel/components/2013/scripts/ec-components.js" type="text/javascript"></script>

<!-- If no style is defined the default common folder is taken. Specific values can be overwritten by eplus or ce style -->
<link href="${url.context}/valor/css/common/styles.css" type="text/css" rel="stylesheet" />
<#if page.properties["style"]??>
	<#if page.properties["style"]=="eplus">
		<link href="${url.context}/valor/css/eplus/styles.css" type="text/css" rel="stylesheet" />
	<#elseif page.properties["style"]=="ce">
		<!-- TODO create template with specific colors for ce -->
		<link href="${url.context}/valor/css/ce/styles.css" type="text/css" rel="stylesheet" />
	<#elseif page.properties["style"]=="efc">
		<!-- TODO create template with specific colors for efc -->
		<link href="${url.context}/valor/css/efc/styles.css" type="text/css" rel="stylesheet" />
	</#if>
<#elseif webSite.logo??>
	<style>
    #logo a {
        background:url(<@makeurl asset=webSite.logo/>) no-repeat;
    }
    </style>
</#if>

${head}
