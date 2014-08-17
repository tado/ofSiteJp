## -*- coding: utf-8 -*-
<%inherit file="/_templates/markdown.mako" />

code::blocks setup guide
========================

私達は、Code::Blocksが軽量で、 Visual Studio独特の癖が無いので、気に入っています。この文書は、起動と実行までのステップ・バイ・ステップのチュートリアルです。

**注意**
[Step e)](#additions) は、openFrameworksを動作させるために必須です。このステップは飛ばさないでください。

バージョン
-------

Code::Blocksの新しいバージョン(12.11)は、openFramewoksの0073以前には対応していません。
最新のバージョンは、0.7.4以降のバージョンと、Githubの開発版では動作します。
これは、古いコンパイラで作成されたライブラリが新しいコンパイラと互換性がないためです。
もし、openFrameworksの0073以前のバージョンを使いたいのであれば、[Code::Blocks 10.05][0]を使用してください。

インストール
------------
**a) code::blocksの最新版のバイナリーをダウンロード**

> [Code::Blocksをダウンロード][1]

**注意** ：MinGwも一緒にダウンロードしてください。Code::Blocks 12.11は、openFrameworksの0.7.4以降で、問題なく動きます。

![a_download](codeblocks.png)


**b) インストール**

![b_install](b_install.png)


**c) 何も設定を変更する必要はありません**

![c_setup](c_setup.png)


**d) ここでもnotを選択します、Code::BlocksをメインのIDEにはしないからです**

![d_assoc](d_assoc-640x378.png)


<a id="additions"></a>**e) MinGWのファイルを追加します**

devcppと同じように、いくつかのライブラリを追加します。ここからダウンロードできます。

> [Additions for Code::Blocks to work with openFrameworks][2]

zipファイルの中には2つのファイルが入っています。その**中身**を、MinGWのフォルダの中に入れる必要があります。

- **add_to_codeblocks_mingw_include** フォルダの中身を、**C:\Program Files\CodeBlocks\MinGW\include** に追加 (もしくは、アプリの中の\mingw\includeへ)
- **add_to_codeblocks_mingw_lib** フォルダの中身を、**C:\Program Files\CodeBlocks\MinGW\lib** へ (もしくはアプリの\mingw\libへ)

![e_putInMingw](e_putInMingw-640x446.png)

Code::BlocksにはMinGWに追加する必要のある、補足的なライブラリとヘッダーがあります。

どのようにするのか解説した簡単なビデオチュートリアルがあります。

<iframe src="http://player.vimeo.com/video/33985058" width="500" height="313" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

**いつも楽しくやりましょう!**

[0]: http://www.codeblocks.org/downloads/26
[1]: http://www.codeblocks.org/downloads/5
[2]: http://www.openframeworks.cc/content/files/codeblocks_additions.zip
[3]: http://vimeo.com/33985058
