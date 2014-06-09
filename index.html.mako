#coding:utf-8
<%inherit file="_templates/home.mako" />

<div class="page-left-medium">
  <p>
    <!-- OF video -->
    <iframe src="http://player.vimeo.com/video/74124094?title=0&amp;byline=0&amp;portrait=0" width="550" height="309" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
  </p>
</div>

<div class="page-right-narrow">
  <div class="home-links">
    <h3>openFrameworks<br/>創造的なコーディングのためのC++のオープンソースツールキット</span></h3>
    <h3><a href="download/">download</a></h3>
    <p>最新のリリース(${bf.config.currentVersion})の入手と、openFrameworksを作動させるためのセットアップガイド。</p>

    <h3><a href="documentation/">documentation</a></h3>
    <p>openFramewroksのクラス、関数、アドオンのリファレンス資料。ガイドやチュートリアルは、<a href="http://wiki.openframeworks.cc/">wiki</a>を参照してください。</p>

    <h3><a href="http://forum.openframeworks.cc/">forum</a></h3>
    <p>フォーラムは、openFrameworksに関係する多くの仲間と交流する場となっています。<a href="/forum">日本語フォーラム</a>もあります。</p>
  </div>
</div>

<div class="page-wide">
    <div class="tweet">
        <h3>twitter</h3>
        <div id="tweets">
        <div class="tweets">
            <a data-chrome="noheader noscrollbar nofooter transparent"  data-show-replies="false" data-tweet-limit="4" data-link-color="#EE3987"  class="twitter-timeline" href="https://twitter.com/search?q=openframeworks" data-widget-id="367489340693176321">Tweets about "#openframeworks"</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </div>
        </div>
    </div>

    <div id="forum"></div>
    
    <div id="github"></div>

    <br class="clearboth">
    <hr/>
</div>

<div class="page-wide">
                
    <div id="flickr"></div>
    <div id="vimeo"></div>

    <br class="clearboth">
</div>