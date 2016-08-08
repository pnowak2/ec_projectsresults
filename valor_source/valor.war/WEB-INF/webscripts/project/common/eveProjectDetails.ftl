<script type="text/javascript">
    $(document).ready(function () {
        // Create Tabs
        $('#jqxTabs').jqxTabs({ width: 'auto', height: 'auto', position: 'top', theme: "energyblue" });
        // Create jqxExpander
		if($("[id^='jqxExpander']").length > 0) {
        	$("[id^=jqxExpander]").jqxExpander({ width: 'auto', theme: "energyblue", expanded: false });
		}
        // Expand the product control if received by url
		<#if productId??>
			$("[id$=${productId}]").jqxExpander({ width: 'auto', theme: "energyblue", expanded: true });
			//for pre-select products tab
			$('#jqxTabs').jqxTabs({ selectedItem: 2 });
		</#if>

		$('.jqx-tabs-headerWrapper').prepend('<div id="pdf-download"></div>');

		$( "#pdf-download" ).bind( "click", function() {
			var url ='${url.context}/service/es/project/pdf?nodeRef=${project.nodeRef}&identifier=${project.identifier}';
			window.open(url,"_self");
		});
    });
</script>

<div id="jqxTabs" style="width: 90%; margin: 10px auto;">

<ul>
    <li style="margin-left: 30px;" id="tabProjectTitle">${msg('tab.project')}</li>
    <li id="tabPartnersTitle">${msg('tab.partners')}</li>
    <li id="tabProductsTitle">${msg('tab.products')}</li>
</ul>

<div id="tabProject"> <!-- First Tab -->

    <!-- Badges -->
    <div id="badges">
    <#if project.goodPractice?exists && project.goodPractice>
        <span class="badge badge-good-practices" title="${msg("prop.good_practices_description")}">${msg("prop.good_practice_example")}</span>
    </#if>
    <#if project.successStory?exists && project.successStory>
        <span class="badge badge-success-stories" title="${msg("prop.success_stories_description")}">${msg("prop.success_story")}</span>
    </#if>
    </div>

    <!--Path-->
    <div id="breadcrumb"><@ctrl.selfhidingtextfield field="${project.programmeName}" label="${msg('prop.programmeName')}" link="false" /></div>

    <div id="identifier"><@ctrl.selfhidingtextfield field="${project.identifier}" label="${msg('prop.identifier')}" link="false" /></div>
    <!-- Programme -->
    <div id="programme"><@ctrl.selfhidingtextfield field="${project.programme}" label="${msg('prop.programme')}" link="false" /></div>

    <!--Title-->
    <div id="title"><@ctrl.selfhidingtextfield field="${project.title}" label="" link="false" /></div>

    <!--Description-->
    <div id="description">
        <fieldset><legend>${msg('prop.description_title')}
        </legend>
        <@ctrl.selfhidingtextfield field="${project.description}" label="" link="false" />
        </fieldset>
    </div>


    <span id="creationDate"><@ctrl.selfhidingtextfield field="${project.creationDate}" label="${msg('prop.creationDate')}" link="false" /></span>
