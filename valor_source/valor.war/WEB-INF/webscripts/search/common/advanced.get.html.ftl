<#if domain=="eplus">
	<input type="hidden" id="domain" value="eplus"/>
<#elseif domain=="ce">
	<input type="hidden" id="domain" value="ce"/>
</#if>

<script type="text/javascript" charset="utf-8">

//define the search webscript URL common part
var webscriptBaseUrl = "${url.context}/service/es/search?index=${domain}";
var webscriptExportBaseUrl = "${url.context}/service/es/exportexcel?index=${domain}";

//ensure that the table is a jQuery datatable
function isDataTable ( nTable )
{
    var settings = $.fn.dataTableSettings;
    for ( var i=0, iLen=settings.length ; i<iLen ; i++ )
    {
        if ( settings[i].nTable == nTable )
        {
            return true;
        }
    }
    return false;
}

//to hide/show all the flags related with the project Countries
function showAllFlags(obj){
    if(obj.style.overflow=='hidden'){
        obj.style.overflow="visible";
        obj.style.height="auto";
        obj.childNodes[6].style.display="none";
    }
    else{
        obj.style.overflow="hidden";
        obj.style.height="74px";
        obj.childNodes[6].style.display="block";
    }
}

//transform the country iso code in the country flag
//TODO solve the problem with amount of flags "size" on CE and EPLUS searches
function displayFlag ( data, type, row ) {
    var countries = new Array();
    if (data != null) {
        if (data.indexOf("|") > -1 ) {
            countries = data.split("|");
        }
        else {
            countries[0] = data;
        }
    }
    var flags = "";
    if(countries.length>6)
        flags = '<div class="fBox" onclick="showAllFlags(this)" style="overflow: hidden; height: 70px;">';
    for ( var i=0; i < countries.length; i++ ) {
        if(i==6)
            flags += '<p class="cAll" style="display: block;">${msg("column.showAll")}</p>';

        if (countries[i].length == 2) {
            flags += '<img class="flag ' + countries[i].toLowerCase() + '" src="${url.context}/valor/images/blank.png" onload="resolveCountryCode(&quot;' + countries[i].toUpperCase() + '&quot;)" />';
        }
        else {
            flags += countries[i];
        }
    }
    if(countries.length>6)
        flags += '</div>';
    return flags;
}

//generate the url related with the project details passing parameters
function displayProjectDetails ( data, type, row ) {
    //The row[0] is the project noderef
    var title = '';

<#if domain=="eplus">
    // Good practices
    if(row[6] === 'true') {
        title += '<img class="project-item-badge badge-good-practices" src="${url.context}/valor/images/medal.png" title="${msg("prop.good_practice_example")}"/>';
    }
    // Success stories
    if(row[7] === 'true') {
        title += '<img class="project-item-badge badge-success-stories" src="${url.context}/valor/images/medal.png" title="${msg("prop.success_story")}"/>';
    }
    title += '<a id="' + row[0] + '" href="${url.context}/erasmus-plus/projects/eplus-project-details-page/?nodeRef='+ row[0] +'" target="_blank">' + $("<div>").text(data).html() + '</a>';
<#else>
    // Success stories
    if(row[5] === 'true') {
        title += '<img class="project-item-badge badge-success-stories" src="${url.context}/valor/images/medal.png" title="${msg("prop.success_story")}"/>';
    }
    title += '<a id="' + row[0] + '" href="${url.context}/creative-europe/projects/ce-project-details-page/?nodeRef='+ row[0] +'" target="_blank">' + $("<div>").text(data).html() + '</a>';
</#if>
    return title;
}

//generate the url to go directly to the product details specific control
function displayProductDetails ( data, type, row ) {
    //The row[1] is the product noderef
    var title = '<a id="' + row[1] + '" href="${url.context}/erasmus-plus/projects/eplus-project-details-page/?nodeRef='+ row[0] +'&productId=' + row[1].split("SpacesStore/")[1] +'" target="_blank">' + data + '</a>';
    return title;
}

