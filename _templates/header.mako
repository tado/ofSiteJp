<%page args="active"/>

<div id="head">
  <div class="clearboth"></div>
  <div id="head-left">
    <a href="${bf.config.site.url}" class="nohover"><img src="${bf.config.site.url}/images/ofw-logo.png" border="0" alt="openFrameworks" /></a>
  </div>
  <div id="head-right">
    <ul>
      <li><a href="${bf.config.site.url}/about" class="${'active' if active=='about' else ''}">about</a></li>
      <li><a href="${bf.config.site.url}/download" class="${'active' if active=='download' else ''}" >download</a></li>
      <li><a href="${bf.config.site.url}/documentation" class="${'active' if active=='documentation' else ''}">documentation</a></li>
      <li><a href="${bf.config.site.url}/gallery" class="${'active' if active=='gallery' else ''}">gallery</a></li>
      <li><a href="${bf.config.site.url}/community" class="${'active' if active=='community' else ''}">community</a></li>
    </ul>
    <ul class="menu-externals">
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://openframeworks.jp/forum" target="_blank">forum</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://ofxaddons.com" target="_blank">addons</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://wiki.openframeworks.cc/" target="_blank">wiki</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://github.com/openframeworks/openFrameworks" target="_blank">github</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://openframeworks.cc/list-info" target="_blank">mailing list</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://openframeworks.cc/" target="_blank">english site</a></li>
    </ul>
    <div class="clearboth"></div>
    <!--
    <ul class="menu-externals">
      <li>Beyond Interaction : </li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://www.bnn.co.jp/books/title_index/web/beyond_interaction_openframewo.html" target="_blank">BNN Inc. 書籍情報</a></li>
      <li><span class="external-dot"> ></span>&nbsp;<a href="http://www.amazon.co.jp/Beyond-Interaction-%E2%80%95%E3%83%A1%E3%83%87%E3%82%A3%E3%82%A2%E3%82%A2%E3%83%BC%E3%83%88%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AEopenFrameworks%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E5%85%A5%E9%96%80-%E7%94%B0%E6%89%80-%E6%B7%B3/dp/4861006708/ref=pd_ybh_2?pf_rd_p=74287706&pf_rd_s=center-2&pf_rd_t=1501&pf_rd_i=ybh&pf_rd_m=AN1VRQENFRJN5&pf_rd_r=0CEWEANCWDBNY0H47Y3Z" target="_blank">amazon</a></li>
    </ul>
    <div class="clearboth"></div>
    -->
    <!--form method="get" id="searchform" action="/index.php">
	<input type="text" value="" name="s" id="s" class="search_input" /> <input type="submit" value="Search" class="search_button"/>
    </form-->
    <!--form method="post" action="http://scripts.dreamhost.com/add_list.cgi">
        <input type="hidden" name="list" value="list@openframeworks.cc" />
        <input type="hidden" name="domain" value="openframeworks.cc" />
        <input type="hidden" name="url" value="http://openframeworks.cc/list-info/subscribe.html"  />
        <input type="hidden" name="unsuburl" value="http://openframeworks.cc/list-info/unsubscribe.html" />
        <input type="hidden" name="alreadyonurl" value="http://openframeworks.cc/list-info/already.html" />
        <input type="hidden" name="notonurl" value="http://openframeworks.cc/list-info/not.html" />
        <input type="hidden" name="invalidurl" value="http://openframeworks.cc/list-info/invalid.html" />
        <input type="hidden" name="emailconfirmurl" value="http://openframeworks.cc/list-info/confirm.html" />
        <input type="hidden" name="emailit" value="1" />
        name: <input name="name" /> <br />
        email: <input name="email" /><br />
        <span class='but'><input type="submit" name="submit" value="subscribe" /></span> <br/ >
          <span class='but'><input type="submit" name="unsub" value="unsubscribe" /></span>
    </form-->
  </div>
</div><!-- head -->