<#--<span id="status"><@ctrl.selfhidingtextfield field="${project.projectStatus}" label="${msg('prop.projectStatus')}" link="false" /></span>-->

    <!--Info-->
    <div class="set" id="info">
        <div class="threecolumn">
            <fieldset>

                <!--three columns-->
                <div class="threecolumn-left">
                <@ctrl.selfhidingtextfield field="${project.startDate}" label="${msg('prop.startDate')}" link="false" />
			    		<@ctrl.selfhidingtextfield field="${project.endingDate}" label="${msg('prop.endingDate')}" link="false" />
			    		<#--<@ctrl.selfhidingtextfield field="${project.startYear}" label="${msg('prop.startYear')}" link="false" />-->
                </div>

                <div class="threecolumn-middle">
                <@ctrl.selfhidingtextfield field="${project.nationalIdentifier}" label="${msg('prop.nationalIdentifier')}"  link="false" />
			    		<@ctrl.selfhidingtextfield field="${project.externalRef}" label="${msg('prop.externalRef')}" link="false" />
			    		<@ctrl.selfhidingtextfield field="${project.datasource}" label="${msg('prop.datasource')}" link="false" />
                </div>

                <div class="threecolumn-right">
                <@ctrl.selfhidingtextfield field="${project.totalBudget}" label="${msg('prop.totalBudget')}" link="false" />
						<@ctrl.selfhidingtextfield field="${project.ecContribution}" label="${msg('prop.ecContribution')}" link="false" />
                </div>
            </fieldset>
        </div>
    </div>

    <div class="set" id="coordinatorcontact">
        <div class="twocolumn">
            <!--left column-->
            <div class="twocolumn-left">
                <fieldset><legend>${msg('prop.coordinator_title')}</legend>
                <@ctrl.selfhidingtextfield field="${coordinator.organisation}" label="${msg('prop.coordinator_organisation')}" link="false" />
                <#--<@ctrl.selfhidingtextfield field="${coordinator.firstName} ${coordinator.lastName}" label="${msg('prop.coordinator_name')}" link="false" />-->
                <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.coordinator_name')}"/>
                <@ctrl.selfhidingtextfield field="${coordinator.address}" label="${msg('prop.coordinator_address')}" link="false" />
                <@ctrl.selfhidingflagfield field="${coordinator.country}" label="${msg('prop.coordinator_country')}"/>
                <@ctrl.selfhidingtextfield field="${coordinator.email}" label="${msg('prop.coordinator_email')}" link="false" />
                <@ctrl.selfhidingtextfield field="${coordinator.phone}" label="${msg('prop.coordinator_phone')}" link="false" />
                <@ctrl.selfhidingtextfield field="${coordinator.fax}" label="${msg('prop.coordinator_fax')}" link="false" />
                <@ctrl.selfhidingtextfield field="${coordinator.url}" label="${msg('prop.coordinator_website')}" link="true" />
                </fieldset>
            </div>
        <#if contact?has_content>
            <div class="twocolumn-right">
                <fieldset><legend>${msg('prop.contact_title')}</legend>
                    <@ctrl.selfhidingtextfield field="${contact.organisation}" label="${msg('prop.contact_organisation')}" link="false" />
                    <#--<@ctrl.selfhidingtextfield field="${contact.firstName} ${contact.lastName}" label="${msg('prop.contact_name')}" link="false" />-->
                    <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.contact_name')}"/>
                    <@ctrl.selfhidingtextfield field="${contact.address}" label="${msg('prop.contact_address')}"  link="false" />
                    <@ctrl.selfhidingflagfield field="${contact.country}" label="${msg('prop.contact_country')}"  />
                    <#--<@ctrl.selfhidingtextfield field="${contact.email}" label="${msg('prop.contact_email')}"  link="false" />-->
                    <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.contact_email')}"/>
                    <#--<@ctrl.selfhidingtextfield field="${contact.phone}" label="${msg('prop.contact_phone')}"  link="false" />-->
                    <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.contact_phone')}"/>
                    <@ctrl.selfhidingtextfield field="${contact.fax}" label="${msg('prop.contact_fax')}"  link="false" />
                    <@ctrl.selfhidingtextfield field="${contact.url}" label="${msg('prop.contact_website')}"  link="true" />
                </fieldset>
            </div>
        </#if>
        </div>
    </div>




<#if project.url?has_content || project.subject?has_content || project.audience?has_content ||
project.tags?has_content || project.relation?has_content>
    <div class="set" id="others">
        <fieldset><legend>${msg('prop.other_data_title')}</legend>
            <@ctrl.selfhidingtextfield field="${project.url}" label="${msg('prop.website')}" link="true" />
            <@ctrl.selfhidingtextfield field="${project.subject}" label="${msg('prop.subject')}" link="false" />
            <@ctrl.selfhidingtagfield field="${project.audience}" label="${msg('prop.audience')}" />
            <@ctrl.selfhidingtagfield field="${project.tags}" label="${msg('prop.tags')}" />
            <@ctrl.selfhidingtextfield field="${project.relation}" label="${msg('prop.relation')}"  link="false" />
        </fieldset>
    </div>