//function to advise for search performance
function alertSearchPerformance(showOrHide) {
    if(showOrHide=="show") {
        //TODO avoid to show missing keywords and tips message
        //if($('#filterSimpleSearch').css('border')=='1px solid #BBBBBB' || !($('#filterSimpleSearch').css('border')=='2px solid red' && $('#moreFilterText').css('color')=='#555555')) {
        $("#filterSimpleSearch").jqxTooltip({ content: ' <i>${msg("search.performanceMessage")}</i><br />', position: 'top', name: 'searchAdvisorTooltip', theme: 'bootstrap' });
        $('#filterSimpleSearch').jqxTooltip({ disabled: false });
        $('#filterSimpleSearch').jqxTooltip('open');
        $('#filterSimpleSearch').jqxTooltip({ autoHideDelay: 8000 });
        //}
    } else {
        $('#filterSimpleSearch').jqxTooltip('close');
        $('#filterSimpleSearch').jqxTooltip({ disabled: true });
    }
}

//function to advise for search performance
function alertFilterPerformance(showOrHide,idFilter) {
    if(showOrHide=="show") {
        $(idFilter).jqxTooltip({ content: '<b>Search Tip :</b> <i>${msg("filter.performanceMessage")}</i><br />', position: 'top', name: 'searchAdvisorTooltip', theme: 'bootstrap' });
        $(idFilter).jqxTooltip({ disabled: false });
        $(idFilter).jqxTooltip('open');
        $(idFilter).jqxTooltip({ autoHideDelay: 8000 });

    } else {
        $(idFilter).jqxTooltip('close');
        $(idFilter).jqxTooltip({ disabled: true });
    }
}

