## -*- coding: utf-8 -*-
<%inherit file="/_templates/markdown.mako" />

linux codeblocks &#038; makefiles
================================

Code::Blocks
----------

Code::Blocksは、Linuxでコードを書くのにとても良いIDE（統合開発環境）で、私達も喜んでサポートしています。このページは、Ubuntu、Fedora、Debian向けのセットアップガイドです。もしあなたが別のディストリビューションを使用していて、追加で作業手順ある場合は、知らせてください。

- openFrameworksのパッケージの中にある、scripts/linuxフォルダ内に、distributionという名前のついたディレクトリがあります。ここには2種類のスクリプトがあります。install_codeblocks.shと、install_dependenciesl.shです。これらはroot権限で実行する必要があるので、デスクトップから直接実行しないでください。ターミナルから起動する必要があります。スクリプトを実行する順番は問いません。また、何かがうまくいかない場合は、何度も実行することが可能です。もし、openFrameworksのバージョンをアップデートしたり、Code::Blocksで問題が発生した場合には、両方のスクリプトを実行してください。一度、これらの手順を終えると、Applications &gt; Developmentの中にcodeblocksが生成されます。また、appsフォルダ内にある.cbpファイルをダブルクリックするだけで、openFrameworksのサンプルを開くことが可能です。

__Ubuntu:__

- Applications &gt; Accessories &gt; Terminal からターミナルを開きます。
- ターミナルで、openFrameworksのパッケージがある場所へ移動します。
- 例: もし、ユーザ名が「ofuser」で、openFrameworksのパッケージをデスクトップに展開したとすると、以下のようなコマンドになります。

      cd /home/ofuser/Desktop/of_preRelease_v0.8.0_linux_cb_FAT/scripts/linux/ubuntu

- このディレクトリ内で、以下のスクリプトを実行します。

        sudo ./install_codeblocks.sh
        sudo ./install_dependencies.sh

- おそらく、h264やmp3といったコーデック（符号化方式）を使用したいでしょう。mp3などのフォーマットは、特定の国々ではライセンスの都合で最初からインストールしておくことができませんので、以下のコマンドでインストールします。

        sudo ./install_codecs.sh

__Debian:__

- Applications &gt; Accessories &gt; Root Terminal からターミナルを開きます。
- ターミナルで、openFrameworksのパッケージがある場所へ移動します。
- 例: もし、ユーザ名が「ofuser」で、openFrameworksのパッケージをデスクトップに展開したとすると、以下のようなコマンドになります。

        cd /home/ofuser/Desktop/of_preRelease_v0.8.0_linux_cb_FAT/scripts/linux/debian

- このディレクトリ内で、以下のスクリプトを実行します。

        ./install_codeblocks.sh
        ./install_dependencies.sh

- おそらく、h264やmp3といったコーデック（符号化方式）を使用したいでしょう。mp3などのフォーマットは、特定の国々ではライセンスの都合で最初からインストールしておくことができませんので、以下のコマンドでインストールします。

        ./install_codecs.sh

__Fedora:__

- Applications &gt; System Tools &gt; Terminal からターミナルを開く。Fedoraでは最初にroot権限になる必要があるので、ターミナルで以下のコマンドを実行します。

        su -

    そのあと、rootのパスワードを入力します。

- ターミナルで、openFrameworksのパッケージがある場所へ移動します。
- 例: もし、ユーザ名が「ofuser」で、openFrameworksのパッケージをデスクトップに展開したとすると、以下のようなコマンドになります。

        cd /home/ofuser/Desktop/of_preRelease_v0.8.0_linux_cb_FAT/scripts/linux/fedora

- このディレクトリ内で、以下のスクリプトを実行します。

        ./install_codeblocks.sh
        ./install_dependencies.sh

- おそらく、h264やmp3といったコーデック（符号化方式）を使用したいでしょう。mp3などのフォーマットは、特定の国々ではライセンスの都合で最初からインストールしておくことができませんので、以下のコマンドでインストールします。

        ./install_codecs.sh

oFをコンパイル
------------

openFrameworksのソースは、コンパイルされていない状態で配布されます。初期状態では、最初にサンプルをコンパイルする際にopenFrameworksのソースも自動的にコンパイルされます。しかし、エラーがあるといけないので、まず始めに単体でコンパイルすることをお勧めします。