<#else>
</#if>

</div>

<div id="tabPartners"> <!-- second Tab -->
    <!--Partners-->
    <div class="set" id="partners">

    <#if partners?exists && partners?has_content>
        <#list partners as partner>
            <#if partner?exists>
                <div id='jqxExpander_${partner_index}'>
                    <div class="person-header">
                        <div class="partner-organisation">${partner.organisation!''}</div><div class="partner-flag"><@ctrl.selfhidingflagfield field="${partner.country}" label="${msg('prop.partner_country')}" /></div>
                    </div>
                    <div class="person-details">
                        <#--<@ctrl.selfhidingtextfield field="${partner.lastName}" label="${msg('prop.partner_name')}" link="false" />-->
                        <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.partner_name')}"/>
  						<@ctrl.selfhidingtextfield field="${partner.address}" label="${msg('prop.partner_address')}" link="false" />
  						<#--<@ctrl.selfhidingtextfield field="${partner.email}" label="${msg('prop.partner_email')}" link="false" />-->
  						<@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.partner_email')}"/>
						<#--<@ctrl.selfhidingtextfield field="${partner.phone}" label="${msg('prop.partner_phone')}" link="false" />-->
						<@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.partner_phone')}"/>
						<@ctrl.selfhidingtextfield field="${partner.fax}" label="${msg('prop.partner_fax')}" link="false" />
						<@ctrl.selfhidingtextfield field="${partner.url}" label="${msg('prop.partner_website')}" link="true" />
                    </div>
                </div>
            </#if>
        </#list>
    <#else>
        <div id="noresults">${msg('prop.nopartners')}</div>
    </#if>
    </div>
</div>

