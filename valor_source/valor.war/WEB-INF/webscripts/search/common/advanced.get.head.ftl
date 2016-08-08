<!-- Utils JS for search -->
<script src="${url.context}/valor/js/utils/searchUtils.lib.js" type="text/javascript"></script>
<!-- Country and region list -->
<script src="${url.context}/valor/js/utils/countryRegionsList.js" type="text/javascript"></script>

<!-- Slideshow locally stored -->
<script src="${url.context}/valor/js/slideshow.js" type="text/javascript"></script>

<!-- Expander control -->
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxexpander.js"></script>

<!-- Tab control -->
<script type="text/javascript" src="${url.context}/valor/js/jqwidgets/jqxtabs.js"></script>

<!-- hack to styles to apply localy in this page -->
<style>
        /* changes for expander and tabs border lines at advanced search page */
    .jqx-expander-header, .jqx-expander-content
    {
        border-left-width: 0px;
        border-right-width: 0px;
        border-bottom-width: 0px;
        border-top-width: 0px;
        opacity: 0.9;
    }
    .jqx-expander-header {
        overflow: inherit !important;
    }
    .jqx-expander-content {
        width: 100%;
        position: relative;
        z-index: 100;
        border-bottom: 1px solid grey;
    }
    .jqx-tabs-bootstrap {
        border-width: 0;
    }
        /* tabs font color and size */
    .jqx-tabs-title-selected-bottom-bootstrap, .jqx-tabs-selection-tracker-bottom-bootstrap {
        font-weight: bold;
    }
    .jqx-tabs-title-bootstrap, .jqx-tabs-title-bottom-bootstrap, .jqx-expander-header-bootstrap {
        color: #555555 !important;
    }
    .jqx-tabs-title-bootstrap, .jqx-tabs-title-bottom-bootstrap, .jqx-expander-header-bootstrap {
        color: #555555 !important;
    }
</style>


<link rel="stylesheet" type="text/css" href="${url.context}/valor/css/multiple-select/multiple-select.css">

<link rel="stylesheet" href="${url.context}/valor/js/spa/lib/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/lib/leaflet/leaflet.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/lib/leaflet.prunecluster/dist/LeafletStyleSheet.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/lib/leaflet.fullscreen/dist/leaflet.fullscreen.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/lib/leaflet.easybutton/dist/easy-button.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/assets/styles/reset-prunecluster.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/assets/styles/reset-easybutton.css">
<link rel="stylesheet" type="text/css" href="${url.context}/valor/js/spa/assets/styles/styles.css">


<script src="${url.context}/valor/js/jquery.multiple.select.js"></script>
<script>
    $(document).ready(function() {
        $("#filterProjectYear").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterProjectCallYear").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterProjectCountry").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterProjectRegion").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterProjectActivityType").multipleSelect({selectAll:false, maxHeight:120, position:'top'});
        $("#filterProjectActivityTypeCE").multipleSelect({selectAll:false, maxHeight:120, position:'top'});
        $("#filterProjectTopic").multipleSelect({selectAll:false, maxHeight:120, position:'top'});
        $("#filterOrganizationCountry").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterOrganizationRegion").multipleSelect({selectAll:false, maxHeight:120});
        $("#filterOrganizationType").multipleSelect({selectAll:false, maxHeight:87, position: 'top'});
        $("#filterOrganizationRole").multipleSelect({selectAll:false, maxHeight:120, position: 'top'});
    });
</script>

