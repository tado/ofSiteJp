## -*- coding: utf-8 -*-
<%inherit file="/_templates/markdown.mako" />

Qt Creator
==========

LinuxとWindows、そしてOSX向けに、バージョン0.9.0からQt Creatorに対応しました。このガイドはQt Creator 3.5.1をベースにしており、その他のバージョンでは手順が異なったり、期待通りに動かない可能性があります。

Qt Creatorは以下のリンクからダウンロードすることができます。  
[http://www.qt.io/download-open-source/#section-6](http://www.qt.io/download-open-source/#section-6)


Linux
-----

LinuxでOFを使うためにはいくらか準備が必要です。まだセットアップが済んでいない場合は[こちらのガイド](../linux-install)を参照しながらおこなってください。

LinuxでQt Creatorを使用する場合、ディストリビューションのリポジトリに存在するものよりもWebページで配布されているものをインストールすることをおすすめします。ディストリビューションから手に入るバージョン（少なくともUbuntu版）は古くなっている可能性がありますが、Webページからダウンロードできるバージョンでは、デフォルトの静的解析ツールに比べてより正確にエラー箇所を教えてくれるclangプラグインのサポートが得られます。

いったんインストールが済めば、openFrameworks向けのQt Creatorプラグインのインストールができます。scripts/qtcreator 内にある install_template.sh を実行すれば必要なものがすべてインストールされるでしょう。

Windows
----

まずはじめにmsys2をインストールする必要があります。[セットアップガイド](../msys2)を参照してください。

ビルドシステムはmsys2がデフォルトのディレクトリ（c:\msys64）にあることを期待します。もし他の場所にインストールされている場合はプロジェクトファイルの修正が必要になるかもしれません。

msys2を利用してQt Creator使うには、メニューから**ツール > オプション**を開いて**ビルドと実行**メニューから**コンパイラ**タブを選択し、リストに**c:\msys64\mingw32\bin**がなければ追加します。**キット**タブへ移動し、

Some parts of the build system rely on msys2 being installed in the default folder: c:\msys64 and installing it somewhere else might need modifications to the project files.

To use QtCreator with msys2 go to Qt Creator > Preferences > Build and Run > Compilers and if it's not there add a compiler that points to c:\msys64\mingw32\bin then in the Kits tab configure the Desktop Kit to use gcc from msys2.

Once installed you can install the Qt Creator plugin for openFrameworks that comes with the OF download by copying the templates in scripts/qtcreator/templates to c:\Qt\qtcreator-3.5.1\share\qtcreator\templates.

OSX
----

Qt Creatorをインストールして起動したら、メニューバーから**Qt Creator > 設定（⌘+,）**を開きます。**ビルドと実行**メニューから**キット**タブを選択し、gccではなくclangを使用するよう設定をおこなってください。設定が変更できない場合は「管理」ボタンを押すか直接**コンパイラ**タブへ移動し、clangが有効になっているか確認します。場合によっては独自の設定を追加する必要があるかもしれません。

いったんインストールが済めば、openFrameworks向けのQt Creatorプラグインのインストールができます。scripts/qtcreator 内にある install_template.sh を実行すれば必要なものがすべてインストールされるでしょう。

すべてのプラットフォーム
-------------

必要に応じてClangの静的解析ツールを有効にすることができます。これはコーディング中に正確にエラーを発見してくれるものですが、速度の低下につながることもあります。Qtのページから、これを有効化する手順を紹介します。

Clang コードモデル用プラグインの設定

  - メニューバーから **Qt Creator > プラグインについて...** を選択してプラグインの一覧を開き、**C++ > Clang Code Model** のチェックボックスを選択します。
  - Qt Creatorを再起動します。
  - メニューバーから **設定... > C++ > コードモデルの確認...** を開いて、すべてのオプションをClangに変更します。

openFrameworksプラグインをインストールすると、ウィザードに従って新規プロジェクトの作成と公式アドオンの追加がおこなえます。プロジェクトを作成したあとは**.qbs**ファイル内にある**of.addons**という配列にアドオンの名前を加えることでそのアドオンを追加することができます。

また、既存のコードからプロジェクトを作成することも可能です。

あるプラットフォーム上で作成したプロジェクトは、サポートされるその他のプラットフォームでも動作するはずです。


<iframe src="https://player.vimeo.com/video/142272907" width="1000" height="563" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
