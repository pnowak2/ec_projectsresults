<#if articles??>
  
    <div class="interior-content" id="introText">
        <#if articles.assets?size == 0>
            ${msg('list.none')}
        <#else>
    		<ul class="newslist-wrapper">
    		  	<#list articles.assets as article>
    		        <li>
    		            <h1 id="diss-title-text">${(article.title!article.name)?html}</h1>	        
					    <div class="article-body" style="color: #013162;font-size: 1em;">
					        <@streamasset asset=article/>
					    </div>    		        
    		        </li>
    		    </#list>
    		</ul>
    	</#if>
    </div>
</#if>