//function to build the Education Search params and URL
function buildEducationSearchParams(searchTypeValue,orderByValue) {

    //Create and initialize url and params variables
    var webscriptUrl = webscriptBaseUrl +"&indexTypeShow=" + searchTypeValue;
    var queryParams = null;
    var validParams = false;

    //check if expander is expanded to do an advanced search
    var expanded = $('#jqxExpander_advancedProjectSearchFilters').jqxExpander('expanded');

    var isGoodPractices = $('#good-practices').is(':checked');
    var isSuccessStories = $('#success-stories').is(':checked');

    if(expanded) {

        //get value to define the logic to perform the search against project or organizations
        var selectedTab = $('#jqxTabs_advancedSearchFilters').jqxTabs('selectedItem');

        //if project criteria collect specific filters
        if(selectedTab==0) {

            //search against project obtaining parameters
            var filterSimpleSearch=getSimpleSearchValueTextbox();
            if(filterSimpleSearch=="${msg("input.projectSimpleSearch")}" ||
			   filterSimpleSearch=="${msg("input.organizationSimpleSearch")}")
                filterSimpleSearch = "";

            var filterProjectYear=processMultipleValues($('#filterProjectYear').multipleSelect("getSelects"));

			var filterProjectCallYear=processMultipleValues($('#filterProjectCallYear').multipleSelect("getSelects"));

            var filterProjectCountry=processMultipleValues($('#filterProjectCountry').multipleSelect("getSelects"));

            var filterProjectRegion=processMultipleValues($('#filterProjectRegion').multipleSelect("getSelects"));

            var multipleTopics = $('#filterProjectTopic').multipleSelect("getSelects", "text");
            var filterProjectTopic=processMultipleValues(multipleTopics);
            var filterProjectStatus=processSimpleValue($('#filterProjectStatus').val());
            var filterProjectLevel1=processMultipleValues($('#filterProjectLevel1').val());
            var filterProjectLevel2=processSimpleValue($('#filterProjectLevel2').val());
            var filterProjectLevel3=processSimpleValue($('#filterProjectLevel3').val());
            var filterProjectTargetGroup=$.trim($('#filterProjectTargetGroup').val());

			//set as valid params
			validParams = true;

			//to avoid several excluding filters
			//level3 filter excludes level1 and level2
			if ($.trim(filterProjectLevel3)!="") {
				filterProjectLevel1 = "";
				filterProjectLevel2 = "";
			}
			//level2 excludes level1
			if ($.trim(filterProjectLevel2)!="") {
				filterProjectLevel1 = "";
				filterProjectLevel3 = "";
			}

			//region excludes Country
			if ($.trim(filterProjectRegion)!="") {
				filterProjectCountry = "";
			}

			//passing parameters and url to generate call
			queryParams = {"KEYWORD" : filterSimpleSearch, "GOOD_PRACTICE" : isGoodPractices, "SUCCESS_STORY": isSuccessStories,
				"FILTER-START_DATE" : filterProjectYear ,
				"FILTER-CALL_YEAR" : filterProjectCallYear ,
				"FILTER-COVERAGE" : filterProjectCountry , "FILTER-TAGS" : filterProjectTopic ,
				"FILTER-PROJECT_STATUS" : filterProjectStatus , "FILTER-AUDIENCE" : filterProjectTargetGroup ,
				"FILTER-LEVEL1" : filterProjectLevel1, "FILTER-LEVEL2" : filterProjectLevel2,
				"FILTER-LEVEL3" : filterProjectLevel3, "FILTER-REGION" : filterProjectRegion,
				"sort" : orderByValue};

			webscriptUrl = webscriptUrl + "&searchType=advanced&indexTypeSearch=projectPublicSearch" ;

            //if organization criteria collect specific filters
        } else if (selectedTab==1) {

            //search against organization obtaining parameters
            var filterOrganizationName=getSimpleSearchValueTextbox();
            if(filterOrganizationName=="${msg("input.organizationSimpleSearch")}")
                filterOrganizationName="";
            var filterOrganizationCountry=processMultipleValues($('#filterOrganizationCountry').multipleSelect("getSelects"));
            var filterOrganizationRegion=processMultipleValues($('#filterOrganizationRegion').multipleSelect("getSelects"));

            var filterOrganizationType=processMultipleValues($('#filterOrganizationType').multipleSelect("getSelects"));

            //get specific filters values for Education
            var filterOrganizationRole=processMultipleValues($('#filterOrganizationRole').multipleSelect("getSelects"));

			//set as valid params
			validParams = true;

			//region excludes Country
			if ($.trim(filterOrganizationRegion)!="") {
				filterOrganizationCountry = "";
			}

			//passing parameters and url to generate call
			queryParams = {"KEYWORD" : filterOrganizationName ,
				"GOOD_PRACTICE" : isGoodPractices, "SUCCESS_STORY": isSuccessStories,
				"FILTER-COUNTRY" : filterOrganizationCountry, "FILTER-ROLE" : filterOrganizationRole,
				"FILTER-TYPE" : filterOrganizationType, "FILTER-REGION" : filterOrganizationRegion,
				"sort" : orderByValue};

			webscriptUrl = webscriptUrl + "&searchType=advanced&indexTypeSearch=organisationPublicSearch" ;
        }
        //if simple search
    } else {

        //advanced search for projects keywords only
        var filterSimpleSearch=getSimpleSearchValueTextbox();
        if(filterSimpleSearch=="${msg("input.projectSimpleSearch")}" ||
		   filterSimpleSearch=="${msg("input.organizationSimpleSearch")}")
            filterSimpleSearch="";

		//set as valid params
		validParams = true;

		//passing parameters and url to generate call
		queryParams = {"KEYWORD" : filterSimpleSearch ,
			"GOOD_PRACTICE" : isGoodPractices, "SUCCESS_STORY": isSuccessStories,
			"sort" : orderByValue};

		webscriptUrl = webscriptUrl + "&searchType=simple&indexTypeSearch=projectPublicSearch" ;

    }

    //check if valid params
    if (validParams) {
        //return url and params values
        return EncodeQueryData(webscriptUrl, queryParams);
    } else {
        return "";
    }
}

