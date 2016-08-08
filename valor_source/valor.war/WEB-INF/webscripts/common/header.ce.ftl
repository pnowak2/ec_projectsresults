<div class="lang-en" id="header">
    <p class="banner-flag"> <img alt="${msg("links.europeanCommission")} logo" id="banner-flag" src="${url.context}/valor/images/logo_en.gif"> </p>
    <p id="banner-title-text">${msg("links.europeanCommission")}<br>
        <span>${msg("links.ceWebsite")}</span> </p>
    <span id="banner-image-right"></span><span class="title-en" id="banner-image-title"></span>
    <p class="off-screen">${msg("links.accesibilityTools")}</p>
    <ul class="reset-list" id="accessibility-menu">
        <li class="m-hide"> <a href="${url.context}/creative-europe/projects/">${msg("links.home")}</a> </li>
        <li class="m-hide"> <a href="#menu">${msg("links.menu")}</a> </li>
        <li> <a accesskey="1" href="#content">${msg("links.goToContent")}</a> </li>
    </ul>
    <p class="off-screen">Service tools</p>
    <ul class="reset-list" id="services">
        <li> <a accesskey="2" class="first" href="http://ec.europa.eu/geninfo/legal_notices_en.htm">${msg("links.legalNotice")}</a> </li>
        <li> <a accesskey="3" href="http://ec.europa.eu/cookies/index_en.htm">${msg("links.cookies")}</a> </li>
        <li> <a accesskey="4" href="http://ec.europa.eu/contact/index_en.htm">${msg("links.contact")}</a> </li>
        <li> <a accesskey="5" href="${url.context}/creative-europe/projects/">${msg("links.search")}</a> </li>
    </ul>
    <p class="off-screen mob-title" id="language-selector-title">Language selector</p>
    <ul class="reset-list language-selector" id="language-selector">
        <li class="selected" lang="en" title="${msg("links.langEnglish")}"> <span class="off-screen">${msg("links.currentLang")}:</span> en </li>
    </ul>
</div>
<div id="path">
    <p class="off-screen">${msg("links.navigationPath")}</p>
    <ul class="reset-list">
        <li class="first"> <a href="http://ec.europa.eu/index_en.htm">${msg("links.europeanCommission")}</a> </li>
        <li> <a href="${url.context}/index_en.htm">${msg("links.programmes")}</a> </li>
        <li> <a href="${url.context}/creative-europe/">${msg("links.ceWebsite")}</a> </li>
        <li> <a href="${url.context}/creative-europe/projects/">${msg("projects")}</a> </li>
        <!--li> ${msg("${page.title}")} </li-->
    </ul>
</div>
