<script type="text/javascript">
    var clearFiltersButtonTopForTab0 = '-322px';
    var clearFiltersButtonTopForTab1 = '-269px';

	function disableMultiSelect(multiSelectId) {
		$(multiSelectId).multipleSelect("setSelects", []);
		$(multiSelectId).multipleSelect("disable");
	}
	function enableMultiSelect(multiSelectId) {
		$(multiSelectId).multipleSelect("setSelects", []);
		$(multiSelectId).multipleSelect("enable");
	}


    //clear the values based on the selected tab
    function clearValues(selectedTab) {
        if(selectedTab==0){

            $('#filterProjectYear').multipleSelect("setSelects", []);
            $('#filterProjectCallYear').multipleSelect("setSelects", []);
            $('#filterProjectCountry').multipleSelect("setSelects", []);
            $('#filterProjectRegion').empty();
            $('#filterProjectLevel1').val("[none]");
            $('#filterProjectLevel2').val("[none]");
            $('#filterProjectLevel3').val("[none]");
            $('#filterProjectLevel2').prop("disabled", true);
            $('#filterProjectLevel2').css("color", "lightgray");
            $('#filterProjectLevel3').prop("disabled", true);
            $('#filterProjectLevel3').css("color", "lightgray");
            $('#filterProjectTopic').multipleSelect("setSelects", []);
            $('#filterProjectStatus').val("");
            $('#filterProjectTargetGroup').val("");
            disableMultiSelect('#filterProjectRegion');
			disableMultiSelect('#filterProjectCallYear');

        } else if(selectedTab==1){
            $('#filterOrganizationCountry').multipleSelect("setSelects", []);
            $('#filterOrganizationRegion').empty();
            $('#filterOrganizationType').multipleSelect("setSelects", []);
            $('#filterOrganizationRole').multipleSelect("setSelects", []);
        }
    }
</script>

<#include "/search/common/advancedSearchFormCommon.ftl"/>

