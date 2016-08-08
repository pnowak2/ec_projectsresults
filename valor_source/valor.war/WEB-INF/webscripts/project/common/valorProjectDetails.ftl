<script type="text/javascript">
    $(document).ready(function () {
		// Linkify results description
		$('.valor-result-description').linkify()
        // Create Tabs
        $('#jqxTabs').jqxTabs({ width: 'auto', height: 'auto', position: 'top', theme: "energyblue" });
		$('#jqxTabs').on('selected', function (event) {
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
		if($("[id^='jqxExpander']").length > 0) {
            $("[id^='jqxExpander']").jqxExpander({ width: 'auto', theme: "energyblue", expanded: false });
        }
        // Expand the product control if received by url
	<#if productId??>
        $("[id$=${productId}]").jqxExpander({ width: 'auto', theme: "energyblue", expanded: true });
        //for pre-select products tab
        $('#jqxTabs').jqxTabs({ selectedItem: 3 });
	</#if>

        $('.jqx-tabs-headerWrapper').prepend('<div id="pdf-download"></div>');

		$( "#pdf-download" ).bind( "click", function() {
			var url ='${url.context}/service/es/project/pdf?nodeRef=${project.nodeRef}&identifier=${project.identifier}';
			window.open(url,"_self");
		});
    });
</script>

<script>
	var requirejs = {
	  config: {
		'eplus-ce.project-partners-page.main': {
		  projectId: '${project.nodeRef}'
		}
	  }
	}
</script>
<script data-main="${url.context}/valor/js/spa/eplus-ce.project-partners-page.main" src="${url.context}/valor/js/spa/lib/requirejs/require.js"></script>

<div id="jqxTabs" style="width: 90%; margin: 10px auto;">

<#assign erasmusProgramme = "Erasmus+"/>
<#assign creativeProgramme = "CREATIVE EUROPE"/>
<#assign KA107 = "31064388"/>

<#assign programme = project.level1Label/>
<#assign level3 = project.level3/>

<#if programme?? && programme==erasmusProgramme>
<ul>
    <li id="tabProjectTitle" style="margin-left: 30px;">${msg('tab.project')}</li>
    <li id="tabCoordinatorTitle">${msg('tab.coordinatingOrg')}</li>
    <li id="tabPartnersTitle">${msg('tab.partnerOrg')}</li>
    <li id="tabProductsTitle">${msg('tab.products')}</li>
    <li id="tabPartnersMapTitle">${msg('tab.projectMap')}</li>
</ul>
<#elseif programme?? && programme==creativeProgramme>
<ul>
    <li style="margin-left: 30px;">${msg('tab.project')}</li>
    <li>${msg('tab.coordinator')}</li>
    <li>${msg('tab.partners')}</li>
    <li>${msg('tab.products')}</li>
    <li>${msg('tab.projectMap')}</li>
</ul>
</#if>

<div id="tabProject"> <!-- First Tab -->
<#if project.logoUrl?has_content>
    <div id="projectLogoContainer">
        <img id="logoImage" src="${url.context}${project.logoUrl}" alt="Project logo"/>
    </div>
</#if>
<#--
<#if project.logoNodeRef?exists>
    <div id="projectLogoContainer">
        <#if project.logoHermesContentsId?exists && project.logoHermesContentsId?has_content>
            <img id="logoImage" src="${url.context}/service/project/result/hrs?contentsId=${project.logoHermesContentsId?url}&amp;file=${project.logoFileName?url}" alt="Project logo"/>
        <#else>
            <img id="logoImage" src="${url.context}/proxy/alfresco-webscripts/api/node/content/workspace/SpacesStore/${project.logoNodeRefUuid?url}/${project.logoFileName?url}" alt="Project logo"/>
        </#if>
    </div>
</#if>
-->
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
<#if programme?? && programme==erasmusProgramme>
    <div id="valoridentifier"><@ctrl.selfhidingtextfield field="${project.identifier}" label="${msg('prop.identifier')}" link="false" /></div>
<#elseif programme?? && programme==creativeProgramme>
    <div id="valoridentifier"><@ctrl.selfhidingtextfield field="${project.identifier}" label="${msg('prop.projectNumber')}" link="false" /></div>
</#if>

    <!--Title-->
    <div id="valortitle"><@ctrl.selfhidingtextfield field="${project.title}" label="${msg('prop.title')}" link="false" /></div><!--/Title-->
	<div id="valortitle">
		<#if project.website?exists && project.website?has_content>
			<@ctrl.selfhidingtextfield field="${project.website}" label="${msg('prop.website')}" link="true" />
		</#if>
	</div>
    <!--Summary-->
    <div id="valorsummary">
        <fieldset><legend>${msg('prop.summary')}
        </legend>

        <#if project.reportSummary?exists && project.reportSummary?has_content>
        	<@ctrl.selfhidingtextfield field="${project.reportSummary}" label="" link="false" />
        <#else>
        	<@ctrl.selfhidingtextfield field="${project.description}" label="" link="false" />
        </#if>
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
				<#if project.grantedAmount?exists && project.grantedAmount?has_content>
					<#if programme?exists && programme==erasmusProgramme>
						<@ctrl.selfhidingtextfield field="${project.grantedAmount}" label="${msg('prop.ecContribution')}" link="false"/>
					<#elseif programme?? && programme==creativeProgramme>
                        <span class="label">${msg('prop.unionGrant')}:</span> <span class="value">${project.grantedAmount}</span> <span class="label">${msg('prop.valor.ce.curency')}</span></br>
					</#if>
				</#if>
                </div>
            </fieldset>
        </div>
    </div>

    <!--Details-->
    <div id="valordetails">
        <fieldset>
            <legend>${msg('prop.details')}</legend>
		<#if project.startYear?exists && project.startYear?has_content>
			<@ctrl.selfhidingtextfield field="${project.startYear}" label="${msg('prop.startYear')}" link="false" />
		</#if>
		<#if project.countries?exists && project.countries?has_content>
			<@ctrl.selfhidingflagfield field="${project.countries}" label="${msg('prop.countries')}" />
		</#if>
		<#if project.level2Label?exists && programme==erasmusProgramme>
			<@ctrl.selfhidingtextfield field="${project.level2Label}" label="${msg('prop.keyAction')}" link="false" />
		<#elseif project.level2Label?exists && programme==creativeProgramme>
			<@ctrl.selfhidingtextfield field="${project.level2Label}" label="${msg('prop.subProgramme')}" link="false" />
		</#if>
		<#if project.level3Label?exists && programme==erasmusProgramme>
			<@ctrl.selfhidingtextfield field="${project.level3Label}" label="${msg('prop.actionType')}" link="false" />
		<#elseif project.level3Label?exists && programme==creativeProgramme>
			<@ctrl.selfhidingtextfield field="${project.level3Label}" label="${msg('prop.action')}" link="false" />
		</#if>
		<#if project.activityTypeLabelList?exists && project.activityTypeLabelList?has_content && programme==creativeProgramme>
            <div class="field">
                <span class="label">Type of Activity: </span>
				<#assign activityTypes = project.activityTypeLabelList?string?split("|")>
				<#list activityTypes as activityTypeLabel>
                    <span class="tags-value">${activityTypeLabel}</span>
				</#list>
            </div>
		</#if>
        </fieldset>
    </div>

</div>

<div id="tabCoordinator"> <!-- second Tab -->
    <div class="set" id="coordinatorcontact">
        <div>
            <div id="valorcoordinator">
                <fieldset><legend>${msg('prop.coordinator_title')}</legend>
				<#if programme?exists && programme==erasmusProgramme>
					<#if coordinating.name?exists && coordinating.name?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.name}" label="${msg('prop.coordinator_organisation')}" link="false" />
					</#if>
					<#if coordinating.firstName?exists && coordinating.firstName?has_content>
					<#--<@ctrl.selfhidingtextfield field="${legalRepresentative.firstName}" label="${msg('prop.coordinator_name')}" link="false" />-->
						<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${legalRepresentative.firstName}" label="${msg('prop.coordinator_name')}"/>
					</#if>
					<#if coordinating.lastName?exists && coordinating.lastName?has_content>
					<#--<@ctrl.selfhidingtextfield field="${legalRepresentative.lastName}" label="${msg('prop.coordinator_lastName')}" link="false" />-->
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
					<#if coordinating.email?exists && coordinating.email?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.email}" label="${msg('prop.coordinator_email')}" link="false" />
					</#if>
					<#if coordinating.phone?exists && coordinating.phone?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.phone}" label="${msg('prop.coordinator_phone')}" link="false" />
					</#if>
					<#if coordinating.type?exists && coordinating.type?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.type}" label="${msg('prop.coordinator_type')}" link="false" />
					</#if>
					<#if coordinating.website?exists && coordinating.website?has_content>
						<@ctrl.selfhidingtextfield field="${coordinating.website}" label="${msg('prop.coordinator_website')}" link="true" />
					</#if>
					<#if coordinating.pic?exists && coordinating.pic?has_content >
						<@ctrl.selfhidingtextfield field="${coordinating.pic}" label="${msg('prop.coordinator_pic')}" link="false" />
					</#if>
				<#elseif project.level3Label?exists && programme==creativeProgramme>
					<#if coordinating.name?exists && coordinating.name?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.name}" label="${msg('prop.coordinator_organisation')}" link="false" />
                        </div>
					</#if>
                    <!-- Address of coordinator: Composed by street, postal code -->
                    <div id="valorcoordinatorproperties"><span class="label">${msg('prop.coordinator_address')}: </span><#if coordinating.street?exists && coordinating.street?has_content>${coordinating.street}</#if><#if coordinating.postalCode?exists && coordinating.postalCode?has_content>, ${coordinating.postalCode}</#if></div>

					<#if coordinating.city?exists && coordinating.city?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.city}" label="${msg('prop.coordinator_city')}" link="false" />
                        </div>
					</#if>
					<#if coordinating.region?exists && coordinating.region?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.region}" label="${msg('prop.coordinator_region')}" link="false"/>
                        </div>
					</#if>
					<#if coordinating.country?exists && coordinating.country?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingflagfield field="${coordinating.country}" label="${msg('prop.coordinator_country')}"/>
                        </div>
					</#if>
					<#if coordinating.type?exists && coordinating.type?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.type}" label="${msg('prop.coordinator_type')}" link="false" />
                        </div>
					</#if>
					<#if coordinating.website?exists && coordinating.website?has_content>
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.website}" label="${msg('prop.coordinator_website')}" link="true" />
                        </div>
					</#if>
					<#if (programme?exists && programme==erasmusProgramme) && (coordinating.pic?exists && coordinating.pic?has_content) >
                        <div id="valorcoordinatorproperties">
							<@ctrl.selfhidingtextfield field="${coordinating.pic}" label="${msg('prop.coordinator_pic')}" link="false" />
                        </div>
					</#if>
				</#if>
                </fieldset>
            </div>
		<#if contactPerson?has_content>

			<#if coordinating.showName?exists && coordinating.showName||
			coordinating.showMail?exists && coordinating.showMail ||
			coordinating.showPhone?exists && coordinating.showPhone>

                <div id="valorcontact">
                    <fieldset><legend>${msg('prop.contact_title')}</legend>
						<#if programme?exists && programme==erasmusProgramme>
							<#if contactPerson.firstName?exists && contactPerson.firstName?has_content>
							<#--<@ctrl.selfhidingtextfield field="${contactPerson.firstName}" label="${msg('prop.contact_name')}" link="false" />-->
								<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.firstName}" label="${msg('prop.contact_name')}"/>
							</#if>
							<#if contactPerson.lastName?exists && contactPerson.lastName?has_content>
							<#--<@ctrl.selfhidingtextfield field="${contactPerson.lastName}" label="${msg('prop.contact_lastName')}"  link="false" />-->
								<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.lastName}" label="${msg('prop.contact_lastName')}"/>
							</#if>
							<#if contactPerson.email?exists && contactPerson.email?has_content>
							<#--<@ctrl.selfhidingtextfield field="${contactPerson.email}" label="${msg('prop.contact_email')}"  link="false" />-->
								<@ctrl.confidentialdata confidential="${(!coordinating.showMail)?string}" field="${contactPerson.email}" label="${msg('prop.contact_email')}"/>
							</#if>
							<#if contactPerson.phone?exists && contactPerson.phone?has_content>
							<#--<@ctrl.selfhidingtextfield field="${contactPerson.phone}" label="${msg('prop.contact_phone')}"  link="false" />-->
								<@ctrl.confidentialdata confidential="${(!coordinating.showPhone)?string}" field="${contactPerson.phone}" label="${msg('prop.contact_phone')}"/>
							</#if>
						<#elseif project.level3Label?exists && programme==creativeProgramme>
							<#if contactPerson.firstName?exists && contactPerson.firstName?has_content>
                                <div id="valorcontactproperties">
								<#--<@ctrl.selfhidingtextfield field="${contactPerson.firstName}" label="${msg('prop.contact_name')}" link="false" />-->
									<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.firstName}" label="${msg('prop.contact_name')}"/>
                                </div>
							</#if>
							<#if contactPerson.lastName?exists && contactPerson.lastName?has_content>
                                <div id="valorcontactproperties">
								<#--<@ctrl.selfhidingtextfield field="${contactPerson.lastName}" label="${msg('prop.contact_lastName')}"  link="false" />-->
									<@ctrl.confidentialdata confidential="${(!coordinating.showName)?string}" field="${contactPerson.lastName}" label="${msg('prop.contact_lastName')}"/>
                                </div>
							</#if>
							<#if contactPerson.email?exists && contactPerson.email?has_content>
                                <div id="valorcontactproperties">
								<#--<@ctrl.selfhidingtextfield field="${contactPerson.email}" label="${msg('prop.contact_email')}"  link="false" />-->
									<@ctrl.confidentialdata confidential="${(!coordinating.showMail)?string}" field="${contactPerson.email}" label="${msg('prop.contact_email')}"/>
                                </div>
							</#if>
							<#if contactPerson.phone?exists && contactPerson.phone?has_content>
                                <div id="valorcontactproperties">
								<#--<@ctrl.selfhidingtextfield field="${contactPerson.phone}" label="${msg('prop.contact_phone')}"  link="false" />-->
									<@ctrl.confidentialdata confidential="${(!coordinating.showPhone)?string}" field="${contactPerson.phone}" label="${msg('prop.contact_phone')}"/>
                                </div>
							</#if>
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
						<#if programme?exists && programme==erasmusProgramme>
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
						<#elseif project.level3Label?exists && programme==creativeProgramme>
							<#if partner.CPFirstName?exists && partner.CPFirstName?has_content && partner.showName>
                            	<div id="valorpartnersproperties">
									<@ctrl.confidentialdata confidential="${(!partner.showName)?string}" field="${partner.CPFirstName}" label="${msg('prop.partner_name')}"/>
								</div>
							</#if>

							<#if partner.CPLastName?exists && partner.CPLastName?has_content && partner.showName>
								<div id="valorpartnersproperties">
									<@ctrl.confidentialdata confidential="${(!partner.showName)?string}" field="${partner.CPLastName}" label="${msg('prop.partner_lastName')}"/>
								</div>
							</#if>

							<#if partner.CPEmail?exists && partner.CPEmail?has_content && partner.showMail>
								<div id="valorpartnersproperties">
									<@ctrl.confidentialdata confidential="${(!partner.showMail)?string}" field="${partner.CPEmail}" label="${msg('prop.partner_email')}"/>
								</div>
							</#if>
							<#if partner.CPPhone?exists && partner.CPPhone?has_content && partner.showPhone>
								<div id="valorpartnersproperties">
									<@ctrl.confidentialdata confidential="${(!partner.showPhone)?string}" field="${partner.CPPhone}" label="${msg('prop.partner_phone')}"/>
								</div>
							</#if>

							<#if partner.city?exists && partner.city?has_content>
                                <div id="valorpartnersproperties">
									<@ctrl.selfhidingtextfield field="${partner.city}" label="${msg('prop.partner_city')}" link="false" />
                                </div>
							</#if>
							<#if partner.region?exists && partner.region?has_content>
                                <div id="valorpartnersproperties">
									<@ctrl.selfhidingtextfield field="${partner.region}" label="${msg('prop.partner_region')}" link="false" />
                                </div>
							</#if>
							<#if partner.website?exists && partner.website?has_content>
                                <div id="valorpartnersproperties">
									<@ctrl.selfhidingtextfield field="${partner.website}" label="${msg('prop.partner_website')}" link="true" />
                                </div>
							</#if>
							<#if partner.type?exists && partner.type?has_content>
                                <div id="valorpartnersproperties">
									<@ctrl.selfhidingtextfield field="${partner.type}" label="${msg('prop.partner_type')}" link="false" />
                                </div>
							</#if>
						</#if>
                    </div>
                </div>
			</#if>
		</#list>
	<#else>
		<#if level3 == KA107>
			<div id="noresults">${msg('prop.nopartnersKA107')}</div>
		<#else>
        	<div id="noresults">${msg('prop.nopartners')}</div>
        </#if>
	</#if>
    </div>
