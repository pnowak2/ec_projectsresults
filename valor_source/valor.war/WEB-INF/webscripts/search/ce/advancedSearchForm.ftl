<script type="text/javascript">
	var clearFiltersButtonTopForTab0 = '-280px';
	var clearFiltersButtonTopForTab0_expanded = '-348px';
	var clearFiltersButtonTopForTab1 = '-218px';
    
	function hideOptionFilter_ProjectActivityType() {
		$('#optionFilter-projectActivityType').hide();
		$("#btnResetFilters").css('top', clearFiltersButtonTopForTab0);
	}
	function showOptionFilter_ProjectActivityType() {
		$('#optionFilter-projectActivityType').show();
		$("#btnResetFilters").css('top', clearFiltersButtonTopForTab0_expanded);
	}
	function disableSingleSelect(simpleSelectId) {
		$(simpleSelectId).val("[none]");
		$(simpleSelectId).prop("disabled", true);
		$(simpleSelectId).css("color", "lightgray");
	}
	function enableSingleSelect(simpleSelectId) {
		$(simpleSelectId).val("[none]");
		$(simpleSelectId).prop("disabled", false);
		$(simpleSelectId).css("color", "#555555");
	}
	function disableSimpleSelect(simpleSelectId) {
		$(simpleSelectId).val("");
		$(simpleSelectId).prop("disabled", true);
		$(simpleSelectId + ' option').css("color", "lightgray");
	}
	function enableSimpleSelect(simpleSelectId) {
		$(simpleSelectId).val("[none]");
		$(simpleSelectId).prop("disabled", false);
		$(simpleSelectId + ' option').css("color", "#555555");
	}
	function disableMultiSelect(multiSelectId) {
		$(multiSelectId).multipleSelect("setSelects", []);
		$(multiSelectId).multipleSelect("disable");
	}
	function enableMultiSelect(multiSelectId) {
		$(multiSelectId).multipleSelect("setSelects", []);
		$(multiSelectId).multipleSelect("enable");
	}
	function hideFilterProjectActivityType() {
		disableMultiSelect('#filterProjectActivityType');
		$('#divFilterProjectActivityType').hide();
	}
	function showFilterProjectActivityType() {
		enableMultiSelect('#filterProjectActivityType');
		$('#divFilterProjectActivityType').show();
	}
	function hideFilterProjectActivityTypeCE() {
		disableMultiSelect('#filterProjectActivityTypeCE');
		$('#divFilterProjectActivityTypeCE').hide();
	}
	function showFilterProjectActivityTypeCE() {
		enableMultiSelect('#filterProjectActivityTypeCE');
		$('#divFilterProjectActivityTypeCE').show();
	}
	
    //clear the values based on the selected tab 
    function clearValues(selectedTab) {
		if(selectedTab==0){
			
			$('#filterProjectYear').multipleSelect("setSelects", []);
			$('#filterProjectCallYear').multipleSelect("setSelects", []);
			$('#filterProjectCountry').multipleSelect("setSelects", []);
			$('#filterProjectRegion').empty();
			enableSingleSelect('#filterProjectLevel1');
			disableSingleSelect('#filterProjectLevel2');
			disableSingleSelect('#filterProjectLevel3');
			disableSingleSelect('#filterProjectFunding');
			disableMultiSelect('#filterProjectActivityType');
			disableMultiSelect('#filterProjectActivityTypeCE');
            hideOptionFilter_ProjectActivityType();
            disableMultiSelect('#filterProjectRegion');
			disableMultiSelect('#filterProjectCallYear');
		} else if(selectedTab==1){
			$('#filterOrganizationCountry').multipleSelect("setSelects", []);
			$('#filterOrganizationRegion').empty();
			$('#filterOrganizationType').multipleSelect("setSelects", []);
		}
    }
</script>

<#include "/search/common/advancedSearchFormCommon.ftl"/>

