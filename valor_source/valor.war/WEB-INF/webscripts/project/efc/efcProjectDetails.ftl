<div id="jqxTabs" style="width: 90%; margin: 10px auto;">

<#assign programme = project.level1Label/>

<ul>
    <li id="tabProjectTitle" style="margin-left: 30px;">${msg('tab.project')}</li>
    <li id="tabCoordinatorTitle">${msg('tab.coordinatingOrg')}</li>
    <li id="tabPartnersTitle">${msg('tab.partnerOrg')}</li>
    <li id="tabPartnersMapTitle">${msg('tab.projectMap')}</li>
</ul>

<div id="tabProject"> <!-- First Tab -->
<#if project.logoUrl?has_content>
    <div id="projectLogoContainer">
        <img id="logoImage" src="${url.context}${project.logoUrl}" alt="Project logo"/>
    </div>
</#if>
    <div id="badges">
	<#if project.goodPractice?exists && project.goodPractice>
        <span class="badge badge-good-practices" title="${msg("prop.good_practices_description")}">${msg("prop.good_practice_example")}</span>
	</#if>
	<#if project.successStory?exists && project.successStory>
        <span class="badge badge-success-stories" title="${msg("prop.success_stories_description")}">${msg("prop.success_story")}</span>
	</#if>
    </div>
    <!-- Programme -->
    <div id="valorlevel1"><@ctrl.selfhidingtextfield field="${programme}" label="${msg('prop.programme')}" link="false" /></div>
    <div id="valoridentifier"><@ctrl.selfhidingtextfield field="${project.identifier}" label="${msg('prop.identifier')}" link="false" /></div>


    <!--Title-->
    <div id="valortitle"><@ctrl.selfhidingtextfield field="${project.title}" label="${msg('prop.title')}" link="false" /></div><!--/Title-->

    <!--Summary-->
    <div id="valorsummary">
        <fieldset><legend>${msg('prop.summary')}
        </legend>
		<@ctrl.selfhidingtextfield field="${project.description}" label="" link="false" />
        </fieldset>
    </div><!--/Summary-->

    <!--Info-->
    <div class="set" id="valorinfo">
        <div class="twocolumn">
            <fieldset>

                <!-- columns-->
                <div class="ce-twocolumn-left">
				<#if project.startDate?exists && project.startDate?has_content>
					<@ctrl.selfhidingtextfield field="${project.startDate}" label="${msg('prop.startDate')}" link="false" />
				</#if>
				    	<#if project.endDate?exists && project.endDate?has_content>
					<@ctrl.selfhidingtextfield field="${project.endDate}" label="${msg('prop.endingDate')}" link="false" />
				</#if>
				    	<#if project.duration?exists && project.duration?has_content>
					<@ctrl.selfhidingtextfield  field="${project.duration}" label="${msg('prop.duration')}" link="false" />
				</#if>
                </div>
                <div class="ce-twocolumn-right">
				<#--<#if project.grantedAmount?exists && project.grantedAmount?has_content>-->
					<#--<@ctrl.selfhidingtextfield field="${project.grantedAmount}" label="${msg('prop.ecContribution')}" link="false"/>-->
				<#--</#if>-->
				<#if project.totalAmount?exists && project.totalAmount?has_content>
					<@ctrl.selfhidingtextfield field="${project.totalAmount}" label="${msg('prop.totalBudget')}" link="false"/>
				</#if>
                </div>
            </fieldset>
        </div>
    </div>

    <!--Details-->
    <div id="valordetails">
        <fieldset>
            <legend>${msg('prop.details')}</legend>
		<#if project.callYear?exists && project.callYear?has_content>
			<@ctrl.selfhidingtextfield field="${project.callYear}" label="${msg('prop.callYear')}" link="false" />
		</#if>
		<#if project.countries?exists && project.countries?has_content>
			<@ctrl.selfhidingflagfield field="${project.countries}" label="${msg('prop.countries')}" />
		</#if>
		<#if project.website?exists && project.website?has_content>
			<@ctrl.selfhidingtextfield field="${project.website}" label="${msg('prop.website')}" link="true" />
		</#if>
		<#if project.level2Label?exists>
			<@ctrl.selfhidingtextfield field="${project.level2Label}" label="${msg('prop.activity')}" link="false" />
		</#if>
		<#if project.level3Label?exists>
			<#if project.level3Label != project.level2Label>
				<@ctrl.selfhidingtextfield field="${project.level3Label}" label="${msg('prop.subactivity')}" link="false" />
			</#if>
		</#if>
        </fieldset>
    </div>

