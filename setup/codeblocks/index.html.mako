<%inherit file="/_templates/markdown.mako" />

code::blocks セットアップガイド
=========================

わたしたちが、windows版のcodeblocksを好むのは軽いからです。また、windows visual studioのいくつかの癖を回避できます。この文書は、起動と実行までのステップ・バイ・ステップのチュートリアルです。

**a) code::blocksの最新版のバイナリーをダウンロード**

[Code::Blocksをダウンロード][0] 注：**mingwも一緒に**ダウンロードしてください。最新版は10.05で、問題なく動きます。

![a_download](codeblocks.png)  


**b) インストール**


![b_install](http://www.openframeworks.cc/wp-content/uploads/2009/07/b_install.png)  


**c) 何も設定を変更する必要はありません**


![c_setup](http://www.openframeworks.cc/wp-content/uploads/2009/07/c_setup.png)  

**d) ここでもnotを選択します、code::blocksをメインのIDEにはしないからです**

![d_assoc](http://www.openframeworks.cc/wp-content/uploads/2009/07/d_assoc-640x378.png)


**e) mingwのファイルを追加します**

devcppと同じように、いくつかのライブラリを追加します。ここからダウンロードできます。

* [oFのための追加ファイル][1]

zipファイルの中には2つのファイルが入っています。その**中身**を、mingwのフォルダの中に入れる必要があります。

* **add\_to\_codeblocks\_mingw\_include**フォルダの中身を、**C:\\Program Files\\CodeBlocks\\MinGW\\include**に追加 (もしくは、アプリの中の\\mingw\\includeへ)
* **add\_to\_codeblocks\_mingw\_lib**フォルダの中身を、**C:\\Program Files\\CodeBlocks\\MinGW\\lib**へ (もしくはアプリの\\mingw\\libへ)

![e_putInMingw](http://www.openframeworks.cc/wp-content/uploads/2009/07/e_putInMingw-640x446.png)

clodeblocksにはMinGWに追加する必要のある、補足的なライブラリとヘッダーがあります。

どのようにするのか解説した簡単なビデオチュートリアルがあります。[copying codeblocks](http://vimeo.com/33985058)

注：もし既にC++をインストールしたことがあるのなら、CBが正しくmingwフォルダを追加しているか確認してください(c:/program files/cb/mingw)。[より詳しい情報はこちら][2]

**楽しくやりましょう!**

[0]: http://www.codeblocks.org/downloads/26
[1]: http://www.openframeworks.cc/content/files/codeblocks_additions.zip
[2]: http://www.openframeworks.cc/forum/viewtopic.php?f=18&t=793


