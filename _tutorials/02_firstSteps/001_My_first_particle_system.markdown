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
実際、[アラン・ケイ](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%A9%E3%83%B3%E3%83%BB%E3%82%B1%E3%82%A4)は、抽象的なオブジェクトを作り、それを再利用するために、また物事を簡潔、柔軟に表すためにオブジェクト指向プログラミング(C++の主な特徴でもあります)というアイデアを用いました。


So in order to make and use this "object" we have to make what it's call a class. Let's imagine a ball.
It's an round object that have some properties like the position and the color, also do things like move around. All this abstract items can be imagined as:

Ball:

- position (property)

- color (property)

- move (function or method)

This exactly what a `.h` it's a list of things that makes an object. So let's add two new files to our project ( this depends on the IDE you are using ), one it's going to be a `.h` file call `ball.h` (here we are going to define the elements of our ball) and the other one a `.cpp` call `ball.cpp` ( here we are going to write how this things are going to work together ).

![Image:kandisky.jpg](001_images/newFile.png)

The `ball.h` file should look like: 

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

Some couple of things are going around here. First note that's follows the `#...` you probably want to leave things that they are. A super simple explanation of it it could be: "Hey compiler, don't compile this stuff two times, and for compiling you will need ofMain.h header file.". The `ofMain.h` have all the methods and objects of openFrameworks. It's what makes your code oF-based and not just C++ code. It's where the magic came from.

For making a object you need to call the class function and give it a constructor. The constructor it's the method that it will run when you create it. It's like when you write 'int i' and 'i' automatically it's setup to zero. The int constructor did that. 
Then the rest of the things are the ones we describe before. I add a `draw()` function in order to draw the ball on our "world".

IMPORTANT: Take a look to the `};` at the end of the class. That's super important! Without that you probably get some impossible errors to track down.  

On the `ball.cpp` side let's preparing everything for work writing:

~~~~{.cpp}
    #include "ball.h"

    Ball::Ball(){
        // Set the initial color
        color.set( ofRandom(255), ofRandom(255), ofRandom(255));
    
        // Initial x position of the ball
        x = ofRandom( ofGetWindowWidth() ); 
    
        // Initial y position of the ball
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

So, as you see here we are going to put the implementation of the methods defined on `ball.h`. Note also that we have to said to the compiler two things:

- `#include "ball.h"` this stuff responds to "ball.h" file

- `Ball::` this says to the compiler that this method it's from `Ball` class. You can picture it like a last name. And it's use exactly for the same reason. To know where one becomes and not mess up names.

The last step for adding a class on a C++ project it's to add it to the `testApp.h` with a `#include "ball.h"` 

~~~~{.cpp}
    #pragma once

    #include "ofMain.h"

    #include "ball.h" // Add this

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
    
            Ball theBall;   // Now let´s try it by replacing the previous variables 
                            // for a object with that information
    };
~~~~

So on the `testApp.cpp` we can change things to look like this:

~~~~{.cpp}
    void testApp::setup(){
        // Smooth edges
        ofEnableSmoothing();

        // Fixed framerate
        ofSetFrameRate(30);

        // Not need to define the initial position of the ball
        // because the Ball constructor does it for you     
    }

    void testApp::update(){
        theBall.x += ( mouseX - theBall.x )*0.1;    
        theBall.y += ( mouseY - theBall.y )*0.1;
    }

    void testApp::draw(){
        ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
            
        // Now we have a method that does the drawing stuff
        theBall.draw();
    }
~~~~

Ok, so now we have a general object that´s automatically is created with some random values, but if we want we can access to the information inside it by using `object.property` or `object.method()`. 
This means that every time we want a new ball we have just to create it and draw it! It´s not awesome?

One last thing, it's to talk about how you can pass some parameters to a object method. If we look to the `testApp::update()` code we are accessing to `x` and `y` information by calling them using the `.`. That's not bad, but it to make things more logical and intuitive if we said something like `myBall.moveTo(mouseX,mouseY)` isn´t it?
So let´s change `ball.h` and  `ball.cpp`.

~~~~{.cpp}
    void Ball::moveTo(int _xDestiny, int _yDestiny){
        x += ( _xDestiny - x )*0.1;
        y += ( _yDestiny - y )*0.1;
    }
~~~~

And use it like like this on the testApp project

~~~~{.cpp}
    void testApp::update(){
            theBall.moveTo(mouseX,mouseY);
    }
~~~~


## 4. Let's go physicaly

Before we continue on our way a to proper particle system. I have good news, You don´t have to deal with heavy maths and lot's of variables for making some nice physics calculations. There some really cool native classes that will help your on that and make's your life really easy. Also you can get very deep in to crazy awesome things taking a look to on Keith´s tutorials at [Math Tutorials](http::/openframeworks.cc/tutorials/maths/)
Our new things it´s going to be a object call `ofVec2f()` for dealing with two dimensional math vector. This will let us work with forces very easily, and because at the very end it´s a class we are going to use them as object. Just like we do with our bright class call `Ball`.
Each `ofVec2f` have a `x` and `y` value, and you can access to them in the same way we just do with `ball.x` and `ball.y`. The thing with `ofVec2f` it´s that also have really handy methods like `.dot()` and also operator `+`, `+`, `*` and `/` that get in chard of the maths calculations.

 
 


