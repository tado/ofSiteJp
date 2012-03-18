# openFrameworks日本語サイト

openFramewroks日本語版サイト[openFrameworks.jp](http://openframeworks.jp/)を生成するコンテントを管理しているリポジトリです。

## サイトをローカルに構築するためのセットアップ

翻訳をお手伝いしていただける方は、まずリポジトリをForkして、ローカルマシンにダウンロードします (参考：[Help.GitHub - Fork A Repo](http://help.github.com/fork-a-repo/))。ローカルのマシンには、Pythonと、lxml、[blogofile](http://blogofile.com/) がインストールされている必要があります。Pythonがインストールされたマシンであれば、以下の手順でインストールできます:
	easy_install lxml	easy_install blogofileサイトを生成してローカルマシンで閲覧するには、以下のコマンドを実行します。	blogofile build	blogofile serve## Markdown記法についてサイトの文書は、Markdownというwikiに似た書式で記述します。詳細は、[Daringfireball](http://daringfireball.net/projects/markdown/)を参照してください。(参考：[Markdown文法の全訳](http://blog.2310.net/archives/6))コードの断片を挿入する際には、下記のように記述します。	~~~~{.cpp}	for(int i = 0; i < 16; i++) {		ofLog() << i;	}	~~~~画像は通常のMarkdown記法で記述します。	![Image Title](filename.png "alt text")## Markdownのためのテキストエディター別の方法として、bogofilesを使用しないでもローカルでHTMLのレンダリング結果を参照しながら編集できるエディターが使用可能です。* Mac OSX: [Mou](http://mouapp.com/)* Windows: [MarkdownPad](http://www.markdownpad.com/)* Linux: [Writr](http://antrix.net/pages/writr-markdown/), [ReText](http://sourceforge.net/p/retext/home/ReText/), & the [gedit-markdown](http://www.jpfleury.net/en/software/gedit-markdown.php) plugin※注：このサイトでは、Markdownの文法に機能を追加しています。ですので、エディターではコードハイライトのような特殊機能はエディターでは確認できません。こうした部分はサイトで確認しながら進めてください。