//function to build the Culture Search params and URL
function buildCultureSearchParams(searchTypeValue,orderByValue) {

    //Create and initialize url and params variables
    var webscriptUrl = webscriptBaseUrl +"&indexTypeShow=projectPublicSearch";
    var queryParams = null;
    var validParams = false;

    //check if expander is expanded to do an advanced search
    var expanded = $('#jqxExpander_advancedProjectSearchFilters').jqxExpander('expanded');

    var isSuccessStories = $('#success-stories').is(':checked');

    if (expanded) {

        //get value to define the logic to perform the search against project or organizations
        var selectedTab = $('#jqxTabs_advancedSearchFilters').jqxTabs('selectedItem');

        //if project criteria collect specific filters
        if (selectedTab==0) {

            //search against project obtaining parameters
            var filterProjectLevel1=processSimpleValue($('#filterProjectLevel1').val());
            var filterProjectLevel2=processSimpleValue($('#filterProjectLevel2').val());
            var filterProjectLevel3=processSimpleValue($('#filterProjectLevel3').val());
            var filterProjectFunding=processSimpleValue($('#filterProjectFunding').val());

            var filterSimpleSearch=getSimpleSearchValueTextbox();
            if(filterSimpleSearch=="${msg("input.projectSimpleSearch")}" ||
			   filterSimpleSearch=="${msg("input.organizationSimpleSearch")}")
                filterSimpleSearch="";

            var filterProjectYear=processMultipleValues($('#filterProjectYear').multipleSelect("getSelects"));
			var filterProjectCallYear=processMultipleValues($('#filterProjectCallYear').multipleSelect("getSelects"));

            var filterProjectCountry=processMultipleValues($('#filterProjectCountry').multipleSelect("getSelects"));

            var filterProjectRegion=processMultipleValues($('#filterProjectRegion').multipleSelect("getSelects"));

            var multipleActivityTypes = $('#filterProjectActivityType').multipleSelect("getSelects", "text");

            var multipleActivityTypesCE = $('#filterProjectActivityTypeCE').multipleSelect("getSelects", "value");

            // Culture (2007-2013)
            var filterProjectActivityType=processMultipleValues(multipleActivityTypes);
            // Creative Europe
            var filterProjectActivityTypeCE=processMultipleValues(multipleActivityTypesCE);

            // Choose proper activity type based on Programme
            var filterProjectActivityTypeResult = "";
            if ($.trim(filterProjectLevel1)=="eve001_cult_2007") {
                // Culture (2007-2013)
                filterProjectActivityTypeResult = filterProjectActivityType;
            } else if ($.trim(filterProjectLevel1)=="31052583") {
                // Creative Europe
                filterProjectActivityTypeResult = filterProjectActivityTypeCE;
            }

			//set as valid params
			validParams = true;

			//to avoid several excluding filters
			//funding schema excludes Levels filters
			if ($.trim(filterProjectFunding)!="") {
				filterProjectLevel1 = "";
				filterProjectLevel2 = "";
				filterProjectLevel3 = "";
			} else if ($.trim(filterProjectFunding)=="" && $.trim(filterProjectLevel1)=="eve001_cult_2007"){
				//solving concept problem with level1 when is related
				//to old culture programmes -> Need to apply filter against CATEGORY and NOT level1
				filterProjectFunding = $.trim(filterProjectLevel1);
				filterProjectLevel1 = "";
				filterProjectLevel2 = "";
				filterProjectLevel3 = "";
			}
			//level3 filter excludes level1 and level2
			if ($.trim(filterProjectLevel3)!="") {
				filterProjectLevel1 = "";
				filterProjectLevel2 = "";
			}
			//level2 excludes level1 and level3
			if ($.trim(filterProjectLevel2)!="") {
				filterProjectLevel1 = "";
				filterProjectLevel3 = "";
			}

			//region excludes Country
			if ($.trim(filterProjectRegion)!="") {
				filterProjectCountry = "";
			}

			//passing parameters and url to generate call
			queryParams = {"KEYWORD" : filterSimpleSearch, "SUCCESS_STORY": isSuccessStories, "FILTER-START_DATE" : filterProjectYear, "FILTER-CALL_YEAR" : filterProjectCallYear,
				"FILTER-COVERAGE" : filterProjectCountry, "FILTER-TAGS" : filterProjectActivityTypeResult ,
				"FILTER-PROJECT_STATUS" : searchTypeValue, "FILTER-LEVEL1" : filterProjectLevel1,
				"FILTER-LEVEL2" : filterProjectLevel2, "FILTER-LEVEL3" : filterProjectLevel3,
				"FILTER-CATEGORY" : filterProjectFunding, "FILTER-REGION" : filterProjectRegion,
				"sort" : orderByValue};

			webscriptUrl = webscriptUrl + "&searchType=advanced&indexTypeSearch=projectPublicSearch" ;

            //if organization criteria collect specific filters
        } else if (selectedTab==1) {

            //search against organization obtaining parameters
            var filterOrganizationName=getSimpleSearchValueTextbox();
            if(filterOrganizationName=="${msg("input.organizationSimpleSearch")}")
                filterOrganizationName="";

            var filterOrganizationCountry=processMultipleValues($('#filterOrganizationCountry').multipleSelect("getSelects"));
            var filterOrganizationRegion=processMultipleValues($('#filterOrganizationRegion').multipleSelect("getSelects"));

            var filterOrganizationType=processMultipleValues($('#filterOrganizationType').multipleSelect("getSelects"));

			//set as valid params
			validParams = true;

			//region excludes Country
			if ($.trim(filterOrganizationRegion)!="") {
				filterOrganizationCountry = "";
			}

			//passing parameters and url to generate call
			queryParams = {"KEYWORD" : filterOrganizationName, "SUCCESS_STORY": isSuccessStories,
				"FILTER-COUNTRY" : filterOrganizationCountry,
				"FILTER-PROJECT_STATUS" : searchTypeValue, "FILTER-TYPE" : filterOrganizationType,
				"FILTER-REGION" : filterOrganizationRegion,
				"sort" : orderByValue};

			webscriptUrl = webscriptUrl + "&searchType=advanced&indexTypeSearch=organisationPublicSearch" ;
        }

    } else {
        //advanced search for projects keywords only, as Simple Search
        //obtaining parameters
        var filterSimpleSearch=getSimpleSearchValueTextbox();
        if(filterSimpleSearch=="${msg("input.projectSimpleSearch")}" ||
		   filterSimpleSearch=="${msg("input.organizationSimpleSearch")}")
            filterSimpleSearch="";

		//set as valid params
		validParams = true;

		//passing parameters and url to generate call
		//if selected search type different to ALL projects perform a simple search, if not an advanced search
		if(searchTypeValue=="") {
			queryParams = {"KEYWORD" :  filterSimpleSearch,
				"SUCCESS_STORY": isSuccessStories,
				"sort" : orderByValue};
			webscriptUrl = webscriptUrl + "&searchType=simple&indexTypeSearch=projectPublicSearch" ;
		} else {
			queryParams = {"KEYWORD" :  filterSimpleSearch,
				"SUCCESS_STORY": isSuccessStories,
				"FILTER-PROJECT_STATUS" : searchTypeValue, "sort" : orderByValue};
			webscriptUrl = webscriptUrl + "&searchType=advanced&indexTypeSearch=projectPublicSearch" ;
		}

    }

    //check if valid params
    if (validParams) {
        //return url and params values
        return EncodeQueryData(webscriptUrl, queryParams);
    } else {
        return "";
    }
}