<script type="text/javascript">
    $(document).ready(function () {

        $("#success-stories").click(function () {
            if($(this).is(":checked")) {
                $("#good-practices").prop('checked', true);
                $("#good-practices").attr('disabled', 'disabled');
            } else {
                $("#good-practices").prop('checked', false);
                $("#good-practices").removeAttr('disabled');
            }
        });

        //capture the search type change event
        $("input[name='searchType']").change(function(){
            //change the text of order criteria if changes are applies between Projects/Products search type
            var searchTypeSelection = $('input[name=searchType]');
            var searchTypeValue = searchTypeSelection.filter(':checked').val();//.toLowerCase();
            switch (searchTypeValue) {
                case "resultPublicSearch":
                case "projectPublicSearch":
                    $('#orderBy').find('option').remove().end();

                    //if products add the product title
                    if(searchTypeValue=="resultPublicSearch") {
                        //append the project modified date
                        $('#orderBy').append('<option id="order1" value="PROJECT_MODIFIED_DATE-DESC">${msg("order.mostRecent")}</option>');
                        //append the product title filter
                        $('#orderBy').append('<option id="order2" value="TITLE.UNTOUCHED-ASC">${msg("order.productTitle")}</option>');
                    }//if project add the project title and the start date
                    else if(searchTypeValue=="projectPublicSearch") {
                        //append the project modified date
                        $('#orderBy').append('<option id="order1" value="MODIFIED_DATE-DESC">${msg("order.mostRecent")}</option>');
                        //append the project title and start year filter
                        $('#orderBy').append('<option id="order2" value="TITLE.UNTOUCHED-ASC">${msg("order.projectTitle")}</option>');
                        $('#orderBy').append('<option id="order3" value="START_DATE-DESC">${msg("order.startYear")}</option>');
                    }

                    break;
            }

        });

        //Levels 1,2,3
        var level1 = [
            { value: "[none]", label: "All" },
            { value:"31046216", label: "Erasmus+", level2:
                    [
                        { value: "[none]", label: "All" },
                        { value:"31046220", label: "KA1: Learning Mobility of Individuals", level3: [
                            { value:"[none]", label: "All" },
						<#include "lov/projectLevel3KA1List.ftl"/>
                        ]
                        },
                        { value:"31046221", label: "KA2: Cooperation for innovation and the exchange of good practices", level3: [
                            { value:"[none]", label: "All" },
						<#include "lov/projectLevel3KA2List.ftl"/>
                        ]
                        },
                        { value:"31046222", label: "KA3: Support for policy reform", level3: [
                            { value:"[none]", label: "All"},
						<#include "lov/projectLevel3KA3List.ftl"/>
                        ]
                        },
                        { value:"31046223", label: "Jean Monnet", level3: [
                            { value:"[none]", label: "All"},
                            { value:"31046336", label: "Jean Monnet Chairs" },
                            { value:"31046337", label: "Jean Monnet Academic Modules" },
                            { value:"31046338", label: "Jean Monnet Centres of Excellence" },
                            { value:"31046339", label: "Support to Institutions and Associations" },
                            { value:"31046347", label: "Jean Monnet Networks" },
                            { value:"31046348", label: "Jean Monnet Projects" }
                        ]
                        },
                        { value:"31046224", label: "Sports", level3: [
                            { value:"[none]", label: "All"},
                            { value:"31046350", label: "Collaborative Partnerships" },
                            { value:"31046351", label: "Not-for-profit European sport events" }
                        ]
                        }
                    ]
            },
            { value:"eve000_educ_llp",label: "LLP (Life-long learning programme)" },
            { value:"eve004_youth_2007",label: "YiA (Youth in Action programme)" },
            { value:"eve000_educ_epp_co_co",label: "Co-operation with industrialised countries" },
            { value:"eve000_educ_epp_era",label: "Erasmus Mundus"},
            { value:"eve000_educ_epp_temp",label: "Tempus"},
            { value:"eve005_sports",label: "Sports"}
        ];

        $('#filterProjectLevel1').change(function() {
            var level1Index = $('#filterProjectLevel1')[0].selectedIndex;
            var level = level1[level1Index];

            if(level.value != "31046216" || $('#filterProjectLevel1').val().length > 1 ){
                $('#filterProjectLevel2').val("[none]");
                $('#filterProjectLevel2').prop("disabled", true);
                $('#filterProjectLevel2').css("color", "lightgray");
                $('#filterProjectLevel3').val("[none]");
                $('#filterProjectLevel3').prop("disabled", true);
                $('#filterProjectLevel3').css("color", "lightgray");
              
                disableMultiSelect('#filterProjectRegion');
				disableMultiSelect('#filterProjectCallYear');

            }else{
                $('#filterProjectLevel2').prop("disabled", false);
                $('#filterProjectLevel2').css("color", "#555555");
                $('#filterProjectLevel3').prop("disabled", false);
                $('#filterProjectLevel3').css("color", "#555555");
                populateDropdown( $('#filterProjectLevel2'), level.level2 );
                enableMultiSelect('#filterProjectRegion');
				enableMultiSelect('#filterProjectCallYear');
            }

        });

        $('#filterProjectLevel2').change(function() {
            var level1Index = $('#filterProjectLevel1')[0].selectedIndex;
            var parent = level1[level1Index];
            var level2Index =$('#filterProjectLevel2')[0].selectedIndex
            var level = parent.level2[level2Index];

            if (parent.value != "31046216"){
                $('#filterProjectLevel3').val("[none]");
                $('#filterProjectLevel3').prop("disabled", true);
                $('#filterProjectLevel3').css("color", "lightgray");
            }else{
                $('#filterProjectLevel3').prop("disabled", false);
                $('#filterProjectLevel3').css("color", "555555");
                populateDropdown( $('#filterProjectLevel3'), level.level3 );
            }

        });

        populateDropdown( $('#filterProjectLevel1'), level1 );
        $('#filterProjectLevel2').val("[none]");
        $('#filterProjectLevel2').prop("disabled", true);
        $('#filterProjectLevel2').css("color", "lightgray");
        $('#filterProjectLevel3').val("[none]");
        $('#filterProjectLevel3').prop("disabled", true);
        $('#filterProjectLevel3').css("color", "lightgray");
        disableMultiSelect('#filterProjectRegion');
		disableMultiSelect('#filterProjectCallYear');   
    });
