<%inherit file="/_templates/markdown.mako" />

Xcodeセットアップガイド
==================

ステップ1 -- Xcodeのインストール<br/>
ステップ2 -- openFrameworksを使う

Xcodeの癖：メインプロジェクトフォルダーの名前でのスペースの使用<br/>
Xcodeの癖：新規ファイルの追加<br/>
Xcode 4.0の注意と、OSX 10.7.2について

**ステップ1：Xcode3以上のバージョンをダウンロードしてインストール** 

XcodeはApple社製のOSXベースのフリーの統合開発環境(IDE)です。Appleの開発者として登録していれば、[デベロッパーセンター][0]からダウンロードできます。[デベロッパー登録](https://developer.apple.com/jp/programs/register/)は無料で、さほど大変でもありません。

![adcLogin](adcLogin.jpg)  

登録したアカウントでログインして、[Member Center](https://developer.apple.com/membercenter/index.action)のリンクを選びます。

![adcDeveloperTools](adcDeveloperTools.jpg)  

最新のバージョンのXcode3、またはXcode4をダウンロードします。

![adcDownload](adcDownload.jpg)  

ダウンロードが完了すると、インストーラーのディスクイメージがマウントされ、XcodeToolsのパッケージが起動されます。カスタマイズのオプションが出てくるまで、クリックしていきます。

これはインストールするかしないかを選択するところで、もしあまりディスクスペースの余裕がなくて、1.3GBもある開発者ドキュメントをスキップしたいのであれあ、下記で図示した部分をクリックします。

また、OS X 10.5や10.6などの古いバージョンのサポートをするかどうかを示す全てのボックスをチェックしておくことをお勧めします。

![xcodeCustomize](xcodeCustomize.jpg)  

インストーラーがインストールを開始します。

![xcodeInstalling](xcodeInstalling.jpg)  

デベロッパーツールのインストーラーは、ハードドライブのroot(一番上位の階層)にある_Developer_フォルダにインストールします。Xcodeのアプリケーションは、_/Developer/Applications/Xcode.app_に配置されます。

![xcodeLocation](xcodeLocation.jpg)  

コンピュータにXcodeがうまくインストールできたら、いよいよopenFrameworksのサンプルをチェックします。


**ステップ2：openFrameworksを使う**

このWebサイトの[download][1]のセクションから、サンプルをダウンロードします。ダウンロードして展開したら、ハードドライブの適切な場所にフォルダを配置します。展開されたフォルダー内のコンテンツは下記のようになります。

![ofFolderStructure](ofFolderStructure.jpg)  

サンプルは_"apps"_フォルダに格納されています。サンプルのそれぞれのフォルダの中に、_"graphicsExample.xcodeproj"_ のようにXcodeのプロジェクトファイルがあります。このファイルをXcodeで開きます。

Xcodeでサンプルを開くと、左側のコラムにファイルのリストが、右側のコラムには現在選択しているファイル(この画像の場合は_"testApp.cpp"_)が表示されます。

![xcodeLeftSide](xcodeLeftSide.jpg)  

おそらく最初にやってみたいことは、プログラムをコンパイルして実際に動くかどうかアプリケーションを実行することでしょう。Xcodeのウィンドウの一番上に_"Build and Go"_ というボタンがあります。このボタンは、サンプルをコンパイルして、もしエラーがない限り、アプリを起動します。もし最初のコンパイルでエラーが出る場合は、Buildメニューから、"Clean All Targets"をを選択して、再度コンパイルし直してください。

![xcodeButtons](xcodeButtons.jpg)  

![ofTypeWindow](ofTypeWindow.jpg)  

_起動したアプリケーションを終了するには、「Esc(エスケープ)」キーを押します。_


**注：警告とエラー**

アプリケーションがコンパイルされている間は、Xcodeウィンドウの右下のコーナーに**プログレスメーター**と呼ばれる小さな円が表示されます。これは、ファイルのコンパイル状況をパーセントで表示します。

黄色い三角形とそれに続く数字は、コンパイラーからの**警告メッセージ**の数を示しています。大抵の場合は、警告メッセージは無視して構いません。しかし、もし警告の内容を読みたいのであれば、三角形をクリックするとXcodeが警告のリストを別ウィンドウで表示します。

![xcodeCompileProgress](xcodeCompileProgress.jpg)  

もしコンパイラーがコードの中に**エラー**を発見した場合や何らかの喜ばしくないことがある場合、コンパイルは失敗し、Xcodeのウィンドウの右下に何らかの表示がされます。

![xcodeError](xcodeError.jpg)  

警告メッセージと同じように、**view the errors**をみるために赤い丸をクリックすると、Xcodeはエラーのリストとどこでエラーが起きたのかわかるように**コードの中をハイライト**して新しいウィンドウで表示します。

![xcodeErrorShow](xcodeErrorShow.jpg)  



Bear in mind that the **error message might not always make sense to you** but most of the time just showing you where the error is will be enough for you to realise your mistake.

In the code above, by looking at the highlighted line it is quite easy to see that I forgot to put a coma between _"frabk.tff"_ (the font name I wanted to load) and _32_ (the size I wanted to font to be).

If I put the coma back in both errors go away and the app compiles and launches nicely.

![ofGraphicsWindow](ofGraphicsWindow.jpg)  


**Notes: Run Log**

When the Xcode project launches the app it has another window running behind it called the _"Run Log"_. This is a console that will give you **feedback about your app** while it is running.

When the app launches the first thing that is printed to the Run Log is  

**\[Session started at 2007-02-25 15:34:07 +0100.\]**

When the app exits it will print something like this  

**openFrameworks has exited with status 0\.**

The useful thing about the Run Log is that you can **print** out to it **while your app is running** with _"ofLog"_ . Also if there are openFrameworks related messages or errors they will be printed here as well.

![RunLog](RunLog.jpg)  


**Notes: Location of your app**

The application that you are compiling and running with Xcode is located in the _"bin/"_ folder of each project directory. You can always **run the application directly** by double clicking it. Everything will be the same as when you launch it with Xcode except you won't see the Run Log output.

![buildLocation](buildLocation.jpg)  


**Xcode -- Bugs and Quirks**

**Spaces in main project folder name:** For some reason Xcode freaks out if your main project folder (the one that contains the _"apps"_ and _"libs"_ folder has spaces in the name.

It will give **linking errors** that it can't find certain libraries in the libs folder.

![badFolder](badFolder.jpg)  


The folder name above, with the space between 'my' and 'apps' will give you all sorts of problems. Replacing the space with a dash or concatenating the spaces, as below will keep everything happy.

![goodFolder](goodFolder.jpg)  


**Adding files to project: relative vs absolute path** When you add source code files or libraries to your project Xcode will ask you whether you wish the path to the file to be a relative path or an absolute path.

![addDialogRelative](addDialogRelative.jpg)  


As a rule for **all files** in your main **openFrameworks folder** and its sub-folders make sure you **choose** _"relative to project"_.If you select **absolute path** then everytime you move your openFrameworks folder around or onto another computer **Xcode will freak out** because your files will have been listed with paths that don't exist anymore.

For example a path like: _"/User/yourname/Documents/openFrameworksProjects"_ means that the Xcode project will **only work** if the openFrameworks folder is in that specific place. Obviously this is **not a good thing**.

The **default path** it will give you is **usually an absolute one** so make sure you **change it** to _"relative to project"_ before you click add.

The **only files** that should have **absolute paths** are the **System Frameworks** which you will most likely not need to add.



**Xcode 4.0 Notes:**

**This is the ideal layout for your Xcode 4 project:**

![xc4](xc4.png)  


Xcode 4 has a completely redesigned interface. Here are some important differences:

**Side bar view mode:**

When you first open an openFrameworks project you might find the files in the sidebar aren't showing up. 
Click the folder icon at the top of the sidebar to show the traditional file view ( you might need to expand out the list with the sidebar arrows ). 

![xc4sideBarTop](xc4sideBarTop.png)  

![xc4sidebarFileSelected](xc4sidebarFileSelected.png)  


**Run button:**

In Xcode 4 the Run button has replaced the "Build" and "Build and Run" buttons. 

To compile and launch your app hit the "Run" button.

![xc4Run](xc4Run.png)  


**Select the correct Target:**

You might also find that your example is not running.

This could be because the openFrameworks library and not the example project is set as the active target. 

To correct this, select the example project name from the 'Scheme' drop down. 

![xc4changeScheme](xc4changeScheme.png)  


**Change from Debug to Release:**

When you are done with your app you will want to create a 'Release' version of this. 

In Xcode 3 this is as easy as switching the Build from Debug to Release mode. 

In Xcode 4 by default only Debug is enabled. 

To switch to Release select the "Edit Schemes" from the Schemes menu.

Then click the example app in the sidebar and change the Build Configuration to Release.

![xc4editSchemes1](xc4editSchemes1.png)  

![xc4editSchemes2](xc4editSchemes2.png)  


**Errors:**

Xcode 4 compiles code as you type so you might see red errors appear in your code before you build. 

This is actually quite handy and can help you spot mistakes. Also the Errors icon which was in the bottom right corner of the window has now moved to the top panel. 

![xc4errors](xc4errors.png)  


**Target OS 10.6 / MacSetRect Error:** 

If you get QuickTime MacSetRect errors on 10.7 with Xcode 4.0, this is because a part of your project is set to 10.7 SDK.
 
Currently OF doesn't build against the 10.7 SDK because of QT 7 dependencies. 

To set the project back to 10.6 SDK follow these steps posted [from this blog][2]:

* Switch from the openFrameworks scheme to the project scheme

* Click on the project on the sidebar to bring up the settings

* Change the Base SDK to 10.6

* Repeat the previous line for the build target

* Click on the openFrameworks folder in the sidebar

* Click on the project to bring up the settings

* Change the Base SDK to 10.6 like you did before

* Repeat for the build target


**10.7.2 OF Issues**

There are a few issues with OF on 10.7.2 - we will work on getting these fixed for the next release.

In the meantime check [these tips posted on the forum][3].




[0]: http://connect.apple.com
[1]: http://www.openframeworks.jp/download
[2]: http://blog.davidpaulrosser.co.uk/2011/08/getting-openframeworks-0-07-compiling-with-osx-10-7/
[3]: http://forum.openframeworks.cc/index.php/topic,7621.0.html
