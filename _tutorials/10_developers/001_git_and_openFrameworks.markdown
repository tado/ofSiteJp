---
date: 2012/02/23 19:52:00
title: gitとoFの導入
summary: openFrameworksの関連したgitの簡単なイントロダクション
author: Christoph Buchner
author_site: 
---

このチュートリアルではバージョン管理システム**Git**について、なぜコーディングにおいてそれを使うのか、そしてopenFrameworksと[github](www.github.com)での使い方について簡単に説明します。

Gitレポジトリの作り方、簡単なOFプロジェクトを始めてコードの変更を管理する方法を学びます。また、Gitを利用する上での一般的な知識についても学ぶことができるでしょう。

## Gitの基礎

### なぜバージョンを管理するのか

バージョン管理は履歴、変更、コードの差異を簡単に保管することができる、バックアップを手動でzipファイルに固めたりするのとは比較できないほど便利なツールです。

さらに、他の開発者と一緒に効率的な作業をする上で欠かすことはできない有用なツールです。

### Gitの基本的な情報

[Git](http://ja.wikipedia.org/wiki/Git)はopenFrameworksとgithubも使用しているバージョン管理システムで、これから私達が使おうとしているものです。

[分散型バージョン管理システム	](http://ja.wikipedia.org/wiki/%E5%88%86%E6%95%A3%E5%9E%8B%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0)とも呼ばれ、中心的なサーバー/レポジトリを作らなくても良い種類のバージョン管理システムです。

Gitを今まで使ったことがなければ、このチュートリアルを続ける前にいくつかの資料を読んでください。*Gitの基本的な使い方*が解説されています。Gitの基本について理解したらOFプロジェクトでGitを使う上で必要な知識を学んでいきます。

[gitref.org](http://gitref.org/) はGitの本質的な事柄についてのリファレンスです。30分程度で読み終えることができ、基本的なことが理解できるようになります。

[The github help page](http://help.github.com/) はGitとGithubの基本的な使い方、コンセプト、用語について解説しています。Gitを使う上でよくでてくる事を理解するのに最初に読むと良いでしょう。

## GitをOFプロジェクトで利用する

あなたのプロジェクトでGitを使おうと思っているなら、**なるべく早く**、理想としてはコーディングを始める前に使いましょう。

以下は基本的な使い方とは別に、先述したリンクで解説されている注意するべき点です。
	
### 適切ではないファイルは無視する
**正しいファイルだけをGitに管理させる**ことが重要です。自動で生成されるファイルや、一時ファイル、バイナリ、ユーザ特有のファイルは、レポジトリ内のコードから生成できたり、特定のユーザだけに必要なものなのでレポジトリに入れるべきではありません。

Gitでは`.gitignore`(`.`が付いていることに注意)を使って無視したいファイルのパターンを指定することができます。
プロジェクトジェネレーターを使うと**予め用意された`.gitignore`ファイル**がプロジェクト内にあり、典型的なオプションが書かれています。
また、[ここ](https://github.com/github/gitignore)から様々な場面で利用できる`.gitignore`ファイルのコレクションを見つけることもできます。	

注意しないといけないことは、既にレポジトリに加わっているファイルは無視されないということです。
また、一旦レポジトリにファイルを加えると、履歴の一部に保管されてしまいます。間違って加えてしまったファイルを除くには複雑な操作が必要になるのでレポジトリの容量を不必要に増やしてしまいます。(特にオンライン上のレポジトリにプッシュしてしまった後は)

これらの理由により、ファイルをレポジトリに加える際には慎重に行うことが**とても重要です**。

### Git GUI
コマンドラインを使いたくない場合には、いくつかのGit GUIクライアントがあります。
Stackoverflowでは[Linux](http://stackoverflow.com/q/2141611/599884), [MacOS](http://stackoverflow.com/questions/455698/best-visual-client-for-git-on-mac-os-x) and [Windows](http://stackoverflow.com/questions/157476/what-guis-exist-for-git-on-windows)で利用できるクライアントが紹介されています。

### Remotes: originとupstream
[Remotes](http://gitref.org/remotes/)はあなたのレポジトリとやり取りを行うリモート上のレポジトリを表すものです。Remotesを指定することで、毎回URLを打つ手間を省くことができます。

自分のレポジトリ(例えばgithub上にあるレポジトリ)は`origin`とするのが慣例です。Githubから`git clone`をすると自動的に設定されます。さらに、あなたのレポジトリが他のレポジトリからフォークしたものの場合、例えばOFのコピーを持っている場合、そのレポジトリは通常`upstream`となります。

### SVNからGitへ移行する
SVNを利用した経験があり、Gitをこれから利用していこうとしている場合は、混乱してしまうかもしれません。Webにはいくつかの資料がありますが、[このページ](http://git.or.cz/course/svn.html)では、各コマンドの対応を確認することができます。
また、GitではSVNほどコミットに神経をとがらせる必要はありません。コミットを行なってもローカルのレポジトリに保存されるだけだからです。Gitでは**「迅速に頻繁にコミットする」**というのがキーになります。

他にも、Gitでのあなたのレポジトリは中央のメインレポジトリとは、より分離されているという違いがあります。

また、マージとブランチはGitの中心的な機能なのでよく利用します。

### Githubに新しいブランチをプッシュする
ブランチを切って新しい作業を行い、それをGithubのレポジトリにプッシュしたい場合、以下のコマンドを実行します `git push origin new-work`
	
### リモート上のブランチのコピーをローカルに作る	
ローカルのレポジトリにはまだ存在しないブランチを取り出したい場合、以下のコマンドを実行します。`git fetch origin` `git checkout --track origin/interesting-branch`

2つ目のコマンドは`interesting-branch`という`origin/interesting-branch`に対応するローカルブランチを作り、Gitにリモートのブランチからpushとpullを簡単に行えるようにしてくれるようにしています。

### リモート上のブランチを削除する
OFへバグを修正したプルリクエストを送りたい場合の様に、あるブランチでの作業を行って、もうそのブランチは必要がなくなった場合（例えばプルリクエストがマージされた場合など）には以下のコマンドでリモート上のブランチを削除することができます。 `git push origin :old-branch`

### OFの開発に参加するためのワークフロー
[このドキュメント](https://github.com/openframeworks/openFrameworks/wiki/openFrameworks-git-workflow)はOFの開発に関わる際に必要なワークフローについて説明しています。openFrameworksの開発に貢献する場合には、このドキュメントに従って下さい。また、*大規模なプロジェクトを管理する際のヒント*としても有用です。

## よくある問題への対処

Gitを使っていればきっと問題にぶつかることもあるでしょう。以下では、問題が起こる状況とその解決方法です。

### 変更をコミットしていないときにpullしてしまう
まだ変更をコミットしていない状態で、リモートから現在編集しているブランチを更新しようとしてpullを行うと、gitはこれを拒否します。

このような場合には`git stash`を使います。

この[機能](http://gitready.com/beginner/2009/01/10/stashing-your-changes.html)は、他の作業を行なっている間に一時的に変更を保存してくれるクリップボードのような機能です。
[オプション](http://linux.die.net/man/1/git-stash)もあります。

通常は、現在の変更を保管場所に移す`git stash`と、保管場所から最新の変更を取り出す`git stash pop`だけで事足ります。

以下の様な作業になります。

	<変更作業>		
	git stash
	git pull upstream develop
	git stash pop
	<変更作業の続き>

## Gitの参考リンク

Gitについてより深く学びたい場合や、このチュートリアルでは触れなかった問題に遭遇した場合には以下のリソースを確認してみて下さい。

[The oF git cheat sheet](http://piratepad.net/ofgitcheatsheet): **oF開発者がまとめた役立つgitコマンド**のリスト

[Pro Git](http://progit.org/): 書籍、またはHTML形式で読むことができます。Gitの基礎から応用までカバーされています。

[The git man pages](http://www.kernel.org/pub/software/scm/git/docs/): Gitのマニュアルです。コマンドラインからも確認することができますが、オンラインの方が見やすいでしょう。コマンドラインでのGitの使い方が最小限に説明されています。

もしGitで何かを行いたいときに、その方法がわからない場合には[Stack overflow](http://www.stackoverflow.com)で質問してみるのが良い方法です。大抵の場合は誰かが既にあなたと同じ疑問を持っています。例えば[How do I make git ignore mode changes?](http://stackoverflow.com/search?q=How+do+I+make+git+ignore+mode+changes)です。

また、 [git for the lazy](http://spheredev.org/wiki/Git_for_the_lazy)や[Git Immersion](http://library.edgecase.com/git_immersion/index.html)のように、多くの記事やWikiページ、チュートリアル、ブログポストもあります。