</script>

<input placeholder="${msg("input.projectSimpleSearch")}" type="text" name="filterSimpleSearchProject" id="filterSimpleSearch" style="margin-left:6px; height: 25px; padding: 1px 6px 0;border: 1px solid #BBB;float:left;width: 80% !important;"/>
<input type="button" id="btnSearch" name="btnSearch" value="${msg("search")}">

<div style="margin-left:6px;width:98.5%;background-color:white;opacity:0.9;border-bottom:dashed 1px grey;">
	<span style="margin-left:4px;">
		<input class="radio" type="radio" value="projectPublicSearch" checked="checked" name="searchType" style="border:none !important;">
	${msg("projects")}
	</span>
	<span>
		<input class="radio" type="radio" value="resultPublicSearch" name="searchType" style="border:none !important;">
	${msg("products")}
	</span>
    <div id="valor-search-additional-criteria">
        <span class="valor-search-criteria">
            <input id="good-practices" value="good-practices" name="good-practices" type="checkbox">${msg("prop.good_practice_examples")}
            <img src="${url.context}/valor/images/info.png" title="${msg("prop.good_practices_description")}">
        </span>
        <span class="valor-search-criteria">
            <input id="success-stories" value="success-stories" name="success-stories" type="checkbox">${msg("prop.success_stories")}
            <img src="${url.context}/valor/images/info.png" title="${msg("prop.success_stories_description")}">
        </span>
    </div>
    <div id="orderDiv" style="display: none;"> <!-- To show at table header.. style="margin-top: -110px !important; display: none;position:absolute;"-->
		<span style="float:right;margin: 1px 0px 0px 2px;">
			<a href="${url.context}/erasmus-plus/projects/eplus-help/eplus_search_help.html#performing_simple_search" target="_blank"><img id="help" tabindex="0" title="${msg("search.eplusHelp")}" src="${url.context}/valor/images/help.png"></a>
		</span>
		<span style="float:right">
			${msg("orderBy")}
                <select id="orderBy" style="margin:none">
                    <option id="order1" value="MODIFIED_DATE-DESC" selected>${msg("order.mostRecent")}</option>
                    <option id="order2" value="TITLE.UNTOUCHED-ASC">${msg("order.projectTitle")}</option>
                    <option id="order3" value="START_DATE-DESC">${msg("order.startYear")}</option>
                </select>
		</span>
    </div>
</div>