<div id="tabProducts"> <!-- third Tab -->
    <!--Results-->
    <div class="set" id="products">
    <#if products?exists && products?has_content>
        <#list products as product>
            <#if product?exists>
                <div id='jqxExpander_${product.nodeRef?split("SpacesStore/")[1]}'>
                    <div>
                    ${product.title?html!''}
                    </div>
                    <div>
                        <div id="identifier"><@ctrl.selfhidingtextfield field="${product.identifier}" label="${msg('prop.product_identifier')}" link="false" /></div>
                        <!--Description-->
                        <div id="description">
                            <fieldset><legend>${msg('prop.description_title')}</legend>
                                <@ctrl.selfhidingtextfield field="${product.description}" label=""  link="false" />
                            </fieldset>
                        </div>
                        <div class="set" id="others">
                            <fieldset><legend>${msg('prop.other_data_title')}</legend>
                                <div class="twocolumn-left">
                                    <@ctrl.selfhidingtextfield field="${product.resultSubject}" label="${msg('prop.product_resultSubject')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultUrl}" label="${msg('prop.product_resultUrl')}"  link="true" />
					  						<@ctrl.selfhidingtextfield field="${product.resultRelation}" label="${msg('prop.product_resultRelation')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultPublisher}" label="${msg('prop.product_resultPublisher')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultRightsHolder}" label="${msg('prop.product_resultRightsHolder')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultFormat}" label="${msg('prop.product_resultFormat')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultPublicationYear}" label="${msg('prop.product_resultPublicationYear')}"  link="false" />
                                </div>
                                <div class="twocolumn-right">
                                    <@ctrl.selfhidingtextfield field="${product.resultTypology}" label="${msg('prop.product_resultTypology')}"  link="false" />
					  						<@ctrl.selfhidingtagfield field="${product.resultAudience}" label="${msg('prop.product_resultAudience')}"  />
					  						<@ctrl.selfhidingflagfield field="${product.resultCoverage}" label="${msg('prop.product_resultCoverage')}" />
					  						<@ctrl.selfhidingtextfield field="${product.resultConditionOfUsage}" label="${msg('prop.product_resultConditionOfUsage')}"  link="false" />
					  						<@ctrl.selfhidingtextfield field="${product.resultMedia}" label="${msg('prop.product_resultMedia')}"  link="false" />
					  						<@ctrl.selfhidingtagfield field="${product.resultTags}" label="${msg('prop.product_resultTags')}"  />
											<@ctrl.selfhidingflagfield field="${product.resultLanguage}" label="${msg('prop.product_resultLanguage')}"/>
                                </div>
                            </fieldset>
                        </div>

                        <#if product.creator?exists || product.contact?exists>
                            <div class="set" id="creatorcontact">
                                <div class="twocolumn">
                                    <!--left column-->
                                <div class="twocolumn-left">
                                    <#if product.creator?exists>
                                        <fieldset><legend>${msg('prop.other_creator_title')}</legend>
                                            <@ctrl.selfhidingtextfield field="${product.creator.organisation}" label="${msg('prop.product_creator_organisation')}" link="false" />
                                            <#--<@ctrl.selfhidingtextfield field="${product.creator.firstName} ${product.creator.lastName}" label="${msg('prop.product_creator_name')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_creator_name')}"/>
                                            <@ctrl.selfhidingtextfield field="${product.creator.address}" label="${msg('prop.product_creator_address')}" link="false" />
                                            <@ctrl.selfhidingflagfield field="${product.creator.country}" label="${msg('prop.product_creator_country')}" />
                                            <#--<@ctrl.selfhidingtextfield field="${product.creator.email}" label="${msg('prop.product_creator_email')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_creator_email')}"/>
                                            <#--<@ctrl.selfhidingtextfield field="${product.creator.phone}" label="${msg('prop.product_creator_phone')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_creator_phone')}"/>
                                            <@ctrl.selfhidingtextfield field="${product.creator.fax}" label="${msg('prop.product_creator_fax')}" link="false" />
                                            <@ctrl.selfhidingtextfield field="${product.creator.url}" label="${msg('prop.product_creator_url')}" link="true" />
                                        </fieldset>
                                    </div>
                                    <div class="twocolumn-right">
                                    <#else>
                                    </#if>
                                    <#if product.contact?exists>
                                        <fieldset><legend>${msg('prop.contact_title')}</legend>
                                            <@ctrl.selfhidingtextfield field="${product.contact.organisation}" label="${msg('prop.product_contact_organisation')}" link="false" />
                                            <#--<@ctrl.selfhidingtextfield field="${product.contact.firstName} ${product.contact.lastName}" label="${msg('prop.product_contact_name')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_contact_name')}"/>
                                            <@ctrl.selfhidingtextfield field="${product.contact.address}" label="${msg('prop.product_contact_address')}"link="false" />
                                            <@ctrl.selfhidingflagfield field="${product.contact.country}" label="${msg('prop.product_contact_country')}" />
                                            <#--<@ctrl.selfhidingtextfield field="${product.contact.email}" label="${msg('prop.product_contact_email')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_contact_email')}"/>
                                            <#--<@ctrl.selfhidingtextfield field="${product.contact.phone}" label="${msg('prop.product_contact_phone')}" link="false" />-->
                                            <@ctrl.confidentialdata confidential="true" field="" label="${msg('prop.product_contact_phone')}"/>
                                            <@ctrl.selfhidingtextfield field="${product.contact.fax}" label="${msg('prop.product_contact_fax')}" link="false" />
                                            <@ctrl.selfhidingtextfield field="${product.contact.url}" label="${msg('prop.product_contact_url')}" link="true" />
                                        </fieldset>
                                    <#else>
                                    </#if>
                                </div>
                                </div>

                            </div>
                        <#else>
                        </#if>
                        <div class="set" id="contents">
                            <#if product.contents?exists && product.contents?has_content>
                                <fieldset><legend>${msg('prop.product_content')}</legend>
                                    <#list product.contents as content>
                                        <#if content?exists>
                                            <div class="content">
														  	<span class="value">
                                                                <#if content.url?exists && content.url?has_content>
                                                                    <a href="${content.url}" target="document">${content.name}</a>
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
        <div id="noresults">${msg('prop.noresult')}</div>
    </#if>
    </div>
</div>
</div>

<div class="projects-disclaimer">
    <h3>Disclaimer</h3>
    <p>
        The European Commission is not responsible for any uploaded or submitted content. Such content expresses the views of its author(s) only.
    </p>
</div>