<script type="text/javascript">
    $(document).ready(function () {

        //Levels 1,2,3
		var level1 = [
		   	{ value: "[none]", label: "All" },
		   	{ value:"31052583", label: "Creative Europe", level2: 
			   	[
			   		{ value: "[none]", label: "All" },
			   		{ value:"31052584", label: "Culture", level3: [
				           { value:"[none]", label: "All" },
				           { value:"31061531", label: "Cooperation projects" },
				           { value:"31061532", label: "Literary translation" },
				           { value:"31061534", label: "Platforms" },
				           { value:"31061533", label: "Networks" }
				        ] 
			        },
			    	{ value:"31052594", label: "Media", level3: [
				           { value:"[none]", label: "All" },
				           { value:"31061522", label: "Video-Games Development Support" },
				           { value:"31061524", label: "Market Access Support" },
				           { value:"31061523", label: "TV Programming Support" },
				           { value:"31061525", label: "Festivals Support" },
				           { value:"31061526", label: "Training Support" },
						   { value:"31061528", label: "On-line Distribution" },
						   { value:"31061530", label: "Audience development" },
				           { value:"31061529", label: "Co-production Funds" }
				        ] 
			        }
			   ]
			},
		   	{ value:"eve001_cult_2007", label: "Culture (2007-2013)", level2: 
			   	[
			   		{ value: "[none]", label: "All" },
			   		{ value: "eve001_cult_2007_000", label: "Cooperation measures" },
			   		{ value: "eve001_cult_2007_001", label: "Cooperation with third countries" },
			   		{ value: "eve001_cult_2007_002", label: "Festivals" },
			   		{ value: "eve001_cult_2007_003", label: "Multi-annual Cooperation Projects" }
			   	],
		}
		];
		
		$('#filterProjectLevel1').change(function() {
		   var level1Index = $('#filterProjectLevel1')[0].selectedIndex;
		   var level = level1[level1Index];
		
			if (level.value == "[none]") {
				disableSingleSelect('#filterProjectLevel2');
				disableSingleSelect('#filterProjectLevel3');
				disableSingleSelect('#filterProjectFunding');
				hideFilterProjectActivityType();
				hideFilterProjectActivityTypeCE();
				hideOptionFilter_ProjectActivityType();
				disableMultiSelect('#filterProjectRegion');
				disableMultiSelect('#filterProjectCallYear');

			} else if (level.value == "eve001_cult_2007") {
				disableSingleSelect('#filterProjectLevel2');
				disableSingleSelect('#filterProjectLevel3');
				enableSingleSelect('#filterProjectFunding');
				disableMultiSelect('#filterProjectRegion');
				disableMultiSelect('#filterProjectCallYear');
				showFilterProjectActivityType();
				hideFilterProjectActivityTypeCE();
				showOptionFilter_ProjectActivityType();

				populateDropdown( $('#filterProjectFunding'), level.level2 );
			   
			} else if (level.value == "31052583") {
				enableSingleSelect('#filterProjectLevel2');
				disableSingleSelect('#filterProjectLevel3');
				disableSingleSelect('#filterProjectFunding');
				hideFilterProjectActivityType();	   		
				showFilterProjectActivityTypeCE();	   		
				enableMultiSelect('#filterProjectRegion');
				enableMultiSelect('#filterProjectCallYear');
				showOptionFilter_ProjectActivityType();
		   				   		
				populateDropdown( $('#filterProjectLevel2'), level.level2 );
			}
			
	
		});
		
		$('#filterProjectLevel2').change(function() {
		   var level1Index = $('#filterProjectLevel1')[0].selectedIndex;
		   var parent = level1[level1Index];
		   var level2Index =$('#filterProjectLevel2')[0].selectedIndex
		   var level = parent.level2[level2Index];
		   
		   if (parent.value != "31052583"){
		   		disableSingleSelect('#filterProjectLevel3');
		   } else {
		   		if (level.value == "[none]"){
	   				disableSingleSelect('#filterProjectLevel3');
	   			} else {
					enableSingleSelect('#filterProjectLevel3');
					populateDropdown( $('#filterProjectLevel3'), level.level3 );
				}
			}
			
		}); 
		
		populateDropdown( $('#filterProjectLevel1'), level1 );
		disableSingleSelect('#filterProjectLevel2');
		disableSingleSelect('#filterProjectLevel3');
		disableSingleSelect('#filterProjectFunding');
		hideFilterProjectActivityType();
		hideFilterProjectActivityTypeCE();
		hideOptionFilter_ProjectActivityType();
		disableMultiSelect('#filterProjectRegion');
		disableMultiSelect('#filterProjectCallYear');
	});
