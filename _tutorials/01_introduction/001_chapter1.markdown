---
date: 2012/02/28
title: ofTutorials - Chapter 1 - 最初の一歩 (翻訳中, under translation)
summary: この章は、openFrameworksの基礎、プロジェクトを作成する正しい方法、ウィンドウサイズの設定、描画の基礎、などを始めるための助けとなるでしょう。
author: Jeff Crouse
author_site: http://www.jeffcrouse.info/
---

## openFrameworksディレクトリ構成
今このページを閲覧している方々は、http://www.openframeworks.cc/download/ にてopenFrameworksアーカイブファイルをダウンロードし終わり、この適切なセットアップガイドのページにたどり着いているのかと思います。

まず最初にダウンロードしたopenFrameworksのアーカイブファイルを解凍し、解凍後に出来たフォルダを、簡単にアクセス出来る場所に配置する事から行いましょう。　個人的には、下記の様に書類フォルダに配置し、そのショートカットをサイドバーに作成する事が好きです。

![Shortcut](images/shortcut.png)

配置場所に関係なく、フォルダを開くと基本的に下記に示す様なフォルダ構成を見る事が出来るはずです。

![addons, apps, and libs folders](images/structure1.png)

では、これらのフォルダはどんなものなのでしょう？

#### addons
openFrameworks "core"は、最も重要な機能のみを含んでいます。addonsフォルダに追加されるものは、断片的な機能を持ったアプリケーションになります。例えば、XMLファイルを解析するようなものであったり、3Dモデルデータをロードしたり、openCVライブラリを利用したものであったりします。

#### apps
このフォルダが、あなたが作るアプリケーションを配置する場所となります。作業時間のほとんどを費やす場所でもありますね。既に２つのフォルダ… appsフォルダとaddonExamplesフォルダが存在していると思います。

#### libs
oF coreと同レベルでopenFrameworksが使用する全てのライブラリがこのフォルダに含まれています。

**注意**：このドキュメントを読んでいれば、CodeForArtフォルダもaddons, apps, libsフォルダと同階層に持つ事になるでしょう。

## サンプルプログラムを試してみよう
appsフォルダにはexamplesフォルダとaddonsExamplesフォルダの２つのサブフォルダが存在します。両フォルダ内には、openFrameworksが出来る事を説明している、いくつかのopenFrameworksプロジェクトが入っています。まず、アプリケーション開発に入る前に、これら全てのサンプルアプリケーションを動かしてみる事が、よい試みとなるでしょう。ただし使用しているIDEによって、若干動作させる方法が違います。


### XCode
apps/examples/graphicsExampleフォルダを開き、"graphicsExample.xcodeproj"ファイルをダブルクリックしましょう。

![navigate to graphicsExample](images/graphicsExample01.png)

この様なウィンドウが表示されます。

![graphicsExample 02](images/graphicsExample02.png)

**重要：**XCodeのバージョンが何か確認してください。メニューバーから、XCode > About XCodeで確認できます。もし4.0より小さいバージョンですとwindowの見た目がかなり違うと思いますが、慌てる必要はありません。 インターフェース上、対応する機能は、簡単に見つけられるはずです。

大きな"Run"ボタンが左上にあります。XCode3系をお使いの方ですと、"Build & Run"ボタンです。 このボタンを押すと現在選択しているアーカイブターゲットが実行されます。しかし、デフォルトではアクティブターゲットが"openFrameworks"となっていると思います。このまま"Run"ボタンを押しても何も行われません。　今、実行したいプログラムは"graphicsExample"なので、もし以下の様に"openFrameworks"が選択されていたら、

![openFrameworks library chosen](images/target-bad.png)

"openFrameworks"の部分をクリックして"graphicsExample"を選択しましょう。下記の様になると思います。

![graphicsExample target chosen](images/target-good.png)

では、"Run"ボタンをクリックしましょう！この様に表示されるはずです。

![graphicsExample, running](images/graphicsExample03.png)

エスケープキー　もしくは、Apple+Qでプログラムが終了します。

**注意：トラブルシューティング**

もしエラーが発生したら、"Base SDK"の設定を10.6にしましょう。

* 左端にある"graphicsExample"をクリック
* “Build Settings”をクリック　- 下記参照
* "All"と"Combined"を選択しておきましょう。
* *Base SDK* を選択して、10.6に設定しましょう。


![10.6 Fix](images/tenpointsix.png)
##### プロジェクト毎にこの設定を行う可能性があるので、慣れておく事をお勧めします。

では、全てのサンプルプログラムを試してみましょう。

### Code::Blocks

coming soon!

### Visual Studio

coming soon!

## 初めてのプロジェクト作成
冒頭で述べたように、openFrameworksは、うんざりするようなC++プロジェクトをセットアップする事に関しては必要ありません。しかしながらFlashやProcessingの様に、プロジェクトの作成方法として、"ファイル" > "新規作成"というようなものが存在しません。代わりにexampleプロジェクトをコピーする事で賄っています。

**重要：**
上記をふまえると、exampleプロジェクトを修正したりexpampleフォルダ内にあなたの作ったアプリケーションを配置するべきではないという事を意図しています。exampleプロジェクトは、あなた自身がこれから作ろうとするアプリケーションのスタートポイントとして配置（存在）されています。何か新しいプロジェクトを作成する時のスタートポイントとして維持しておいた方がよいでしょう。この大切さは、openFrameworksの理解が進むにつれ分かってくると思います。

初心者の多くにとっては、これらは見た目よりも、大きな障害になる可能性がありますので、まず最初にいくつか用語を決めて、説明していきます。

appsフォルダを開くと、 _examples_ と _addonsExamples_ フォルダが存在しています。
これらを*ワークスペース*と呼ぶ事にしましょう。

ワークスペースの一つを開いてみると、その中に幾つかのフォルダ… _easyCamExample_, _floatingPointImageExample_, _movieGrabberExample_, _serialExample_ などがあります。これらの１つ１つが*プロジェクト*になります。各プロジェクトは、".xcodeproj"ファイルと"src"フォルダを含んでいます。*プロジェクト*は、*ワークスペース*内に存在していないといけません。そして１つのアプリケーションとしてコンパイルされます。


![Workspace terminology](images/workspace04.png)

各*プロジェクト*を作るにあたり、各プロジェクトは*ワークスペース*内に配置しなければなりません。そして、*examples*と*addonsExamples*ワークスペース内には、他にあなたが独自に作成したものを配置する事を推奨しません。
という事をふまえ、まずは、新しい*ワークスペース*を作ってみましょう。単に“MyFirstWorkspace”というフォルダをappsフォルダ内に作成してください。openFrameworksを使って行くうちに、多くのワークスペースを作成することになるとおもいますが、"apps"フォルダ直下に置かなければいけないという事が重要です。言い換えれば、あるワークスペースは、他のワークスペース内に配置する事は出来ないという事です。


!["My First Workspace"](images/workspace01.png)

次に、"emptyExample"フォルダを"examples"ワークスペースから"MyFirstWorkspace"フォルダへコピー（移動ではないですよ！）しましょう。Macをお使いの方でしたら、文字通りemptyExampleフォルダをクリックして選択し、コマンド＋Cでコピーし、“MyFirstWorkspace”フォルダに移動して、コマンド+Vでペーストになります。結果、次の様になっていると思います。

![My First Project](images/workspace02.png)

次に、コピーした"emptyExample"フォルダ名を"MyFirstProject"とリネームしましょう。

