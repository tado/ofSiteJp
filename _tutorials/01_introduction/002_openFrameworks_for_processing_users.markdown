---
date: 2008/06/30 14:16:00
title: ProcessingユーザーのためのopenFrameworks
summary: Processingジャンキーのための、openFrameworksの概観
author: Zach Gage
author_site: http://www.stfj.net 
---
## Contents

*   [1 Processingジャンキーのための、openFrameworksの概観][2]
    
    *   [1.1 Processingは実際どのように動作しているのか?][3]
        
        *   [1.1.1 クラスの拡張とは? (基底クラスとサブクラスって何?)][4]
        *   [1.1.2 了解、じゃあProcessingではそれはどうやるの?][5]
            
        
    *   [1.2 openFramewroksはどうやって動いているの?][6]
        
        *   [1.2.1 Main.cppの詳細][7]
            
        
    *   [1.3 Java vs. C++ コンパイルのプロセス][8]
    *   [1.4 C++ではクラスはどうやって動かすの? (2つのファイル!?)][9]
        
        *   [1.4.1 testApp.h][10]
        *   [1.4.2 testApp.cpp][11]
            
        
    *   [1.5 なんだ\*&れは? (ポインタの初歩).][12]
        
        *   [1.5.1 値と参照Value vs. Reference][13]
        *   [1.5.2 &と\*][14]
        *   [1.5.3 どんな状況で使うのか?][15]
        *   [1.5.4 基本のデータ型][16]
            
            *   [1.5.4.1 Processingの文字列の例外][17]
                
            
            
        
    *   [1.6 PImage, updatePixels() 対 ofTexture, pixels\[\]][18]
        
        *   [1.6.1 何故Pixelの値はColorオブジェクトとして格納されていないの?][19]
            
        
    *   [1.7 C++に関する既知の問題 / その他のトピックス][20]
        
        *   [1.7.1 暗黙のデータ変換の期待][21]
        *   [1.7.2 ウィンドウのサイズ変更][22]
        *   [1.7.3 Update()とDraw()?][23]
        *   [1.7.4 コンソールに出力するには?][24]
            
            *   [1.7.4.1 printf][25]
            *   [1.7.4.2 iostream][26]
                
            
        *   [1.7.5 塗り潰しの図形は、スムージングできない?][27]
        *   [1.7.6 ofSetColorに関するビデオ表示の問題][28]
        *   [1.7.7 Processingのbackground() 対 oFのofBackground()][29]
        *   [1.7.8 ofFill() / ofNoFill() 対 Processingのfill() noFill()][30]
        *   [1.7.9 数学関数とそれはどこから来たのか?(ノー・モア Math.\*)][31]
            
            *   [1.7.9.1 cmath][32]
            *   [1.7.9.2 ofConstants][33]
            *   [1.7.9.3 ofMath][34]
                
            
        *   [1.7.10 構造体、何のために、どうやって使うのか?][35]
        *   [1.7.11 メモリ管理][36]
        *   [1.7.12 基本的な論理構造の問題][37]
        *   [1.7.13 Xcodeのブレイクポイントと、何故デバッガが凄いのか][38]
            

## Processingは実際どのように動作しているのか?

もし、あなたがある程度Processingでプログラミングしてきたのなら、あなたは当然クラスを使ったことがあると受けとめて良いでしょう。Javaのクラスの特徴一つは、もしかしたら馴染みがないかもしれませんが、多態性(ポリモーフィズム、クラスの継承)です。


### クラスの拡張とは? (基底クラスとサブクラスって何?)

クラスの拡張は、基本となる一つのクラスから、機能を追加したクラスを新規に生成するための方法です。

もし、例えばあなたがビデオゲームのようなものを作っていたとします。あなたは「敵」というクラスを作り、その外観を画像として読みこんだり、その動きを定義したり、スクリーンの望みの場所に描画したりするでしょう。そのコードは以下のようになるでしょう。


~~~~{.cpp}
    class Enemy
    {
    	int x; //x position
    	int y; //y position
    	public void init(String pathToEnemyPicture, int startX, int startY)
    	{
    		//load in the enemy picture from the hard-drive
    		//assign starting positions
    	}
    	
    	public void move()
    	{
    		//move, maybe shoot at player
    	}
    	public void draw()
    	{
    		//draw my picture to the screen at the proper location
    	}
    }
~~~~

しかし、もし複数の種類の敵を作りたかったり、それぞれ違う描画のされかたをしたい場合はどうやるのでしょう? こうしたとき、クラスの継承が役立ちます。全ての敵は、依然としてinit()で自身を初期化してmove()でスクリーンを動くようにしていきましょう。わたしたちが変更したい唯一の機能は、それぞれの構成をdraw()関数で描画することです。

Enemyクラスは「基底クラス」と呼ばれる方法で使用しましょう。基底クラス自体は初期化されることはおそらくありません、その代わり継承された別のクラスからのみ初期化されます。何故なら、draw()関数のみがわたしたちが変更したい部分です、init()やmove()は変更する必要はありません。draw()関数を再度宣言することで、我々は関数を再定義できるのです。それは、既に宣言された関数の場所で再度宣言することで行います。結果として、その敵のサブクラスは機能を上書きします。

例えば、Javaであれば

~~~~{.cpp}
    class DoubleEnemy extends Enemy
    {
    	public void draw()
    	{
    		//draw myself twice
    	}
    }
~~~~

C++ではこう書きます

~~~~{.cpp}
    //on a "DoubleEnemy.h" file
    class DoubleEnemy: public Enemy // class[className]:[privacy][extended Class]{}
    {
    	public void draw();//the actual code for draw would be on the "DoubleEnemy.cpp" file
    }; // note the ";" at the end of the class statement
~~~~
    
