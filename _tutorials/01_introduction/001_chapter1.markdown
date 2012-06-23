---
date: 2012/02/28
title: ofTutorials - Chapter 1 - 最初の一歩
summary: この章は、openFrameworksの基礎、プロジェクトを作成する正しい方法、ウィンドウサイズの設定、描画の基礎、などを始めるための助けとなるでしょう。
author: Jeff Crouse
author_site: http://www.jeffcrouse.info/
---

## openFrameworksディレクトリ構成
今このページを閲覧している皆様は[http://www.openframeworks.cc/download/]([http://www.openframeworks.cc/download/) のページでopenFrameworksアーカイブファイルをダウンロードし終わり、このセットアップガイドのページにたどり着いているものと思います。

まず最初にダウンロードしたopenFrameworksのアーカイブファイルを解凍し、解凍後に出来たフォルダを簡単にアクセス出来る場所に配置する事から行いましょう。  
個人的には下記の様に書類フォルダに配置し、そのショートカットをサイドバーに作成する方法を好んでいます。<br /><br />

![Shortcut](images/shortcut.png)

配置場所に関係なく、フォルダを開くと基本的に下記に示す様なフォルダ構成になっていると思います。

![addons, apps, and libs folders](images/structure1.png)

では、これらのフォルダがどんなものなのかを簡単に説明します。

#### addons
openFrameworks "core"は、最も重要な機能のみを含んでいます。addonsフォルダに追加されるものは、断片的な機能を持ったアプリケーションになります。例えば、XMLファイルを解析するようなものであったり、3Dモデルデータをロードしたり、openCVライブラリを利用したものであったりします。

#### apps
このフォルダが、あなたが作るアプリケーションを配置する場所となります。作業時間のほとんどを費やす場所でもあります。既に２つのフォルダ… appsフォルダとaddonExamplesフォルダが存在していると思います。

#### libs
oF coreと同レベルでopenFrameworksが使用する全てのライブラリがこのフォルダに含まれています。

**注意**：このドキュメントを読んでいれば、CodeForArtフォルダもaddons, apps, libsフォルダと同階層に持つ事になるでしょう。

## サンプルプログラムを試してみよう
appsフォルダにはexamplesフォルダとaddonsExamplesフォルダの２つのサブフォルダが存在します。両フォルダ内にはopenFrameworksが出来る事を説明している、いくつかのopenFrameworksプロジェクトが入っています。まず、アプリケーション開発に入る前に、これら全てのサンプルアプリケーションを動かしてみる事をお勧めします。ただし使用しているIDEによって若干動作させる方法が違います。


### XCode
apps/examples/graphicsExampleフォルダを開き、"graphicsExample.xcodeproj"ファイルをダブルクリックしましょう。

![navigate to graphicsExample](images/graphicsExample01.png)

この様なウィンドウが表示されます。

![graphicsExample 02](images/graphicsExample02.png)

**重要：**XCodeのバージョンを確認してください。メニューバーから、XCode > About XCodeで確認できます。もし4.0より小さいバージョンですとwindowの見た目がかなり違うと思いますが、慌てる必要はありません。インターフェース上、対応する機能は簡単に見つけられるはずです。

大きな"Run"ボタンが左上にあります。XCode3系をお使いの方であれば"Build & Run"という表記のボタンです。このボタンを押すと現在選択しているアーカイブターゲットが実行されます。しかしデフォルトではアクティブターゲットが"openFrameworks"となっていると思います。このまま"Run"ボタンを押しても何も行われません。今、実行したいプログラムは"graphicsExample"なので、もし以下の様に"openFrameworks"が選択されているのであれば、

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
冒頭で述べたように、openFrameworksは、うんざりするようなC++プロジェクトをセットアップする事に関しては必要ありません。しかしながらFlashやProcessingの様にプロジェクトの作成方法として"ファイル" > "新規作成"というようなものが存在しません。代わりにexampleプロジェクトをコピーする事で賄っています。

**重要：**
上記はexampleプロジェクトを修正したりexpampleフォルダ内にあなたの作ったアプリケーションを配置するべきではないという事を示唆しています。exampleプロジェクトは、あなた自身がこれから作ろうとするアプリケーションのスタートポイントとして配置（存在）されています。その為、何か新しいプロジェクトを作成する時のスタートポイントとして修正等行わずに維持しておいた方が良いです。この事はopenFrameworksの理解が進むにつれ分かってくると思います。

初心者の多くにとっては、これらは見た目よりも、大きな障害になる可能性がありますので、まず最初にいくつか用語を決めて、説明していきます。

appsフォルダを開くと、 _examples_ と _addonsExamples_ フォルダが存在しています。
これらを*ワークスペース*と呼ぶ事にします。

ワークスペースの一つを開いてみると、その中に幾つかのフォルダ… _easyCamExample_, _floatingPointImageExample_, _movieGrabberExample_, _serialExample_ などがあります。これらの１つ１つが*プロジェクト*になります。各プロジェクトは、".xcodeproj"ファイルと"src"フォルダを含んでいます。*プロジェクト*は、*ワークスペース*内に存在していないといけません。そして１つのアプリケーションとしてコンパイルされます。


![Workspace terminology](images/workspace04.png)

各*プロジェクト*を作るにあたり、各プロジェクトは*ワークスペース*内に配置しなければなりません。そして、*examples*と*addonsExamples*ワークスペース内には、他にあなたが独自に作成したものを配置する事を推奨しません。  
上記を踏まえ、まずは新しい*ワークスペース*を作ってみましょう。単に“MyFirstWorkspace”というフォルダをappsフォルダ内に作成してください。openFrameworksを使って行くうちに多くのワークスペースを作成することになるとおもいますが、"apps"フォルダ直下に置かなければいけないという事が重要です。言い換えれば、あるワークスペースは他のワークスペース内に配置する事は出来ないという事です。

!["My First Workspace"](images/workspace01.png)

次に、"emptyExample"フォルダを"examples"ワークスペースから"MyFirstWorkspace"フォルダへコピー（移動ではありません！）しましょう。Macをお使いの方でしたら文字通りemptyExampleフォルダをクリックして選択しコマンド＋Cでコピーして“MyFirstWorkspace”フォルダに移動しコマンド+Vでペーストになります。結果、次の様になっていると思います。

![My First Project](images/workspace02.png)

次に、コピーした"emptyExample"フォルダ名を"MyFirstProject"とリネームしましょう。

![My First Project](images/workspace03.png)

ここで一番重要な事は、XCodeプロジェクトファイルが、Rootフォルダ（色のついた上記の図を参照ください）から、*丁度*３つ下ったところに配置されている事です。新しいプロジェクトを作成した時に、明らかな理由がないにも関わらず、何千ものエラーが出た場合はXCodeプロジェクトファイルが正しい位置に配置されているかどうかを確認してください。

この理由は'lib'フォルダと関係しています。以前、openFrameworksは沢山のライブラリ群の"糊"であり、それらのライブラリ群は'lib'ディレクトリに配置されていますと説明しました。

またいろいろなライブラリ群を見つけてリンクをするのはIDEの仕事という事も知りました。その為IDEがあなたのプログラムをコンパイルしようとする時、"../../../lib"内からライブラリ群を探す様にセットアップされています。言い方をすると「フォルダを３つ戻ってlibフォルダを探す[relative to your .xcodeproj](http://support.dtsearch.com/webhelp/dtsearch/relative_paths.htm)」とも言えます。

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

リネームすると下記の様なダイアログボックスが表示されますので、"Rename"ボタンをクリックしましょう。

![Renaming your Project](images/rename02.png)

### 完成!
XCodeの"Run"ボタンをクリックすると、プログラムコードがコンパイルされ実行可能ファイルが“bin”ディレクトリ内に配置されます。この実行可能ファイルをダブルクリックすることで、アプリケーションが実行されます。
"MyFirstWorkspace/MyFirstApplication/bin"フォルダを見てみると、アプリケーションアイコンが見つかるはずです。
それが、あなたのアプリケーションです！　それをダブルクリックすると、先ほどと同様なグレーウィンドウが表示されると思います。これで、このアプリケーションをMacユーザの友達に送る事が出来ますし、友人達はその素晴らしいグレーウィンドウアプリケーションを実行する事が出来ます。

![Your Executable](images/workspace05.png)

## プログラムコードを書く
では、プロジェクト作成方法は理解出来たと思いますので、いくつかコードを書く事を始めてみましょう。これからのセクションではopenFrameworksアプリケーションの構造、単純な描画およびsetup関数の紹介になります。

### testApp.cpp

まず最初に、プロジェクトファイルをXCodeで開く必要があるので、先ほどのセクションで作成した"MyFirstWorkspace"ワークスペース内の"MyFirstProject"を用いて作成していきましょう。プロジェクトファイルを開いたらXCodeの一番左側にある*ナビゲーションビュー*にマウスを移動し、以下の様に三角マークをクリックして開きましょう。

![Open up the project](images/expand01.gif)

* "MyFirstProject"の横にある三角マークをクリック
* "src"の横にある三角マークをクリック
* testApp.cppをクリック

testApp.cpp は、これからのチュートリアルを行うにあたり一番見る機会が多いものになります。 *エディターウィンドウ*内で、以下の様になっているはずです。


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

ウィキペディアでは[function](http://en.wikipedia.org/wiki/Function_(computer_science))大きなプログラムの一部を構成するものと説明されています。

上記はコードの一部ですが、４つの関数〜setup, update, draw, keyPressed〜があります。
各々の関数は、１つの中括弧（{}）が付いています。通常、これらの中括弧内に書かれたものが、その関数を作ります。
（値の定義、繰り返し、その他の関数呼び出しなど）

イントロダクションのQ&Aにある「ソフトウェアフレームワークとは？」でお話した、
映画制作会社の説明が類似していて理解しやすいと思います。

openFrameworksがその基本的基盤や論理的な詳細を
どの様にして提供しているか？という事がtestApp.cppに書かれているものになります。

これらの関数は、あなたのプログラム実行中で、
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


### メイキングマーク
ofCircle関数を使用して灰色のウィンドウ内にシンプルな円を描画してみる事からスタートしてみようと思います。
draw()関数内に`ofCircle(200, 200, 60);` と入力してください。以下の様になります。

~~~~{.cpp}
void testApp::draw(){
    ofCircle(200, 300, 60);
}
~~~~

**注意**：各行の最後にセミコロンが存在している事に注意してください。すべての関数呼び出しはセミコロンで終わる必要があります。また、関数名はセンシティブです。OfSetColor, OFsetcolorとタイプしても実行されません。ofSetColorとタイプする必要があります。

では、プログラムを実行してください。以下の様に表示されるはずです。

![A Plain White Circle](images/MyFirstProject01.png)

おめでとう！ 今、あなたはスクリーン上に“何か”を表示できました！
でも、私たちは何を今行ったのでしょう？

[ofCircle](http://openframeworks.jp/documentation/graphics/ofGraphics.html#ofCircle)は、openFrameworksで定義された関数です（それ故、'of'というプレフィックスが付いているのです）。
ofCircleは、好きなだけdraw関数内で呼び出す事が可能です。ofCircleに続く括弧内の数字はパラメータと呼ばれています。[arguments](http://en.wikipedia.org/wiki/Parameter_(computer_programming)).
これらの値は関数が何を行うのかを正確に示しています。
「円を描きたい。でも何処に？どのくらいの大きさで？」という疑問の答えになっているということです。

関数は幾つもの値を持つ事ができます。これらの値はカンマで区切られています。ofCircleは３つの値を受け取ります。
x座標、y座標そして半径の３つです。

これらの値について理解する為に必要な事がいくつかあります。

* openFrameworksで使用される寸法値はピクセル単位です。先ほど作成した円の半径は60となっていますが、これは円内にトータルPI*60^2^ピクセル数存在している事を意味しています。

* 座標値（x,y）は円の中心を示しています。他のシェイプ（例えば四角形）は、左上を起点としています。

* 座標系の起点はウィンドウの左上となっています。私たちが作った円は左端から200ピクセル上から300ピクセルの位置に表示されます。

**注意**：パラメータの順番は重要です。ofCircleの最初の値は、いつも"x座標"を意味しますし、３番目の値はいつも"半径"を意味します。

**注意**：パラメータを１つも持たない関数が存在しますが、括弧は必要です。  
（例：[ofFill](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofFill)）

もしかするとofCircleについて[openFrameworks documentation page](http://www.openframeworks.cc/documentation/)のページで既に得ているかもしれません。このページは、これから参照する事が多くなると思います。

### 色を追加する
円を描画しましたが、少々つまらないので色について考えてみましょう。それには[ofSetColor](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofSetColor)が必要になります。`ofSetColor(255, 0, 255);`をofCircleの直前に追加してみてください。以下の様なコードになります。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
	ofCircle(200, 300, 60);
}
~~~~

では、アプリケーションを実行してみてください。

![A Plain White Circle](images/MyFirstProject02.png)

ofCircleと同じく、ofSetColorも３つの値を必要としています。ただ、値の意味は全く違います。ドキュメントページ[ofSetColor](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofSetColor)を見てみると、パラメータ値が赤、緑、青を示している事に気づくと思います。これらの値は、それぞれ0〜255の範囲になっています。例えば、`ofSetColor(255, 0, 255);`というのは「赤100%, 緑0%, 青100%」の色で全てのを描画する」という事になります。

**TIP** 値を変更して色が変化するのを試してみましょう。  

  
もう１点、重要な事があります。  
ofSetColorを呼びだす事はクレヨンを箱の中から選んでいるのと同じ様な事です。
ofSetColorをコールした後に描かれるものは再度ofSetColorをコールするまで色は変更されません。また、他の円を描画したい場合は下のコードの様に単にofCircoleを再びコールすれば可能です。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
    ofCircle(200, 300, 60);
    
    ofCircle(500, 500, 100);
}
~~~~

しかし違う色で円を描画したい場合はofSetColorを再びコールする必要があります。

~~~~{.cpp}
void testApp::draw(){
	ofSetColor(255, 0, 255);
    ofCircle(200, 300, 60);
    
    ofSetColor(0, 255, 255);
    ofCircle(500, 500, 100);
}
~~~~

![Two Colorful Circles](images/MyFirstProject03.png)

###使用できる図形
openFrameworksは、もちろん円以外のものも描画できます。

. 四角形 [ofRect](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofRect)：引数（x, y, width, height）


. 三角形 [ofTriangle](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofTriangle)：引数（x1, y1, x2, y2, x3, y3) 

. 線 [ofLine](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofLine)：引数(x1, y1, x2, y2)

. 楕円 [ofEllipse](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofEllipse)：引数(x, y, width, height)

. カーブ [ofCurve](http://www.openframeworks.cc/documentation/graphics/ofGraphics.html#ofCurve)：引数(x0, y0, x1, y1, x2, y2, x3, y3)  
（x1,y1）から（x2, y2）へカーブを描画します。  
　カーブはコントロールポイントである(x0, y0)と(x3, y3)によって形状が影響を受けます。

**注意**：コントロールポイントはトリッキーです。photoshopやillustratorを使用した事のある人であれば理解できるでしょう。もし使用した事がない人は[this tutorial](http://www.actionscript.org/resources/articles/172/1/Understanding-curves-and-control-point-placement/Page1.html)をチェックしてみてください。こちらはアクションスクリプトで書かれていますがカーブとコントロールポイントについてのコンセプトについて詳しい説明が掲載されています。

**TIP** “MyFirstWorkspace”ワークスペース内に３つのプロジェクトを作成し、それぞれで違う「形」を、いろいろな色や場所に描画してみましょう。


###動きを加える

静的な図形を描く事も面白いですが、その図形をスクリーン上で動かしてみる事はどうでしょう？

draw()関数は上述した様に、プログラム実行後、繰り返し呼ばれます。openFrameworksがアニメーションを表現する方法に直結している事な為、とても重要です。Flash等の"ステージ"に何かオブジェクトを置いて必要な時に位置を変更する様なアプリケーションを使用しているユーザにとっては、少々直感的でないかもしれません。

openFrameworks（もしくは、ほとんどのコンピュータアニメーション）での仕組みは違います。openFrameworksは、よりトラディショナル（私たちは保守的なディズニー/バンビを話しています。）なアニメーションです。毎フレーム時、全てのフレームを再描画する必要があるのです。

openFrameworksでは毎回draw()関数が実行される時が "１フレーム"となります。上記のプログラムを実行すると紫色の円が描画されますが、実際は「円が描画され、そしてクリアされる」という事を１フレームとして繰り返し実行されています。ただ、非常に高速に繰り返されているので、単純に表示されている様に見えているのです。

上記のサンプルでは円を描画する時にウィンドウ内のどこに円を描くかをofCircle関数に伝えるために２つの数値を使いました。したがって円を動かしたい場合は、これらの数値を時間と共に変更していく必要があります。例えば、最初の描画時の位置が(200, 300)であったとすれば、次は１ピクセル右に…(201, 300)、そして、もう１ピクセル右へ(202, 300)という感じで。

`c++`で、普段プログラミングを行う時に値を変更したい場合はいつも変数を宣言（作成）します。変数は、その時々で異なる形と大きさを持ちます。10進数、整数、文字、または文字列などです。今回はofCircle関数において座標を表現する為に２つの*int* 型を使用してみましょう。

下記の様な２行をtestApp.cppの一番上にある`#include“`の真下に書いてください。

~~~~{.cpp}
#include "testApp.h"

int myCircleX;
int myCircleY;
~~~~

これで２つの変数を"宣言"した事になります。１つは'myCircleX'で、もう１つは、'myCircleY'ですね。実際、あなたが好きな名前で宣言する事も出来ますが、変数名を決める時は、それがどのように使用されるか？どんなものに関連しているか？を考えて決める方が良い方法です。
また、これらの変数は整数値を保存する為にも使用します。
変数を宣言する事は重要で且つ必要なステップです。

次に必要な事は、これらの変数に初期値を与える事です。ここで最終的に行う事は、これらの変数値を時間と共に変更する事です。ただし値を変更する前に変数に初期値を与えておく必要があります。これは上記で作成した円を動かす前に、最初に何処に表示するか？という事になります。

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

３つの変数をofCircle関数に与えている事自体は変わっていませんが、(200, 300)と"ハードコーディング"していた為に変更できなかったものが変更可能な変数になりました。

この状態でアプリケーションを起動したとしても、何も変化していません。まだ何も値を変更する事を行っていない為です。
では、下記の様にdraw()関数を少々変更してみてください。

~~~~{.cpp}
void testApp::draw(){
	myCircleX = myCircleX + 1;
	
	ofSetColor(255, 0, 255);
	ofCircle(myCircleX, myCircleY, 60);
}
~~~~

setup()関数内で使用しているのと同じ様に、追加した新しい行で再び“代入演算子”を使用しています。この追加した行を言葉で説明すると「myCircleXに１を加え、その値をmyCircleXに代入せよ」となります。別の言い方をすると、「私たちが
myCircleXを増加させている」と言えます。`c++`は、値を増加させるための共通ショートカットとして`myCircleX++;`という表現を割り当てる事が出来るようになっています。これは非常によく使われる方法です。では、このショートカットを使ってコードを書き換えてみましょう。

myCircleX = myCircleX + 1;
は、
myCircleX++;
となります。

アプリケーションを動かしてみてください。円が画面の右の方へ動いているはずです！

より魅力的な動きにする前にもう１つ必要な事があります。  
update()関数とdraw()関数についての説明を再度読んでみると、draw()関数は描画する為の関数（今のところは十分なのですが）という事に気づくと思います。しかしupdate()関数は変数を更新する関数である事にも気づくと思います。この理由については後述致しますが、追加した新しい行をupdate()関数に移動してみましょう。

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


###フレームレート
「円の動き」について、最初はある意味スローだったスピードが速くなる事に気づく事があるかもしれません。アプリケーションが起動した直後はスロースピードであったのに、すごく速くなってしまう…これはアプリケーションのフレームレートに因るものです。既にお話してはいますが、フレームレートはdraw()関数／update()関数ループ処理の速度を示します。

下記の１行をdraw()関数の最後に挿入してみてください。アプリケーションウィンドウの左上にフレームレート値を見る事が出来るようになります。

~~~~{.cpp}
ofDrawBitmapString(ofToString(ofGetFrameRate())+"fps", 10, 15);
~~~~

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

**[TIP]** 毎秒60回update()関数が実行される毎に、円のx座標を1ピクセル増やしていますが、240ピクセル円を動かすには、何秒必要か考えてみてください。

**[TIP]** 動きが遅い！
フレームレートをコントロール出来るようになりましたが、60ピクセル／秒では、とても遅く思われるかもしれません。これを解消するにはフレームレート値を増やす方法がありますが、60fpsは非常に良い値なので、代りに円自身の動くスピードを変更してみましょう。毎1ピクセル増やしているところを、4ピクセルに変更してみます。ショートカットを使用してupdate()関数を以下の様に変更しましょう。


~~~~{.cpp}
void testApp::update(){
    myCircleX+=4;
}
~~~~


###パックマン エフェクト
それでは、「紫の円」に最後のエフェクトを付けてみましょう。ここまでで作成してきたアプリケーションでは、単に円がスクリーンの右へ移動し、結果的にスクリーンから消えてしまいます。そこで「スクリーン右側へ到達したら、スクリーン左側から再度出現させる」という修正を行ってみましょう。ちなみに、ここでは、これを**パックマン エフェクト**と呼びます。

コードを修正する前に、今のコード内に存在する変数という観点について考えてみましょう。現状、"myCircleX"は円のx座標を表現しており、毎フレームで1ピクセル（上述のtipを反映していれば4ピクセル）づつ増加しています。openFrameworksのデフォルトウィンドウサイズは1024x768ピクセルなのでパックマンエフェクトを実現する１つの方法としては、"myCircleX"が1024を超えたら、300にリセットする事で可能です。

では、どの様にすれば良いでしょうか？変数値を更新するには、update()関数で行うべき事を私たちは既に学んでいますね。
そして、**もし** 「“myCircleX”が1024より大きくなったら300に値をリセットする」としたい為、**if** 構文を使用します。

~~~~{.cpp}
void testApp::update(){
    myCircleX++;		
    if(myCircleX > 1024) 
    {
        myCircleX = 300;
    }
}
~~~~

このコードを説明すると、

- myCircleX を１増加します。
- myCircleXが1024を超えているか？テスト（確認）します。
- テスト結果が**真**の場合のみ、myCircleXを300にセットします。


インタラクション（相互作用）の追加
------------------

アニメーションについては、マスターしました！　では次に、ユーザの行動を取り込んでみましょう。このセクションではキーボードとマウスのインタラクションに注目してみます。
 
これまで、setup()、update()、draw()の３つの関数について見てきました。インタラクションを追加するにあたり、testApp.cpp内の以下２つの関数について見て行きます。

~~~~{.cpp}
void testApp::keyPressed(int key){

}

void testApp::keyReleased(int key){

}
~~~~

openFrameworksはユーザがキーボードを使用して何かを行った時に作成したアプリケーションにそれを知らせる為の仕組みを既に持っています。あなたが行うべき事はイベントが起きた時に実行させたい関数を用意する事のみです。

- ユーザーが物理的にキーを押した
- ユーザが物理的に押していたキーを離した

もし、あなたが「文字をタイプする」という事に対して、それは１つのアクションだと普段から考えている場合は、少々分かり難らいかもしれません。「私は、"O"という文字をタイプした！」という感じです。しかし、本来は２つのアクション（もしくは"イベント"）で構成されています。この違いについては簡単に理解する事になると思います。

"KeyboardInteraction"プロジェクトを“MyFirstWorkspace”ワークスペース内に作成します。もし作成方法を忘れていたら、“初めてのプロジェクト作成”に戻ってください。

![Keyboard Interaction Project](images/KeyboardInteraction01.png)


###coutコマンド
これらの関数が、どの様に動いているかを確認する為の一番速い方法はコンソールにメッセージを表示する事です。コンソールに"Hello, World!"と表示した事を覚えていますか？ `c++`の関数である[cout](http://www.cplusplus.com/reference/iostream/cout/["cout"])を使用しました。(c out と発音します。)
このcoutの構文が関数と同じ様なものでないので、使用する時に少々奇妙に感じるかもしれません(coutコマンドは、実際にはオブジェクトですが、これについては別の章で説明します)。　しかしデバッグするには、非常に便利なコマンドです。

プログラムが出力したテキストの確認についてですが、XCodeはそれを閲覧できるウィンドウを備えています。[stdout](http://www.cplusplus.com/reference/clibrary/cstdio/stdout/[stdout])
View->Debug Area->Activate Consoleもしくは、apple+shift+Cを押してみましょう。

![Activate Console](images/activate-console.png)


**注意**
XCode3を使用している方。Shift-Cmd-Rを使用してください。もしくはXCode設定で、Xcode->Preferences->Dubuggingの画面で、Start Show Consoleをオンにしましょう。

XCodeの下方に下記の様なパネルが表示されます。
![Debug Area](images/debug-area.png)

では下記の様に２つのキー関数にコードを追加し、コンソールに表示してみましょう。

~~~~{.cpp}
void testApp::keyPressed(int key){
    cout << "keyPressed " << key << endl;
}

void testApp::keyReleased(int key){
    cout << "keyReleased " << key << endl;
}
~~~~

上述した様に、cout関数の構文は、この章においては、少々奇妙に感じられると思います。`c++`では、coutは"標準出力ストリーム"と表現されています。“ストリーム”の意味については、特に気にする必要はありませんが、'keyPressed'内で使用しているcoutの行を見ると、coutが扱っているデータの"流れ"が存在していると見る事が出来ます。最初に、"keyPressed"という文字列を"流れ"に送り、そしてkey変数を送っています。最後に、[endl](http://www.cplusplus.com/reference/iostream/manipulators/endl/[endl])を呼び出しています。

'key'変数は、押された／離された「キー」を表しています。
それでは、アプリケーションを起動して、キーをタイプしてみましょう。試しに、“qwerty”とタイプしてみるとコンソール上では下記の様に表示されると思います。

~~~~{.cpp}
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
~~~~

前半部分の数行については、気にしないでください。デバッガによって追加されたものです。

'key'変数によって供給されているものは、実際には'int'型の値となっています。もしかしたら、あなたはstringもしくはchar型を想像したのではないでしょうか。実は、このint型の番号は、押されたキーの[ASCII](http://www.asciitable.com/[ASCII code])コードを示しています。

![ASCII Table](images/ascii_table.jpg)

キーボード上で見る事が出来るものが赤色の列にあります。"Dec"列（10進数）にある番号は、key関数で取得する番号が書かれています。

**[TIP]**
[type casting](http://www.cplusplus.com/doc/tutorial/typecasting/[type casting])という方法でint型からchar型あるいは文字に変換する事が可能です。"（char）"をkey変数の直前に置きます。
~~~~{.cpp}
cout << "keyPressed " << (char)key << endl;
~~~~
type casting については後述します。

コンソールに表示する事までは出来ましたが、キーを押す事によるインタラクションについて、もう少し進めてみたいと思います。

「動きを加える」で行った様に、testAppに２つの変数を追加し円を描画する事から始めます。

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

「動きを加える」のところで、変数を利用する事で円そのものを動かしました。これから行う事との違いは、ボールの動きをキーボードの入力によって作るところです。毎フレームごとに自動的に変数値を増加していたところをキーの入力によって変更する必要があるということです。具体的にはupdate()関数で更新する代りに、mousePressed()関数内（もしくはmouseReleased()関数でも良いでしょう）で、myCircleXとmyCircleY変数値を変更する必要があります。

それでは、典型的なゲームのキー・スキームに習って、「wを押した時は上へ」「aを押した時は左へ」「sを押した時は右へ」「dを押した時は下へ」動くようにしてみましょう。
ASCIIコード値表を参照してみると、それぞれの文字が119, 97, 115, 100の値である事がわかります。次に、どの値が「上」「下」「左」「右」であるのかについて考え、変数myCircleXとmyCircleYをどの様に変更していけば良いか？と考えてみると、以下の様なコードになります。

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

上記で分かる通り、キーを押した時にkeyPressed()関数が呼び出されます。そして、どのキーが押されたのかを判断したいので[if構文](http://www.cprogramming.com/tutorial/lesson2.html)を使用しています。ここではkeyPressed関数が呼ばれた時、最初に押されたキーのASCIIコードが119なのかをテストしています。


**注意**
ダブルイコールは、サインです。「代入」というよりもむしろ、「比較」を意味しています。119という数字を代入するのではなく、変数keyが119なのかどうかをテストするためにダブルイコールを使用します。結果がtrue（真）であれば、その直後の中括弧内のコードが実行されます。

sキーとdキーについての処理も追加してみてください。

**[TIP]**
以下のコードも同様に動作します。

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


###強力なマウス
キーボードによるインタラクションについて説明してきましたが、マウスではどうでしょうか。次の関数に気付いている人も多いかもしれませんね。

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

マウスによるインタラクションを試すために、MouseInteractionプロジェクトを新たに作成してください。

!["Mouse Interaction Project"](images//MouseInteraction01.png)

key関数と同じ様にmouse関数にも以下のコードを追加してみましょう。

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

cout構文内のxとyは、マウスをクリックした箇所の座標を表しています。
プログラムを実行して下記の様に表示されるか確認してください。

~~~~{.cpp}
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
~~~~

いくつか重要な事があります。まず“mouseMoved”メッセージが沢山表示されているかと思います。実際に、この関数は1ピクセル単位でマウスが動くたびに呼び出されますので、コードを追加する時には注意しましょう。次に、"mouseDragged"の前に必ず"mousePressed"がある事に気付くと思います。そして、“mouseMoved”へ戻る前に、沢山の"mouseDragged"が表示され、“mouseReleased”が表示されています。

###インタラクション・グラフィックス
マウスを使用した時に「何か」を起こす方法が分かりました。しかしコンソールに表示するのには難しい事です。インタラクションを採用したGUIアプリケーションでは、様々なマウスの使い方があります。単純なクリック、ダブルクリック、ドラック、マウスオーバ、ジェスチャー、etc.　これらのうち、基本的なもののうちの１つは「どこかで何かをクリックしたら、何かが起こる」です。では、これを実現する方法を見て行きましょう。

例として、円上でクリックした時に円を拡大してみます。まず、新しいプロジェクトMouseInteraction2プロジェクトを作成して、始めましょう。

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

上記のコードを見ると、'myCircleRadius'という新しい変数が追加されています。円を大きくしたい時に'myCircleRadius'変数値を増加させれば良いわけです。

マウスクリック時に円を大きくしたいので、mousePressed関数が関連している事になります。マウスをクリックする度に、mousePressed関数が呼び出される事は既に分かっているので、単に'myCircleRadius++'というコードをmousePressed関数に追加します。

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
	myCircleRadius++;
}
~~~~

アプリケーションを実行してみましょう。マウスをクリックすると円が大きくなっていく事が確認出来ると思います。しかし、円の外側でクリックしても大きくなっています。どうすれば*円内*でクリックした時にのみ、作用する様にする事が出来るのでしょうか？

円の中心とマウスクリックした座標間の距離を測り、この値が円の半径よりも小さい時が円内であると判断できます。

!["Hit Test 1"](images//hit-test-01.png)

半径が100として、マウスクリックした座標が円の中心から230ピクセル離れています。この場合、マウスクリックした場所は、円の内部でしょうか？

!["Hit Test 2"](images//hit-test-02.png)

このケースでは円の中心から90ピクセル離れているので、円の内部でクリックしているのは明らかです。

では距離を計算するには、どうすれば良いでしょう？　openFrameworksでは、ofDist([x1], [y1], [x2], [y2])という関数が用意されています。
これを使います。

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
    float distance = ofDist(myCircleX, myCircleY, x, y);
    cout << distance << endl;
    
    myCircleRadius++;
}
~~~~

'cout'では、ofDist関数から取得した値を確認するとこを行えます。　アプリケーションを起動してみましょう。マウスクリックした時に、どのような値がコンソールで表示されているか確認してみてください。

最後に距離と半径を比較し、距離が半径より小さい場合のみ'myCircleRadius'変数値を増加するコードを追加します。

~~~~{.cpp}
void testApp::mousePressed(int x, int y, int button){
    float distance = ofDist(myCircleX, myCircleY, x, y);
 	if(distance < myCircleRadius)
 	{
 		myCircleRadius++;
 	}  
}
~~~~

あらためて、コードの内容をまとめますと、
「円の中心とマウスクリックした座標の距離をまず計算し、'myCircleRadius'値と比較。もし距離がmyCircleRadiusよりも小さかったらmyCircleRadiusを１増加」という事になります。


テクニカル・トピック
----------------
ここまでの例で、私たちは一番基本的な制御構造について見てきました。ifステートメント[if statement](http://www.cprogramming.com/tutorial/lesson2.html)の様な制御構造は自分で定義した基準に基づいてプログラムのフローを変更する事が可能です。制御構造はopenFrameworksの"もの"ではなく、`c++`の機能です。そこで、幾つか`c++`の基本を見てみましょう。

###変数
「動きを加える」のところで、プログラムの方向性を変更する為に存在する変数について紹介しました。
２つの整数（integerもしくは*int*）を使用しました。　ー 'int myCircleX'と'int myCircleY'ー　円の位置を定義したものでした。int型として変数を定義した時、あなたはコンピュータに対し「この変数に全範囲の整数を代入する予定です。」と伝えている事になります。円をピクセル単位で動かしたサンプルプログラムに置いては、少数（数学的な）で心配する所はありません。

しかし、少数やその他の型を持つデータを保存する変数を持つ必要がある場合は注意する必要があります。
例えば、文字、文字列やメモリの場所などです。シチュエーションに寄って変数の型を使い分ける必要があります。[ここ](http://www.cplusplus.com/doc/tutorial/variables/)に幾つかのリストがあります。

!["Variable Types"](images//variable-types.png)

この表の様に、基本的なinteger型の変数はメモリに4バイトの空間を必要とします。メモリは有限なので使用できる大きさに制限があります（といっても、とても大きいですが！）。すなわち-2,147,483,648から 2,147,483,647です。もしこれ以上の数値を扱いたい場合はintegerではなく、long int型を使用しなければなりません。図には反していますが、long int型は、上限9,223,372,036,854,775,807で、下限-9,223,372,036,854,775,808となっています。

変数を取り扱う時、変数の型を区別する事は直感的だろうと思います。数は、数ですよね？　少数と整数を区別するのは、なぜでしょう？　メモリにどのくらいの量の値を保存しなければいけないのか？という事に関連しています。プログラム（アプリケーション）がより効果的に動作する為に、プログラマには最終的に必要な変数が、どのくらいの精度で、且つどのくらいの範囲で必要なのかをコンピュータに知らせる責任があるのです。

**[TIP]**
以下のプログラムをコンパイルして動かしてみてください。コンピュータがいろいろな種類の変数を扱っているかについて見る事が出来ます。

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

###ループ
ループはプログラマにとって重要なものの１つでしょう。ループは間違いなくコンピュータを使用する主要な利点です。どのくらい素早く処理を繰り返す事が出来るか？が、そのコンピュータの性能を示します。ループには幾つかの種類があります。これらを理解する事はとても重要な事です。

例えば20ピクセル毎に間隔をあけて円を描画したいとします。１つの方法としては、ofCircleコマンドをコピー＆ペーストしていく方法があるでしょう。

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

この方法で50行以上コピー＆ペーストする事になったとします。そして、もし20ピクセル毎ではなく、30ピクセル毎に修正したくなったとしたら、どうでしょう？　１行ずつコードを修正していかなければならなくなります。　そして更にウィンドウの大きさを変更しないといけなくなったら？どうでしょう。　コードの修正が大変になるのは明らかです。　では、以下のコードを見てみましょう。

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

１行で円を描画していたところを２行にしているという意味で、更に悪いコードになっています。しかし、１点重要な違いが見られます。このケースでは、２行を共通化しています。つまりタスク（円を描画する）を「抽象化」しているのです。

ではコンピュータに、この２行のコードを私たちが何度もコピー＆ペーストする換わりに行ってもらいましょう。それがループです！


###do...while

「ループ」は基本的に同じ形を取ります。

* 初期値を設定
* ループさせたい処理を実行
* ステップ２に戻るか、ループを終了するかを決定


最もシンプルなループは、do/whileループです。名前が示す様に、このループでは、コンピュータに「何かを行う」事を「ある条件に達する」まで要求する事が出来ます。　このループを使うことで51個の円簡単に描画できます。

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

では実際に何が行われているのでしょうか？　コンピュータになったつもりで１行ずつコードをみてみましょう。

* 変数iを宣言し、初期値を0に設定します。
* 変数xを宣言し、初期値を20に設定します。
* 円を(20, 30)の位置に半径10で描画します。
* xに20を加えます（=40）。
* iに１を加えます（=1）。
* i(=1)が51より小さいか？を確認します。 ..51より小さいのでループの最初に戻ります。
* 円を(40, 30)の位置に半径10で描画します。
* xに20を加えます（=60）。
* iに１を加えます（=2）。
* i(=2)が51より小さいか？を確認します。 ..51より小さいのでループの最初に戻ります。
* ..変数iが50（x = 1000）になるまで繰り返します。（残り47回）
* 円を(1000, 30)の位置に半径10で描画します。
* xに20を加えます（=1020）。
* iに１を加えます（=51）。
* i(=51)が51より小さいか？を確認します。 ..51より小さくないのでループ処理を終了します。

**[TIP]**
下記コードの様に、変数xに２つの義務を持たせる事も出来ます。

~~~~{.cpp}
int x = 20;
do {
	ofCircle(x, 300, 10);
	x+=20;
} while(x < ofGetWidth());
~~~~

ウィンドウサイズを変更した時の事を考慮したコードです。ウィンドウを大きくしたり小さくしたりしてみてください。円はウィンドウの大きさに応じて描画されます。

###while loop
whileループでは、whileの位置が単にループの上部に移動しただけです。以下の様なコードになります。

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

do..whileループとwhileループの違いは、条件判断が行われるタイミングが最初に行われるというところです。例えば、do..whileループを以下の様に修正したとしましょう。

~~~~{.cpp}
int x = 10;
do {
	ofCircle(x, 300, 10);
	x += 20;
} while( x < mouseX );
~~~~

変数xマウスのx座標より小さい場合にのみ円が描画される事に気ずくと思います。
特に、気にしていただきたい事は、マウス位置がどんなに左にあったとしても最低１つの円が描画されているところです。

では、次の様にwhileループを使ったコードに修正してみましょう。

~~~~{.cpp}
int x = 10;
while( x < mouseX )
{
	ofCircle(x, 300, 10);
	x += 20;
}
~~~~

さて、マウスをウィンドウの左側を超えところに移動してみますと、何も描画されません。理由は、ループ内の処理（ofCircleコマンド）が実行されるよりも前に、条件判断がされた為です。つまりmouseXが変数xより小さい場合は、円は全く描画されません。

###forループ

forループはおそらく最も私たちが使用するループになります。
なぜなら３つのパート（初期化、条件、変数値の増加）が１つに集約されている事が大きな理由です。
では、forループを使用して円を同様に描画してみましょう。

~~~~{.cpp}
int x = 20;
for(int i=0; i<51; i++)
{
	ofCircle(x, 300, 10);
	x+=20;
}
~~~~

慣れるまでforループの構文が少々手強いかもしれませんが、１つ１つ見て行きましょう。
まず最初のパート"int i=0;"ですが、これはとても簡単ですね。整数型の変数iを宣言しiの初期値として0をセットしています。次のパートで"i<51"は条件判断を行っています。変数iの値が51よりも小さいうちはループを継続したいという事をコンピュータに伝えています。最後のパート“i++”は変数値の増加パートです。毎ループ処理の後に変数iに1足しています。


###配列

もう１つのコピュータの強みは配列です。これは広い範囲の軌跡を１度に保つ事ができます。  
例えば6,000個の動いているパーティクルを描画したいとしましょう。何かを何度も繰り返し行う事は他愛もない事だという事をループセクションで学びましたが、今まで行ってきたとこは比較的一貫したパターンについてループを使用してきました。もし、それぞれ固有の位置を持った沢山のパーティクルを描画する場合は、少々複雑になります。


!["50000 particles!"](images//Arrays01.png)

**Figure 1.** 50000 particles! 

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

**[TIP]**
ofRandom()関数はランダムな数字を返します。この関数は２つの引数を取る事ができます。それは最小値および最大値です。このコードでは「0〜スクリーンの横幅までの値を返してください」と要求している事になります。  

技術的な意味で正常に動きますが、３つの円のみを描画しているに過ぎませんしコードは扱いにくいものとなっています。例えば1,000個の円を描画したい！と思った場合、非常に沢山の変数を取り扱わなければいけない事は明白で、しかも同じ方法でコードを記述していく事も同様に明白です。ではグループという考え方は使えないのでしょうか？ x座標を１つのグループとして、またy座標やその他についても同じ様にグループ化出来ないでしょうか？

この「グループ」の事を**配列**と呼んでいます。次のコードを見てみましょう。


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

ご覧の通り、int circle1x, int circle2x そして int circle3xをint circleX[3]に置き換えています。これにより3つの整数を、int型の値を格納する事が出来る**配列**に置き換えたのです。もうすこしコードを見てみましょう。配列に１つの値を代入する為には、ブランケット[]を使用します。例えば次の様な感じです。 

circleX[0] = 50;

draw関数を見てみましょう。前もって代入した値を使用するのに同じ構文を使っている事が分かります。 

しかし、依然としてコードは少々煩雑です。それはコード内でパターン化出来る箇所が存在しているにも関わらずループを使用していないという事…つまり、同じ様な構文を繰り返し使用しているところです。 

それではforループを使用してコードを綺麗にしてみましょう。

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

ブランケット[]内に直接数値をハードコーディングする換わりに、forループで使用している変数iを使います。


define
----------------
賢者がかつて、「プログラマの主な美徳は怠惰である事です」と言いました。  
例えば円の数を３つから500個に変更したくなったとしましょう。まず最初にcircleX[3]をcircle[500]に変更する事は明白ですね。circleYとcircleRadも同様です。しかし、これだけではありません。全てのforループ構文内でi<3をi<500にする必要があります。これでは修正箇所が多くなってしまいます。

もし配列で使用する値の個数をキープ出来る変数を使用する事が出来れば良いのですが…

~~~~{.cpp}
int num = 500;
float circleX[num];
float circleY[num];
float circleRad[num];
~~~~

ただ不幸な事に、この様に配列で使用する個数を変数を使用して宣言する事は出来ません。
換わりに#defineという新しい方法を使用する事が出来ます。


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

コードの一番最初に"#define NUM_CIRCLES 500"と書かれていますね。`c++`では、この行はコードと見なされませんが、コンパイラに対しては意味のあるメッセージと見なされます。「コードをコンパイルする前に、NUM_CIRCLESがコード内に存在したら、500という数字に置き換えろ」とコンピュータに伝えている事になります。たったそれだけの事です！#defineはコンパイラに対してメッセージを伝えるためのものです（もう少し正確に云うなら、プリプロセッサと言います）。[preprocessor directives](http://www.cplusplus.com/doc/tutorial/preprocessor/)　

プリプロセッサについては、もう少し議論する事がありますが、今のところは、#defineは単純に置換手続きであると覚えておきましょう。


###Functions

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

