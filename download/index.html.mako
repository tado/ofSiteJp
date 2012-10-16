<%inherit file="/_templates/slideshow.mako" />

<h1>download</h1>
<div id="download-latest-header">
  <h2>0072</h2>
  <p><strong>は最新のリリースです。様々な新機能や新しいインターフェイスが追加されています。もしかしたら新たなバグも…バージョン間の違いの一覧は、<a href="https://github.com/openframeworks/openFrameworks/blob/develop/changes.txt">更新履歴</a>を参照してください。</strong></p>
  <p>openFrameworksを使用するためにはIDE(統合開発環境)が必要です。また、実際に試していくにはプラットフォームごとのセットアップガイドが必要となるでしょう。もしバグをみつけたら<a href="http://github.com/openframeworks/openFrameworks/issues">問題点</a>のページに投稿してください。その他質問があれば、<a href="http://forum.openframeworks.cc">フォーラム</a>に投稿してください。openFrameworksは、<a href="../about/license.html">MITライセンス</a>で配布されています。</p>
</div>

<div id="download-latest-platform">
  <h2>osx</h2>
  <h3>ダウンロード</h3>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_osx_release.zip">xcode</a></p><br/>
  <h3>セットアップガイド</h3>
  <p><a href="../setup/xcode">xcode</a></p>
</div>

<div id="download-latest-platform">
  <h2>linux</h2>
  <h3>ダウンロード</h3>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_linux_release.tar.gz">code::blocks</a></p>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_linux64_release.tar.gz">code::blocks (64 bit)</a></p><br/>
  <h3>セットアップガイド</h3>
  <p><a href="../setup/linux-codeblocks">code::blocks</a></p>
</div>

<div id="download-latest-platform">
  <h2>windows</h2>
  <h3>ダウンロード</h3>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_win_cb_release.zip">code::blocks</a></p>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_vs2010_release.zip">visual studio 2010</a></p><br/>
  <h3>セットアップガイド</h3>
  <p><a href="../setup/codeblocks">code::blocks</a></p>
  <!--<p><a href="../setup/vs-2008">visual studio 2008</a></p>-->
  <p><a href="../setup/vs-2010">visual studio 2010</a></p>
</div>

<div id="download-latest-platform">
  <h2>ios</h2>
  <p><em>osxのみ</em></p><br/>
  <h3>ダウンロード</h3>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_ios_release.zip">ios</a></p><br/>
  <h3>セットアップガイド</h3>
  <p><a href="../setup/iphone">ios</a></p>
</div>

<div id="download-latest-platform">
  <h2>android</h2>
  <p><em>linuxもしくはosxのみ</em></p><br/>
  <h3>ダウンロード</h3>
  <p><a href="http://www.openframeworks.cc/versions/v0072/of_v0072_android_release.tar.gz">eclipse</a></p><br/>
  <h3>セットアップガイド</h3>
  <p><a href="../setup/android-eclipse">eclipse</a></p>
</div>

<br class="clearboth"/>

openFrameworksはコンパイルされていない状態でライブラリとしてリリースしています。つまり、openFrameworksをダウンロードしてunzipしたら、以下のフォルダが展開されるはずです：「addons/」「/apps」「/libs」など。これらのフォルダにopenFrameworksの全てが含まれています。ですので、もし複数のバージョンのopenFrameworksを同時に保持していたいのであれば、複数のフォルダを作成して保存するだけです。例えば「openFrameworks007/」「openFrameworks0071/」というフォルダを一つずつ作成し、それぞれに「apps/」フォルダなどが含まれるようにします。もし新しいバージョンのopenFrameworksがリリースされたとしても、作成した古いバージョンのアプリケーションは、引き続き古いバージョンのopenFrameworksでコンパイル可能です。

まず始めに「apps/examples/」からみていくと良いでしょう。たくさんのサンプルを通してopenFrameworksで何ができるのかがわかるでしょう。フォントのロード、グラフィクス、オーディオ入出力、サウンドファイルを再生しFFT解析、ビデオのキャプチャー、動画の再生、画像のロードと保存、イベントの取り扱い、シリアル接続などをデモしています。「apps/addonsExamples/」には、さらに多くのサンプルがあります。

<br />

*バージョン0071では、さらにいくつかの新しいサンプルが追加されています：ポイントピッカー、ゲームイベント、クォータニオンによる配置、ポイント状のテクスチャ、など*

<div id="myslides">
  <img src="0.png" />
  <img src="1.jpg" />
  <img src="2.png" />
  <img src="3.jpg" />
</div>

--------------------------------

その他のリリース
--------------

さらに古いバージョンのopenFrameworksは、[ここ](older.html)にアーカイブしてあります。完璧に最新のバージョンは、[openFrameworks GitHub](https://github.com/openframeworks/openFrameworks/)です。ですので、もしopenFrameworksの開発に貢献したいと考えたとしたら、GitHugのリポジトリをフォークしてください。そして、[openFrameworks GitHub workflow](https://github.com/openframeworks/openFrameworks/wiki/openFrameworks-git-workflow)にあるガイドラインに従うようにしてください。


[0]: http://forum.openframeworks.cc
[1]: http://github.com/openframeworks/openFrameworks/issues
[2]: ../versions/preRelease_v0.07/of_preRelease_v007_win_cb.zip
[3]: ../versions/preRelease_v0.07/of_preRelease_v007_vs2010.zip
[4]: ../versions/preRelease_v0.07/of_preRelease_v007_osx.zip
[5]: ../versions/preRelease_v0.07/of_preRelease_v007_linux.tar.gz
[6]: ../versions/preRelease_v0.07/of_preRelease_v007_linux64.tar.gz
[7]: ../versions/preRelease_v0.07/of_preRelease_v007_iphone.zip
[8]: ../versions/preRelease_v0.07/of_preRelease_v007_android.tar.gz
[9]: ../license
[10]: http://openframeworks.cc/setup