DobubeEnemyクラスは抽象的なEnemyクラスを拡張して、Enemyクラスで宣言された全ての機能と変数を継承します。それによって、我々は新たにinit()やmove()を書く必要がなくなるのです。わたしたちはまた、別の特別なEnemyクラスも作成できます。


~~~~{.cpp}
    //on a "TripleEnemy.h" file
    class TripleEnemy : public Enemy
    {
    	public void draw(); //draw myself three times
    };
~~~~

これで自分自身で動きまわり初期化するが、それぞれに別々に表示される2つの敵のタイプができました。この方法の別の利点としては、もしわたしたちが敵の移動や初期化の方法を知らなかったとしても、基底クラスを一度だけ変更すれば、全ての特殊な敵を動かし初期化できるのです。

### 了解、じゃあProcessingではそれはどうやるの?

しかしながら、プロセッシングはこうした方法をコンパイラから隠しています。Processingは実際基底クラス(pApplet)を動かしています。あなたが記述したプログラムはすべて、もちろんクラスも含め、Processingのアプリケーション内部では、自動的に動作してるProcessingエンジンの基底クラスを派生させています。あなたがdraw()やsetup()関数を書いた時、実際にはProcessingの基底クラスの中になるdraw()やsetup()関数を再定義しているのです。


## openFramewroksはどうやって動いているの?

openFrameworksは、Processingとよく似た方法で作られています。ただ、煩雑な部分もそのまま隠していません。しかし、testApp.hを開いてみると\#include "ofMain.h" という行のすぐ下に、"class TestApp : public ofSimpleApp{"という記述がみられます。

これは、Processingと同様に、testAppクラスがofSimpleAppクラスを拡張していることを意味します。すぐ下の"Public:"という記述以下は、Processingと同様に、ofSimpAppから継承したtestAppで再度記述するの全ての関数となっています。

全てのC++のアプリケーションは、プログラムの開始地点を定義するためにmain()関数を使用しています。Javaも同様です。しかしProcessingではこの事実は隠されています、なぜなら、あなたはmain関数から呼びだされる派生したクラスさえ定義すれば良いからです。

しかし、C++はmain()関数からスタートしなくてはなりません。これは「エントリーポイント」と呼ばれ、あなたのプログラムの出発点なのです。

main.cppはmain()関数を含んでいます。この中にはスクリーンサイズを設定したり、プログラムのなかで動作させる無限ループを開始したりしています。もし、より詳しく知りたいのであれば、2.1のセクションを読んでみてください。しかし、これは現在のところ混乱を招きかねないので、必須ではありません。


### Main.cppの詳細

oFのサンプルプログラムのどれをみても、main.cppファイルには一番上に2つの\#includeの宣言が含まれているのがわかります。これは、Processingが行なっている方法と一緒です。

最初の記述、


~~~~{.cpp}
    #include "ofMain.h"
~~~~

これは、全てのopenFrameworksのライブラリをmain.cppに加えます。これによりmainクラスで2つの重要なoFの機能を実行できるようになります。ofSetupOpenGL()はアプリケーションのウィンドウを生成します、ofRunApp()はアプリケーションを起動します。

注意してみると、ofRunApp()はパラメータを渡しています。

~~~~{.cpp}
    new testApp()
~~~~

