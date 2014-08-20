## -*- coding: utf-8 -*-
<%inherit file="/_templates/markdown.mako" />

linux eclipse
=============

**注意** : 何かトラブルに遭遇したら、最後にある[FAQ](#faq)を参照してください。

このガイドは、EclipseをIDEとしてopenFrameworksを使用し始める方法について解説しています。Eclipseはとてもパワフルです。その反面、複雑で若干リソースが重い環境です。もし、新規ユーザ、もしくは素早く開発を始めたいのなら、[Code::Blocks][15]版から始めると良いでしょう。

このガイドは、Ubuntu 12.10 64bit版で、Eclipse Juno(4.1 SR1)、openFrameworksのv0073の64bit版でテストしました。Eclipse特有の作業手順は、他のプラットフォームでも適用可能でしょう。

使用するには、Eclipse for C++とopenFrameoworksが必要です。

要約
-------

主な作業手順は以下のとおり :

- Eclipseのインストール
- ダウンロードページ、もしくはgitのクローンから、openFrameworksをダウンロード
- Project Generatorで、新規プロジェクトを生成
- openFrameworksのプロジェクトを、Eclipseにインポート
- 新規プロジェクトのインポート
- 参照されているソースを探すためのプロパティーを新規プロジェクトに設定
- デバッグ用に、新規ビルドターゲットを追加
- プログラムが正しく動いているかチェックするためのコードをプロジェクトに追加
- デバッグビルドが機能しているかデバッグして確認

インストール
------------

**a) Eclipse**: (EclipseのWebサイトのダウンロードペー)[11]から、使用しているプラットフォーム向けのC/C++エディションをダウンロードする。

![download Eclipse][01downloadEclipse]

この説明は、Eclipse Juno 4.2 SR1.を使用しています。

[Eclipseのサイト][1]に、インストールの解説があります。Sun/Oracleの公式版のJavaがEclipseには必要です。このページで参照されている、UbuntuへのJavaのインストール解説は古く、[こちらのインストール解説][12]が使用されています。よりUbuntuに特化したEclipseのインストール情報は、[質問と回答][13]そして[このページのどこに実行ファイルを置いて起動アイコンを生成するか][14]に掲載されています。


**b) openFrameworks for linux package**: [openFrameworksのダウンロードページ][4]からダウンロード。

[Githubのマスターブランチ][9]からチェックアウトすることも可能です。

- openFrameworksパッケージの script/linix フォルダの下に、ディストリビューションの名前がつけられたディレクトリがあります。その中には install_codeblocks.sh、install_dependencies.sh という2つのスクリプトが入っています。必要なのは、install_dependencies.sh のみです。root権限が必要となるため、デスクトップから起動するのは避けて、ターミナルから起動するようにします。もし、おかしなことがあれば、複数回実行することも問題ありません。もし、openFrameworksのバージョンを上げた場合は、install_dependencies.sh を再度実行してください。もし、tar+zipで圧縮されたダウンロードバージョンのopenFrameworksを使用している場合、コマンドラインからmakefileを使用してサンプルをビルドすることが可能です。Github版を使用している場合には、必要であれば、projectGeneratorを使用して、サンプルを生成しなくてはなりません。


Ubuntuでの正確な手順は、以下のようになります :


__Ubuntu:__

- 

- open a terminal. If you are using unity click on the Dash icon and type term then choosing the appropriate application.

- in the terminal go to the directory where your openFrameworks package is.

- ie. if your user name is ofuser and you have uncompressed the oF package in the desktop it should be something like:

        cd /home/ofuser/Desktop/of_v0073_linux64_release/scripts/linux/ubuntu

- once in this directory run the scripts with:

        sudo ./install_dependencies.sh

- to check if the example works with a make file, go to the example directory and type make.

- ie. if your user name is ofuser and you have uncompressed the oF package in the desktop try the following commands:

        cd /home/ofuser/Desktop/of_v0073_linux64_release/examples/graphics/polygonExample
        make
        cd bin
        ./polygonExample


**c) Start Eclipse**:

Depending on where you installed eclipse you can start it from the terminal or if you made a launcher icon start it from there. The terminal command may look like this:

        cd /home/ofUser/opt/eclipse
        ./eclipse

You will see a pop up asking you what workspace to use. Just point it to the default, the openframeworks projects will not end up in this workspace.
![workspace launcher][01workspaceLauncher]


**d) Import openFrameworks into Eclipse:**

File \> Import and select General \> Existing projects in the workspace...

![import projects 1][01importProjects]
![import projects 2][02importProjects]

Import in this order:

- openFrameworks/libs
- openFrameworks/libs/openFrameworks
- openFrameworks/addons/

**e) Create an External Tools Configuration to run the projectGeneratorSimple**

Run \> External Tools \> External Tools Configuration

![add external tool 1][01externalTool]

Set the Location to
        /home/ofUser/of_v0073_linux64_release/apps/projectGenerator/projectGeneratorSimple/bin/projectGeneratorSimple

Set the Working directory to
        /home/ofUser/of_v0073_linux64_release/apps/projectGenerator/projectGeneratorSimple/bin

![add external tool 2][02externalTool]

Run \> External Tools \> Organize Favourites...

![add external tool 3][03externalTool]

**f) Create a Test project**
Use the toolbar button to run the external tool or choose from the menus:

Run \> External Tools \> ProjectGeneratorSimple

Fill in the info for your test project

![create a test project][01createTestProject]

**g) Import the test project**

