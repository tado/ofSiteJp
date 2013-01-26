---
date: 2012/02/24 10:00:00
title: パーティクルシステム入門 (翻訳中, under translation)
summary: プログラムの入門としてパーティクルシステムの作成を楽しみませんか?
author: Patricio Gonzalez Vivo
author_site: http://patriciogonzalezvivo.com
---

ここまで読んだあなたは、openFrameworksのインストール方法、IDEの設定、サンプルプロジェクトのコンパイル方法を理解できているでしょう。
ここでは次のステップに移り、実際にものを作っていきます。

## 1. 描画する

早速、何かを描いてみることから始めます。何かを描画したい場合には ```testApp.cpp``` の `void testApp::draw()` に、コードを書くのでした。
 
"Hello World"プログラムのグラフィック版として、青い円を描いてみましょう。

~~~~{.cpp}
    void testApp::draw(){
        ofBackground(0);
        ofSetColor(0,0,255);
        ofFill();
        ofCircle(100, 100, 30);
    }
~~~~

Processingの経験があれば、"of"という文字から始まっている点を除いて親しみやすいコードでしょう。

最初の行では `ofBackground(0);` で背景を黒に設定しています。これは、 `ofBackground(76,63,72)` のようにRGBチャンネルでも設定することができます。より直感的に `ofBackground(ofColor::black);` という指定もできます。
背景を描画した後、これから描画するものに対して描画色を指定しています。 `ofSetColor(int r, int g, int b)` を使って色を指定すると、その部分から再度変更しない限りプログラムの最後まで指定した色が使われます。このような色の指定はopenGLの手法に倣ったものです。一度、定義すると変更しない限り、その定義が使われます。なれないうちはしっくりと来ないかもしれませんが、属性を扱う際には良い方法だという事がわかってくるでしょう。
`ofBackground` と同じように `ofSetColor(ofColor::blue)`とすることもできます。
次に`ofFill()`で画像を色で塗るかどうかを定義しています。逆に`ofNoFill()`を使えば輪郭のみを描画します。輪郭のみを描画したい場合には`ofSetLineWidth(4)`というコードも試してみて下さい。
背景と描画色を設定したので、`100, 100`に位置する30ピクセルの小さな円を描きます。

![Image: coordinates.jpg](001_images/coordinates.png)

図の様に、`x`と`y`の座標は原点`0,0`を右上として見たものです。

そのため、`1024,768`というサイズのウィンドウの中央に円を書きたい場合には`ofCircle(1024/2, 768/2, 30)` のように指定します。しかし、ウィンドウの大きさはユーザが自由に変更することができます。ウィンドウサイズが変われば、円の位置は中心からずれてしまいます。

このような場合にはoFのメソッドを使って解決してみましょう。oFでは`ofGetWindowWidth()`と`ofGetWindowHeight()`というウィンドウの高さと幅を返すメソッドが用意されています。何かを描画したい場合にはこのメソッドは重宝します。また、同じようなメソッドとして`ofGetScreenWidth()`、`ofGetScreenHeight()`というスクリーンの高さと幅を返すメソッドもあります。
これらのメソッドを使って、さきほどのプログラムを書き換えてみましょう。

~~~~{.cpp}
    void testApp::draw(){
        ofBackground(30,10,30);
        ofSetColor(ofColor::blue);
        ofFill();
        ofCircle( ofGetWindowWidth()*0.5, ofGetWindowHeight()*0.5, 30);
    }
~~~~

これで、ウィンドウサイズを変えても小さな青い円はウィンドウの中心に位置するようになりました!