</script>

<input placeholder="${msg("input.projectSimpleSearch")}" type="text" name="filterSimpleSearchProject" id="filterSimpleSearch" style="margin-left:6px; height: 25px; padding: 1px 6px 0;border: 1px solid #BBB;float:left;width: 80% !important;"/>
<input type="button" id="btnSearch" name="btnSearch" value="${msg("search")}">

<div style="margin-left:6px;width:98.5%;background-color:white;opacity:0.9;border-bottom:dashed 1px grey;">
	<span style="margin-left:4px;">
		<input class="radio" type="radio" value="" checked="checked" name="searchType" style="border:none !important;">
		${msg("status.projects.all")}
	</span>
	<span style="margin-left:4px;">
		<input class="radio" type="radio" value="ongoing" name="searchType" style="border:none !important;">
		${msg("ongoingProjects")}
	</span>
	<span>
		<input class="radio" type="radio" value="finalized" name="searchType" style="border:none !important;">
		${msg("finalizedProjects")}
	</span>
    <div id="valor-search-additional-criteria">
        <span class="valor-search-criteria">
            <input id="success-stories" value="success-stories" name="success-stories" type="checkbox">${msg("prop.success_stories")}
            <img src="${url.context}/valor/images/info.png" title="${msg("prop.success_stories_description")}">
        </span>
    </div>
	<div id="orderDiv" style="display: none;"> <!-- To show at table header.. style="margin-top: -110px !important; display: none;position:absolute;"-->	
		<span style="float:right;margin: 1px 0px 0px 2px" >
			<a href="${url.context}/creative-europe/projects/ce-help/ce_general_help.html" target="_blank"><img id="help" tabindex="0" title="${msg("search.ceHelp")}" src="${url.context}/valor/images/help.png"></a>
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
    
