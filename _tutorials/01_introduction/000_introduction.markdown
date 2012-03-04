---
date: 2012/02/28
title: ofTutorials - イントロダクション (翻訳中, under translation)
summary: openFrameowrksの紹介と、最初のプロジェクトを開始するための準備
author: Jeff Crouse
author_site: http://jeffcrouse.com
---

## openFrameworksって何?

![Image:images/ofw-logo.png](images/ofw-logo.png)

openFrameworksは、シンプルで先端的なフレームワークによって創作活動を支援するための[オープンソース](license.html)の[C++](https://en.wikipedia.org/wiki/C%2B%2B)ツールキットです。ツールキットは、以下のリストあげたよく利用されるライブラリー群をまとめて汎用的な「糊」のような役割を果たすようにデザインされています。

* グラフィクス：[OpenGL](http://www.opengl.org/), [GLEW](http://glew.sourceforge.net/), [GLUT](http://www.opengl.org/resources/libraries/glut/), [libtess2](https://code.google.com/p/libtess2/), [cairo](http://cairographics.org/)
* オーディオの入出力と分析：[rtAudio](http://www.music.mcgill.ca/~gary/rtaudio/), [PortAudio](http://www.portaudio.com/) or [FMOD](http://www.fmod.org/), [Kiss FFT](http://kissfft.sourceforge.net/)
* フォント：[FreeType](http://freetype.sourceforge.net/index2.html)
* イメージの読込と保存：[FreeImage](http://freeimage.sourceforge.net/)
* 動画の再生と取込：[Quicktime](http://developer.apple.com/quicktime/), [videoInput](https://github.com/ofTheo/videoInput)
* 様々なユーティリティー：[Poco](http://pocoproject.org/)

コードは様々なプラットフォームで動作するように書かれています。現在は、5つのOS(Windows, OSX, Linux, iOS, Android)と、4つの開発環境(XCode, Code::Blocks, and Visual Studio, Eclipse)をサポートしています。APIは最小限で把握し易いようデザインされています。

簡単に言うと、openFrameworksはコードにまつわる様々な事柄をずっと容易にしてくれるツールなのです。わたしたちはこのツールをとても便利と感じています、きっとあなたもそうなるでしょう。

openFrameworksは[ザック・リーバーマン(Zach Lieberman)](http://thesystemis.com/)、[セオドア・ワトソン(Theodore Watson)](http://muonics.net/), [アルトロ・カストロ(Arturo Castro)](http://arturocastro.net/)を中心にして、[OFコミュニティー](../community/)とともに開発されています。openFramewokrsは以下2つの先駆的なプロジェクトの恩恵を受けています。

* [Processing](http://processing.org/)：[ケーシー・リーズ(Casey Reas)](http://reas.com/)と[ベン・フライ(Ben Fry)](http://benfry.com/)を中止に開発された開発環境
* ACUツールキット：ベン・フライらによって[MITメディアラボのAesthetics and Computation Group](http://acg.media.mit.edu/)で開発されたC++ライブラリ

<p align="right">ー <a href="/about/index.html">openFrameworks about</a>より</p>

パッケージのいくつかは(例えばOpenGLのように)他のドキュメントにより詳細に説明されているものもあります。またパッケージの多くは、あまり心配しなくてもバックグラウンドで勝手に動いてくれます。ライブラリのそれぞれは、独自の文法や慣習や癖を持っていたりします。しかし、openFrameworksの美点はそうしたことを気にしなくて良いところです。oFは、提供されたライブラリの機能に対する、単一の一貫したインターフェイスを提供してくれるのです。

### Q＆A

#### プログラムなのですか?

oFはそれ自体は[プログラム](http://ja.wikipedia.org/wiki/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0_(%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF))や、[アプリケーション](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3)ではありません。しかし、oFを使用して自分自身のプログラムやアプリケーションを作成することが可能です。

#### プログラミング言語なのですか?

oFはそれ自身が独自の[プログラミング言語](http://ja.wikipedia.org/wiki/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E8%A8%80%E8%AA%9E)で構成されているわけではありません。oFでプログラムを書く際に用いる言語は、[C++](http://ja.wikipedia.org/wiki/C%2B%2B)です。

#### では、ライブラリなのですか?

oFは実際、多くの[ライブラリ](http://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%83%BC)から構成されています。しかし、ライブラリを統合する特定の方法は「ソフトウェアフレームワーク」と呼ぶほうがより相応しいでしょう。

#### ソフトウェアフレームワークって何?

[ソフトウェアフレームワーク](http://ja.wikipedia.org/wiki/%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E3%83%AF%E3%83%BC%E3%82%AF)とは、プログラマーがアプリケーションに動作させたい内容を高レベルで詳細をカスタマイズできる一方で、アプリケーションに必要な全ての低レベルの機能を提供するようにデザインされた、ある種のプレハブ構造のソフトウェアの基盤のようなものです。ライブラリを使用することとフレームワークの違いの一つは、[制御の反転](http://ja.wikipedia.org/wiki/%E5%88%B6%E5%BE%A1%E3%81%AE%E5%8F%8D%E8%BB%A2)です。ライブラリは、全般的なタスクの集合としてコードを直接コントロールします。フレームワークではイベントに対するコードの応答は、フレームワークによってコントロールされます。またフレームワークは、他のライブラリの機能へのアクセスのインタフェイスとして使用されます。

複雑に聞こえますか?

あまり明確でないこともありますが、多くのマルチメディアオーサリング環境は実際にこの手法をとっています。

大雑把なたとえで考えてみてください。あなたは映画制作会社で自身の映画を制作監督しています。制作会社は場所を用意し、全てのインフラを提供し、カメラクルーや照明監督、サウンドエンジニアなどの重要なスタッフを探してくれます。全ての人達は、あなたを含め、必要なときに時間通りに一斉に仕事をします。openFrameworksは、あなたのプログラムに対する制作会社のようなものです。openFramewroksは、事務的な部分やロジスティックな詳細はケアしてくれて、あなたを創造的な視点に集中させてくれます。

## C++プログラミング言語

前のセクションで学んだように、openFrameworks自体はプログラミング言語ではなく、[C++](http://ja.wikipedia.org/wiki/C%2B%2B)で書かれたソフトウェアプログラムです。では、C++とは何でしょう?

注意：この文書は、openFrameworksのガイドを目的としています。その間に、C++という言語に慣れていくでしょう。しかし、非常に深い部分からボトムアップでC++の導入をすることは、この文書の目的を越えています。この文書を読んだ後で、最後にあげた参考文献のサイトのリストを参考にすると良いでしょう。

C++は、1979年にベル研究所で開発された[C言語](http://ja.wikipedia.org/wiki/C%E8%A8%80%E8%AA%9E)の拡張です。これらは共に汎用的なプログラミング言語で、世界中のほとんどのコンピューティングプラットフォームで動作可能です。C++プログラムの多くは以下のような体裁をしています。

~~~~{.cpp}
// 初めてのC++プログラム

#include <iostream>
using namespace std;

int main()
{
  cout << "Hello World!\n";
  return 0;
}
~~~~

※ このプログラムの各行ごとの細かな分析は、[Structure of a program](http://www.cplusplus.com/doc/tutorial/program_structure/)のチュートリアルを参照してください。

コンパイラでビルドすると、このコードは完全な実行可能なプログラムを生成します。これはとても単純なコマンドラインプログラムで、コンソールにただ「Hello World!」と出力するだけです。以下のステップの手順に従って、実際に挑戦してみましょう。

注意：この手順はプラットフォームに依存することがあります。下記の解説はMac OSでの動作です。実行するにはXCodeがインストールされている必要があります。

### 初めてのC++プグラムをコンパイルする

<img src="images/PlainText.png" />

* 先程のコードのテキストをコピー＆ペーストして、テキストファイルとしてデスクトップに「hello.cpp」という名前で保存。
  * もしテキストエディットを使用している場合は、「リッチテキスト」などのフォーマットではなく、「標準テキスト」で保存するように注意してください。
* 「アプリケーション」→「ユーティリティ」にある「ターミナル.app」を起動します。

![ターミナル.app](images/Terminal.png)

* 下記の記述を、各行でenterを入れながら、ターミナルのウィンドウ内にタイプしていきます。


<pre>
cd Desktop <1>
g++ -o hello hello.cpp <2>
./hello <3>
</pre>


1. デスクトップ(Desktop)に移動
2. [g++](http://gcc.gnu.org/)プログラムを使用して、hello.cpp(プログラムのソースコード)をコンパイルし、"hello"という名前で出力
3. たった今生成した、"hello"プログラムを実行

結果は下記のようになるでしょう。

![Hello World](images/HelloWorld.png)

おめでとう、あなたは最初のC++プログラムを作成し実行できました! デスクトップには下記のようなものが出来ているでしょう。

![Hello World](images/hello.png)


This might not look like other programs that you are used to -- programs with flashy custom icons that launch windows and use graphics and such -- but it's a program nonetheless. In fact, if you dig deep enough, every program on your computer boils down to a something just like the 'hello' program you just created. The rest is just bells and whistles. 

IMPORTANT: I can hear some people panicing right now, but don't worry! Things get much more exciting when we start playing with oF. This example was only meant to illustrate the low-level basics of c++. Hopefully you will never have to compile a command line program on the command line again. 


### What is a compiler? and an IDE?

If you have used a program like Flash or Processing, you are familliar with the process of writing some code and then "pressing play" to see it in action. This is called *compilation* or *compiling*, and it's what we just did in the previous section. If you are familliar with video editing, compiling is somewhat similar to rendering. The idea is that you must translate the code that is "human readable" into format that your computer can execute. C, C++, Java, Objective-C, Fortran, Lisp, Pascal... these are all http://en.wikipedia.org/wiki/Compiled_language[compiled languages]. As cryptic as they may seem, all of these languages are supposed to be "human readable". They were created specifically to be written, read, and understood by humans. But no matter which language you start with, in the end, it has to be translated into something your computer can understand. Namely, http://en.wikipedia.org/wiki/Machine_code[machine code].

NOTE: Some languages, such as PHP and Python are known as "scripting languages."  They still require compiling, but it happens right before the program executes.

The program that does the job of taking your code and translating it into machine code is called the *compiler*. http://gcc.gnu.org/[GCC] is one of the most popular compilers. It can compile lots of different languages. GCC is great for compiling, but knowing exactly how to tell the program exactly what you want to do is the subject of much headache and frustration. In the previous section, we conpiled a program with the simple command "g++ -o hello hello.cpp", but once you start doing stuff like using existing libraries, optimizing code for particular processors, bundling your application with resources like images, etc., all bets are off. Telling GCC to compile even a moderately complicated openFrameworks project takes hundreds of lines of isoteric syntax and invoking dozens of helper tools. It's super complex.

So instead, most developers use http://en.wikipedia.org/wiki/Integrated_development_environment[IDEs (Integrated Development Environments)] to organize and create code projects. Most IDEs will include a text editor, a file organizer, a compiler, and lots of GUI interfaces for customizing all of the options and details of the compilation process. http://en.wikipedia.org/wiki/Comparison_of_integrated_development_environments[Some popular IDEs are]: XCode, Visual Studio, CodeBlocks, Eclipse, NetBeans. There are IDEs for every operating system and language. Some IDEs are for one specific language and some support many.

You *might* be able to get away with calling stuff like Flash, Processing, VVVV, and MaxMSP IDEs -- most of the important features are there. The difference is that IDEs are typically blank slates -- they don't come with any specific functionality. The other tools, on the other hand, come with lots of built-in functionality that is usually optimized for a particular purpose. For insance, Flash compiles programs to be run on the web, while Processing is a rapid prototyping tool. 

openFrameworks definitely comes with a lot of functionality. The difference with openFrameworks is that it doesn't come with it's own IDE. Technically, you can use whatever IDE you want to create an openFrameworks project, but just as interfacing with a compiler can be difficult, the process of setting up a project of any complexity in an IDE can also be complex and tedious. One of the great things about openFrameworks is that it provides starting points for several IDEs on the 3 major platforms. They've done the hard work of creating project templates for 3 different IDEs on the 3 major platforms so all you have to do is download and start coding.

To get started working with openFrameworks, you will want to download and install an IDE for your operating system. Guides for installations can be found here:

#### Windows

* http://www.openframeworks.cc/setup/codeblocks/[code::blocks setup guide]
* http://www.openframeworks.cc/setup/vs-2010/[vs 2010 setup guide]

#### Mac

* http://www.openframeworks.cc/setup/xcode/[XCode Setup Guide]

#### Linux

* http://www.openframeworks.cc/setup/linux-codeblocks/[codeblocks & makefiles]

## What Can I Make with oF?

The following collection of projects is an attempt to illustrate the range of different kinds of projects that have been built using openFrameworks.


### Puppet Parade

by Emily Gobeille and Theo Watson

> Puppet Parade is an interactive installation by Emily Gobeille and Theo Watson of Design I/O that allows children to use their arms to puppeteer larger than life creatures projected on the wall in front of them. This dual interactive setup allows children to perform alongside the puppets, blurring the line between the ‘audience’ and the puppeteers and creating an endlessly playful dialogue between the children in the space and the children puppeteering the creatures.

<iframe src="http://player.vimeo.com/video/34824490?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

http://www.creativeapplications.net/openframeworks/puppet-parade-openframeworks/[More Information]


### Interactive Wall at UD

> The 36-foot wall at the University of Dayton’s admission center engages prospective students and reveals videos of student life at UD. The wall displays continuously changing patterns of generative graphics, which respond to the presence of people in front of the wall.

> The field of cubes is animated with waves of activity, and a viewer’s presence causes them to rotate and unveil POV videos of a student experience. The viewers can explore the videos moving around to reveal different video fragments. When viewers stand together, their silhouettes join to reveal more of the video. When no one is present in the interaction area the installation displays typographic animations overlaid on the dynamically animated graphic patterns.

> For more video documentation and details of design and development process see the http://www.flightphase.com/main_wp/case-studies/ud-interactive-wall[Case Study].

<iframe src="http://player.vimeo.com/video/27500054?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

http://www.flightphase.com/main_wp/expanded-media/interactive-wall-at-ud[More information]

### Scramble Suit

by Arturo Castro and Kyle McDonald

One great thing about openFrameworks is that how easy to incorporate c++ code from pretty much any library. To that end, Arturo and Kyle used a http://web.mac.com/jsaragih/FaceTracker/FaceTracker.html[Face Tracker library by Jason Saragih] to create a face-replacement technique that Kyle named "Scramble Suit" inspired by fictional technology from Philip K. Dick’s 1977 novel, "A Scanner Darkly". It’s effectively a cloak that hides the identify of the wearer by making it impossible to describe or remember them.

<iframe src="http://player.vimeo.com/video/29391633?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

## Why openFrameworks?

openFrameworks is not the only creative coding framework out there. So why should you (or shouldn't you) use openFrameworks?

coming soon...

## Additional oF Resources

* http://www.openframeworks.cc/about/[About openFrameworks] More about openFrameworks, including the design methodology.
* http://www.openframeworks.cc/documentation/[Official Documentation] Where you can find descriptions of classes and functions that make up openFrameworks
*  http://forum.openframeworks.cc/[oF Forum] Probably the best place to get your questions answered
* http://www.amazon.com/Programming-Interactivity-Designers-Processing-Openframeworks/dp/0596154143[Programming Interactivity] A great book that covers openFrameworks, Processing, and Arduino.
* http://www.creativeapplications.net/[Creative Applications]