![My First Project](images/workspace03.png)

ここで一番重要な事は、XCodeプロジェクトファイルが、Rootフォルダ（色のついた上記の図を参照ください）から、*丁度*３つ下ったところに配置されている事です。新しいプロジェクトを作成した時に、明白な理由がないにも関わらず、もし何千ものエラーが出た場合は、XCodeプロジェクトファイルが正しい位置に配置されているかどうかを確認してください。

この理由は'lib'フォルダと関係しています。以前、openFrameworksは沢山のライブラリ群の"糊"であり、それらのライブラリ群は'lib'ディレクトリに配置されていますと説明しました。

またいろいろなライブラリ群を見つけてリンクをするのはIDEの仕事という事も、知りました。そのため、IDEがあなたのプログラムをコンパイルしようとする時、"../../../lib"内からライブラリ群を探す様にセットアップされたり、また、別の言い方をすると、「フォルダを３つ戻ってlibフォルダを探す(http://support.dtsearch.com/webhelp/dtsearch/relative_paths.htm[relative] to your .xcodeproj)」とも言えます。

例えば、もしopenFrameworksプロジェクトの設定を深く掘った場合は、"../../../libs/FreeImage/include" や "../../../libs/poco/include"の様にして見つける事になるでしょう。

.xcodeprojファイルがof_preRelease_v007_osx/apps/[workspace]/[project]内にある限りは、全てコンパイルされるでしょうが、そうでなければ、コンパイル結果は醜いものとなるでしょう。

では、これで、あなたの最初のopenFrameworksプロジェクトが出来ました。"MyFirstProject"内のXCodeプロジェクトファイルをダブルクリックし、"emptyExample"がターゲットとして選択されている事を確認したら、"Run"ボタンをクリックしてみましょう。　

![My First Project](images/PlainGray.png)

なにもない！ですね。でも、これで大丈夫です。今のところ、エキサイティングなものではないのですが、これは正常な結果なのです。

エスケープキーまたはコマンド+Qでプログラムを終了できます。

### プロジェクト名の変更（XCode）
"emptyExample.xcodeproj"ファイル名を"MyFirstProject.xcodeproj"に変更したいと思うでしょう。もし使用しているXCodeのバージョンが4より小さい場合は可能ですが、XCode 4を使用している場合は、いくつか問題が生じます。
XCode4を使用している場合は、XCodeでプロジェクトを開き、左上にある"emptyExample"をクリックし選択します。

![Renaming your Project](images/rename01.png)

リネームすると、下記の様なダイアログボックスが表示されますので、"Rename"ボタンをクリックしましょう。

![Renaming your Project](images/rename02.png)

### 完成!
XCodeの"Run"ボタンをクリックすると、プログラムコードがコンパイルされ実行可能ファイルが“bin”ディレクトリ内に配置されます。この実行可能ファイルをダブルクリックすることで、アプリケーションが実行されます。
"MyFirstWorkspace/MyFirstApplication/bin"フォルダを見てみると、アプリケーションアイコンが見つかるはずです。
それが、あなたのアプリケーションです！　それをダブルクリックすると、先ほどと同様なグレーウィンドウが表示されると思います。これで、このアプリケーションをMacユーザの友達に送る事が出来ますし、友人達はその素晴らしいグレーウィンドウアプリケーションを実行する事が出来ます。

![Your Executable](images/workspace05.png)

## プログラムコードを書く
では、プロジェクト作成方法は理解出来たと思いますので、いくつかコードを書く事を始めてみましょう。これからのセクションではopenFrameworksアプリケーションの構造、単純な描画およびsetup関数の紹介になります。

### testApp.cpp

遂に！、プログラムコードを見て行くところまできました！まず最初に、プロジェクトファイルをXCodeで開く必要がありますね。先ほどのセクションで作成した、"MyFirstWorkspace"ワークスペース内の"MyFirstProject"で作成していきましょう。プロジェクトファイルを開いたら、XCodeの一番左側にある*ナビゲーションビュー*に目を移動し、以下の様に、三角マークをクリックして開きましょう。

![Open up the project](images/expand01.gif)

* "MyFirstProject"の横にある三角マークをクリック
* "src"の横にある三角マークをクリック
* testApp.cppをクリック

testApp.cpp は、これからのチュートリアルを行ううちに、一番見慣れていくものになるでしょう。 *エディターウィンドウ*内で、以下の様になっているはずです。


~~~~{.cpp}
#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){

}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){

}

//--------------------------------------------------------------
void testApp::keyPressed(int key){

}
~~~~
それでは、ここで何が行われいるのか見て行きましょう。

testApp.cppは、イントロダクションで既に書いたファイルですが、
いろんな意味でhello.cppの様なものです。

そして単なるc++ソースコードを含んだテキストファイルです。
IDEを使用して編集することによって、コードを理解することを楽にしてくれる
シンタックスハイライトが反映されていたり、コンパイルやプログラムを実行する時にも、
簡単になります。

まず基本的なことですが、からっぽな関数群が見えていると思います。

ウィキペディアでは（http://en.wikipedia.org/wiki/Function_(computer_science)[function]）、
大きなプログラムの一部を構成するものと説明されています。

上記はコードの一部ですが、４つの関数〜setup, update, draw, keyPressed〜があります。
各々の関数は、１つの中括弧（{}）が付いています。通常、これらの中括弧内に書かれたものが、その関数を作ります。
（値の定義、繰り返し、その他の関数呼び出しなど）

イントロダクションのQ&Aにある「ソフトウェアフレームワークとは？」でお話した、
映画制作会社の説明が、類似していて、理解しやすいと思います。

openFrameworksがその基本的基盤や論理的な詳細を
どの様にして提供しているか？がtestApp.cppに書かれているものになります。

これらの関数は、あなたのプログラム実行中に、
それぞれ違ったタイミングでopenFrameworksによって呼び出されます。

それでは、いくつかの関数を見ていきましょう。

#### setup
この関数は、アプリケーションライフサイクルの１番最初（ウィンドウがオープンされる前）に呼び出されるものです。
たとえば、ウィンドウサイズをセットしたい場合を考えると、ウィンドウが実際に開かれる（表示される）よりも前に行いたいですよね？その様な用途ととして、このsetup関数は適切なものになると思います。
	
#### update, draw
setup関数が実行された後、update関数とdraw関数はアプリケーションが終了するまでループします。つまり、setup()関数が実行された後、update()関数が実行されdraw()関数が実行され…update()関数ー＞draw()関数という様になります。これらの処理は基本的にはコンピュータが対応出来る範囲の速度で実行されます。
典型的にupdate()関数は、プログラムの状態をアップデートする為に使用され（例えば、変数値の変更）、その一方draw()関数でウィンドウ内で実際に描画を行う為に使用します。

#### keyPressed, keyReleased, mouseMoved, mouseDragged, mousePressed
上述した３つの関数とは違い、これらの関数は、ユーザが何かを行った時にのみ呼び出されます。想像できますか？
説明は、ここまでにして、実際にコードを見てみましょう。


### Making a Mark
ofCircle関数を使用して、灰色のウィンドウ内にシンプルな円を描画してみる事からスタートしてみようと思います。
draw()関数内に`ofCircle(200, 200, 60);` と入力してください。以下の様になります。

~~~~{.cpp}
void testApp::draw(){
    ofCircle(200, 300, 60);
}
~~~~

