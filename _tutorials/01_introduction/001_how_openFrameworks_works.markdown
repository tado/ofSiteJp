---
date: 2012/02/23 10:00:00
title: openFrameworksはどうやって動いているのか
summary: oFのコードの中で用いられる共通のパターンについての簡単な解説
author: Arturo Castro
author_site: http://arturocastro.net
---

openFrameworksはオープンソースのC++書かれたツールキットで、シンプルで直感的な記述で創造的なプロセスを支援するようにデザインされています。ツールキットは汎用に使える「糊」として機能し、広く利用されている数多くのライブラリを束ねてまとめてくれます。

openFrameworksはわずかなパターンしか使用していないので、どのように作動しているのか知るのはとても簡単です。一度それらのパターンを理解さえすれば、openFrameworksの全ての機能も簡単に使えるようになるでしょう。

もし、あなたは既にoFの開発者として貢献しているのであれば、この文書は、どのようにしたら他のopenFrameworksのプロジェクトに一貫した方法で、あなた自身のクラスをコーディングするのかを知る上での助けになるでしょう。

##	 setup, update, draw

openFramewroksで最も実用的な方法はこのパターンです。oFに含まれている全てのサンプルは、この「setup・update・draw」メソッドを使用しています。

###setup()

setupメソッドは、アプリケーションが開始した際に一度だけ実行されます、主にofApp.hで宣言されたオブジェクトや変数を初期化といった用途に用いられます。


__ofApp.h__

~~~~{.cpp}
ofVideoPlayer player;
int counter;
~~~~

__ofApp.cpp__

~~~~{.cpp}
void ofApp::setup(){
    player.loadMovie("movie.mov");
    counter = 0;
}
~~~~

C++で変数の初期化に関する特に重要な注意事項として、変数は初期状態では初期化されていないという点があげられます。例えば、このサンプルでは最初に counter = 0; としています。しかしこの変数counterには別の値が入っていることが有り得ます。


###update/draw()

updateとdrawは無限ループと呼ばれます。アプリケーションが終了するまでは、繰り返し順番に実行されます。

updateは一般的にアプリケーションの状態を変更する際に用いられます。何らかの演算をする際には他のオブジェクトに対してupdateする必要があります、例えば動画の再生や、コンピュータビジョンや解析などあらゆる操作をするような際に当てはまります。

drawは、画面を描画する際に用いるようにします。



__ofApp.h__

~~~~{.cpp}
float x;
~~~~

__ofApp.cpp__

~~~~{.cpp}
void ofApp::setup(){
    x = 0;
}

void ofApp::update(){
    x++;
}

void ofApp::draw(){
    ofCircle(x,120,30);
}
~~~~

このコードはy = 120の位置で、スクリーンを左から右に円が移動します。

## クラス

openFrameworksの大部分はクラスから構成されています。クラスは3つのタイプがあります。

### ユーティリティ・クラス

このクラスは何かを行うためのクラスです。例えば、ofVideoGrabber、ofVideoPlayer、ofSoundPlayer、ofImageといったクラスがあげられます。これらのクラスの多くは「setup/update/draw」パターンを用います。もちろんその中には、例えばofSoundPlayerなどのように「draw」という関数名が意味を無さない場合もあるでしょう。そうした「draw」関数を持たないクラスもあります。

このクラスはShared Pointerパターンを引き継ぐものでもあります。これらの複製方法は「浅いコピー」と呼ばれます。「浅いコピー」はオブジェクトの参照を作成するのみで、オブジェクトはその内容はコピーしません。

例えば、もしビデオプレーヤーをコピーしてなにか変更を加えたとしたら、オリジナル自体も変更されるでしょう：


__ofApp.h__

~~~~{.cpp}
ofVideoPlayer player;
~~~~

__ofApp.cpp__

~~~~{.cpp}
void ofApp::update(){
    ofVideoPlayer player2 = player;
    player2.setFrame(100);
}
~~~~

もし現在のフレームを100に設定すると、playerとplayer2は双方同じく動作します、playerとplayer2は同じオブジェクトを参照しているからです。