グラフィックに関しては、[http://openframeworks.jp/documentation/](http://openframeworks.jp/documentation/) のGraphicのセクションを見れば、`ofLine()`、`ofRect()`のような他のメソッドを探すことができます。

oFのドキュメントではopenFrameworksの全ての関数とクラスがまとまっています。もっとたくさんのコードを試していくとすぐに「oFのやりかた」がわかるようになり、直感的にプログラムを書くことが出来るようになるでしょう。

課題: ここまで学んできた知識と[http://openframeworks.jp/documentation/](http://openframeworks.jp/documentation/) を使って、デジタルなカンディンスキー風のアートワークを作成してみてください。良い結果を得るために`ofEnableSmoothing()`を使ってみてください。グラフィックのエッジや`ofBackgroundGradient(ofColor::white, ofColor(255,255,200), OF_GRADIENT_CIRCULAR);` で生成したグラデーションをスムーズに描画することができます。

![Image:kandisky.jpg](001_images/kandinsky.jpg)

## 2. 物体を動かす

さて、ここまでやってたことには、あなたが期待していたであろうインタラクティブ性はありません。物体を動かしてみましょう。

以下のtestAppクラスにはoFが用意している変数 `mouseX`と`mouseY`が書かれています。これらの変数は名前通りの値を表しています。前述のサンプルコードの`draw()`を書き換えてみましょう。

~~~~{.cpp}
    void testApp::draw(){
        ofBackground(30,10,30);
        ofSetColor(ofColor::blue);
        ofFill();
        ofCircle( mouseX, mouseY, 30);
    }
~~~~

円ではなく、矩形を使いたい場合( `ofRect(mouseX, mouseY, 30, 30);` ) マウスの位置と矩形の中心があっていないことに気付くでしょう。これは矩形が左上から描かれるためです。スクリーンへの描画と同じように行いたい場合には矩形を中心から描くために`ofSetRectMode(OF_RECTMODE_CENTER);`を使って下さい。

すべて大文字で"OF_"から始まるのはモードや予め定義されている型を表しています。多くの種類を使うので、使用しているIDEの自動補完で探すか、「Jump to definition」機能を使って調べてみて下さい。

これまでのプログラムでは`draw()`メソッド内だけにコードを書いていましたが、oFの特徴でもある`update()`、`setup()`を使っていきます。まずは円を動かすための2つの変数`x`と`y`を定義します。変数を`draw()`か`update()`メソッド上で定義するとループが終わる度に生成、破棄されます。変数を各ループ上で「保存」しておきたい場合には常に動いているtestAppクラスで定義しておかなければなりません。testAppクラスに変数を定義するには`testApp.h`を以下の様に記述します。


~~~~{.cpp}
    class testApp : public ofBaseApp{
    public:
        void setup();
        void update();
        void draw();

        void keyPressed  (int key);
        void keyReleased(int key);
        void mouseMoved(int x, int y );
        void mouseDragged(int x, int y, int button);
        void mousePressed(int x, int y, int button);
        void mouseReleased(int x, int y, int button);
        void windowResized(int w, int h);
        void dragEvent(ofDragInfo dragInfo);
        void gotMessage(ofMessage msg);

        float xPos;
        float yPos;
    };
~~~~

この2つの変数はボールの最新の位置を保存しておくために利用し、値を各ループ内でのマウスの位置に変更していきます。

~~~~{.cpp}
    void testApp::setup(){
        // 輪郭を滑らかにする
        ofEnableSmoothing();

        // フレームレートを設定する   
        ofSetFrameRate(30);

        // ボールの初期X座標
        xPos = ofGetWindowWidth()*0.5;

        // ボールの初期Y座標
        yPos = ofGetWindowHeight()*0.5; 
    }

    void testApp::update(){
        xPos += ( mouseX - xPos )*0.1;
        yPos += ( mouseY - yPos )*0.1;
        // ボールのxとyの距離をマウスの位置に設定する
        // ここでは、x,yの変数を調整している
    }

    void testApp::draw(){
        ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
        ofSetColor(200,200,124);
        ofFill();
        ofCircle( xPos, yPos, 30);
    }
~~~~

無事にボールを動かすことができました。プログラムと対話する方法としてはキーボードを使う方法もあります。OpenFrameworksではマウスとキーボードのイベントを扱うために異なるメソッドが用意されています。`testApp.cpp`の下の方を見てみると`keyPress()`、`keyRelease()`、`mouseMove()`、`mouseDragged()`、`mousePressed()`、`mouseReleased()`というメソッドがあります。
ここでは、`ofRandom()`、`ofNoise()`といったメソッドを使ってランダムな効果を与えることができます。このメソッドについてはドキュメント([http://openframeworks.jp/documentation/](http://openframeworks.jp/documentation/))を読むことをおすすめします。また、`openFrameworks/examples/math`でGolanによるoFNoiseの例を見ることができます。

マウスボタンを押すとボールがウィンドウ内のランダムな位置に移動するというシンプルな効果を加えます。

~~~~{.cpp}
    void testApp::mousePressed(int x, int y, int button){
        xPos = ofRandom( ofGetWindowWidth() );
        yPos = ofRandom( ofGetWindowHeight() );
    }
~~~~

課題: クラス内の全てのメソッドからアクセスすることができる変数を作る方法を学んだので、データを保存し、それを再利用する方法が分かりました。カンディンスキーのプロジェクトで、ウィンドウ内をクリックすると全ての要素の位置が変わる様にしてみて下さい。カンディンスキーメーカーです。慣れてきたら、動きにアニメーションを加えても良いでしょう。            

## 3. クラス

これまでの課題では、最終的に似たようなコードを繰り返し書かなければならないことがわかります。コンピュータの主な役割は、私たちの仕事を簡単にしてくれることです。特に繰り返し行うものに特化しています。
[アラン・ケイ](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%A9%E3%83%B3%E3%83%BB%E3%82%B1%E3%82%A4)は、抽象的なオブジェクトを作り、それを再利用するため、また物事を簡潔、柔軟に表すためにオブジェクト指向プログラミング(C++の主な特徴でもあります)というアイデアを用いました。

「オブジェクト」を作り、使うためにはクラスと呼ばれるものを作る必要があります。
ボールを例に考えてみましょう。
ボールは球状のもので、位置や色、動きまわるといった属性(property)を持っています。これらの抽象的な特徴は以下の様に考えることができます。

ボール:

- 位置 (属性)

- 色 (属性)

- 動く (関数またはメソッド)

`.h`ファイルはまさにオブジェクトを作るためのこれらのリストを定義するファイルなのです。新たに2つのファイルをプロジェクトに加えてみましょう(ファイルの作成方法は使用しているIDEによって異なります)。"ball.h"(ボールを構成する要素を定義する)と"ball.cpp"(ボールを構成する要素が互いにどのように振る舞うかを定義する)です。


![Image:kandisky.jpg](001_images/newFile.png)

`ball.h`は以下の様にします。

~~~~{.cpp}
    #ifndef ball_h
    #define ball_h

    #include "ofMain.h"

    class Ball {
    public:
            // Constructor
            Ball();     
    
            // Methods
            void moveTo();
            void draw();
    
            // Properties
            int x;
            int y;
            ofColor color;
    };
    #endif
~~~~

初めて出てくるものがいくつかあります。まず`#...`から始まる行はそのままにしておきます。簡潔に言うと、これはコンパイラーに対して「このクラスは1回だけコンパイルしてくれ。今バイルするにはofMain.hというヘッダーファイルが必要だ」という命令を行なっています。`ofMain.h`はopenFrameworksの全てのメソッドとオブジェクトが含まれるヘッダーファイルです。こうすることでC++だけでなくoFベースのコードを書くことができるようになります。

オブジェクトを作るにはクラスの関数を呼び出し、それをコンストラクタに渡す必要があります。コンストラクタはオブジェクトを作成するときに初期化を行うための関数です。例えば`int i`と書くと`i`は自動的に0となります。これはintのコンストラクタが行なってくれているためです。
コードの以降の部分は前に解説しています。またボールを描画するために`draw()`メソッドを追加しています。

重要: クラスを定義する際には末尾の`};`に注意して下さい。これを忘れるとエラーになります。

`ball.cpp`ではオブジェクトを動作させるための準備を行います。

~~~~{.cpp}
    #include "ball.h"

    Ball::Ball(){
        // 初期の色を設定する
        color.set( ofRandom(255), ofRandom(255), ofRandom(255));
    
        //　初期のX座標を設定する
        x = ofRandom( ofGetWindowWidth() ); 
    
        // 初期のY座標を設定する
        y = ofRandom( ofGetWindowHeight() ); 
    }

    void Ball::moveTo(){
    
    }

    void Ball::draw(){
        ofSetColor(color);
        ofFill();
        ofCircle( x, y, 30);
    }
~~~~

つまり、`ball.h`で定義したメソッドの実装を行なっています。`ball.cpp`でもコンパイラーに2つの指示を行なっています。

- `#include "ball.h"` ball.hを読み込む

- `Ball::` `Ball`クラスのメソッドであることを表す。苗字のような役割を持つ。何に属するものなんかが明確になり、名前も複雑にならない


最後にこのクラスをプロジェクトに加えるために`testApp.h`を以下の様に変更します。

~~~~{.cpp}
    #pragma once

    #include "ofMain.h"

    #include "ball.h" // この行を追加

    class testApp : public ofBaseApp{
    public:
            void setup();
            void update();
            void draw();

            void keyPressed  (int key);
            void keyReleased(int key);
            void mouseMoved(int x, int y );
            void mouseDragged(int x, int y, int button);
            void mousePressed(int x, int y, int button);
            void mouseReleased(int x, int y, int button);
            void windowResized(int w, int h);
            void dragEvent(ofDragInfo dragInfo);
            void gotMessage(ofMessage msg);
    
            Ball theBall;   // 位置情報はオブジェクト自身が持っているので
                            // xPos,yPos変数は不要になる
    };
~~~~

`testApp.cpp`は以下の様に変更します。

~~~~{.cpp}
    void testApp::setup(){
        // 輪郭を滑らかにする
        ofEnableSmoothing();

        // フレームレートを設定する
        ofSetFrameRate(30);

        // Ballクラスのコンストラクタが位置を初期化するので
        // ここでは設定する必要がない
    }

    void testApp::update(){
        theBall.x += ( mouseX - theBall.x )*0.1;    
        theBall.y += ( mouseY - theBall.y )*0.1;
    }

    void testApp::draw(){
        ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
            
        // 描画するメソッドを呼び出す
        theBall.draw();
    }
~~~~

これで自動的にランダムな値を持つオブジェクトを作り、`object.property`や`object.method()`を使ってオブジェクトが持つ情報にアクセスすることができます。つまり、ボールが必要になったらその都度オブジェクトを作り、描画すれば良いのです。

最後に、オブジェクトのメソッドに引数を渡す方法について解説します。`testApp::update()`を見ると、`x`と`y`という情報にアクセスするために`.`を使っています。これでも悪くないのですが、もっと論理的に直感的に行いたい場合、`myBall.moveTo(mouseX, mouseY)`のようにしたいところです。

`ball.h`と`ball.cpp`を以下の様に変更してみましょう。

~~~~{.cpp}
    void Ball::moveTo(int _xDestiny, int _yDestiny){
        x += ( _xDestiny - x )*0.1;
        y += ( _yDestiny - y )*0.1;
    }
~~~~

testAppプロジェクトでは以下の様に使用することができます。

~~~~{.cpp}
    void testApp::update(){
        theBall.moveTo(mouseX,mouseY);
    }
~~~~


## 4. 自然の法則に従う

自然なパーティクルシステムの作成を続ける前に、良いニュースとして、物理演算を行うために数学やたくさんの変数を扱う必要は無いということを知っておいて下さい。複雑な部分は用意されている素晴らしいクラスが行なってくれます。Keithによる[チュートリアル](http://openframeworks.jp/tutorials/maths/)も役に立つでしょう。2次元のベクトルを扱うために`ofVec2f`というクラスを使います。これにより重力を簡単に扱えるようになります。`Ball`クラスを作ったことを思い出して下さい。`ofVec2f`クラスのオブジェクトはそれぞれ`x`と`y`の値を持ち、`ball.x`、`ball.y`と同じようにアクセスすることができます。また`.dot()`のような便利なメソッドを持ち、`+`、`-`、`*`、`/`のような演算子を使って計算を行うこともできます。