**注意**：各行の最後にセミコロンが存在している事に注意してください。すべての関数呼び出しはセミコロンで終わる必要があります。また、関数名はセンシティブです。OfSetColor, OFsetcolorとタイプしても実行されません。ofSetColorとタイプする必要があります。

では、プログラムを実行してください。以下の様に表示されるはずです。

![A Plain White Circle](images/MyFirstProject01.png)
おめでとう！ 今、あなたはスクリーン上に“何か”を表示できました！これからは、全て楽になっていきいますよ。
でも、私たちは何を今行ったのでしょう？

[ofCircle](http://openframeworks.jp/documentation/graphics/ofGraphics.html#ofCircle)は、openFrameworksで定義された関数です（それ故、'of'というプレフィックスが付いているのです）。
ofCircleは、好きなだけdraw関数内で呼び出す事が可能です。ofCircleに続く括弧内の数字はパラメータと呼ばれています。http://en.wikipedia.org/wiki/Parameter_(computer_programming)[arguments].
これらの値が、関数が何を行うのかを正確に示しています。
「円を描きたい。でも何処に？どのくらいの大きさで？」という疑問の答えになっているということです。

関数は幾つもの値を持つ事ができます。これらの値は、カンマで区切られています。ofCircleは３つの値を受け取ります。
x座標、y座標そして半径の３つです。

これらの値について理解する為に必要な事がいくつかあります。

* openFrameworks使用される寸法値はピクセル単位です。先ほど作成した円の半径は60となっていますが、これは円内にトーラルPI*60^2^ピクセル数存在している事を意味しています。
* これは明確な感じがしますが、座標値（x,y）は円の中心を示しています。他のシェイプ（例えば四角形）は、左上を起点としています。
* 座標系の起点はウィンドウの左上となっています。その為に、私たちが作った円は、左端から200ピクセル、上から300ピクセルの位置に表示されます。

**注意**：パラメータの順番は重要です。ofCircleの最初の値は、いつも"x座標"を意味しますし、３番目の値はいつも"半径"を意味します。

**注意**：パラメータを１つも持たない関数が存在しますが、括弧は必要です。（例：ofFill:http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofFill[ofFill]）

もしかするとofCircleについての情報をhttp://www.openframeworks.cc/documentation/[openFrameworks documentation page]で得ているかもしれません。この[openFrameworks documentation page]は、これから参照する事が多くなると思います。

### 色を追加する
円を描画しましたが、少々つまらないので色について考えてみましょう。それには、ofSetColor：http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofSetColor[ofSetColor]が必要になります。`ofSetColor(255, 0, 255);`をofCircleの直前に追加してみてください。以下の様なコードになります。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
	ofCircle(200, 300, 60);
}
~~~~

では、アプリケーションを実行してみてください。
![A Plain White Circle](images/MyFirstProject02.png)

ofCircleと同じく、ofSetColorも３つの値を必要としています。ただ、値の意味は全く違います。ドキュメントページ：http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofSetColor[ofSetColor]を見てみると、パラメータ値が赤、緑、青を示している事に気づくと思います。これらの値は、それぞれ0〜255の範囲になっています。例えば、`ofSetColor(255, 0, 255);`というのは、「赤100%, 緑0%, 青100%」の色で、全てのを描画する」という事になります。

TIP: 値を変更して色が変化するのを試してみましょう。

もう１点、重要な事があります。ofSetColorを呼びだす事は、クレヨンを箱の中から選んでいるのと同じ様な事です。
ofSetColorをコールした後に描かれるものは、再度ofSetColorをコールするまで、色は変更されません。また、他の円を描画したい場合は、下のコードの様に、単にofCircoleを再びコールすれば可能です。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
    ofCircle(200, 300, 60);
    
    ofCircle(500, 500, 100);
}
~~~~

しかし、違う色で円を描画したい場合は、ofSetColorを再びコールする必要があります。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
    ofCircle(200, 300, 60);
    
    ofSetColor(0, 255, 255);
    ofCircle(500, 500, 100);
}
~~~~

![Two Colorful Circles](images/MyFirstProject03.png)

使用できる図形
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

openFrameworksは、もちろん円以外のものも描画できます。

. 四角形：引数（x, y, width, height）
　http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofRect[ofRect]

. 三角形：引数（x1, y1, x2, y2, x3, y3) 
　http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofTriangle[ofTriangle]

. 線：引数(x1, y1, x2, y2)
　http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofLine[ofLine]

. 楕円：引数(x, y, width, height)
　http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofEllipse[ofEllipse]

. カーブ：引数(x0, y0, x1, y1, x2, y2, x3, y3)
　http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofCurve[ofCurve]
　（x1,y1）から（x2, y2）へカーブを描画します。カーブはコントロールポイントである(x0, y0)と(x3, y3)によって形状が影響を受けます。

**注意**：コントロールポイントはトリッキーです。photoshopやillustratorを使用した事のある人であれば理解できるでしょう。もし使用した事がない人は、http://www.actionscript.org/resources/articles/172/1/Understanding-curves-and-control-point-placement/Page1.html[this tutorial].をチェックしてみてください。こちらはアクションスクリプトで書かれていますが、カーブとコントロールポイントについてのコンセプトについて詳しい説明が掲載されています。

TIP: “MyFirstWorkspace”ワークスペース内に３つのプロジェクトを作成し、それぞれで、違う「形」を、いろいろな色や場所に描画してみましょう。


####動きを加える

静的な図形を描く事も面白いですが、その図形をスクリーン上で動かしてみる事はどうでしょう？

draw()関数は上述した様に、プログラム実行後、繰り返し呼ばれます。openFrameworksがアニメーションを表現する方法に直結している事な為、とても重要です。Flash等の"ステージ"に何かオブジェクトを置いて必要な時に位置を変更する様なアプリケーションを使用しているユーザにとっては、少々直感的でないかもしれません。

openFrameworks（もしくは、ほとんどのコンピュータアニメーション）での仕組みは違います。openFrameworksは、よりトラディショナル（私たちは保守的なディズニー/バンビを話しています。）なアニメーションです。毎フレーム時、全てのフレームを再描画する必要があるのです。

openFrameworksでは毎回draw()関数が実行される時が"１フレーム"となります。上記のプログラムを実行すると紫色の円が描画されますが、実際は「円が描画され、そしてクリアされる」という事を１フレームとして繰り返し実行されています。ただ、非常に高速に繰り返されているので、ただ表示されている様に見えているのです。

上記のサンプルでは、円を描画する時にウィンドウ内のどこに円を描くかをofCircle関数に伝えるために２つの数値を使いました。したがって円を動かしたい場合は、これらの数値を時間とともに変更していく必要があります。たぶん、最初の描画時が、(200, 300)の位置であったとすれば、次は１ピクセル右に…(201, 300)、そして、もう１ピクセル右へ(202, 300)という感じで。

`c++`で、普段プログラミングを行う時、値を変更したい場合はいつも変数を宣言（作成）します。変数は、その時々で異なる形と大きさを持ちます。10進数、整数、文字、または文字列などです。今回はofCircle関数において座標を表現する為に２つの*int* 型を使用してみましょう。

下記の様な２行をtestApp.cppの一番上にある`#include“`の真下に書いてください。

~~~~{.cpp}
#include "testApp.h"

int myCircleX;
int myCircleY;
~~~~

