---
date: 2012/02/28
title: ofTutorials - イントロダクション (翻訳中, under translation)
summary: openFrameowrksの紹介と、最初のプロジェクトを開始するための準備
author: Jeff Crouse
author_site: http://jeffcrouse.com
---

## openFrameworksって何?

![Image:images/ofw-logo.png](images/ofw-logo.png)

<blockquote>

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
</blockquote>

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

実際に、多くのマルチメディアオーサリング環境は、あまり明快でないこともありますが、この手法をとっています。

この大雑把なたとえで考えてみてください。あなたは映画制作会社で自身の映画を制作監督しています。制作会社は場所を用意し、全てのインフラを提供し、カメラクルーや照明監督、サウンドエンジニアなどの重要なスタッフを探してくれます。全ての人達は、あなたを含め、必要なときに時間通りに一斉に仕事をします。openFrameworksは、あなたのプログラムに対する制作会社のようなものです。openFramewroksは、事務的な部分やロジスティックな詳細はケアしてくれて、あなたを創造的な視点に集中させてくれます。

## C++はプログラミング言語です

We learned in the last section that openFrameworks is *not* a programing language, but rather a software framework for creating [`c++`](http://en.wikipedia.org/wiki/C%2B%2B) programs. But what is c++?

NOTE: This documentation aims to guide you through openFrameworks, during which you will become comfortable with the `c++` language. But it is beyond its scope to delve too deeply into a bottom-up introduction to `c++`, so if that is what you are after, you'll have better luck with the sites listed in the Additional Resources appendix. 

`C++` is an extension of [the C language](http://en.wikipedia.org/wiki/C_(programming_language)), which was developed in 1979 at Bell Labs. They are both general purpose computing languages that can be run on virtually any computing platform in the world. The most basic c++ program looks like this:

~~~~{.cpp}
// my first program in C++

#include <iostream>
using namespace std;

int main()
{
  cout << "Hello World!\n";
  return 0;
}
~~~~

TIP: You can get a line-by-line breakdown of this program in the [Structure of a program](http://www.cplusplus.com/doc/tutorial/program_structure/) tutorial.

After being run through a compiler, this code will create a fully executable program. It is an exceedingly simple command-line program that simply prints "Hello World!" to the console, but a program nonetheless. You can try it yourself by following these steps:

WARNING:  This process will vary slightly depending on platform. The following instructions are for the Mac OS, and you must have XCode installed to run them.

## Compiling your First c++ program

![images/PlainText.png](images/PlainText.png)

* Paste the code above into a text file and save it on your Desktop as *hello.cpp*. 
  * If you are using TextEdit, make sure you specify that you want to save it as "plain text", not "rich text" or anything else.
* Go into /Applications/Utilities and double-click on Terminal.app image:images/Terminal.png["Terminal.app",height=24]
* Type the following into the Terminal window, pressing enter after each line:

<pre>
cd Desktop <1>
g++ -o hello hello.cpp <2>
./hello <3>
</pre>

* <1> Navigate ("change directory") to the Desktop
* <2> Use the http://gcc.gnu.org/[g++] program to compile hello.cpp (the source code file) into a program called "hello"
* <3> Execute the "hello" program that you just created

The result should look like this:

image::images/HelloWorld.png["Hello World!"]

Congratulations, you've just created (and then run) your first c++ program!  You should see something that looks like this on your Desktop:

image::images/hello.png["Your First Program"]

This might not look like other programs that you are used to -- programs with flashy custom icons that launch windows and use graphics and such -- but it's a program nonetheless. In fact, if you dig deep enough, every program on your computer boils down to a something just like the 'hello' program you just created. The rest is just bells and whistles. 

IMPORTANT: I can hear some people panicing right now, but don't worry! Things get much more exciting when we start playing with oF. This example was only meant to illustrate the low-level basics of c++. Hopefully you will never have to compile a command line program on the command line again. 


What is a compiler? and an IDE?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you have used a program like Flash or Processing, you are familliar with the process of writing some code and then "pressing play" to see it in action. This is called *compilation* or *compiling*, and it's what we just did in the previous section. If you are familliar with video editing, compiling is somewhat similar to rendering. The idea is that you must translate the code that is "human readable" into format that your computer can execute. C, C++, Java, Objective-C, Fortran, Lisp, Pascal... these are all http://en.wikipedia.org/wiki/Compiled_language[compiled languages]. As cryptic as they may seem, all of these languages are supposed to be "human readable". They were created specifically to be written, read, and understood by humans. But no matter which language you start with, in the end, it has to be translated into something your computer can understand. Namely, http://en.wikipedia.org/wiki/Machine_code[machine code].

NOTE: Some languages, such as PHP and Python are known as "scripting languages."  They still require compiling, but it happens right before the program executes.

The program that does the job of taking your code and translating it into machine code is called the *compiler*. http://gcc.gnu.org/[GCC] is one of the most popular compilers. It can compile lots of different languages. GCC is great for compiling, but knowing exactly how to tell the program exactly what you want to do is the subject of much headache and frustration. In the previous section, we conpiled a program with the simple command "g++ -o hello hello.cpp", but once you start doing stuff like using existing libraries, optimizing code for particular processors, bundling your application with resources like images, etc., all bets are off. Telling GCC to compile even a moderately complicated openFrameworks project takes hundreds of lines of isoteric syntax and invoking dozens of helper tools. It's super complex.

So instead, most developers use http://en.wikipedia.org/wiki/Integrated_development_environment[IDEs (Integrated Development Environments)] to organize and create code projects. Most IDEs will include a text editor, a file organizer, a compiler, and lots of GUI interfaces for customizing all of the options and details of the compilation process. http://en.wikipedia.org/wiki/Comparison_of_integrated_development_environments[Some popular IDEs are]: XCode, Visual Studio, CodeBlocks, Eclipse, NetBeans. There are IDEs for every operating system and language. Some IDEs are for one specific language and some support many.

You *might* be able to get away with calling stuff like Flash, Processing, VVVV, and MaxMSP IDEs -- most of the important features are there. The difference is that IDEs are typically blank slates -- they don't come with any specific functionality. The other tools, on the other hand, come with lots of built-in functionality that is usually optimized for a particular purpose. For insance, Flash compiles programs to be run on the web, while Processing is a rapid prototyping tool. 

openFrameworks definitely comes with a lot of functionality. The difference with openFrameworks is that it doesn't come with it's own IDE. Technically, you can use whatever IDE you want to create an openFrameworks project, but just as interfacing with a compiler can be difficult, the process of setting up a project of any complexity in an IDE can also be complex and tedious. One of the great things about openFrameworks is that it provides starting points for several IDEs on the 3 major platforms. They've done the hard work of creating project templates for 3 different IDEs on the 3 major platforms so all you have to do is download and start coding.

To get started working with openFrameworks, you will want to download and install an IDE for your operating system. Guides for installations can be found here:

Windows
^^^^^^^
- http://www.openframeworks.cc/setup/codeblocks/[code::blocks setup guide]
- http://www.openframeworks.cc/setup/vs-2010/[vs 2010 setup guide]

Mac
^^^
- http://www.openframeworks.cc/setup/xcode/[XCode Setup Guide]

Linux
^^^^^
- http://www.openframeworks.cc/setup/linux-codeblocks/[codeblocks & makefiles]

What Can I Make with oF?
~~~~~~~~~~~~~~~~~~~~~~~~

The following collection of projects is an attempt to illustrate the range of different kinds of projects that have been built using openFrameworks.


Puppet Parade
^^^^^^^^^^^^^
by Emily Gobeille and Theo Watson
[quote, creativeapplications.net]
__________________________
Puppet Parade is an interactive installation by Emily Gobeille and Theo Watson of Design I/O that allows children to use their arms to puppeteer larger than life creatures projected on the wall in front of them. This dual interactive setup allows children to perform alongside the puppets, blurring the line between the ‘audience’ and the puppeteers and creating an endlessly playful dialogue between the children in the space and the children puppeteering the creatures.
__________________________
++++
<iframe src="http://player.vimeo.com/video/34824490?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
++++
http://www.creativeapplications.net/openframeworks/puppet-parade-openframeworks/[More Information]


Interactive Wall at UD
^^^^^^^^^^^^^^^^^^^^^^
[quote, flightphase.com]
__________________________
The 36-foot wall at the University of Dayton’s admission center engages prospective students and reveals videos of student life at UD. The wall displays continuously changing patterns of generative graphics, which respond to the presence of people in front of the wall.

The field of cubes is animated with waves of activity, and a viewer’s presence causes them to rotate and unveil POV videos of a student experience. The viewers can explore the videos moving around to reveal different video fragments. When viewers stand together, their silhouettes join to reveal more of the video. When no one is present in the interaction area the installation displays typographic animations overlaid on the dynamically animated graphic patterns.

For more video documentation and details of design and development process see the http://www.flightphase.com/main_wp/case-studies/ud-interactive-wall[Case Study].
__________________________
++++
<iframe src="http://player.vimeo.com/video/27500054?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
++++
http://www.flightphase.com/main_wp/expanded-media/interactive-wall-at-ud[More information]

Scramble Suit
^^^^^^^^^^^^^
by Arturo Castro and Kyle McDonald

One great thing about openFrameworks is that how easy to incorporate c++ code from pretty much any library. To that end, Arturo and Kyle used a http://web.mac.com/jsaragih/FaceTracker/FaceTracker.html[Face Tracker library by Jason Saragih] to create a face-replacement technique that Kyle named "Scramble Suit" inspired by fictional technology from Philip K. Dick’s 1977 novel, "A Scanner Darkly". It’s effectively a cloak that hides the identify of the wearer by making it impossible to describe or remember them.
++++
<iframe src="http://player.vimeo.com/video/29391633?title=0&amp;byline=0&amp;portrait=0" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
++++


Why openFrameworks?
~~~~~~~~~~~~~~~~~~~
openFrameworks is not the only creative coding framework out there. So why should you (or shouldn't you) use openFrameworks?

coming soon...

Additional oF Resources
~~~~~~~~~~~~~~~~~~~~~~~
- http://www.openframeworks.cc/about/[About openFrameworks] More about openFrameworks, including the design methodology.
- http://www.openframeworks.cc/documentation/[Official Documentation] Where you can find descriptions of classes and functions that make up openFrameworks
- http://forum.openframeworks.cc/[oF Forum] Probably the best place to get your questions answered
- http://www.amazon.com/Programming-Interactivity-Designers-Processing-Openframeworks/dp/0596154143[Programming Interactivity] A great book that covers openFrameworks, Processing, and Arduino.
- http://www.creativeapplications.net/[Creative Applications]