function buildSearchColumns(searchTypeValue){
    //check the search type to define the columns used in Datatable
    switch (searchTypeValue) {
        //Education search types
        case "projectPublicSearch":
            return [
                { "sName": "nodeRef", "sTitle": "nodeRef", "bVisible": false},
                { "sName": "title", "sTitle": "${msg("column.projectTitle")}", "sClass": "title_col", "mRender": displayProjectDetails},
                { "sName": "description", "sTitle": "${msg("column.description")}", "sClass": "description_col"},
                { "sName": "topics", "sTitle": "${msg("column.topics")}", "sClass": "topics_col"},
                { "sName": "startDate", "sTitle": "${msg("column.startYear")}", "sClass": "year2_col"},
                { "sName": "countries", "sTitle": "${msg("column.countries")}", "mRender": displayFlag, "sClass": "countries_col"}
            ];
            break;
        case "resultPublicSearch":
            return [
                { "sName": "nodeRef", "sTitle": "nodeRef", "bVisible": false},
                { "sName": "productNodeRef", "sTitle": "nodeRef", "bVisible": false},
                { "sName": "title", "sTitle": "${msg("column.productTitle")}", "sClass": "title_col", "mRender": displayProductDetails},
                { "sName": "projectTitle", "sTitle": "${msg("column.projectTitle")}", "sClass": "title_col", "mRender": displayProjectDetails},
                { "sName": "typology", "sTitle": "${msg("column.typology")}", "sClass": "typology_col"}
            ];
            break;
        //Culture search types
        case "ongoing":
        case "finalized":
        case ""://all projects
            return [
                { "sName": "nodeRef", "sTitle": "nodeRef", "bVisible": false},
                { "sName": "title", "sTitle": "${msg("column.projectTitle")}", "sClass": "title_col", "mRender": displayProjectDetails},
                { "sName": "description", "sTitle": "${msg("column.description")}", "sClass": "description_col"},
                { "sName": "startDate", "sTitle": "${msg("column.startYear")}", "sClass": "year_col"},
                { "sName": "countries", "sTitle": "${msg("column.countries")}", "mRender": displayFlag, "sClass": "countries_col"}
            ];
            break;
    }
}