これで２つの変数を"宣言"した事になります。１つは'myCircleX'で、もう１つは、'myCircleY'ですね。実際、あなたが好きな名前で宣言する事も出来ますが、変数名を決める時は、それがどのように使用されるか？どんなものに関連しているか？を考えて決める方が良い方法です。
また、これらの変数は整数値を保存する為にも使用します。
変数を宣言する事は重要で且つ必要なステップです。「よし！、変更できる数値を保存する事が必要だ！」

次に必要な事は、これらの変数に初期値を与える事です。ここでの最終的に行う事は、これらの変数値を時間とともに変更する事です。ただし値を変更する前に変数に初期値を与えておく必要があります。これは上記で作成した円を動かす前に、最初に何処に表示するか？という事になります。

前章でsetup()関数はアプリケーションが起動した時に１度だけ呼び出され、２度と呼び出されないと学びました。初期値を設定する関数としてsetup()関数が役に立つようなので、次のコードを加えてください。


~~~~{.cpp}
void testApp::setup(){
	myCircleX = 300;
	myCircleY = 200;
}
~~~~

これでOKです！ 簡単に説明すると、２つの変数'myCircleX'と'myCircleY'を「初期化」もしくは「初期値を代入」した事になります。数学方程式の様に、300という値を'myCircleX'へ割り当てるためにイコール文字 '='を使います。`c++`では、イコール'='は、値を代入する為に使われているため、"代入演算子"として知られています。"演算子"は、いつも右から左へ流れます。代入される値は右辺に配置し、右辺に配置された値を受ける変数は左辺に配置します。

それでは、ofCircle関数を少々編集してみましょう。：

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
	ofCircle(myCircleX, myCircleY, 60);
}
~~~~

３つの変数をofCircle関数に与えている事自体はかわっていませんが、(200, 300)と"ハードコーディング"していた為に変更できなかったものが変更可能な変数になりました。

この状態でアプリケーションを起動したとしても、何も変化していません。まだ何も値を変更する事を行っていない為です。
では、下記の様にdraw()関数を少々変更してみてください。

~~~~{.cpp}
void testApp::draw(){
	myCircleX = myCircleX + 1;
	
	ofSetColor(255, 0, 255);
	ofCircle(myCircleX, myCircleY, 60);
}
~~~~

追加した新しい行で、setup()関数内で使用しているのと同じ様に、再び“代入演算子”を使用しています。この追加した行を言葉で説明すると「myCircleXに１を加え、その値をmyCircleXに代入せよ」となります。別の言い方をすると、「私たちが
myCircleXを増加させている」と言えます。`c++`は、値を増加させるための共通ショートカットとして`myCircleX++;`という表現を割り当てる事が出来るようになっています。これは非常によく使われる共通なものです。では、このショートカットを使って、コードを書き換えてみましょう。

....
myCircleX = myCircleX + 1;
....
becomes
....
myCircleX++;
....

アプリケーションを動かしてみてください。円が画面の右の方へ動いれいるはずです！

より魅力的な動きにする前にもう１つ必要な事があります。update()関数とdraw()関数についての説明を再度読んでみると、draw()関数は、描画する為（今のところ、十分なのですが）という事に気づくと思います。しかしupdate()関数は、変数を更新する関数である事にも気づくと思います。この理由については後述致しますが、追加した新しい行を、update()関数に移動してみましょう。

~~~~{.cpp}
void testApp::update(){
    myCircleX++;
}

void testApp::draw(){
	ofSetColor(255, 0, 255);
	ofCircle(myCircleX, myCircleY, 60);
}
~~~~

機能的な観点で違いを理解しなくとも、この習慣に慣れる事は良いことです。


####フレームレート

「円の動き」について、最初はある意味スローだったスピードが速くなる事に気づく事があるかもしれません。アプリケーションが起動した直後はスロースピードであったのに、すごく速くなってしまう…これはアプリケーションのフレームレートに因るものです。既にお話してはいますが、フレームレートはdraw()関数／update()関数ループ処理の速度を示します。

下記の１行をdraw()関数の最後に挿入してみてください。アプリケーションウィンドウの左上にフレームレート値を見る事が出来るようになります。

....
ofDrawBitmapString(ofToString(ofGetFrameRate())+"fps", 10, 15);
....

1000fpsに近い値になるかと思います。1秒間に約1000回、円が描画されているという事です。もし他のアプリケーションを沢山起動し、FinalCutで巨大なビデオのレンダリングを始めたとすると、フレームレート値が落ちていることに気付く事になるでしょう。アプリケーションは、単純にコンピュータが実行できる可能な速さで動こうとします。

スムーズに動かし、そしてより予測可能な観点として、フレームレートを適正な値…60くらいにセットしてみましょう。
その為に、setup()関数に、以下の１行を配置しましょう。

~~~~{.cpp}
void testApp::setup(){
    ofSetFrameRate(60);
    
    myCircleX = 300;
    myCircleY = 200;
}
~~~~

プログラムを起動してみてください。大分、円の動くスピートが遅くなったと思います。
上記で追加した関数は、「１秒間に60フレーム」という事を必ずしも保証しませんが、最低60フレームという事は保証されます。すごく古いコンピュータを使用している、もしくは他のプログラムによってプロセッサに極めて負荷がかかっていなければ、円を動かすようなシンプルな事に対しては、一貫して60fpsで動作するのに問題は起こりません。


TIP: SAT word problem #1: If we know that the update loop is happening (at most) 60 times/second, and we are incrementing the x coordinate of the circle by 1 pixel every time update is called, how long will it take for the circle to move 240px?

[TIP]
.Too bloody slow
=====================================================================
It's true that we now have a good handle on the framerate, but 60px/second turns out to be really slow. To fix this problem, we *could* increase the framerate, but 60fps is a pretty good framerate. so instead, let's change the speed of the circle itself:  instead of just incrementing the x coordinate by 1 pixel every time, let's increment it by 4. Using the same "incrementing" shortcut, we can change our update() function like this:

~~~~{.cpp}
void testApp::update(){
    myCircleX+=4;
}
~~~~
=====================================================================

The Pacman Effect
~~~~~~~~~~~~~~~~~

Let's have one final adventure with our purple circle before saying goodbye. Our application is still a litlte dissapointing because once our circle leaves the screen on the right, it's gone forever. Let's fix that problem by making the circle re-appear on the left side after leaving on the right: the Pacman Effect.

Before we write any code, let's think about what this is going to mean in terms of the variables that we have. In the current state, we have myCircleX acting as the x coordinate for our circle, and it is being incrementing by 1 (or 4, if you followed the tip above) every frame. By default, an openFrameworks window is 1024x768. So, one way we could achieve the Pacman Effect is to reset myCircleX back to 300 once it goes beyond 1024. 

How can we do this? We know that we are supposed to do any variable updating in the update() function, so let's start there. We also know that we *only* want to reset myCircleX *if* it has gone above 1024. So for that, we use the 'if' statement.

~~~~{.cpp}
void testApp::update(){
    myCircleX++;		
    if(myCircleX > 1024) 
    {
        myCircleX = 300;
    }
}
~~~~
This code says:

- increment myCircleX by one. 
- test if myCircleX is greater than 1024
- *only* if that test turns out to be true, set myCircleX back to 300;


Adding Interaction
------------------

Now that you are a master of animation, it's time to get the user involved. For this section, we will be focusing on keyboard and mouse interaction. 

So far, we've been focusing on 3 functions: setup(), update(), and draw(). For interaction, we will start with 2 of the other functions in your testApp.cpp file:

~~~~{.cpp}
void testApp::keyPressed(int key){

}

