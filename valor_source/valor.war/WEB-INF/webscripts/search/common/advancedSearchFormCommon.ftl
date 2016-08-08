<script type="text/javascript" src="${url.context}/valor/js/jquery-textrange-1.3.0.min.js"></script>
<script type="text/javascript">
//change the text of placeholder and name of input between Project and Organization
function switchSearchByProjectOrOrganization(selectedTab) {
    var value="";
    if(selectedTab==0){
        $("#filterSimpleSearch").attr("placeholder", "${msg("input.projectSimpleSearch")}").val(value).focus().blur();
        $("#filterSimpleSearch").attr("name", "filterSimpleSearchProject");

        $("#btnResetFilters").css('top', clearFiltersButtonTopForTab0);

        clearValues(selectedTab);
    }
    else if(selectedTab==1){
        //check if we keep provided value
        $("#filterSimpleSearch").attr("placeholder", "${msg("input.organizationSimpleSearch")}").val(value).focus().blur();
        $("#filterSimpleSearch").attr("name", "filterSimpleSearchOrganization");

        $("#btnResetFilters").css('top', clearFiltersButtonTopForTab1);

        clearValues(selectedTab);
    } else {
        if(value=$("#filterSimpleSearch").attr("name")=="filterSimpleSearchOrganization") {
            $("#filterSimpleSearch").attr("placeholder", "${msg("input.projectSimpleSearch")}").val("").focus().blur();
            $("#filterSimpleSearch").attr("name", "filterSimpleSearchProject");
        }
    }
}

function populateDropdown(drop, items) {
    drop.empty();
    for(var i = 0; i < items.length; i++) {
        drop.append('<option value=' + items[i].value + '>' + items[i].label + '</option>');
    }
    //drop.show();
}


$(document).ready(function () {

    //fix for placeholder in IE
    $('[placeholder]').focus(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
            input.val('');
            input.removeClass('placeholder');
        }
    }).blur(function() {
                var input = $(this);
                if (input.val() == '' || input.val() == input.attr('placeholder')) {
                    input.addClass('placeholder');
                    input.val(input.attr('placeholder'));
                }
            }).blur();

    //country change event for project
    $('#filterProjectCountry').change(function() {
        var $countriesCombo = $('#filterProjectCountry');
        var $regionsCombo = $('#filterProjectRegion');
        showRegionsForCountry($countriesCombo, $regionsCombo);
    });

    //country change event for organisations
    $('#filterOrganizationCountry').change(function() {
        var $countriesCombo = $('#filterOrganizationCountry');
        var $regionsCombo = $('#filterOrganizationRegion');
        showRegionsForCountry($countriesCombo, $regionsCombo);
    });

    function showRegionsForCountry($countriesCombo, $regionsCombo) {
        //var selectedCountries = $countriesCombo.eq(0).val();
        var selectedCountries = $countriesCombo.multipleSelect("getSelects");
        if (selectedCountries.length == 1 && selectedCountries[0] != "[none]") {
            var countryCode = selectedCountries[0];
            var regionsOfCountry = countryRegions[countryCode];

            // Add the "All regions" entry
            //if (regionsOfCountry[0].value != "[none]") {
            //	var allRegions = { value:"[none]", code: "", label: "All Regions" };
            //	regionsOfCountry.splice(0, 0, allRegions);
            //}

            //populate region combo
            populateDropdown($regionsCombo, regionsOfCountry);
            $regionsCombo.multipleSelect("refresh");

        } else {
            $regionsCombo.empty();
            $regionsCombo.multipleSelect("refresh");
        }
    }

    // Create Tabs
    $('#jqxTabs_advancedSearchFilters').jqxTabs({ width: 'auto', height: 'auto', position: 'bottom', theme: "bootstrap", animationType: 'fade'  });
    // Create jqxExpander
    $("[id^=jqxExpander]").jqxExpander({ width: '98.5%', theme: "bootstrap", expanded: false, showArrow: true });

    $('#jqxExpander_advancedProjectSearchFilters').on('expanded', function () {
        //change the text of project more/less filters
        $("#moreFilterText").text("${msg("search.lessFilters")}");
        //$("#btnResetFilters").show();
        //$("#btnResetFilters").detach().prependTo('.jqxExpander_advancedProjectSearchFilters_header');
        $("#btnResetFilters").detach().appendTo('#jqxExpander_advancedProjectSearchFilters');

        //logic to perform the search against project or organizations
        /*var selectedTab = $('#jqxExpander_advancedProjectSearchFilters').jqxTabs('selectedItem');
switchSearchByProjectOrOrganization(selectedTab);*/
        //when expanded pre-select first tab
        $('#jqxTabs_advancedSearchFilters').jqxTabs({ selectedItem: 0 });
    });
    $('#jqxExpander_advancedProjectSearchFilters').on('collapsed', function () {
        //change the text of project more/less filters
        $("#moreFilterText").text("${msg("search.moreFilters")}");
        //$("#btnResetFilters").hide();
        $("#btnResetFilters").detach().prependTo('.jqxExpander_advancedProjectSearchFilters_content');

        //logic to perform the search against project or organizations
        var selectedTab = $('#jqxTabs_advancedSearchFilters').jqxTabs('selectedItem');
        switchSearchByProjectOrOrganization(selectedTab);

        //to fix all validation when switch to simple search
        $('#filterSimpleSearch').css('border','1px solid #BBBBBB');
        $('#filterSimpleSearch').css('height','25px');
        $('#filterSimpleSearch').jqxTooltip('close');
        $('#filterSimpleSearch').jqxTooltip({ disabled: true });
        //advanced search filters too
        $('#moreFilterText').css('color','#555555');
        $('#moreFilterText').jqxTooltip('close');
        $('#moreFilterText').jqxTooltip({ disabled: true });
    });

    //event to hook the tab change event
    $('#jqxTabs_advancedSearchFilters').on('selected', function (event)
    {
        var selectedTab = event.args.item;
        switchSearchByProjectOrOrganization(selectedTab);
    });


    //Clear Project or Organization criteria
    $("#btnResetFilters").click(function(event){
        //check in which tab i am positioning
        var selectedTab = $('#jqxTabs_advancedSearchFilters').jqxTabs('selectedItem');
        clearValues(selectedTab);

        $('input[name="searchType"][value=""]').prop('checked', true);

        // Fix for the problem when 'Clear filters' button pressed, the default sorting
        // is different for searching by projects or by results.
        var searchTypeSelection = $('input[name=searchType]');
        var searchTypeValue = searchTypeSelection.filter(':checked').val();

        switch (searchTypeValue) {
            case "resultPublicSearch":
                $('#orderBy').val("PROJECT_MODIFIED_DATE-DESC");
                break;
            case "projectPublicSearch":
                $('#orderBy').val("MODIFIED_DATE-DESC");
                break;
        }

        event.stopPropagation();
    });

    //focus for keyword search
    $("#filterSimpleSearch").focus(function() {
        this.select();
    });
    $("#filterSimpleSearch").focus();

});

function clickToSelect(field) {
    var $field = $(field);
//		// If there is no selection existing, then select the entire text field
//		if ($field.textrange('get', 'length') == 0) {
//			$field.textrange('set');
//		}
    // Since the above does not work, we will have to store the selected state somewhere else
    if ($field.data("isTextSelected")) {
        $field.data("isTextSelected", false);
    } else {
        field.select();
        $field.data("isTextSelected", true);
    }
}
</script>