</div>

<div id="tabProducts"> <!-- four Tab -->
    <!--Results-->
    <div class="set" id="products">
	<#if products?exists && products?has_content>
		<#if project.website?exists && project.website?has_content>
			<p style="margin: 0 10px">
				${msg('prop.info_website')}:
				<a href="${project.website}" target="_blank">${project.website}</a>
			</p>
		</#if>

		<#list products as product>
			<#if product?exists>
                <div id='jqxExpander_${product.nodeRef?split("SpacesStore/")[1]}'>
                    <div>
					${product.title?html!''}
                    </div>
                    <div>
                        <!--Description-->
                        <div id="valor-result-description" class="valor-result-description">
                            <fieldset><legend>${msg('prop.description_title')}</legend>
								<#if product.description?exists && product.description?has_content>
									<@ctrl.selfhidingtextfield field="${product.description}" label=""  link="false" />
								</#if>
                            </fieldset>
                        </div>
                        <div class="set" id="contents">
							<#if product.contents?exists && product.contents?has_content>
                                <fieldset><legend>${msg('prop.product_content')}</legend>
									<#list product.contents as content>
										<#if content?exists>
                                            <div class="content">
												<span class="value">
													<#if content.url?exists && content.url?has_content>
														<a href="${content.url}" target="document">${content.name}</a>