void testApp::keyReleased(int key){

}
~~~~

Going back to the producer metaphor can help us understand how these functions work. openFrameworks has done the hard work of setting up your app to know when the user has done some keyboard business. Now, all you have to do is put code into these functions that you want to execute when a particular event occurs: 

- user physically presses down on a key
- user physically releases the key

This might be a little unintuitive if you are accustomed to thinking about typing a letter as a single action: "I just typed the letter 'o'". But in fact, they are 2 distinct actions, or "events", and eventually you might find it handy to be able to distinguish between them.

Create a new project in "MyFirstWorkspace" called "KeyboardInteraction". If you need to, go back to "Creating your First Project" to see how.

image:images/KeyboardInteraction01.png["Keyboard Interaction Project"]

Introducing, cout!
~~~~~~~~~~~~~~~~~~

The easiest way to quickly see how these functions work is to print a message to the console. Remember when we printed "Hello, World!" to the console in the introduction? We did that using a `c++` thing called http://www.cplusplus.com/reference/iostream/cout/["cout"] (pronounced 'c out'). The syntax for using it is a bit weird because it's not technically a function (it's actually an object, which we will talk more about in later chapters), but if you can get beyond the syntax, it's actually very useful for debugging. 

But first: you may be asking yourself: how will we see text output? We are dealing with a GUI interface now. Luckily, XCode provdes a window where we can see anything text that your program outputs (also known as http://www.cplusplus.com/reference/clibrary/cstdio/stdout/[stdout]).

So start by going to View->Debug Area->Activate Console, or press apple+shift+C

image:images/activate-console.png["Activate Console"]

NOTE: For XCode 3 users, use the key command Shift-Cmd-R. There's also a preference in XCode to bring up the console after each launch - Xcode->Preferences->Debugging->On Start Show Console.

You should see a panel like this appear at the bottom of your XCode window

image:images/debug-area.png["Debug Area"]

Excellent! Your output will appear in the pane on the right. Now we will add some code to our key functions that will print stuff to the console:

~~~~{.cpp}
void testApp::keyPressed(int key){
    cout << "keyPressed " << key << endl;
}

void testApp::keyReleased(int key){
    cout << "keyReleased " << key << endl;
}
~~~~

As I mentioned before, the syntax for cout is a little strange and, frankly, way beyond the scope of this chapter. In `c++` parlance, cout represents the "standard output stream", and without worrying too much about what that means, "stream" is a nice way to think about it. If you look at the line of code within 'keyPressed', it appears that there is a "stream" of data flowing into the "cout". First we send in the string "keyPressed " down the stream, then we send in a variable: key. Finally, we send http://www.cplusplus.com/reference/iostream/manipulators/endl/[endl] down the stream. endl simply tells the console to go to the next line. 

The 'key' variable represents the key that was pressed or released. More about this in a bit.

Let's give it a try. Launch your program and type some keys. I will type "qwerty". You should see something like this in the console:

...................................
GNU gdb 6.3.50-20050815 (Apple version gdb-1708) (Thu Nov  3 21:59:02 UTC 2011)
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB. Type "show warranty" for details.
This GDB was configured as "x86_64-apple-darwin".tty /dev/ttys002
[Switching to process 92317 thread 0x0]
keyPressed 113
keyReleased 113
keyPressed 119
keyReleased 119
keyPressed 101
keyReleased 101
keyPressed 114
keyReleased 114
keyPressed 116
keyReleased 116
keyPressed 121
keyReleased 121
...................................

Don't worry about the crap at the beginning -- that's added by the debugger.

The fact that the 'key' is supplied as an 'int' may seem a bit strange. Perhaps you were expecting a string or a char? In fact, what this number represents is the http://www.asciitable.com/[ASCII code] for the key pressed. Check out this table:

image:images/ascii_table.jpg["ASCII Table"]

On the right of each column in red, you will see a key on your keyboard. Under the corresponding "Dec" (decimal=base 10) column, you will see the number that you will receive in the key functions. 

[TIP]
=====================================================================
You can actually use something called http://www.cplusplus.com/doc/tutorial/typecasting/[type casting] to turn the int into a 'char', or letter. Simply put "(char)" before the "key" variable so that your cout statement looks like this:
~~~~{.cpp}
cout << "keyPressed " << (char)key << endl;
~~~~
More about type casting later in this chapter!
=====================================================================

Fantastic. But presumably we want to do more with the key presses than print to the console. Let's use the keys to move a ball around on the screen.

Start by adding two variables to your testApp and using them to draw a circle, just like we did in the Adding Movement section:

~~~~{.cpp}
#include "testApp.h"

int myCircleX;
int myCircleY;

void testApp::setup(){
    myCircleX = 300;
    myCircleY = 200;
}

void testApp::update(){

}

void testApp::draw(){
    ofSetColor(255, 0, 255);
	ofCircle(myCircleX, myCircleY, 60);
}
~~~~

In the Adding Movement section, we used variables so that we could have the circle move by itself. The difference this time is that we want the ball to move in response to our keyboard input. This means that we need to modify the values of the variables depending on which keys are pressed rather than incrementing it automatically every frame. So it follows that we need to change the value of myCircleX and myCircleY in mousePressed() (or mouseReleased() -- it's up to you!) instead of update().

Let's use a typical computer game keyboard scheme: say we want the ball to move up when we press 'w', to the left when we press 'a', down when we press 's', and right when we press 'd'. We could start by looking up the ASCII values and finding that the values are 119, 97, 115, and 100, respectively. Next, we think about what "up", "down", "left" and "right" mean in terms of our variables: myCircleX and myCircleY. What we end up with is:

~~~~{.cpp}
void testApp::keyPressed(int key){
    if(key==119) // 'w' key
    {
        myCircleY--;
    }
    if(key==97) // 'a' key
    {
        myCircleX--;
    }
}
~~~~

As we discovered, any time any key is pressed, the keyPressed() function is called. However, we want to be more selective than that. We want to be able to make certain things happen when the 'w' key is pressed, and other things happen when the 'a' key is pressed, etc. So, we need to add some http://www.cprogramming.com/tutorial/lesson2.html[if statements]. When the keyPressed function is called, the first thing that happens is we test if 'key' is equal to 119. 

Notice the double equals sign. This signifies that we are performing a comparison rather than an assignment. In other words, we don't want to assign the value 119 to the variable 'key', we want to test whether key is equal to 119. If this turns out to be true, than the code inside the curly brackets immediately following the if() is executed.

Your challenge is to complete the function to respond to the 's' and 'd' keys.

[TIP]
=====================================================================
This also works!
~~~~{.cpp}
if(key=='w')
{
	myCircleY--;
}
if(key=='a')
{
	myCircleX--;
}
~~~~
=====================================================================


Mighty Mouse
------------

Keyboard interaction is great, but what about the mouse? You might have noticed the following functions hanging out in testApp also:

~~~~{.cpp}
void testApp::mouseMoved(int x, int y ){

}

void testApp::mouseDragged(int x, int y, int button){

}

void testApp::mousePressed(int x, int y, int button){

}

void testApp::mouseReleased(int x, int y, int button){

}
~~~~

Create a new project called MouseInteraction so we can play with them.

image:images/MouseInteraction01.png["Mouse Interaction Project"]

Let's do the same thing with the mouse functions that we did with the key functions. Add the following to your project:

~~~~{.cpp}
void testApp::mouseMoved(int x, int y){
    cout << "mouseMoved: " << x << ", " << y << endl;
}

void testApp::mouseDragged(int x, int y, int button){
    cout << "mouseDragged: " << x << ", " << y << " button: " << button << endl;
}

void testApp::mousePressed(int x, int y, int button){
    cout << "mousePressed: " << x << ", " << y << " button: " << button << endl;
}

void testApp::mouseReleased(int x, int y, int button){
     cout << "mouseReleased: " << x << ", " << y << " button: " << button << endl;
}
~~~~

The 'x' and 'y' variables in the cout statement represent the location of the mouse click -- very handy information to have.

Run the program and you should see something like this:

...................................
mouseMoved: 627, 500
mouseMoved: 619, 500
mouseMoved: 610, 500

...

mouseMoved: 426, 473
mouseMoved: 426, 476
mouseMoved: 427, 478
mousePressed: 426, 478 button: 0
mouseDragged: 427, 477 button: 0

...

mouseDragged: 548, 411 button: 0
mouseDragged: 547, 411 button: 0
mouseDragged: 546, 411 button: 0
mouseReleased: 546, 411 button: 0
mouseMoved: 544, 411
mouseMoved: 543, 411
mousePressed: 543, 411 button: 0
mouseDragged: 542, 411 button: 0

...

mouseDragged: 433, 396 button: 0
mouseDragged: 433, 377 button: 0
mouseReleased: 433, 377 button: 0
mouseMoved: 434, 370
mouseMoved: 433, 367
...................................

There are a few important things to notice about this output. First, you will probably see a ton of "mouseMoved" messages. Indeed, this function is called whenever the mouse is moved so much as a single pixel, so be aware of this when adding code to mouseMoved. Next, notice that you see a "mousePressed" before every "mouseDragged" event, and then a bunch of "mouseDragged" messages, and then "mouseReleased" before it switches back to "mouseMoved".

Interacting With Graphics
~~~~~~~~~~~~~~~~~~~~~~~~~

So now we know how to make something happen when the user does any mouse business. But printing to the console is hardly the kind of interaction we want. When it comes to interacting with GUI applications, the mouse is used in a variety of ways: simple clicking, double-clicking, dragging, hovering, gestures, etc. One very basic interaction is "user clicks on something, something happens." Let's see how we might accomplish this.

Suppose, for instance, that we wanted our trusty circle to expand whenever the user clicks on it. Let's start by setting up a new project called MouseInteraction2. It will start out very similar to our 'MouseInteraction' project:

~~~~{.cpp}
int myCircleX=200;
int myCircleY=300;
int myCircleRadius=100;

void testApp::setup(){
}

void testApp::update(){
}

void testApp::draw(){
    ofSetColor(255, 0, 255);
    ofCircle(myCircleX, myCircleY, myCircleRadius);
}
~~~~

As you can see, we have added a new variable called 'myCircleRadius'. It should be clear that, if we want the circle to grow, all we have to do is increase myCircleRadius. The trick will be to determine when this should happen.

It's clear that it has something to do with the mousePressed function that we just discovered above. We know that mousePressed is called every time the user clicks the mouse, so if we simply drop 'myCircleRadius++;' into the mousePressed function, we would be half way there. Try this out.

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
	myCircleRadius++;
}
~~~~

You should find that the circle grows every time you click the mouse, regardless of whether or not your clicked inside the circle. But our challenge is to only grow the circle when the use clicks *inside* of it. So how might we go about this?

Well, luckily we are dealing with a circle, which will make it significantly easier. Because if we can determine the distance between the center of the circle and the location of the mouse click, we can compare this distance to the radius, and if it is less than the radius, then the click was inside the circle. Take a look at the diagrams:

image:images/hit-test-01.png["Hit Test 1"]

We know that the radius of the circle = 300, and we know that the mouse click is 230 pixels away from the center of the circle. So, was the mouse click inside the circle?

image:images/hit-test-02.png["Hit Test 2"]

In this case, we know that the mouse click was 90 pixels from the center of the circle, so the click was clearly inside the circle.

So how do we measure this distance? openFrameworks provides a function called 
ofDist([x1], [y1], [x2], [y2]) that will save us from doing any basic trigonometry. All we have to do is give it our two coordinates. 

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
    float distance = ofDist(myCircleX, myCircleY, x, y);
    cout << distance << endl;
    
    myCircleRadius++;
}
~~~~