### データ・コンテナ

このクラスはデータを保持します、そしてデータに対する操作を受けても元のデータを保持しつづけます。ofPixelsやofBufferなどのクラスがこれにあたります。

これらのクラスは「allocatte/loadData」パターンを継承します。allocateはコンテナ内のメモリー内にデータ領域を確保し、loadDataを使用してデータを入れこみます。関数の名前はクラスの内容によって変化することはありますが、その機能は同じです。こうしたクラスは「深いコピー」と呼ばれます。これは、新規に生成した同じコンテンツをもった全てのオブジェクトがオリジナルなものとなることを意味します。結果として、コピーされたオブジェクトのデータを変更しても、オリジナルに触れることはできません。


__ofApp.h__

~~~~{.cpp}
ofPixels pixels1, pixels2;
ofTexture tex1, tex2;
~~~~

__ofApp.cpp__

~~~~{.cpp}
void ofApp::setup(){
    pixels1.allocate(640,480,OF_IMAGE_COLOR)
    pixels1.set(0);
    pixels2 = pixels1;
    pixels2.setColor(10,10,ofColor(255,255,255);
    
    tex1.allocate(640,480,GL_RGB);
    tex2.allocate(640,480,GL_RGB);
    tex1.loadData(pixels1);
    tex2.loadData(pixels2);
}

void ofApp::draw(){
    tex1.draw(0,0);
    tex2.draw(660,0);
}
~~~~

このコードは完全に黒い画像をスクリーンの左に描画し、黒いイメージと白いピクセルを(10, 10)の位置に配置したものを右に描画します。pixel2 = pixel1を実行した際に、pixel2はpixel1と同じサイズのチャンネル分のデータ領域を確保します。そして、pixel1のデータがpixel2にコピーされます。

### GLデータ・コンテナ

GLデータ・コンテナは、データ・コンテナーの特殊なケースです。機能的にはとてもよく似ています。データを保持するには「allocate/loadData」パターンに従います。ofTexture、ofFbo、ofVbo、ofVboMeshなどが相当します。それらのクラス全てはglフォルダの中に格納されてます。ただし、glフォルダの中にあるクラスが全てデータ・コンテナというわけではありません。ofShader、ofLightなどはGLユーティリティクラスで、その他のユーテリティ・クラスと同様のふるまいをします。

GLデータ・コンテナとその他のデータ・コンテナの主要な違いは、GLデータ・コンテナは「浅いコピー」のパターンに従うというところです。この理由は、主にパフォーマンスに関連しています。GPU(ビデオカード)の中でリソースをコピーすることはスピードの定価を招きます。ですので、初期状態ではデータを複製しないようにしているのです。

例えば：

__ofApp.h__

~~~~{.cpp}
ofTexture tex1, tex2;
~~~~

__ofApp.cpp__

~~~~{.cpp}
void ofApp::setup(){
    tex1.allocate(640,480,GL_RGB);
    ofPixels pixels;
    pixels.allocate(640,480,OF_IMAGE_COLOR);
    pixels.set(0);
    tex1.loadData(pixels);
    tex2 = tex1;
    pixels.setColor(10,10,ofColor(255,255,255);
    tex2.loadData(pixels);
}

void ofApp::draw(){
    tex1.draw(0,0);
    tex2.draw(660,0);
}
~~~~

このコードは、黒い四角形の上に白いピクセルが(10, 10)の位置にある図形を右と左の両方に描画します。これは、GLのリソース管理は、実際には最初のテクスチャのID番号を参照しているに過ぎず、完全なコピーではないからです。データを変更すると、オリジナルのデータも変更されてしまいます。


### データ・タイプ

これらのクラスは、openFrameworksで使用するデータ型を表現します。ofRectangle、ofVec3f、ofMatrix4x4などのクラスが相当します。

## 関数

openFramworksのいくつかの機能は、プレーンなC言語として提供されます。これらは、通常はユーテリティ関数として機能します。ofToString()、ofRandom()、ofDrawBitmapString()、もしくはofCircle()やofRect()のような関数がこれにあたります。