//reload datatable to reuse the same object
function reloadDatatable( webscriptUrl, columns )
{
    //check if the table already exists
    if(isDataTable( $('#searchResults')[0] )) {
        var oTable = $('#searchResults').dataTable();
        //Delete and empty the table object first
        oTable.fnDestroy();
        $('#searchResults').empty();
    }else {
        //introText is showed, then replace with the datatable
        $('#troggleTextOrSearch').html('<div id="container"><div id="dynamic"><table cellpadding="0" cellspacing="0" border="0" class="display" id="searchResults"></table></div></div>');
    }
    //to show or not the pagination component based in the result obtained
<#assign hasResults="false">
    //Create the datatable for results
    var oTable = $('#searchResults').dataTable( {
        "sDom": '<"top"i>rt<flp>',
        "bProcessing": true,
        "oLanguage": {
            "sProcessing":  "<img src='${url.context}/valor/img/loading.gif'><p>${msg("search.loading")}</p>"
        },
        "fnInfoCallback": function( oSettings, iStart, iEnd, iMax, iTotal, sPre ) {

            if(iTotal>0){
                //commented because it's not needed?
			<#assign hasResults="true">
                var message = "Showing "+ iStart +" to "+ iEnd +" of "+ iTotal +" entries";

                //show the order criteria
                var orderDiv = $('#orderDiv').css('display','inline');
                $('.dataTables_paginate').css("display", "block");
                $('.dataTables_paginate').css("width", "960px");
                $('.dataTables_paginate').css("margin-bottom", "-90px");

				//show the "Download results as Excel" button, but only for search by projects, not for search by results
				$('#downloadExcelLinkContainer').remove();
				if (oSettings.sAjaxSource.indexOf("&indexTypeShow=projectPublicSearch&") > 0) {
					var webscriptExportUrl = webscriptUrl.replace(webscriptBaseUrl, webscriptExportBaseUrl);
					$('#searchResults_wrapper .top').prepend('<div id="downloadExcelLinkContainer" style="width:19%; float:right; text-align:right"><a id="downloadExcelLink" rel="nofollow" href="#">Download list as Excel (max. 1000 lines)</a></div>');
					$('#downloadExcelLink').prop('href', webscriptExportUrl);
				}

                return message;
            } else {
                //hide the order criteria
                var orderDiv = $('#orderDiv').css('display','none');
                $('.dataTables_paginate').css("display", "none");
                return "";
            }
        },
        "bServerSide": true,
        "bPaginate": true,
        "sPaginationType": "full_numbers",
        "sServerMethod": "GET",
        "sAjaxSource": webscriptUrl,
        "bDeferRender": true,
        "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
            oSettings.jqXHR = $.ajax( {
                "dataType": 'json',
                "type": "GET",
                "url": sSource,
                "data": aoData,
                "headers": {
                    "Accept-Language": "en-gb"
                },
                "success": fnCallback
            } );
        },
        "bFilter": false,
        "bSort": false,
        "bInfo": true,
        "bLengthChange": false,
        "iDisplayLength": 10,
        "aoColumns": columns
    } );
}