The 'cout' will allow us to check what kind of values we are getting from ofDist. Run your program now. Click around the screen and see what kind of values get printed in your console.

So the only thing left to do is compare 'myCircleRadius' to 'distance', and we can do this using a simple if statement.

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
    float distance = ofDist(myCircleX, myCircleY, x, y);
 	if(distance < myCircleRadius)
 	{
 		myCircleRadius++;
 	}  
}
~~~~

This code says "first calculate the distance btween the center of the circle and the mouse click. Then compare 'distance' to 'myCircleRadius'. If (and only if) distance is LESS THAN myCircleRadius, increment myCircleRadius by 1."

Et voila!  You are interacting with graphics!

Technical Topics
----------------

In the example above, we looked at one of the most basic control structures: the http://www.cprogramming.com/tutorial/lesson2.html[if statement]. Control structures like the if statement allow you to alter the flow of your program based on criteria that you define. Control structures are not an openFrameworks "thing", but rather a feature of the `c++` language. Let's take a moment to review a few basics of the `c++` language.

Variables
~~~~~~~~~

In the "Adding Movement" section, we introduced the idea of using variables to represent values that change over the course of your program. We used 2 integers, or *int*s - 'int myCircleX' and 'int myCircleY' - to represent the location of a circle. When you declare a variable as an 'int', you are telling the computer "I only intend to put whole numbers into this variable."  This made sense in our example because we were moving a circle by a single pixel, so we didn't need to worry about fractions. 

But there will be times when you do need to have a variable that can hold a fraction, or something completely different, such as letters, words, even a location in memory. There are variable types for each of these situations. Here is a short list of some of them from http://www.cplusplus.com/doc/tutorial/variables/[cplusplus.com]

image:images/variable-types.png["Variable Types"]

So, as you can see, our basic integer takes up 4 bytes in memory. This is a finite amount of memory, and therefore there is limited (but pretty huge!) range of values that it can hold: namely, -2,147,483,648 to 2,147,483,647. If you need to store higher (or lower) numbers, you'd have to use a 'long int', which (contrary to the diagram) can go up to 9,223,372,036,854,775,807 and down to -9,223,372,036,854,775,808. 

It may be unintuitive to make such distinctions when dealing with variables. A number is a number, right? Why differentiate between a decimal number and a whole number? The reason has to do with how values are stored in your computer's memory. Ultimately, by giving the programmer the responsibility of declaring what range and precision their variables need, the program can run that much more efficiently.

[TIP]
=====================================================================
Compile and run this program to see information about how your computer treats different kinds of variables.

~~~~{.cpp}
#include <iostream>
#include <limits.h>
#include <float.h>
using namespace std;