<div class="erasmusPlusAdvancedSearchForm" id='jqxExpander_advancedProjectSearchFilters' style="margin-left:6px;margin-bottom:6px;opacity:1;">
    <div class='jqxExpander_advancedProjectSearchFilters_header' style="margin-left: 0px !important;">
        <div id="moreFilterText" style="margin-left: 700px !important;">
		${msg("search.moreFilters")}
        </div>
    </div>
    <div class='jqxExpander_advancedProjectSearchFilters_content'>
        <input type="button" id="btnResetFilters" name="btnReset" value="${msg("reset")}" style="top:-322px;" />
        <div id="jqxTabs_advancedSearchFilters">
            <ul style="width: auto;">
                <li style="width: auto;">${msg("search.tabProject")}</li>
                <li style="width: auto;">${msg("search.tabOrganization")}</li>
            </ul>
            <div id="tabProjectCriteria"> <!-- First Tab -->
                <!-- Year filter -->
                <div id="optionFilter-Year">
                    <label>${msg("filter.projectYear")}</label><br/>
                    <select id="filterProjectYear" style="width:7em" multiple="multiple" data-placeholder="All Years">
					<#include "/search/common/lov/projectYearList.ftl"/>
                    </select>
                </div>
                <!-- Country filter -->
                <div class="optionFilter-Country">
                    <label>${msg("filter.projectCountry")}</label><br/>
                    <select id="filterProjectCountry" style="width:22em" multiple="multiple" data-placeholder="All Countries">
					<#include "/search/common/lov/projectCountriesList.ftl"/>
                    </select>
                </div>
                <!-- Region filter -->
                <div class="optionFilter-Region">
                    <label>${msg("filter.projectRegion.eplus")}</label><br/>
                    <select id="filterProjectRegion" multiple="multiple" data-placeholder="All Regions"></select>
                    <div class="optionFilter-Region-Note">${msg("filter.projectRegion.eplus.note")}</div>
                </div>
				<!-- Call Year -->
				<div id="optionFilter-CallYear">
					<label>${msg("filter.callYear")}</label><br/>
					<select id="filterProjectCallYear" style="width:7em" multiple="multiple" data-placeholder="All Years">
					  <#include "/search/common/lov/projectCallYearList.ftl"/>				  		  		  		  		  		    		  		  		  		  		  		  
					</select>	
				</div> 
                <!-- Programme filter -->
                <div id="optionFilter-projectLevel1eplus">
                    <label>${msg("filter.projectProgramme")}</label><br/>
                    <select id="filterProjectLevel1" multiple>
                        <option value="[none]">All</option>
                    </select>
                </div>
                <!-- Action filter -->
                <div id="optionFilter-projectLevel2eplus">
                    <label>${msg("filter.projectAction")}</label><br/>
                    <select id="filterProjectLevel2">
                        <option value="[none]">All</option>
                    </select>
                </div>
                <!-- Action Type filter -->
                <div id="optionFilter-projectLevel3eplus">
                    <label>${msg("filter.projectActionType")}</label><br/>
                    <select id="filterProjectLevel3">
                        <option value="[none]">All</option>
                    </select>
                </div>

                <!-- Topic filter -->
                <div id="optionFilter-projectTopic">
                    <label>${msg("filter.projectTopic")}</label><br/>
                    <select id="filterProjectTopic" multiple="multiple" data-placeholder="All Topics">
					<#include "/search/eplus/lov/projectTopicList.ftl"/>
                    </select>
                </div>

                <!-- Status filter -->
                <div id="optionFilter-projectStatus">
                    <label>${msg("filter.projectStatus")}</label><br/>
                    <select id="filterProjectStatus">
                        <option id="status-all" value="">All</option>
					<#include "/search/eplus/lov/projectStatusList.ftl"/>
                    </select>
                </div>
                <!-- Target Group filter -->
                <div id="txtFilter-projectTargetGroup">
                    <label>${msg("filter.projectTargetGroup")}</label>
                    <input type="text" name="filterProjectTargetGroup" id="filterProjectTargetGroup" style="margin: 0 !important;"/>
                </div>
            </div>
            <div id="tabOrganizationCriteria"> <!-- Second Tab -->
                <!-- Country filter -->
                <div class="optionFilter-Country">
                    <label>${msg("filter.projectCountry")}</label><br/>
                    <select id="filterOrganizationCountry" multiple="multiple" data-placeholder="All Countries">
					<#include "/search/common/lov/projectCountriesList.ftl"/>
                    </select>
                </div>
                <!-- Region filter -->
                <div class="optionFilter-Region">
                    <label>${msg("filter.projectRegion.eplus")}</label><br/>
                    <select id="filterOrganizationRegion" multiple="multiple" data-placeholder="All Regions"></select>
                    <div class="optionFilter-Region-Note">${msg("filter.projectRegion.eplus.note")}</div>
                </div>

                <!-- Org Type filter -->
                <div id="optionFilter-OrgType">
                    <label>${msg("filter.organisationType")}</label><br/>
                    <select id="filterOrganizationType" multiple="multiple" data-placeholder="Any Organisation Type" style="width:400px;">
					<#include "/search/eplus/lov/organisationTypeList.ftl"/>
                    </select>
                </div>

                <!-- Role filter -->
                <div id="optionFilter-organizationRole">
                    <label>${msg("filter.organizationRole")}</label><br/>
                    <select id="filterOrganizationRole" multiple="multiple" data-placeholder="Any Role">
					<#include "/search/eplus/lov/organisationRoleList.ftl"/>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>

<script data-main="${url.context}/valor/js/spa/eplus-ce.landing-page.main" src="${url.context}/valor/js/spa/lib/requirejs/require.js"></script>