//on ready event
$(document).ready(function() {

    //capture the keyup to made a project search when press enter
    $("#filterSimpleSearch").keyup(function(event){
        if(event.keyCode == 13){
            $("#btnSearch").click();
        }
    });

    $("#filterSimpleSearch").hover(function(){
                //Mouse Over
                alertSearchPerformance("show");
            },
            function(){
                //Mouse Out
                alertSearchPerformance("hide");
            });
    //TODO capture event to ensure the keyword parameter is provided

    //click on search when order changes
    $("#orderBy").change(function(){
        $("#btnSearch").click();
    });

    //btnSearch click event
    $("#btnSearch").click(function(){
        //get the order criteria
        var orderByValue = $('#orderBy').find(":selected").val();

        //check the search type selection
        var searchTypeSelection = $('input[name=searchType]');
        var searchTypeValue = searchTypeSelection.filter(':checked').val();

        //initialize the webscript call url, empty by default
        var webscriptUrl = "";
        //initialize the columns variable
        var columns = [];

	<#if domain=="eplus">
        webscriptUrl = buildEducationSearchParams(searchTypeValue,orderByValue);
	<#elseif domain=="ce">
        webscriptUrl = buildCultureSearchParams(searchTypeValue,orderByValue);
	</#if>

        //define the columns based in search type
        columns = buildSearchColumns(searchTypeValue);

        //ensure that we recieve the webscriptURL, if not is because validation
        if(webscriptUrl!="") {
            //general function to reload datatable
            reloadDatatable(webscriptUrl, columns);
        }
    });
});


function getSimpleSearchValueTextbox(){
	var texttoEscape=($.trim($('#filterSimpleSearch').val()));
	return texttoEscape;
}


</script>


<style>
	.layout-results {
		clear: both;
		margin: 0 -9px 0 -15px;
	}

	.eplus-ce-map-container {
		display: none;
	}

	#searchResults {
		width: 984px;
	}

	#searchResults_paginate {
		margin: 0 auto !important;
		width: 984px !important;
	}
</style>

<!-- SLIDER -->
<div class="clearer"></div>
<div class="banner-wrapper">
    <div id="slider-banner" class="bc-input">
        <div class="slide-1"> <img border="0" src="${url.context}/valor/images/${domain}_slidea.jpg" class="euImg" alt="Europe"> <span class="clear">&nbsp;</span> </div>
        <div class="slide-2"> <img border="0" src="${url.context}/valor/images/${domain}_slideb.jpg" class="euImg" alt="Europe"> <span class="clear">&nbsp;</span> </div>
        <div class="slide-3"> <img border="0" src="${url.context}/valor/images/${domain}_slidec.jpg" class="euImg" alt="Europe"> <span class="clear">&nbsp;</span> </div>
        <div class="slide-4"> <img border="0" src="${url.context}/valor/images/${domain}_slided.jpg" class="euImg" alt="Europe"> <span class="clear">&nbsp;</span> </div>
        <span class="clear">&nbsp;</span>
        <ul class="slide-control">
            <li class="slide-previous-area"><a id="previous">${msg("slider.previous")}</a></li>
            <li class="slide-next-area"><a id="next">${msg("slider.next")}</a></li>
        </ul>
    </div>
    <ul id="nav-img-slideshow">
        <li id="slide-1"><a>1</a></li>
        <li id="slide-2"><a>2</a></li>
        <li id="slide-3"><a>3</a></li>
        <li id="slide-4"><a>4</a></li>
    </ul>
</div>
<!-- END of SLIDER-->

<div>&nbsp;</div>
<div class="landing-page-fieldset">
    <!--h3>${msg("search.advanced")}</h3-->

<#if domain=="eplus">
	<#include "/search/eplus/advancedSearchForm.ftl"/>
<#elseif domain=="ce">
	<#include "/search/ce/advancedSearchForm.ftl"/>
<#elseif domain=="efc">
	<#include "/search/efc/advancedSearchForm.ftl"/>
</#if>
</div>

<div class="layout-results">
	<div class="eplus-ce-tab-switcher-container"></div>

	<div id="troggleTextOrSearch">
		<#include "/search/common/introText.ftl"/>
	</div>
	<div class="eplus-ce-map-container"></div>
</div>
