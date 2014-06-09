## -*- coding: utf-8 -*-
<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="${bf.config.site.url}/js/jquery.masonry.min.js"></script>
    <script src="${bf.config.site.url}/js/documentation_index.js"></script>
  </head>
  <body>
    <div id="content">
      ${self.header()}
      <div id="body-wrap">	
	    <div class="page-wide">
	        <div class="page-left-split">
                <!--ul class="submenu">
                    <li><a href="/documentation">reference</a></li>
                    <li><a href="/tutorials">tutorials</a></li>
                </ul-->

                <h1 class="documentation">reference</h1> <ul class="docsadvanced"><li><a href="/documentation" class="active">基本</a></li> <li><a href="/doxygen/annotated.html">応用</a></li> </ul>
            </div>  
		    <div class="page-right-narrow">
          <p>このページは、openFrameworksのコアとパッケージに含まれているアドオンに関するリファレンスです。第三者によるアドオンは、<a href="http://ofxaddons.com/">http://ofxaddons.com/</a>を参照してください。openFrameworksのAPIは常に発展しています、修正や機能の追加、コメントなどは大歓迎です!</p>
			    <p><a href="http://openframeworks.cc/tutorials/developers/003_contributing_to_the_documentation.html">ドキュメンテーションの導入</a>のチュートリアルに従って、ドキュメンテーションに貢献することが可能です。</p>
			    <p>このドキュメントは、最新版のリリース<strong>${bf.config.currentVersion}</strong>を参照しています。</p>
		    </div>
	   </div>
	   
	    <div class="page-wide">
		    

		    <div class="page-right-narrow">
		        <!--p>
			        <strong>Show advanced?</strong><br />
				        <a href="documentation?adv=yes">yes</a> / no
		        </p-->
		        <!--div id="documentation-ebook">
		        <h2>download</h2>
		        <p><a href="${bf.config.site.url}/epub/ofDocs.zip"><strong>html</strong></a></p>
		        <!--p><a href="${bf.config.site.url}/epub/ofReference.pdf"><strong>pdf</strong></a></p>
		        <p><a href="${bf.config.site.url}/epub/ofReference.epub"><strong>epub</strong></a></p>
		        <p><a href="${bf.config.site.url}/epub/ofReference.mobi"><strong>mobi (kindle)</strong></a></p-->
		        <!--/div-->
		    </div>

    	</div>


    	<div class="page-wide sectiontitle">
		    <h2>core</h2> 
		    <a class="hide_core_functions">hide functions</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="collapse_core">collapse all</a>
        </div><!-- End Page Wide -->

    	<div class="page-wide core">
            % for module, classes in sorted(core.items(), key=lambda module: module):
                <%include file="documentation_index_block.mako" args="module=module,classes=classes" />
            % endfor
        </div><!-- End Page Wide -->
        
    	<div class="page-wide">
        </div><!-- End Page Wide -->
        
    	<div class="page-wide sectiontitle">
		    <h2>addons</h2> <a class="hide_addons_functions">hide functions</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="collapse_addons">collapse all</a>
        </div><!-- End Page Wide -->

    	<div class="page-wide addons">
            % for module, classes in sorted(addons.items(), key=lambda module: module):
                <%include file="documentation_index_block.mako" args="module=module,classes=classes" />
            % endfor
        </div><!-- End Page Wide -->
              
      </div><!-- End Body Wrap -->
      
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>

<%def name="header()">
  <%include file="header.mako" args="active='documentation'" />
</%def>


