<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
    <div id="content">
      ${self.header()}
      <div id="body-wrap">
		   <div class="page-wide">
		     <h1>community</h1>
			 <div class="page-left-split">
			   <p>コミュニティーページは、oFフォーラムの活動的なメンバーから自動的に生成されています。自分のプロフィールを変更する方法については<a href="https://github.com/openframeworks/ofSite/wiki/community">ガイド</a>を参照してください。もしこのページに載りたいのであれば、近日中にフォーラム内にスレッドを設け、そこで知らせてもらえれば、手作業で掲載する予定です。</p>
			</div>
			<br style="clear:both" />
      		<br />
      		% for member in members:
                <a href="user/?user=${member.user}" title="${member.name}"><img width="109" height="109" src="${member.avatar}" alt="${member.name}"/></a>
            % endfor
            </div>
      </div>
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>

<%def name="header()">
  <%
    active = "community"
  %>
  <%include file="header.mako"  args="active=active" />
</%def>