</div>

<div id="tabCoordinator"> <!-- second Tab -->
    <div class="set" id="coordinatorcontact">
        <div>
            <div id="valorcoordinator">
                <fieldset><legend>${msg('prop.coordinator_title')}</legend>
					<#if coordinating.name?exists && coordinating.name?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.name}" label="${msg('prop.coordinator_organisation')}" link="false" />
					</#if>
					<#if coordinating.firstName?exists && coordinating.firstName?has_content>
						<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${legalRepresentative.firstName}" label="${msg('prop.coordinator_name')}"/>
					</#if>
					<#if coordinating.lastName?exists && coordinating.lastName?has_content>
						<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${legalRepresentative.lastName}" label="${msg('prop.coordinator_lastName')}"/>
					</#if>
					<#if coordinating.street?exists && coordinating.street?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.street}" label="${msg('prop.coordinator_address')}" link="false" />
					</#if>
					<#if coordinating.postalCode?exists && coordinating.postalCode?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.postalCode}" label="${msg('prop.coordinator_postalcode')}" link="false" />
					</#if>
					<#if coordinating.city?exists && coordinating.city?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.city}" label="${msg('prop.coordinator_city')}" link="false" />
					</#if>
					<#if coordinating.country?exists && coordinating.country?has_content>
						<@ctrl.selfhidingflagfield field="${coordinating.country}" label="${msg('prop.coordinator_country')}"/>
					</#if>
					<#if coordinating.region?exists && coordinating.region?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.region}" label="${msg('prop.coordinator_region')}" link="false"/>
					</#if>
					<#--<#if coordinating.email?exists && coordinating.email?has_content>-->
						<#--<@ctrl.selfhidingtextfield field="${coordinating.email}" label="${msg('prop.coordinator_email')}" link="false" />-->
					<#--</#if>-->
					<#--<#if coordinating.phone?exists && coordinating.phone?has_content>-->
						<#--<@ctrl.selfhidingtextfield field="${coordinating.phone}" label="${msg('prop.coordinator_phone')}" link="false" />-->
					<#--</#if>-->
					<#if coordinating.type?exists && coordinating.type?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.type}" label="${msg('prop.coordinator_type')}" link="false" />
					</#if>
					<#if coordinating.website?exists && coordinating.website?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.website}" label="${msg('prop.coordinator_website')}" link="true" />
					</#if>
					<#if coordinating.pic?exists && coordinating.pic?has_content >
						<@ctrl.selfhidingtextfield field="${coordinating.pic}" label="${msg('prop.coordinator_pic')}" link="false" />
					</#if>
                </fieldset>
            </div>
		<#if contactPerson?has_content>

			<#if coordinating.showName?exists && coordinating.showName||
			coordinating.showMail?exists && coordinating.showMail ||
			coordinating.showPhone?exists && coordinating.showPhone>

                <div id="valorcontact">
                    <fieldset><legend>${msg('prop.contact_title')}</legend>
						<#if contactPerson.firstName?exists && contactPerson.firstName?has_content>
							<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.firstName}" label="${msg('prop.contact_name')}"/>
						</#if>
						<#if contactPerson.lastName?exists && contactPerson.lastName?has_content>
							<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.lastName}" label="${msg('prop.contact_lastName')}"/>
						</#if>
						<#if contactPerson.email?exists && contactPerson.email?has_content>
							<@ctrl.confidentialdata confidential="${(!coordinating.showMail)?string}" field="${contactPerson.email}" label="${msg('prop.contact_email')}"/>
						</#if>
						<#if contactPerson.phone?exists && contactPerson.phone?has_content>
							<@ctrl.confidentialdata confidential="${(!coordinating.showPhone)?string}" field="${contactPerson.phone}" label="${msg('prop.contact_phone')}"/>
						</#if>
                    </fieldset>
                </div>
			</#if>

		</#if>
        </div>
    </div>
</div>

