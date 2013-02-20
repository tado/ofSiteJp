---

date: 2012/10/20 17:00:00
title: プロジェクトジェネレータで新しいプロジェクトを作成
summary: openframeworks 0072 からは新しいプロジェクト生成ツールが加わりました
author: Jesus Gollonet
author_site: http://jesusgollonet.com

---

## 1. プロジェクトジェネレータとは何ですか?
<!--
As of openframeworks 0072 we have a new tool called projectGenerator to create new openframeworks projects, including addons.  In previous versions, creating a new openframeworks project involved duplicating an existing example app and adding the addons by hand.  With the project generator project creation is faster and less error-prone. 
-->

openframeworks 0072 からはプロジェクトジェネレータと呼ばれるアドオンを含めて新しいopenFrameworksのプロジェクトを作成するための新しいツールが入っています。以前のバージョンでは、新しいopenframeworksプロジェクトを作成するには既存のexampleを複製したり、手動でアドオンを追加して作成していました。プロジェクトジェネレータを使うとプロジェクトの作成がより早くなり間違いが減ります。

<!--
It is, by the way, a desktop app made with openFrameworks.
-->

ちなみに、プロジェクトジェネレータはopenFrameworksで作られています。


## 2. 使い方
<!--
It's pretty simple to make a new project. 
The project generator lives in a folder in the top level of an openframeworks download. 
-->

新しいプロジェクトを作成するのはとても簡単です。
プロジェクトジェネレータはダウンロードしたopenFrameworksの一番上の階層にあります。

![Image: where is the projectGenerator](pg_images/pg-00.png)

<!--
Double click the app. This is our new friend.
-->

アプリケーションをダブルクリックしてください。これが私たちの新しい仲間です。

![Image: projectGenerator GUI](pg_images/pg-01.png)

<!--
There are some options to consider when creating a new app.
-->

新しいアプリケーションを作成するためにに指定するいくつかのオプションがあります。

### 1. 名前:
<!--
Give a name to yor project
-->

あなたのプロジェクトに名前をつけてください。

### 2. パス
<!--
When you execute the projectGenerator, this should contain the absolute path to the myApps folder in the distribution you downloaded, usually something like
-->

プロジェクトジェネレータを実行すると、あなたがダウンロードしたディストリビューションの、myAppsフォルダへの絶対パスが設定されており、通常は次のようになっています。
	
	/Users/username/wherever/you/have/openFrameworks/apps/myApps
	
<!--
That's a good default option, but you can put your projects anywhere relative to OF, and it should work. That said, due to the self-contained structure of openframeworks, it is still recommended to use folders inside the apps project. That way, if the OF release or your project gets moved, or if some lower level folder gets renamed, the generated paths don't break.
-->

これは良い初期設定なのですが、あなたはプロジェクトをopenFrameworksに対してどの位置にでも配置することができ、実行することができます。

openframeworksが自己完結できる構造のために、appsフォルダを使用することをお勧めします。

この方法では、もしもopenFrameworks本体やあなたのプロジェクトが移動したとき、または下位のフォルダー名が変更されたとき、生成されたパスは解除されません。

<!--
Here's a suggested file structure
-->

推奨されるファイル構造はこのようになります。
	
	
	/.../apps/myApps/
		/myApp1
		/myApp2
		...
	/.../apps/myBigInstallation
		/myProject1
		/myProject2
		...
	/.../apps/myAddonsTests/
		/ofxGifEncoderTests	
		/ofxFlashTests
		...
		

	
### 3. プラットフォーム
<!--
This should contain the platform you want to build for. Given that there are different distributions for different platforms this is set in your download. This means that if you have, for example, an osx distribution and an ios distribution on mac, you'll have to execute the projectGenerator in their respective folders.
-->

あなたがビルドを行うプラットフォームが選択されているはずです。異なるプラットフォームの様々なディストリビューションがありますので、あなたのダウンロードしたものに設定されています。これが意味することは、たとえば、Mac上でのOS X用ディストリビューションとiOS用ディストリビューションは、それぞれ別のフォルダでプロジェクトジェネレータを実行する必要があるということです。


### 4. アドオン
<!--
If you know the addons you're going to need, open the addon selection page where you can include them. Click on Back when you're done.
-->

必要となるアドオンがわかっていれば、addonを選択するページを開いて、必要なaddonを含めることができます。選択できたらBackをクリックします。

![Image: projectGenerator - selecting addons](pg_images/pg-02.png)

#### アドオンについての注釈
<!--
- All the addons you have in your addons folder will be listed here, not only the ones that came with openframeworks. 
-->

- addonフォルダーの中にあるフォルダーが、openFrameworks以外のフォルダーも含めて、すべて表示されます、

<!--
- That said, not all addons (especially non core addons) are packaged in the right way for this. This tool is in its early days so there are many addons we haven't tested yet.
-->

- すべてのアドオンは（コア・アドオンではないものは特に）正しい方法でパッケージされているとは限りません。

<!--
- Also, don't worry if you still don't know what you'll need. You can always add them later with the usual method for your platform.
-->

- まだどのアドオンが必要かがわからなくても気にしなくてかまいません。あとから各プラットフォームの従来の方法でいつでも追加することができます。

<!--
- There are several guides on how to install addons for different platform in the [openframeworks wiki](http://wiki.openframeworks.cc/index.php?title=Main_Page). They might be slightly out of sync with the latest release but if you run into trouble don't hesitate to ask in the [forum](http://forum.openframeworks.cc/index.php)
-->

- [openframeworks wiki](http://wiki.openframeworks.cc/index.php?title=Main_Page)にはアドオンを各プラットフォームにインストールするための方法があります。これらは最新のリリースでは若干のズレがあるかもしれませんが、上手くいかなかったときには躊躇せず[forum](http://forum.openframeworks.cc/index.php)で質問してください。

<!--
- Check out [ofxaddons.com](http://ofxaddons.com) for a huge collection of them.
-->

- [ofxaddons.com](http://ofxaddons.com)にある多くのアドオンを見てみてください。

### 5. 完了!
<!--
Click on generate and your project will be created. Depending on the amount and size of addons you selected it might take a while. You'll get a message on the bottom bar when the app is done.
-->

generateをクリックするとプロジェクトが作成されます。あなたが選択したアドオンのサイズによって時間がかかる場合があります。完了すると一番下のバーにメッセージがでます。

<!--
Go to the folder you specified in the path and your project will be waiting for you. Start coding.
-->

選んだパスのフォルダーに行けば、あなたのプロジェクトがあなたを待っています。コーディングを始めてください。


## 3. その他の注意事項：
<!--
- Check the [readme](https://github.com/ofZach/projectGeneratorSimple/tree/master/bin) for more info about the tool, including some advanced notes and a more flexible version for developers.
-->

- プロジェクトジェネレータについてのより高度な事項、開発者のためのよりフレキシブルなバージョンを含めた更に詳しい情報については、[readme](https://github.com/ofZach/projectGeneratorSimple/tree/master/bin)をみてください。

<!--
- Even though the screenshots and paths in this guide are mac centric, the process is the same for all platforms. Again, if you have doubts, ask in the [forum](http://forum.openframeworks.cc/index.php)
-->

- このガイドに含まれているスクリーンショットやファイルパスはMac用のものですが、手順はどのプラットフォームでも同じです。もう一度言っておくと、何か間違いがあれば、[forum](http://forum.openframeworks.cc/index.php)で尋ねてください。

<!--
- Excuse the blurriness of the screenshots. We're working on it : )
-->

- スクリーンショットが枠からはみだしていてすみません。ただいま作業中です : )