int main ()
{
	cout << "type \t\tsize \tmin \t\t\tmax" << endl;
	cout << "---------------------------------------------------------------" << endl;
	cout << "bool\t\t" << sizeof(bool) << endl;
	cout << "char\t\t" << sizeof(char) << "\t" << CHAR_MIN << "\t\t\t" << CHAR_MAX << endl;
	cout << "unsigned char\t" << sizeof(unsigned char) << "\t\t\t\t" << UCHAR_MAX << endl;
	cout << "short\t\t" << sizeof(short) << "\t" << INT_MIN << "\t\t" << INT_MAX << endl;
	cout << "int\t\t" << sizeof(int) << "\t" << INT_MIN << "\t\t" << INT_MAX << endl;
	cout << "unsigned int\t" << sizeof(unsigned int) << "\t\t\t\t" << UINT_MAX << endl;
	cout << "float\t\t" << sizeof(float) << "\t" << FLT_MIN << "\t\t" << FLT_MAX << endl;
	cout << "long\t\t" << sizeof(long) << "\t" << LONG_MIN << "\t" << LONG_MAX << endl;
	cout << "double\t\t" << sizeof(double) << "\t" << DBL_MIN << "\t\t" << DBL_MAX << endl;
	return 0;
}
~~~~
=====================================================================

There is one important kind of variable that is not covered in this chart: 'string'. A string can hold a sequence of characters. ... more to come ...

Loops
~~~~~

Loops are perhaps one of the most important things to be comfortable with as a programmer. They are, arguably, the main advantage of using a computer: doing something over and over again very rapidly is the definition of what a computer is good at. There are a few different kinds of loops, and it is important to be familiar with all of them.

Suppose you want to a circle every 20 pixels across your window. One option would be to copy and paste ofCircle commands like this:

~~~~{.cpp}
void testApp::draw(){
    ofCircle(20, 300, 10);
    ofCircle(40, 300, 10);
    ofCircle(60, 300, 10);
    ofCircle(80, 300, 10);
    ofCircle(100, 300, 10);
    ofCircle(120, 300, 10);
    // repeat 
    ofCircle(1020, 300, 10);
}
~~~~

That would be over 50 lines of code - ugh. And what if you decided you wanted them every 30 pixels instead of every 20 pixels?  You'd have to go back and edit each line of code. And what if the size of your window changed?  This is clearly unacceptable. Consider this code:

~~~~{.cpp}
void testApp::draw(){
	int x = 10;
	
	ofCircle(x, 300, 10);
	x += 20;
	ofCircle(x, 300, 10);
	x += 20;
	ofCircle(x, 300, 10);
	x += 20;
	ofCircle(x, 300, 10);
	x += 20;
	// copy and paste 47 more times
}
~~~~

In some ways, this is even worse. We've turned one line of code per circle into 2 lines of code per circle. However, there is one very important difference: in this case, the 2 lines are identical every time. We have "abstracted" the task -- that is, we have taken out the specifics and made it into a more general form. 

So now, all that's left to do is to tell the computer to do those 2 lines of code a bunch of times instead of us pasting it in ourselves. This is where loops come in.

do...while loop
^^^^^^^^^^^^^^^

All loops basically take the same form:

. Set up some initial values (initialization)
. Execute the body of the loop 
. Decide whether to go back to step 2 or exit the loop

The simplest loop is the do/while loop. As the name suggests, this loop allows you to ask the computer to "do" something "while" a condition is met. Using a do/while loop, we can easily draw 51 circles

~~~~{.cpp}
void testApp::draw(){
    int i = 0;
    int x = 20;
    do {
        ofCircle(x, 300, 10);
        x+=20;
        i++;
    } while( i < 51 );
}
~~~~

So what just happened?  Let's go through the code step by step as if we were the computer. I apologize that this is the most tedious thing you will ever read, but hopefully it will illustrate what is going on in the loop.

. Initialize a variable called i and set it equal to 0
. Initialize a variable called x and set it equal to 20
. Draw a circle at (20, 30) with a radius of 10
. Increment x by 20 (it now equals 40)
. Increment i by 1 (it now equals 1)
. Is 1 less than 51?  
.. Yes!  Go back to the beginning of the loop
. Draw a circle at (40, 30) with a radius of 10
. Increment x by 20 (it now equals 60)
. Increment i by 1 (it now equals 2)
. Is 2 less than 51?  
.. Yes!  Go back to the beginning of the loop
. Draw a circle at (60, 30) with a radius of 10
. Increment x by 20 (it now equals 80)
. Increment i by 1 (it now equals 3)
. Is 3 less than 51? 
.. Yes!  Go back to the beginning of the loop
. [REPEAT 46 TIMES UNTIL i=50 and x=1000]
. Draw a circle at (1000, 30) with a radius of 10
. Increment x by 20 (it now equals 1020)
. Increment i by 1 (it now equals 51)
. Is 51 less than 51? 
.. NO!  Exit out of loop and continue on to whatever comes next

[TIP]
=====================================================================
We could actually make this even a bit more efficient and make the 'x' variable to double duty like this:
~~~~{.cpp}
int x = 20;
do {
	ofCircle(x, 300, 10);
	x+=20;
} while(x < ofGetWidth());
~~~~
This has the added advantage of being immune to changes in window size. Try making the window bigger and smaller -- the circles will always be drawn to the end of the window.
=====================================================================

while loop
^^^^^^^^^^

In a while loop, the 'while' part is simply moved up to the top of the loop. So if we want to draw a string of circles with a while loop, it would look like this:

~~~~{.cpp}
int i = 0;
int x = 20;
while(i < 51)
{
	ofCircle(x, 300, 10);
	x+=20;
	i++;
}
~~~~

The only difference between a do...while loop and a while loop is that the the condition happens first, before the loop body runs. For example, suppose we edited our do...while loop like this:

~~~~{.cpp}
int x = 10;
do {
	ofCircle(x, 300, 10);
	x += 20;
} while( x < mouseX );
~~~~

Notice how we've changed the condition so that the circles will be drawn until 'x' is less than the x position of the mouse. Run this code and see what happens. Notice, in particular, that there is always 1 circle on the screen regardless of how far to the left the mouse goes. Now transform that into a while loop:

~~~~{.cpp}
int x = 10;
while( x < mouseX )
{
	ofCircle(x, 300, 10);
	x += 20;
}
~~~~

Now, if you move your mouse beyond the left side of the window, nothing at all is drawn. This is because before the body of the loop is executed (namely the ofCircle draw command), the test is done. So if mouseX is less than x, no circles are drawn at all.

for loop
^^^^^^^^

We've saved the best for last. The for loop is probably the one that you will use the most. This might be because it combines all 3 parts of a loop (initialization, condition, and incrementing) into one compact syntax. Let's draw the same circles using a for loop:

~~~~{.cpp}
int x = 20;
for(int i=0; i<51; i++)
{
	ofCircle(x, 300, 10);
	x+=20;
}
~~~~

The syntax of the for loop can be a little daunting at first, but let's take it apart piece by piece. The first part is initialization: "int i=0;"  Pretty straightforward: we now have an integer called i that we have set to 0. The next part is the condition: "i<51". In other words, we want the loop to continue so long as i is less than 51. And lastly,  the increment: "i++". After every iteration of the loop, we will increment i by 1.

We saw each of these things in the other kind of loops. THe only difference here is that they are all smushed into one line. 


Arrays
~~~~~~

Another strength of computers is that they are encyclopedic: that is, they can keep track of a huge number of things at a time. Suppose we want to draw six thousand moving particles?  We know from the loop section that it is trivial to do something over and over again, but so far, we have only used loops to achieve a relatively consistent pattern. If we want do draw tons of particles, each with their own position, things get a little more complicated.

.50000 particles!
image::images/Arrays01.png["Arrays!",width=500]

~~~~{.cpp}
float circle1x;
float circle1y;
float circle1r;
float circle2x;
float circle2y;
float circle2r;
float circle3x;
float circle3y;
float circle3r;

