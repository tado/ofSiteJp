# coding: utf-8
<%inherit file="_templates/home.mako" />

<div class="page-left-medium">
<p>
	<!-- OF video -->
	<iframe src="http://player.vimeo.com/video/74124094?title=0&amp;byline=0&amp;portrait=0" width="700" height="393" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</p>



</div>

<div class="page-right-narrow">
    <div class="home-links">
        <h2>openFrameworksは創造的なコーディングのためのC++のオープンソースツールキットです</h2>

        <h3><a href="download/">download</a></h3>
        <p>最新のリリース(${bf.config.currentVersion})の入手と、openFrameworksを作動させるためのセットアップガイド。</p>

	<h3><a href="documentation/">documentation</a></h3>
	<p>openFramewroksのクラス、関数、アドオンのリファレンス資料。ガイドやチュートリアルは、<a href="http://openframeworks.jp/tutorials">tutorial</a>を参照してください。</p>

	<h3><a href="http://forum.openframeworks.cc/">forum</a></h3>
	<p>フォーラムは、openFrameworksに関係する多くの仲間と交流する場となっています。</p>
    </div>
</div>

<div class="sectiontext home">
    <h2>Latest images</h2>
</div>
<div class="gallery home">
    <div id="flickr"></div>
    <br class="clearboth">
</div>

<div class="sectiontext home">
    <h2>Latest posts</h2>
</div>
<div class="social home">
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
</div>