<div class="creativeEuropeAdvancedSearchForm" id='jqxExpander_advancedProjectSearchFilters' style="margin-left:6px;margin-bottom:6px;opacity:1;">
	<div class='jqxExpander_advancedProjectSearchFilters_header' style="margin-left: 0px !important;">
		<div id="moreFilterText" style="margin-left: 700px !important;">
		${msg("search.moreFilters")}
		</div>
	</div>	
	<div class='jqxExpander_advancedProjectSearchFilters_content'>			
		<input type="button" id="btnResetFilters" name="btnReset" value="${msg("reset")}" style="top:-268px;" />
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
					  <!-- injection of year list -->
					  <#include "/search/common/lov/projectYearList.ftl"/>				  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
				<!-- Country filter -->
				<div class="optionFilter-Country">
					<label>${msg("filter.projectCountry")}</label><br/>
					<select id="filterProjectCountry" style="width:22em" multiple="multiple" data-placeholder="All Countries">
					  <!-- injection of countries list -->
					  <#include "/search/common/lov/projectCountriesList.ftl"/>			  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
				<!-- Region filter -->
				<div class="optionFilter-Region">
					<label>${msg("filter.projectRegion.ce")}</label><br/>
					<select id="filterProjectRegion" multiple="multiple" data-placeholder="All Regions"></select>
					<div class="optionFilter-Region-Note">${msg("filter.projectRegion.ce.note")}</div>
				</div>	
				
				<!-- Call Year -->
				<div id="optionFilter-CallYear">
					<label>${msg("filter.callYear")}</label><br/>
					<select id="filterProjectCallYear" style="width:7em" multiple="multiple" data-placeholder="All Years">
					  <!-- injection of year list -->
					  <#include "/search/common/lov/projectCallYearList.ftl"/>				  		  		  		  		  		    		  		  		  		  		  		  
					</select>	
				</div> 	
				
				<!-- Programme filter -->
				<div id="optionFilter-projectLevel1ce">
					<label>${msg("filter.projectProgramme")}</label><br/>
					<select id="filterProjectLevel1">
						<option value="[none]">All</option>															  			  		  		  		  		  		    		  		  		  		  		  		  
					</select>		
				</div> 			
				<!-- Subprogramme filter -->
				<div id="optionFilter-projectLevel2ce">
					<label>${msg("filter.projectSubprogramme")}</label><br/>	
					<select id="filterProjectLevel2">
						<option value="[none]">All</option>															  			  		  		  		  		  		    		  		  		  		  		  		  
					</select>								  			  		  		  		  		  		    		  		  		  		  		  		  		
				</div>
				<!-- Action filter -->
				<div id="optionFilter-projectLevel3ce">
					<label>${msg("filter.projectAction")}</label><br/>
					<select id="filterProjectLevel3">
						<option value="[none]">All</option>										  			  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
				<!-- Funding Scheme -->
				<div id="optionFilter-projectFunding">
					<label>${msg("filter.projectFundingScheme")}</label><br/>
					<select id="filterProjectFunding">
						<option value="[none]">All</option>										  			  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
				
				<!-- Activity type filter -->
				<div id="optionFilter-projectActivityType">
					<label>${msg("filter.projectActivityType")}</label><br/>
					<div id="divFilterProjectActivityType">
					<select id="filterProjectActivityType" multiple="multiple" data-placeholder="All Activities">
						<!-- injection of activity type list -->
						<#include "/search/ce/lov/projectActivityTypeList.ftl"/>			  		  		  		  		  		    		  		  		  		  		  		  
					</select>
					</div>
					<div id="divFilterProjectActivityTypeCE">
                    <select id="filterProjectActivityTypeCE" multiple="multiple" data-placeholder="All Activities">
                        <!-- injection of activity type list -->
                    	<#include "/search/ce/lov/projectActivityTypeCEList.ftl"/>
                    </select>
					</div>
                </div>
                <br/>
			</div>
			<div id="tabOrganizationCriteria"> <!-- Second Tab -->
				<!-- Country filter -->    
				<div class="optionFilter-Country">
					<label>${msg("filter.projectCountry")}</label><br/>
					<select id="filterOrganizationCountry" multiple="multiple" data-placeholder="All Countries">
					  <!-- injection of countries list -->
					  <#include "/search/common/lov/projectCountriesList.ftl"/>			  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
				<!-- Region filter -->
				<div class="optionFilter-Region">
					<label>${msg("filter.projectRegion.ce")}</label><br/>
					<select id="filterOrganizationRegion" multiple="multiple" data-placeholder="All Regions">
					</select>			
					<div class="optionFilter-Region-Note">${msg("filter.projectRegion.ce.note")}</div>
				</div>
				
				<!-- Org Type filter -->    
				<div id="optionFilter-OrgType">
					<label>${msg("filter.organisationType")}</label><br/>
					<select id="filterOrganizationType" multiple="multiple" data-placeholder="All Organisation Types" style="width:700px;">
					  <!-- injection of countries list -->
					  <#include "/search/ce/lov/organisationTypeList.ftl"/>			  		  		  		  		  		    		  		  		  		  		  		  
					</select>			
				</div>
			</div>
		</div>
	</div>
</div>

<script data-main="${url.context}/valor/js/spa/eplus-ce.landing-page.main" src="${url.context}/valor/js/spa/lib/requirejs/require.js"></script>