void testApp::setup(){
    ofSetFrameRate(24);
    
    circle1x = ofRandom(0, ofGetWidth());
    circle1y = ofRandom(0, ofGetHeight());
    circle1r = ofRandom(10, 40);
    
    circle2x = ofRandom(0, ofGetWidth());
    circle2y = ofRandom(0, ofGetHeight());
    circle2r = ofRandom(10, 40);
    
    circle3x = ofRandom(0, ofGetWidth());
    circle3y = ofRandom(0, ofGetHeight());
    circle3r = ofRandom(10, 40);

}

void testApp::update(){
    circle1x += ofRandom(-1,1);
    circle1y += ofRandom(-1,1);
    
    circle2x += ofRandom(-1,1);
    circle2y += ofRandom(-1,1);
    
    circle3x += ofRandom(-1,1);
    circle3y += ofRandom(-1,1);
}

void testApp::draw(){
    ofCircle(circle1x, circle1y, circle1r);
    
    ofCircle(circle2x, circle2y, circle2r);
    
    ofCircle(circle3x, circle3y, circle3r);
}
~~~~

TIP: Notice the use of ofRandom(). This function will return a random number. It takes 2 arguments: the minimum possible value and the maximum possible value. What I am saying in this code is "give me a number between 0 and the width of the screen."

Technically this works, but we have only drawn 3 circles, and already the code is getting unwieldy. We want to draw 1000! We clearly have a bunch of variables that are used in very similar ways. Why not group, say, all of the x coordinates into a single set, and all of the y coordinates, etc.?  

These sets are called arrays. Check out the following code:

~~~~{.cpp}
float circleX[3];
float circleY[3];
float circleRad[3];

void testApp::setup(){
    ofSetFrameRate(24);
    
    circleX[0] = ofRandom(0, ofGetWidth());
    circleY[0] = ofRandom(0, ofGetHeight());
    circleRad[0] = ofRandom(10, 40); 
    
    circleX[1] = ofRandom(0, ofGetWidth());
    circleY[1] = ofRandom(0, ofGetHeight());
    circleRad[1] = ofRandom(10, 40); 
    
    circleX[2] = ofRandom(0, ofGetWidth());
    circleY[2] = ofRandom(0, ofGetHeight());
    circleRad[2] = ofRandom(10, 40); 
}

void testApp::update(){
    
    circleX[0] += ofRandom(-1,1);
    circleY[0] += ofRandom(-1,1);

    circleX[1] += ofRandom(-1,1);
    circleY[1] += ofRandom(-1,1);
    
    circleX[2] += ofRandom(-1,1);
    circleY[2] += ofRandom(-1,1);
}

void testApp::draw(){
    
    ofCircle(circleX[0], circleY[0], circleRad[0]);
    ofCircle(circleX[1], circleY[1], circleRad[1]);
    ofCircle(circleX[2], circleY[2], circleRad[2]);
}
~~~~

As you can see, we've replaced int circle1x, int circle2x, and int circle3x with simply int circleX[3]. Now circleX is an "array" that can hold up to 3 integers, rather than just 1. Read a little further, and you will see that, in order to assign a value to one of the ints in the array, you use the square brackets, like this: circleX[0] = 50;  

Down in the draw function, you can see that we use the same syntax to use the values that we have previously assigned to a particular slot in the array.

But this is still kind of a mess. One sign that you might not be utilizing loops as much as possible is if you see patterns in your code -- that is, similar sequences of code over and over again. So let's try to clean this up even more using some 'for' loops. 

~~~~{.cpp}
float circleX[3];
float circleY[3];
float circleRad[3];

void testApp::setup(){
    ofSetFrameRate(24);

    for(int i=0; i<3; i++)
    {
        circleX[i] = ofRandom(0, ofGetWidth());
        circleY[i] = ofRandom(0, ofGetHeight());
        circleRad[i] = ofRandom(10, 40); 
    }
}

void testApp::update(){
    
    for(int i=0; i<3; i++)
    {
        circleX[i] += ofRandom(-1,1);
        circleY[i] += ofRandom(-1,1);
    }
}

void testApp::draw(){
    
    for(int i=0; i<3; i++)
    {
        ofCircle(circleX[i], circleY[i], circleRad[i]);
    }
}
~~~~

Now, instead of putting hard-coded numbers between the square brackets, we use the 'i' variable of our for loop.

#define
^^^^^^^

A wise person once said: the primary virtue of a programer is laziness. Suppose you wanted to change the number of circles that appear on the screen from 3 to 500. Obviously, the first step would be to change circleX[3] to circleX[500], and likewise circleY and circleRad. Oh, but that's not all. You'd still have to go through every "for" loop and change i<3 to i<50. That's a lot of work!  

It would be great if we could use a variable to keep track of how many items we have in our array! It might look something like this:

~~~~{.cpp}
int num = 500;
float circleX[num];
float circleY[num];
float circleRad[num];
~~~~

Unfortunately, this isn't possible. You can't use a variable to declare a variable. 

Instead, we will use a new thing called a #define (pronounced: "pound define"). Take a look at this:

~~~~{.cpp}
#define NUM_CIRCLES 500

float circleX[NUM_CIRCLES];
float circleY[NUM_CIRCLES];
float circleRad[NUM_CIRCLES];
int circleR[NUM_CIRCLES];
int circleG[NUM_CIRCLES];
int circleB[NUM_CIRCLES];

void testApp::setup(){
    ofSetFrameRate(24);
    
    for(int i=0; i<NUM_CIRCLES; i++)
    {
        circleX[i] = ofRandom(0, ofGetWidth());
        circleY[i] = ofRandom(0, ofGetHeight());
        circleRad[i] = ofRandom(10, 40); 
        
        circleR[i] = ofRandom(0, 255);
        circleG[i] = ofRandom(0, 255);
        circleB[i] = ofRandom(0, 255);
    }
}

void testApp::update(){
    
    for(int i=0; i<NUM_CIRCLES; i++)
    {
        circleX[i] += ofRandom(-1,1);
        circleY[i] += ofRandom(-1,1);
    }
}

void testApp::draw(){
    
    for(int i=0; i<NUM_CIRCLES; i++)
    {
        ofSetColor(circleR[i], circleG[i], circleB[i]);
        ofCircle(circleX[i], circleY[i], circleRad[i]);
    }
}
~~~~

At the very top, notice the line "#define NUM_CIRCLES 500". This isn't technically a line of `c++` code, but rather a message to your compiler. It tells the compiler "before you start compiling code, anywhere you see NUM_CIRCLES, replace it with 500". That's it! A #define is one of a couple messages that you can send to the compiler (or, more accurately, the preprocessor), known more broadly as http://www.cplusplus.com/doc/tutorial/preprocessor/[preprocessor directives]. We will talk more about them at a later date., but for now, all you need to know is that #define is a very simple find/replace procedure. 


Functions
~~~~~~~~~

~~~~{.cpp}
void drawStar(float xpos, float ypos, float radius, int npts)
{
    bool useInner=false;
    ofBeginShape();
    for(int i=0; i<360; i+=360/npts)
    {
        int r = useInner ? radius*.6 : radius;
        int x = xpos + cos( ofDegToRad(i) ) * r;
        int y = ypos + sin( ofDegToRad(i) ) * r;
        ofVertex(x, y);
        useInner = !useInner;
    }
    ofEndShape();
}
~~~~