ofRunApp()は、testAppクラスのインスタンスを渡します、main.cppの2つめのincludeの記述(\#include "testApp.h")でおこなわれています。

ofRunAppは、ofSimpleAppの種類をパラメータを渡さなくてはなりません。これがわたしたちがまず最初にtestApp.hを見た理由です。このクラスはofSimpAppを継承していることに注意してください。

くり返すと、

* main.cppは、ofMainとtestAppを内包しています

* ofMainは、スクリーンサイズを設定し、ofRunAppを呼びだします

* testAppもまた、ofMainを内包します

* testAppに書かれた全てのコードは、openFrameworksのライブラリの恩恵を受けることが可能となります
    
あなたが自分自身でクラスを書くようになるまでは、testApp.hとtestApp.cppはProcessingのメインウィンドウのように考える助けとなるかもしれません。あなたの記述する全てのコードは、この2つのファイルに含まれます。その気がなければ、その他のXcodeに入っているコードは見る必要はないのです。

## Java vs. C++ コンパイルのプロセス

JavaとC++では、コンパイルのプロセスが大きく異なります。C++のコンパイルのプロセスをステージごとに理解しることは、吐きださせる様々なタイプのエラーの内容を理解する上でとても重要です。どの段階でどのようなエラーがあるのかという知識によって、プロジェクトのデバッグの助けになります。

Javaではコンパイルのたびにプログラムの全てを走査しバイトコードへと変換します。プログラムを実行すると、Javaインタプリタが、プログラムが作動するようにランタイムコンパイルします。

C++の場合はより複雑です。

* はじめに、コンパイラがまずプログラムをプリプロセスします。全ての\#include宣言をたどっていき作成たコードをコピー＆ペーストして一つの大きなファイルを作成します。(C++の全ての\#がついた宣言はプリプロセッサの対象です)

* 第2に、コンパイラはコード全体をパースします。コードの全てに意味があるのか確認し、パースツリーの中にコードを分類し、アセンブラ(とても低レベルの言語)に翻訳されます。

* 第3に、アセンブラは、オブジェクトファイルの中で機械語に翻訳されます。

* 最後に、オブジェクトファイルは結びあわされ、.exeや.appなどの実行ファイルを生成します。    

この方法の利点は、一度コンパイルしたセクションは再コンパイルする必要はないので、C++のコンパイラのスタイルは巨大なプログラム(例えば、openFrameworksのアプリケーション本体)に向いているという点であるとすぐに理解できでしょう。これは、実際にサンプルプログラムを開いてコンパイルしてみるとわかります。最初のコンパイルは30秒から1分ほどかかるかもしれません。もし、testApp.cppに変更を加えて再度コンパイルすると、コンパイルはずっと早く終わるはずです。これは、XCodeはopenFrameworksの全てのライブラリをもうコンパイルする必要がなく、修正した少量のコード変化だけを再コンパイルすれば良いからです。


## C++ではクラスはどうやって動かすの? (2つのファイル!?)

C++のクラスは2つのファイルから構成されています。
この2つは、レシピだと思うと理解しやすいでしょう。

ヘッダーファイル(.h)は、原材料と含有物のリストです。

* ヘッダーの宣言が重なるのを防ぐためのプリプロセッサ宣言
* 他のクラスを読みこむためのinclude宣言
* クラスの継承の宣言
* クラス変数
* クラスに含まれる関数のプロトタイプ
* それらの属性に対するセキュリティ設定 (public, private, protected, など).
    
実装ファイル(.cpp)は、材料に何をするのかの説明です。

* 全てのーinclude宣言が、.hファイルを読みこみます
* 全てのコードはファンクション・プロトタイプで定義した全ての関数

これらを確認するために、testApp.cppとtestApp.をみてみましょう。

### testApp.h

testApp.hの全てのコードは、もし\#ifndefを宣言をすると全体を囲むことがきる。この宣言はコンパイルのプリプロセッサのステージのためのものです。基本的にコンパイラがコード全体をコンパイルする前に、全てのinclude宣言が機能するようにコードをコピー＆ペーストします。もし複数の場所に同じヘッダーが呼びだされてしまった場合、コンパイルの際に問題を引きおこします。\#ifndefは任意の変数名をつけてコンパイラに伝えます。例えば\_TEST\_APPのような名前が既にどこかのコードで使用されていたら、再度定義することはできなくなります。この手法は、コードの構造を簡単にするハックの一種で、自分でカスタムのクラスを生成した際にも実践できます(違う変数名をつけてあげれば良いのです)。

その後で\#includeを使用して、全てのopenFrameworksの機能を呼びだします。

つぎの行にくる「class testApp : public ofSimpleApp{ ...」はJavaの記述の構造によく似ています。2つを比較してみましょう。

C++ : class \[className\] : \[privacy\] \[extendedClass\]
JAVA/P5 : \[privacy\] class \[className\] extends \[extendedClass\]

そこに続くクラス定義は、クラスそのものです。クラスはプライバシー単位でのブロックに分かれています。場合によっては、public:ブロックしかない場合もあります。しかし、private:やprotected:のグループを望みに応じて追加することが可能です。Javaではpublicやpriveteな関数や変数をどの場所にも定義できました。しかし、c++の場合にはグループごとにブロック分けしておかなければなりません。

C++では実際に使用する前にヘッダー内でクラスについて定義しなくてはなりません(クラスのローカル変数に似ています)。これはプロトタイピングと呼ばれます。始めはわずらわしく感じるかもしれません、しかし慣れてくると全ての関数と変数がヘッダーファイルの中で簡単に読むことができて、クラスに関するドキュメンテーションのように活用することもできます。特にopenFrameworksの他の誰かのクラスを学ぼうとする際にとても有用なものです。

クラスの最後は、ただの括弧ではなく、括弧の後ろにセミコロン"};"が付いていることに注意してください。また、\#endifが最後にあり、先頭の\#ifndefと対応していることにも注意してください。

より詳細なC++のクラスについての情報は以下を参照してください：
[http://pages.cs.wisc.edu/~hasti/cs368/CppTutorial/NOTES/CLASSES-INTRO.html][48]

### testApp.cpp

ここにあなたの実際のコードの実装を記述します。クラスの関数の書式はProcessingとはちょっと異なります。
C++ :  \[ReturnType\] \[class\] :: \[functionName\] ( \[type\]\[variableName\]..etc )
JAVA/P5 : \[ReturnType\] \[functionName\] ( \[type\]\[variableName\]..etc )

## なんだ\*&れは? (ポインタの初歩).

Pointerは間違いなく、C++のもっとも困難でがっかりさせられる部分でしょう。

わたしはポインタの入門解説をここでしようと思いました。ポインタとは何なのかということだけでなく、それがどのようにJavaと関連しているのかというところまでです。しかし、ポインタに関して、それが何なのか、何のために使われるのかといった完全な内容は下記の重厚なチュートリアルを参考にしてください。

[http://www.cplusplus.com/doc/tutorial/pointers.html][51]

C++とJavaの最も大きな違いは、Javaは基本的なデータ型(byte, short, int, long, float, double, boolean, and char)を除いて、全ての値は参照渡しされます。ひとつ重要な注意点としては、Processingでは文字列(String)は値で渡されます。それに対して、C++は全てのクラスに見られるように値をコピーします。


### 値と参照

値と参照の違いを理解するには、まずコンピュータがRAMの中に値をどのように記録しているのかを知るべきです。

Processingに会のように書いたときには、

~~~~{.cpp}
    int num = 5;
~~~~

ここでコンピュータがやっているのは、メモリの中にいってそこに整数型のデータを記憶します。メモリの中で整数型で必要となる分の空の場所を選択して、そこに5という数値置いています。その後、num変数にはデータを入れた場所のアドレスを送っています。



What the computer does is it goes to the place in its memory that is set up to store integers, picks an empty spot with the right number of bytes to store an integer, places the number 5 in that spot, and then sends the address of that spot to your program which stores it in the "num" variable.

It might be easier to think of the spot in memory that num references as a box containing the number 5:
5
// value stored

2591
// address in memory

  
and as num as knowing the address this box

num:
2591
// address in memory

Because Processing knows you're using an int and knows to pass it by value, when you ask for what num is with the line print(num), it prints the value of the address that num is referencing.

Try typing this code into processing:

~~~~{.cpp}
    void setup()
    {
    int num = 1;
    addOne(num);
    print(num);
    }
    
    void addOne(int num)
    {
      num++;
    }
~~~~

Unsurprisingly, the program prints "1". We know that this is because when you pass num to a function, the function makes a copy of num and doesn't modify the original. This is called passing by value.

  
Lets look at another example. Here, instead of passing an integer, we will try passing a class containing an integer. Try typing this code into Processing:

~~~~{.cpp}
    class Test
    {
      int num=0;
    }
    
    void setup()
    {
    Test test = new Test();
    test.num=1;
    addOne(test);
    print(test.num);
    }
    
    void addOne(Test test)
    {
      test.num++;
    }
~~~~

  
This time it printed "2". What's going on here? 

What happened is that because we created a class Test, Processing recognized that it was not a basic data-type (even though the class contained an int which IS a basic data-type), and passed it to the function by reference. Reference means that instead of passing a copy of the entire Test object to the addOne function, it sent only the address in memory of where the class was stored. 

Let's look at boxes again.

test:
52498
// address in memory

52498:
1
// test.num

So when test is passed through addOne(), really just 52498, or whatever the actual memory address of test's data is passed. Because of that, when test's num is incremented, it is actually changed. No copy is ever made.

Java does this because if it were to pass entire objects around constantly everything would slow to a crawl. The basic data-types are small enough to get passed by value, but everything else is passed by reference.

### &と\*

C++ differs from Java in that you need to explicitly state whether you are passing something by value or by reference. You can also define when a variable will behave as if it contains actual data and when a variable will only contain a pointer to data. You can even make an int that behaves like the Test class did above. This is all done with the & (referencing) and \* (dereferencing) symbols.

the & symbol is used to acquire the memory address of a variable or function, so for example:

~~~~{.cpp}
    b=1;
    a = &b;
~~~~

means, a is now equal to (or points to) the memory address of b, (and not the value of b). At this point, 

~~~~{.cpp}
    a++;
~~~~

would make a equal to the next memory address after b.

the \* symbol is used to acquire the value stored in an address. So, 

~~~~{.cpp}
    *a++;
~~~~

would increment the value stored in a, and therefore, b would now equal 2\.

But how do I declare a variable to point to an address?
To do this, you use the \* symbol. This variable is called a pointer. Because different types of variables take on specific numbers of bytes, it is important to declare pointers of the same type as what they are pointing to, e.g. integer pointers for integers, float pointers for floats, etc.

example:

~~~~{.cpp}
    int x;
    int *ptr;
    
    x=5;
    ptr = &x;
    *ptr = 10;
    
    //x now equals 10
~~~~

### どんな状況で使うのか?

Initially, you will use pointers to pass arrays back and forth through functions. This can be seen in the movieGrabberExample, where a pointer is used to access the pixels from the video grabber. 

~~~~{.cpp}
    ( unsigned char * 	videoInverted;)
~~~~

This works because when you refer to an array in C++ without the \[\]'s you are actually referring to an address in memory. The \[\]'s work as a dereferencing operator, or, a "\*". 

At runtime, your processor multiplies the number inside of the \[\]'s (your index) by the number of bytes your data-type takes up in memory to figure out how far it must jump in memory to reach that index of your array.

So to pass an array in C++ you must pass it without the \[\]'s, and the receiving function must be aware it is receiving a pointer:

    [functionName] ( [variable type] * [varName]){
    }
    

To learn more about the infinite complexities of pointers, I recommend visiting the site I referenced at the top of this section.
( [http://www.cplusplus.com/doc/tutorial/pointers.html][51] )

### 基本のデータ型

Java and C++ share most basic data-types:

byte, short, int, long, float, double, and char. 
(Boolean is also in C++, and works the same way as it does in processing except it is called 'bool').

However, C++ has an extra set of data-types that are unsigned:

unsigned byte, unsigned short, unsigned int, unsigned long, unsigned float, unsigned double, unsigned char.

Unsigned means that instead of running positive and negative, (e.g. char can be set to any value between -128 and 127), these variables have no sign. (e.g. unsigned char can be set to any value 0-255).

  
#### Processingの文字列の例外

One major difference in the basic data-types is that Processing's string type is "String" while C++ uses a lowercase "string". But more importantly, C++'s string type, when set equal to another string type refers to it by reference (does not make a copy).

_**NOTE: (theo) not sure if this is true. I think C++ is by copy. So this example might be incorrect.** _

_**NOTE: (nathan) I've tested this. It's definitely incorrect. Output is "yes". Also it should be a.c\_str() not a.c\_str(a)** _

So, in processing:

~~~~{.java}
    String a = "yes";
    String b = a;
    b = "no";
    
    print(a);
~~~~

will print "yes"

but in C++

~~~~{.cpp}
    string a = "yes";
    string b = a;
    b = "no";
    printf("%s \n", a.c_str(a));   // to see how this prints, see section 6.3.3 How in the world do I print to the console?
~~~~
    

will print "no".

## PImage, updatePixels() 対 ofTexture, pixels\[\]

When you draw in openGL (OF draws using the GLUT library, which in turn uses openGL, Processing draws to openGL optionally, if you decide to when declaring your window size), any pixel data that you want to put on the screen must be preloaded into your RAM before you can draw it. Loading pixel (bitmap) data to RAM is called loading your image into a texture.

Processing has a number of ways to solve this texture problem that hide what you are actually doing from you.

The first is the PImage object. A PImage is a texture object that has a built in color array that holds pixel values so that you can access the individual pixels of the image that you have loaded in. Images cannot draw themselves exactly, but they can be drawn by the image() function.

~~~~{.java}
    PImage myPImage; //allocate space for variable
    myPImage = loadImage("sample.jpg"); //allocate space for pixels in ram, decode the jpg, and load pixels of the decoded sample.jpg into the pixels.
    image(myPImage,100,100); //draw the texture to the screen at 100,100
~~~~
    

_I should note that its possible that the image() function actually loads the pixels into the ram instead of the PImage, but I dont know enough about the tech behind Processing to say for sure if this is the case or not._

If you want to access the individual pixels of the screen itself, however, you use a different function altogether. You first call loadPixels(), make your pixel changes, and then call updatePixels() to make your changes appear. 

This is slightly confusing, because what is actually happening here is the same as what happened above with the PImage: Processing is loading your pixels from the screen into a texture, essentially a PImage, and then drawing that texture to the screen after you update it. For some reason, however, they chose not to use the same function for both.

OpenFrameworks handles this a little differently (and a little bit better in my opinion). Instead of having two different methods, the ofImage object loads images from files, _and_ images from the screen. Additionally, ofImage can draw itself and needs no separate function to do this.

The OF code for the example above with myPImage looks like:

~~~~{.cpp}
    ofImage myImage; //allocate space for variable
    myImage.loadImage("sample.jpg"); //allocate space in ram, decode jpg, load pixels.
    myImage.draw(100,100);
~~~~

If you wanted to change the pixels on the screen, you would also use an ofImage.

~~~~{.cpp}
    ofImage theScreen; //declare variable
    theScreen.grabScreen(0,0,1024,768); //grab at 0,0 a rect of 1024x768. Equivalent to loadPixels();
    //edit pixels in theScreen
    theScreen.draw(0,0); //equivalent to updatePixels();
~~~~

But how do I edit the pixels of something that is in the ram you may ask? The short answer is you cannot. Once something is in the RAM (in an ofTexture), you cannot access it anymore. 

You can edit the pixels of an ofImage because ofImages contain two data structures. One of these is an array of Unsigned Characters which represent all of the colors of every pixel, and the other is an ofTexture, which is used to upload those pixels into the ram after changes.

You can actually turn off this texture in an ofImage to save RAM if you know you won't ever have to draw what you are loading to the screen. This could be useful if you only need to load an image to access pixel color values in it, or if you are taking a screenshot that you will save to your hard drive but never draw. 
see: [http://www.openframeworks.cc/documentation\#ofImage-setUseTexture][58]

### 何故Pixelの値はColorオブジェクトとして格納されていないの?

Pixel values are stored as a series of Unsigned Characters. An Unsigned Character is a fancy way of saying a byte value between 0 and 255 inclusive. Every object in OF that can return a pixel array ( getPixels() ), will return you an array of unsigned characters. Because it takes three unsigned characters to denote a color (one for each of the red, green, blue, channels), this array's length will be three times the number of pixels inside of it and structured like:

~~~~{.cpp}
    {pixel_1_Red, pixel_1_Green, pixel_1_Blue, pixel_2_Red, pixel_2_Green, pixel_2_Blue....}
~~~~

To access a color of a specific pixel:

~~~~{.cpp}
    unsigned char *	myPixels; //create a pointer to an unsigned charecter
    myPixels = myOFImage.getPixels(); //set that pointer to point to the beginning of the pixel array
    int colorIndex = y*(myOFImage.width*3)+x*3; // yPos * width * 3 + xPos * 3 = the red channel position
    ofSetColor(myPixels[colorIndex],myPixels[colorIndex+1],myPixels[colorIndex+2]); 
    //sets the color of each channel by going to the successive two values in the array after that of the red channel. 
~~~~

## C++に関する既知の問題 / その他のトピックス

### 暗黙のデータ変換の期待

One big surprise that comes with C++ is that it doesn't do implicit data conversion.
A good example of this is trying to print an integer.

~~~~{.cpp}
    int num = 5;
    printf(num +"\n");
~~~~

will yield an error.

This is because printf only prints strings and chars, and num is neither one of these.
To convert any non-string or non-char to a string, use the ofToString() function.

### ウィンドウのサイズ変更

Window size is set intuitively in main.cpp. If you open it up, the comments will show you clearly how to change the size or go to fullscreen mode.

### Update()とDraw()?

Unlike Processing, OF contains two methods that are run every loop through of your program, Update() and Draw(). 
It is good practice to do all of your calculations in the Update() function and reserve Draw() for simply showing results on the screen. This prevents any large slowdowns that might occur during a draw function that could be too complicated. Instead of getting halves of images drawn or screen-tearing, you simply get a low framerate.

Additionally, I should mention that if you do any heavy lifting in your project (e.g. loading in images, or loading anything at all from a file really), you should do it in your setup() function if possible. Update() and Draw() run in a loop, and because of that you should only include code in them that has to run every frame. If something only has to run once, it should probably be in Setup().

### コンソールに出力するには?

For printing to the console, you have two options. The first is printf, which is robust but a bit complicated, and is included by default in openframeworks.

The second is iostream, which is simpler, but less robust, and not included by default.

#### printf

If you want to use printf to print to the console, this is a good tutorial on how it works:
[http://www.cplusplus.com/reference/clibrary/cstdio/printf.html][66]

  
#### iostream

Another option for printing to the console is iostream. This is a very old c++ library that lets you print to the console very easily and will implicitly convert many variable types for you so you don't have to use ofToString(). 

To use iostream you first need to include it at the top of your .cpp file

~~~~{.cpp}
    #include <iostream>
~~~~

Note that in some compilers, specifically very old ones, you will need to include <iostream.h\> instead of just <iostream\>. This is due to updates in the c++ standard language library (std) in recent years. A more detailed explanation can be found at:

[http://members.gamedev.net/sicrane/articles/iostream.html][68]

Actually using iostream is extraordinarily easy.

in processing your code might look like this:

~~~~{.java}
    int i = 10;
    String s = "Hello!";
    boolean b = false;
    
    println(i+" "+s+" "+b); // print variables and end the line
    print(i+" "+s+" "+b); // print variables without ending the line.
~~~~

this would print 

~~~~{.java}
    10 Hello! false
    10 Hello! false
~~~~

in the console.

The equivalent c++ code using iostream is:

~~~~{.cpp}
    int i = 10;
    string s = "Hello!";
    bool b = false;
    
    cout<<i<<" "<<s<<" "<<b<<endl; // print variables and end the line
    cout<<i<<" "<<s<<" "<<b;       // print variables without ending the line.
~~~~
    

this would print 

~~~~{.cpp}
    10 Hello! 0
    10 Hello! 0
~~~~

in the console. Note that with iostream, unlike in processing, a false boolean is represented by a '0' and not "false", and a true boolean is represented by a '1'.

Also note that in Java, ending or not ending the line after you print is accomplished by which function you pick, print() or println(), whereas in c++ with iostream, it is controlled by whether or not you put the 'endl' keyword at the end of your cout statement.

### 塗り潰しの図形は、スムージングできない?

If you are drawing a filled shape, e.g. with ofBeginShape(), even if you have called ofEnableSmoothing(), you will notice that the edges of the shape have not been smoothed. This is because GLUT, the library that OF uses for openGL management, doesn't have support for true full-screen graphics, and therefor can't run full-screen anti-aliasing, which is what would smooth your shapes.

An easy workaround for this is to simply draw your shapes twice, the first time filled, and the second time not filled, so that OF draws lines, which it software anti-aliases.

~~~~{.cpp}
    ofFill();
    
    ofBeginShape(); //shape
    	ofVertex( 1,1 );
    	ofVertex( 5,5 );
    	ofVertex( 1,10 );
    	ofVertex( 1,1 );
    ofEndShape();
    
    
    ofNoFill();
    
    ofBeginShape(); //smoothed edges
    	ofVertex( 1,1 );
    	ofVertex( 5,5 );
    	ofVertex( 1,10 );
    	ofVertex( 1,1 );
    ofEndShape();
~~~~

### ofSetColorに関するビデオ表示の問題

Although this is a problem/feature affecting any object that uses an ofTexture draw itself to the screen, I first encountered it with the videoGrabber, and I think that may be the case for many people, so I'm listing it as the video problem/feature.

Basically, ofTextures are constructed so that they can be tinted by the ofSetColor() call. This is great as long as you know it's going to happen, but if it catches you by surprise it can be really confusing, especially if your background is black and you have just called 

~~~~{.cpp}
    ofSetColor(0,0,0);
~~~~

which would make whatever ofTexture you're telling to draw not show up at all.

The solution to this is easy, just make sure that right before you tell any ofTextures to draw, you call ofSetColor() and set it to white, or whatever tint you want to use.

### Processingのbackground() 対 oFのofBackground()

In Processing, making the background() call automatically tells Processing to set the background to be set every frame to the color you specified in your function call.

Of can make it auto-refresh every frame, there is a separate function to call:

~~~~{.cpp}
    ofSetBackgroundAuto(true);
~~~~

This function will make the background autorefresh with the last ofBackground() call, without having to re-call it each time inside draw().
If you don't want to redraw, but make a cumulative image, use:

~~~~{.cpp}
    ofSetBackgroundAuto(false);
~~~~
    

Because by default OF redraws the screen every frame.

### ofFill() / ofNoFill() 対 Processingのfill() noFill()

In processing, you can toggle fills and strokes:
fill(), noFill.
stroke(), noStroke.

In Openframeworks, it's one or the other.
C++  :
JAVA/P5:

ofFill();
fill(); noStroke();

ofNoFill();
noFill(); stroke(1);

additionally, there is no way to change the stroke width built into openFrameworks.
A way around this is to change the stroke size with an openGL call, but it doesn't look that great.

~~~~{.cpp}
    glLineWidth(STROKE_SIZE);
~~~~

  
### 数学関数とそれはどこから来たのか?(ノー・モア Math.\*)

Math functions in OpenFrameworks actually come from three separate files

#### cmath

Complex math functions (trigonometric, hyperbolic, exponential, logarithmic, power, rounding, absolute value and remainder functions) come from the cmath library (math.h), and are included by default in OF.

A list of these functions is available at:
[http://www.cplusplus.com/reference/clibrary/cmath/][75]

#### ofConstants

Other basic math functions are provided by the ofConstants file.

These include:

Constants:

*   PI;
*   TWO\_PI;
*   M\_TWO\_PI;
*   FOUR\_PI;
*   HALF\_PI;
    

and Functions:

*   DEG\_TO\_RAD();
*   RAD\_TO\_DEG();
*   MIN(x,y);
*   MAX(x,y);
*   CLAMP(val,min,max);
*   ABS(\[math functions you want to get the absolute value of\]);
    

#### ofMath

additionally ofMath() provides functions for getting random values.

[http://www.openframeworks.cc/documentation\#ofMath-about][78]

### 構造体、何のために、どうやって使うのか?

Structs are like miniature classes except they don't have methods. Basically they're custom data objects.

They're very convenient because they don't have to be created externally from your class files (although technically neither do classes..) 

Primarily they're used for implementing linked lists (similar to ArrayLists in java). Although linked lists are probably my favorite data structure, I'm not going to write a tutorial here because they can be very complicated at first.

A very inclusive tutorial on linked lists can be found here:
[http://richardbowles.tripod.com/cpp/linklist/linklist.htm][80]

Anyway, the general format of a struct is :


    struct [name]
    {
    	[varType] varName;
    	[varType] varName;
    	[varType] varName;
    	[etc...]
    };
    

### メモリ管理

In Java/p5 the way garbage collection works is that every few cycles the interpreter sweeps the ram looking for any used objects that have no pointers referencing them, and deletes them.

That means if you were to declare

~~~~{.cpp}
    myCustomDataType temp = new myCustomDataType();
    temp = null;
~~~~

temp was set to reference a newly created myCustomDataType. temp was then set equal to null. This did not actually clear the new myCustomDataType from ram, but whenever java's garbage collection runs it would notice that the new myCustomDataType has no references and would delete it. 

Unlike java/p5 however, c++ does not have automated garbage collection. This means that if you have declared object and you want to get rid of it, you will have to delete it yourself. Setting a pointer to NULL is not good enough.

calling the comparable code in c++ would result in an empty pointer and some memory that had been allocated in the ram but now is lost forever. This is called a memory leak. Although it might not affect you right off the bat, memory leaks can lead to your program eating up all of its available memory and crashing. These can be very frustrating to debug because they happen over time and don't give you a specific line that's crashing your program. 

Fortunately, they're easy to avoid as long as you plan your programs carefully. The proper way to delete an object after you have created it is to use the delete keyword

~~~~{.cpp}
    delete temp;
~~~~

### 基本的な論理構造の問題

Zach Lieberman asked me to include a bit on conditional logic errors so here goes.

A very common conditional logic error is forgetting to restate your entire argument inside an if statement with an && (and) or || (or) operator.

For example:

~~~~{.cpp}
    int x = 5;
    if(x < 0 || > 10)
    {
        return true;
    }
    else
    {
        return false;
    }
~~~~

will always return true because ( \> 10) is always true. The proper way to write this would be:

~~~~{.cpp}
    int x = 5;
    
    if(x < 0 ||x > 10)
    {
        return true;
    }
    else
    {
        return false;
    }
~~~~
    

note how the entire argument is restated. Instead of asking:
is x less than 0 or greater than 10

you need to ask:
is x less than 0 or **is x** greater than 10

### Xcodeのブレイクポイントと、何故デバッガが凄いのか

[![Image:BkPt.jpg](002_images/BkPt.jpg)][84]

Breakpoints are something that you can put in by clicking on the far left column of the editing window. If you're compiling in debug mode:
[![Image:BuildConf.jpg](002_images/BuildConf.jpg)][85]

your program will stop running whenever it comes across one of these breakpoints and bring up the debugging console which lets you look at variable contents and the current running processes and things like that. 
[![Image:HilightedVar.jpg](002_images/HilightedVar.jpg)][86]

  
They're extremely convenient for debugging programs, but they can be confusing if you don't know what they are and they keep stopping your program.

To remove a debug point just click on it and drag it out of the window. You'll get a friendly poof of smoke and it'll be gone.
[0]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#column-one
[1]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#searchInput
[2]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#An_overview_of_OpenFrameworks_for_processing_junkies.
[3]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#How_Processing_Actually_Works
[4]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#What_is_class_extending.3F_.28base_and_sub_classes.29.3F
[5]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Ok.2C_so_what_does_this_have_to_do_with_Processing.3F
[6]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#How_OpenFrameworks_Works.
[7]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Main.cpp_In-depth
[8]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Java_vs._C.2B.2B_Compile_Processes
[9]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#How_Classes_Work_in_C.2B.2B_.28Two_Files.21.3F.29
[10]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#testApp.h
[11]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#testApp.cpp
[12]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#What_the_Fu.2A.26.3F_.28a_very_basic_introduction_to_pointers.29.
[13]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Value_vs._Reference
[14]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#.26_and_.2A
[15]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#So_Where_Do_I_use_This.3F
[16]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Basic_Data-types
[17]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#The_Processing_String_Exception
[18]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#PImage.2C_updatePixels.28.29_vs._ofTexture.2C_pixels.5B.5D
[19]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#How_are_pixel_values_stored_without_a_Color_object.3F
[20]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Common_Problems_With_C.2B.2B_.2F_Misc._Topics
[21]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Expecting_implicit_data_conversion.3F
[22]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Changing_window_size
[23]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Update.28.29_and_Draw.28.29.3F
[24]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#How_in_the_world_do_I_print_to_the_console.3F
[25]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#printf
[26]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#iostream
[27]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Smoothing_not_working_on_filled_shapes.3F
[28]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Displaying_video_problem.2Ffeature_related_to_ofSetColor
[29]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Processing_background.28.29_vs._OF_ofBackground.28.29
[30]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#ofFill.28.29_.2F_ofNoFill.28.29_vs._processing_fill.28.29_noFill.28.29
[31]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Math_functions.2C_and_where_they_come_from_.28no_more_Math..2A.29
[32]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#cmath
[33]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#ofConstants
[34]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#ofMath
[35]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Structs.2C_what_are_they_for.2C_and_how_can_we_use_them.3F
[36]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Memory_Management_and_You
[37]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#Basic_Logic_Problems
[38]: file:///home/arturo/Downloads/ittyeditor-read-only/ittyeditor-example.html#accidental_breakpoints_in_Xcode_and_Why_Having_a_Debugger_Rocks
[39]: file:///index.php?title=OF_for_Processing_users&action=edit&section=1 "Edit section: An overview of OpenFrameworks for processing junkies."
[40]: file:///index.php?title=OF_for_Processing_users&action=edit&section=2 "Edit section: How Processing Actually Works"
[41]: file:///index.php?title=OF_for_Processing_users&action=edit&section=3 "Edit section: What is class extending? (base and sub classes)?"
[42]: file:///index.php?title=OF_for_Processing_users&action=edit&section=4 "Edit section: Ok, so what does this have to do with Processing?"
[43]: file:///index.php?title=OF_for_Processing_users&action=edit&section=5 "Edit section: How OpenFrameworks Works."
[44]: file:///index.php?title=OF_for_Processing_users&action=edit&section=6 "Edit section: Main.cpp In-depth"
[45]: file:///index.php?title=OF_for_Processing_users&action=edit&section=7 "Edit section: Java vs. C++ Compile Processes"
[46]: file:///index.php?title=OF_for_Processing_users&action=edit&section=8 "Edit section: How Classes Work in C++ (Two Files!?)"
[47]: file:///index.php?title=OF_for_Processing_users&action=edit&section=9 "Edit section: testApp.h"
[48]: http://pages.cs.wisc.edu/~hasti/cs368/CppTutorial/NOTES/CLASSES-INTRO.html "http://pages.cs.wisc.edu/~hasti/cs368/CppTutorial/NOTES/CLASSES-INTRO.html"
[49]: file:///index.php?title=OF_for_Processing_users&action=edit&section=10 "Edit section: testApp.cpp"
[50]: file:///index.php?title=OF_for_Processing_users&action=edit&section=11 "Edit section: What the Fu*&? (a very basic introduction to pointers)."
[51]: http://www.cplusplus.com/doc/tutorial/pointers.html "http://www.cplusplus.com/doc/tutorial/pointers.html"
[52]: file:///index.php?title=OF_for_Processing_users&action=edit&section=12 "Edit section: Value vs. Reference"
[53]: file:///index.php?title=OF_for_Processing_users&action=edit&section=13 "Edit section: & and *"
[54]: file:///index.php?title=OF_for_Processing_users&action=edit&section=14 "Edit section: So Where Do I use This?"
[55]: file:///index.php?title=OF_for_Processing_users&action=edit&section=15 "Edit section: Basic Data-types"
[56]: file:///index.php?title=OF_for_Processing_users&action=edit&section=16 "Edit section: The Processing String Exception"
[57]: file:///index.php?title=OF_for_Processing_users&action=edit&section=17 "Edit section: PImage, updatePixels() vs. ofTexture, pixels[]"
[58]: http://www.openframeworks.cc/documentation#ofImage-setUseTexture "http://www.openframeworks.cc/documentation#ofImage-setUseTexture"
[59]: file:///index.php?title=OF_for_Processing_users&action=edit&section=18 "Edit section: How are pixel values stored without a Color object?"
[60]: file:///index.php?title=OF_for_Processing_users&action=edit&section=19 "Edit section: Common Problems With C++ / Misc. Topics"
[61]: file:///index.php?title=OF_for_Processing_users&action=edit&section=20 "Edit section: Expecting implicit data conversion?"
[62]: file:///index.php?title=OF_for_Processing_users&action=edit&section=21 "Edit section: Changing window size"
[63]: file:///index.php?title=OF_for_Processing_users&action=edit&section=22 "Edit section: Update() and Draw()?"
[64]: file:///index.php?title=OF_for_Processing_users&action=edit&section=23 "Edit section: How in the world do I print to the console?"
[65]: file:///index.php?title=OF_for_Processing_users&action=edit&section=24 "Edit section: printf"
[66]: http://www.cplusplus.com/reference/clibrary/cstdio/printf.html "http://www.cplusplus.com/reference/clibrary/cstdio/printf.html"
[67]: file:///index.php?title=OF_for_Processing_users&action=edit&section=25 "Edit section: iostream"
[68]: http://members.gamedev.net/sicrane/articles/iostream.html "http://members.gamedev.net/sicrane/articles/iostream.html"
[69]: file:///index.php?title=OF_for_Processing_users&action=edit&section=26 "Edit section: Smoothing not working on filled shapes?"
[70]: file:///index.php?title=OF_for_Processing_users&action=edit&section=27 "Edit section: Displaying video problem/feature related to ofSetColor"
[71]: file:///index.php?title=OF_for_Processing_users&action=edit&section=28 "Edit section: Processing background() vs. OF ofBackground()"
[72]: file:///index.php?title=OF_for_Processing_users&action=edit&section=29 "Edit section: ofFill() / ofNoFill() vs. processing fill() noFill()"
[73]: file:///index.php?title=OF_for_Processing_users&action=edit&section=30 "Edit section: Math functions, and where they come from (no more Math.*)"
[74]: file:///index.php?title=OF_for_Processing_users&action=edit&section=31 "Edit section: cmath"
[75]: http://www.cplusplus.com/reference/clibrary/cmath/ "http://www.cplusplus.com/reference/clibrary/cmath/"
[76]: file:///index.php?title=OF_for_Processing_users&action=edit&section=32 "Edit section: ofConstants"
[77]: file:///index.php?title=OF_for_Processing_users&action=edit&section=33 "Edit section: ofMath"
[78]: http://www.openframeworks.cc/documentation#ofMath-about "http://www.openframeworks.cc/documentation#ofMath-about"
[79]: file:///index.php?title=OF_for_Processing_users&action=edit&section=34 "Edit section: Structs, what are they for, and how can we use them?"
[80]: http://richardbowles.tripod.com/cpp/linklist/linklist.htm "http://richardbowles.tripod.com/cpp/linklist/linklist.htm"
[81]: file:///index.php?title=OF_for_Processing_users&action=edit&section=35 "Edit section: Memory Management and You"
[82]: file:///index.php?title=OF_for_Processing_users&action=edit&section=36 "Edit section: Basic Logic Problems"
[83]: file:///index.php?title=OF_for_Processing_users&action=edit&section=37 "Edit section: accidental breakpoints in Xcode and Why Having a Debugger Rocks"
[84]: file:///index.php?title=Image:BkPt.jpg "Image:BkPt.jpg"
[85]: file:///index.php?title=Image:BuildConf.jpg "Image:BuildConf.jpg"
[86]: file:///index.php?title=Image:HilightedVar.jpg "Image:HilightedVar.jpg"