もし、FedoraかDebianを使用している場合は、開いているターミナルで、管理者アカウントから以下のコマンドで離脱します。

        exit

scripts/linuxディレクトリに移動します。

        cd /home/ofuser/Desktop/of_preRelease_v0.8.0_linux_cb_FAT/scripts/linux/

下記のスクリプトを使用して、コンパイルします。

        ./compileOF.sh

もし、何らかのエラーに遭遇したら、[フォーラム](http://forum.openframeworks.cc)のLinuxセクションに報告してください。


Project Generator
-----------------

Project Generatorは、新規プロジェクトを簡単に生成するためのツールです。Project Generatorをコンパイルするには、oFをコンパイルした際と同じターミナルの同じ場所から、以下のコマンドを実行するだけです。

        ./compilePG.sh

これで、openFrameworks直下に、新規プロジェクトを生成するための実行ファイルがあるprojectGeneratorというディレクトリが出来ています。

Code::Blocks
----------

バージョン007以降は、Code::Blocksはそれ自身の設定ではなく、makefileを使用するようになっています。そのため、もしプロジェクトにライブラリやアドオンのサーチパスを追加しい場合は、Code::Blocksのプロジェクトか、root以下にあるのconfig_filesフォルダ以下を確認します。

2つのファイルが見付かるはずです :

- *config.make* includeやライブラリののサーチパスや、コンパイラの最適化などの構成を設定します。
- *addons.make* アドオンを追加します。もし、Code::Blocksを使用しているなら、使用したいアドオンの名前を1行ずつ追加します。これでアドオンは使用できるようにありますが、Code::Blocks上には表示されません。Project > Add files recursivelyに移動して、アドオンのフォルダを追加します。
- *addons.make* where you can add addons to your project. If you are using codeblocks adding a line with the name of the addon you want to use will

再度確認すると、プロジェクトの設定や、コンパイルにするファイルの追加には、Code::Blocksで設定しないようにしてください。srcフォルダ内にある全てのものは、最初からコンパイルされます。

makefiles
------------

openFrameworks 0.06以降から、全てのサンプルを生成するmakefileがあります。特別なパッケージではなく、Code::Blocks版の配布パッケージに入っています。

Code::Blocksを使用せずに生成するのであれば、単純にinstall_dependenciesスクリプトを実行するだけです。Code::Blocksをインストールしたプラットフォームの説明に従ってください。

makefileを使用するには、それぞれのexampleのディクトリに移動して、makeと入力するだけです。Code::Blocksがするのと同様に、全てをコンパイルし、実行ファイルを生成し、binディレクトリ内にclickToLaunch.shスクリプトを生成します。

Makeのターゲット設定は以下のものがあります。

- Debug: デバッグシンボルと一緒に、実行ファイルを生成します。
- Release: コンパイラーによって最適化された実行ファイルを生成します。
- clean: 実行ファイルとオブジェクトファイルを消去します。
- CleanDebug: Debugビルドのファイルのみを消去します。
- CleanRelease: Releaseビルドのファイルのみ消去します。
- help: makefileをどのように使用するかのヘルプを表示します。

プロジェクトのルートディレクトリに、addons.makeファイルを生成することで、makefileにアドオンを追加することも可能です。使用うるアドオンの名前を1行ずつ追加します。


FAQ
---

**下記のようなエラーが表示されて、サンプルがコンパイルできません!**


    ../../../libs/glew/include/GL/glew.h:1172:20: fatal error: GL/glu.h: No such file or directory


- install_dependencies.shスクリプトを最初に実行しましたか? このスクリプトは、サンプルをコンパイルするのに必要なライブラリをインストールします。


**サンプルをコンパイルすることはできたのに、実行されません。ウィンドウは表示されるのに、何も表示されないのです。**

- グラフィクスカードのドライバーがインストールされていますか? 標準設定のドライバーでは、OpenGLの機能が存在しない場合があります。また、もし実行できてもとても遅くなってしまうことがあります。

- もしubuntuを使用していて、垂直同期を有効にしているのにも関わらず画面が乱れてしまう場合、gnome shellをインストールしてnon-acceleratedのバージョンを試してみてください。acceleratedバージョンのgnome shellは、垂直同期に問題がある場合があります。