<#--
													<#elseif content.hermesContentsId?exists && content.hermesContentsId?has_content>
														<a href="${url.context}/service/project/result/hrs?contentsId=${content.hermesContentsId?url}&amp;file=${content.name?url}" target="document">${content.name}</a>
-->
													<#else>
														<a href="${url.context}/proxy/alfresco-webscripts/api/node/content/workspace/SpacesStore/${content.uuid?url}/${content.name?url}" target="document">${content.name}</a>
													</#if>
												</span>
                                            </div>
										<#else>
										</#if>
									</#list>
                                </fieldset>
							</#if>
                        </div>
                    </div>
                </div>
			</#if>
		</#list>
	<#else>
        <div id="noresults">
			${msg('prop.noresult')}
		</div>
		<#if project.website?exists && project.website?has_content>
			<div class="results-additional-info">
				${msg('prop.info_website')}:
				<a href="${project.website}" target="_blank">${project.website}</a>
			</div>
		</#if>
	</#if>
    </div>
</div>

<div id="tabPartnersMap">
	<div class="efc-project-partners-container">
	</div>
</div>

</div>

<div class="projects-disclaimer">
	<h3>Disclaimer</h3>
	<p>
		The European Commission is not responsible for any uploaded or submitted content. Such content expresses the views of its author(s) only.
	</p>
</div>