In eclipse import the test project. You can right-click on the project explorer tab or choose

File \> Import then make sure to choose C/C++ Existing code as makefile project

![import the test project 1][01importTestProject]
![import the test project 2][02importTestProject]

**h) Set test project references**

Add the references to openFrameworks in the project so that source code is visible in the test code.

Right click on the test project in the project browser and choose Properties. Choose C/C++ Generatl and choose the References tab. Then select both the addons and the openFrameworks projects.

![set project references][01setReferences]

**i) Add test project debug settings**

The openframeworks project makefile uses the argument "Debug" to compile the code with the correct symbols to allow debugging. The executable it generates for debug ends with _debug. e.g.

        test_debug

instead of just

        test

Change the project properties to use

        make Debug

and to use the executable

        test_debug

by setting up project properties. Right-click on the project in the project browser and choose Properties. Add a new Debug configuration with Manage Configurations. Set the new Debug configuration as the active configuration. Set the Builder settings to call _make Debug_. Then change the Run/Debug Settings to use the _test_debug_ executable.

![add a debug target 1][01debugTarget]
![add a debug target 2][02debugTarget]
![add a debug target 3][03debugTarget]
![add a debug target 4][04debugTarget]
![add a debug target 5][05debugTarget]
![add a debug target 6][06debugTarget]

**j) Add code to the test project**

Add some code to the project. In this step you can test if code completion works with Ctrl-Spacebar. e.g. type ofL Ctrl-Space and see if the ofLog method is displayed. You can also see if Eclipse will jump to the declaration of a method or constant by pressing F3. Compile the code using the Hammer icon. For this example I added a log message to the setup method in the ofApp.cpp file. Make sure you choose the Debug configuration under the arrow of the Hammer.

![add code 1][01addCode]
![add code 2][02addCode]
![add code 3][03addCode]

**k) Run and debug the test project**

Activate a breakpoint in the new code by Right-click in the margin and choosing Toggle Breakpoint or double clicking in the margin. Press the green bug toolbar icon to run in debug mode. The debugger should break at your breakpoint. Use the debug controls to continue or step into the code.

![debug the test project][01debugTestProject]

Notes
-----

- Data files should go in bin/data.

- Sometimes there are unresolved symbols which look like bugs, red squiggles. The project still compiles and runs correctly. This happens if Eclipse is confused about which symbols it should use.

- You can see the output of the compiler and of the ofLog commands in the Console tab.

<a id="faq"></a>FAQ
---

- If the Import project step does not find a project you are missing a .project file.
For openFrameworks/libs save [this file][libsProjectFile] as .project file.
For openFrameworks/libs/openFrameworks save [this file][ofProjectFile] as .project file.
For openFrameworks/addons/ save [this file][addonsProjectFile] as .project file.

- If nothing happens when you click on the green bug to debug, you may have to choose organise favourites from the green bug arrow and add your test project configuration.

- If you can't set a breakpoint, check carefully where in the margin you are clicking. The click target isn't all that large.

- Sometimes it helps to refresh the symbols by Right clicking on the project and choosing Index \> Rebuild


[1]: http://wiki.eclipse.org/Eclipse/Installation#Install_a_JVM
[2]: http://developer.android.com/sdk/index.html
[3]: http://developer.android.com/sdk/ndk/index.html
[4]: http://openframeworks.cc/download
[5]: http://ant.apache.org/bin/download.cgi
[6]: http://developer.android.com/sdk/eclipse-adt.html
[7]: http://developer.android.com/guide/developing/device.html
[8]: http://www.multigesture.net/articles/how-to-setup-openframeworks-for-android-on-windows/
[9]: http://github.com/openframeworks/openFrameworks
[10]: http://www.undef.ch/uploads/ofDoc/html/classof_log.html
[11]: http://www.eclipse.org/downloads/
[12]: http://www.ubuntugeek.com/how-to-install-oracle-java-7-in-ubuntu-12-04.html
[13]: http://askubuntu.com/questions/186299/eclipse-juno-need-root-access-everytime-i-change-the-configuration
[14]: https://help.ubuntu.com/community/EclipseIDE
[15]: http://www.openframeworks.cc/setup/linux-codeblocks/

[libsProjectFile]: https://raw.github.com/openframeworks/openFrameworks/master/libs/.project
[ofProjectFile]: https://raw.github.com/openframeworks/openFrameworks/master/libs/openFrameworks/.project
[addonsProjectFile]: https://raw.github.com/openframeworks/openFrameworks/master/addons/.project

[01downloadEclipse]: 01downloadEclipse.png
[01workspaceLauncher]: 01workspaceLauncher.png
[01importProjects]: 01importProjects.png
[02importProjects]: 02importProjects.png
[01externalTool]: 01externalTool.png
[02externalTool]: 02externalTool.png
[03externalTool]: 03externalTool.png
[01createTestProject]: 01createTestProject.png
[01importTestProject]: 01importTestProject.png
[02importTestProject]: 02importTestProject.png
[01setReferences]: 01setReferences.png
[01debugTarget]: 01debugTarget.png
[02debugTarget]: 02debugTarget.png
[03debugTarget]: 03debugTarget.png
[04debugTarget]: 04debugTarget.png
[05debugTarget]: 05debugTarget.png
[06debugTarget]: 06debugTarget.png
[01addCode]: 01addCode.png
[02addCode]: 02addCode.png
[03addCode]: 03addCode.png
[01debugTestProject]: 01debugTestProject.png