<div id="tabPartners"> <!-- third Tab -->
    <!--Partners-->
    <div class="set" id="partners">

	<#if partners?exists && partners?has_content>
		<#list partners as partner>
			<#if partner?exists && !partner.withdrawnFromProject>
                <div id='jqxExpander_${partner_index}'>
                    <div class="person-header">
                        <div class="partner-organisation">${partner.name!''}</div><div class="partner-flag"><@ctrl.selfhidingflagfield field="${partner.country}" label="${msg('prop.partner_country')}" /></div>
                    </div>
                    <div class="person-details">
						<#if partner.CPFirstName?exists && partner.CPFirstName?has_content>
						<#--<@ctrl.selfhidingtextfield field="${partner.CPFirstName}" label="${msg('prop.partner_name')}" link="false" />-->
							<@ctrl.confidentialdata confidential="${(!partner.showName)?string}" field="${partner.CPFirstName}" label="${msg('prop.partner_name')}"/>
						</#if>
						<#if partner.CPLastName?exists && partner.CPLastName?has_content>
						<#--<@ctrl.selfhidingtextfield field="${partner.CPLastName}" label="${msg('prop.partner_lastName')}" link="false" />-->
							<@ctrl.confidentialdata confidential="${(!partner.showName)?string}" field="${partner.CPLastName}" label="${msg('prop.partner_lastName')}"/>
						</#if>
						<#if partner.street?exists && partner.street?has_content>
							<@ctrl.selfhidingtextfield field="${partner.street}" label="${msg('prop.partner_address')}" link="false" />
						</#if>
						<#if partner.postalCode?exists && partner.postalCode?has_content>
							<@ctrl.selfhidingtextfield field="${partner.postalCode}" label="${msg('prop.partner_postalCode')}" link="false" />
						</#if>
						<#if partner.CPEmail?exists && partner.CPEmail?has_content>
						<#--<@ctrl.selfhidingtextfield field="${partner.CPEmail}" label="${msg('prop.partner_email')}" link="false" />-->
							<@ctrl.confidentialdata confidential="${(!partner.showMail)?string}" field="${partner.CPEmail}" label="${msg('prop.partner_email')}"/>
						</#if>
						<#if partner.CPPhone?exists && partner.CPPhone?has_content>
						<#--<@ctrl.selfhidingtextfield field="${partner.CPPhone}" label="${msg('prop.partner_phone')}" link="false" />-->
							<@ctrl.confidentialdata confidential="${(!partner.showPhone)?string}" field="${partner.CPPhone}" label="${msg('prop.partner_phone')}"/>
						</#if>
						<!-- Second column -->
						<#if partner.region?exists && partner.region?has_content>
							<@ctrl.selfhidingtextfield field="${partner.region}" label="${msg('prop.partner_region')}" link="false" />
						</#if>
						<#if partner.city?exists && partner.city?has_content>
							<@ctrl.selfhidingtextfield field="${partner.city}" label="${msg('prop.partner_city')}" link="false" />
						</#if>
						<#if partner.website?exists && partner.website?has_content>
							<@ctrl.selfhidingtextfield field="${partner.website}" label="${msg('prop.partner_website')}" link="true" />
						</#if>

						<#if partner.type?exists && partner.type?has_content>
							<@ctrl.selfhidingtextfield field="${partner.type}" label="${msg('prop.partner_type')}" link="false" />
						</#if>
						<#if partner.pic?exists && partner.pic?has_content >
							<@ctrl.selfhidingtextfield field="${partner.pic}" label="${msg('prop.partner_pic')}" link="false" />
						</#if>
                    </div>
                </div>
			</#if>
		</#list>
	<#else>
        <div id="noresults">${msg('prop.nopartners')}</div>
	</#if>
    </div>
</div>

<div id="tabPartnersMap"> <!-- fourth Tab -->
	<div class="efc-project-partners-container">
	</div>
</div>

</div>

<div class="efc-projects-disclaimer">
	Within the Europe for Citizens Programme, the information available on the Website refers to the content submitted by the beneficiaries, as the data is retrieved directly from the application, at the moment of the selection.
</div>

<script type="text/javascript">
    $(document).ready(function () {
        // Create Tabs
        jQuery('#jqxTabs').jqxTabs({ width: 'auto', height: 'auto', position: 'top', theme: "energyblue" });
		jQuery('#jqxTabs').on('selected', function (event) {
			if (document.createEvent) {
				// W3C
				var ev = document.createEvent('Event');
				ev.initEvent('resize', true, true);
				window.dispatchEvent(ev);
			} else {
				// IE
				document.fireEvent('onresize');
			}
		});
        // Create jqxExpander
        jQuery("[id^=jqxExpander]").jqxExpander({ width: 'auto', theme: "energyblue", expanded: false });
    });
</script>

<script>
	var requirejs = {
	  config: {
		'efc.project-partners-page.main': {
		  projectId: '${project.nodeRef}'
		}
	  }
	}
</script>
<script data-main="${url.context}/valor/js/spa/efc.project-partners-page.main" src="${url.context}/valor/js/spa/lib/requirejs/require.js"></script>

