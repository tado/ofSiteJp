<%inherit file="/_templates/markdown.mako" />

<!--
ios setup
===========
-->


iOS セットアップ
===========

<!--
There are a number of tutorials about ofxiPhone and development. We've tried to make it as easy as possible to get your code up and running on the iPhone as quickly as possible, but there's a ton of information to cover. If you need more help after following this tutorial, be sure and check out these others, or check out the iPhone section of the openFrameoworks forum.
-->


ofxiPhoneやその開発については、数多くのチュートリアルがあります。私たちはあなたがコードを作りiPhone上でできるだけ手早く実行できるように、チュートリアルを可能な限り簡易なものにするよう努めてきましたが、網羅しなくてはならない情報が大変多いのです。もしあなたがこのチュートリアルより多くの助けが必要ならば、他のチュートリアルを見るか、openFrameworksフォーラムのiPhoneセクションをチェックするようにしてください。

- [Memo Akten's simple openFrameworks application on an iPhone tutorial][0]

- [Memo Akten's tutorial for getting started with ofxiPhone][1]

- [Zach Gage's comprehensive overview of ofxiPhone][2]

- [Jeff Crouse's oF-iPhone tutorial][3]

/////////////////////////////////////////
<!--
**ofxiPhone "quick"start tutorial**
-->


**ofxiPhone 「クイック」スタート　チュートリアル**
<!--
Setting up your iPhone with xcode and Apple can either be really easy, or a total nightmare. Apple has made a lot of changes lately to make the process smoother. Hopefully this document will help ease the process further. I should note that apple changes and updates this process ALL THE TIME, so this might not be 100% accurate at your time of reading, but hopefully it will be close enough. If not, there's always the forum to look to for help, or google.
-->

XcodeとアップルのマシンであなたのiPhoneをセットアップすることは、とても簡単なことになるのか、完全な悪夢になるかのどちらかです。アップルは最近になって手順をスムーズにするために数多くの変更を行なってきました。このドキュメントは、うまくいけば、手順をさらに簡単にする助けになるでしょう。アップルはこの手順を「いつでも」変更して更新するかもしれないと言っておいたほうがよいでしょう、ですからあなたが読んでいる時に100%正確ではないかもしれませんが、うまくいけば必要十分には当たっているでしょう。そうでなければ、いつでも助けになるフォーラムがありますし、googleがあります。

<!--
The first bit of this tutorial is for if you haven't yet gotten your provisioning profile from apple set up. If you have gotten it all set up, click [here][4] to skip that part.
-->

まず最初のちょっとしたチュートリアルは、あなたがまだアップルからプロビジョニングプロファイルを取得していない場合のためのものです。すでにセットアップが出来ているならば、 [ここ][4] をクリックしてこのパートを飛ばしてください。

<!--
First go to developer.apple.com, create an account if you do not already have one, and then apply to become an iPhone lisenced developer.
-->

まず　developer.apple.com　に行き、まだアカウントを持っていなければ作成し、ライセンスを受けたiPhone開発者になる申し込みをします。

<!--
After paying the $99 fee, you should recieve an email with an activation code. If you click on the code in the email, it should take you to this page:
-->

$99の料金を支払った後、アクティベーションコードの入ったメールを受け取ります。メールに記載されているコードをクリックすれば、このページにやってきます。

![1](1.jpg)
<!--
Your code will probably have been automatically put into the text box, but if not, copy/paste it in, and hit Activate.
-->

おそらくあなたのアクティベーションコードは自動的にテキストボックスに入っていますが、もし入っていなければ、コピー／ペーストして、Activateをクリックします。

<!--
The next time you return to the developer.apple.com page, it will look like this. Click on the iPhone Developer Program Portal link in the sidebar
-->

次に　developer.apple.com　のページに戻ってきたら、このように見えているでしょう。サイドバーにあるiPhone Developer Program Portalのリンクをクリックします。


![2](2.jpg)
<!--
This will bring you to the provisioning profile section of the website. This is where you will set up your various provisioning profiles. Provisioning profiles allow you to digitally sign your code, which will allow you to put it on devices of your choosing, or release the program in the app store or via ad hoc distrobution. For now, we are just going to cover the steps involved with getting the code onto your device (and leave the selling your app steps for another time).
-->

するとウェブサイトのプロビジョニングプロファイルのセクションにやってきます。ここであなたの有効なプロビジョニングプロファイルを準備します。プロビジョニングプロファイルは、あなたの選択したデバイスにデジタル署名を行ったり、プログラムをapp storeで、またはアドホックな配布によってリリースできるようにするものです。ひとまず、コードをあなたのデバイスに取得するための手順を説明します（あなたのアプリを販売するステップについての説明は別の機会にします）。

<!--
Click on the Launch Assistant button to start the provisioning assistant
-->

Launch Assistantボタンをクリックして、プロビジョニングアシスタントを開始します。

![3](3.jpg)
<!--
read the information and continue
-->

内容を読んで、continueをクリックします。

![4](4.jpg)
<!--
Type in the name of this App ID description. This is purely for your reference in identifying the profile, so you can call it whatever you want.
-->

App IDの名前を入力します。この名前は単にあなたがプロファイルを特定するために参照するものですから、あなたの好きなようにつけることができます。

![5](5.jpg)
<!--
Next you will have to enter the information for your testing device (your iPhone or iPod Touch that you will install your apps on.) It is possible to register multiple devices later, but Apple asks you to register one now. For the description, you can type whatever you want. I recomend just typing in the name of the phone. The Device ID number is available from xcode via the instructions under the device ID box. Another way to get to this information is to plug your device into iTunes and click on the 'serial number' field on the summary page. This will show the UDID\#, but it is not a great way to do it as you won't be able to copy/paste the number.
-->

次にテストするデバイスの情報を入力する必要があります（あなたのアプリをインストールするiPhoneかiPod Touch）。後から複数のデバイスを登録することができますが、まずここで１つ登録することを求められます。説明の欄には好きなことをなんでも入力できます。その電話の名前を入力することをお勧めします。デバイスIDはXcodeのデバイスIDについての説明欄の下にあります。デバイスIDを知る他の方法はあなたのデバイスをiTunesに差し込み、概要ページにある'serial number'の場所をクリックします。これでUDID\#が表示されますが、番号をコピー／ペーストすることができないので、良い方法ではありません。

![6](6.jpg)
<!--
if you do get the device ID through xcode, this is where it is and what the organizer window looks like:
-->

デバイスIDをXcodeから取得するならば、オーガナイザーウィンドウのこの様に見えているところがそうです：

![7](7.jpg)
<!--
Next you will have to generate a certificate signing request. This part can get a little hairy
-->

次はcertificate signingの要求を生成しなくてはなりません。ここはちょっと面倒です。

![8](8.jpg)
<!--
First you will have to launch the Keychain Access application on your computer. It's located here:
-->

まずキーチェーンアクセスを起動します。ここにあります。

![9](9.jpg)


<!--
Then go to the Keychain Access / Certificate Assistant / Request a Certificate from a Certificate Authority menu item.

そして、キーチェーンアクセス / 証明書アシスタント / 証明局に証明書を要求 を選択します。
-->

そして、Keychain Access / Certificate Assistant / Request a Certificate Authority　を選択します。

![10](10.jpg)

![11](11.jpg)

<!--
Make sure you click on the 'saved to disk' bubble, so that you don't have to enter a CA Email Address.
-->


'saved to disk'ボタンの選択を確認し、CAメールアドレスの入力を不要にします。

![12](12.jpg)

<!--
Fill out the rest of the information, hit continue, and save the certificate somewhere on your computer that you will remember. Then, it's back to the the provisioning assistant.
-->


残りの内容を入力し終えたら、continueをクリックして、コンピューター上の覚えやすいところに証明書を保存してください。それからプロビジョニングアシスタントに戻ります。

![13](13.jpg)

<!--
Click the browse button and find the certificate you just saved. After that is successful, you will have to name your provisioning profile. Again, you can name it anything. I recommend naming it \[your name\] dev. Since this will be your development profile. Hit Generate when you're done.
-->


ブラウズボタンをクリックして、今保存したばかりの証明書を探します。成功したら、プロビジョニングプロファイルに名前をつける必要があります。ここでも、どのような名前でもつけることができます。\[自分の名前\] dev と名前をつけるのをお勧めします。これがあなたの開発プロファイルになります。完了したら Generateをクリックしてください。

![14](14.jpg)

<!--
Download the profile when promted. And then double click on it
-->


プロファイルが表示されたら、ダウンロードします。ダウンロードが完了したら、それをダブルクリックします。

![15](15.jpg)

<!--
Double clicking on your profile should open up Xcode and add it to your device, if it doesn't open xcode, drag the provision to xcode. If it doesn't add it to your device, it's possible you mistyped your device's UDID. This can be fixed after you've finished going through this tutorial by going back to your program portal, going to the 'devices' tab, and changing the id in there, and then re-downloading your profile in the distribution tab.
-->

ダブルクリックするとXcodeが起動してプロファイルをあなたのデバイスに追加します、もしXcodeが開かなければ、Xcodeのプロビジョニングのところまでドラッグします。もし、あなたのデバイスに追加が行われなければ、あなたがデバイスUDIDをミスタイプしている可能性があります。それはこのチュートリアルを中断してプログラムポータルまで戻ってから'devices'タブへ行き、そこでIDを変更して、distributionタブでprofileを再ダウンロードすることで直すことができます。

![16](16.jpg)

<!--
And now again, back to the provisioning assistant! Hit continue.
-->


ここでもう一度、プロビジョニングアシスタントに戻ります！continueをクリックします。

![17](17.jpg)

<!--
Download your Development certificate, and save it somewhere memorable.
-->

Development certificateをダウンロードして、覚えやすいところに保存します。

![18](18.jpg)

<!--
Hit continue a bunch more times until the Assistant is over. You're almost there!
-->


continueをアシスタントが終了するまでクリックします。もうすぐです！

![19](19.jpg)

<!--
Hit 'Done'. You should now be in the program portal. Click on the 'App ID's' tab in the left sidebar
-->

'Done'をクリックします。今あなたはプログラムポータルの中にいるはずです。左のサイドバーある 'App ID's'タブをクリックします。

![20](20.jpg)

<!--
Scroll down until you see this box:
-->


この欄が見えるまでスクロールします：

![21](21.jpg)

<!--
Copy the random letters and numbers below description. (don't copy the .\* part, just the letters and numbers, this will be important in a few more steps).
-->


Descriptionの下にあるランダムな英数字をコピーします。（*の部分はコピーしないでください、文字と数字だけです、これはあとのステップで重要になります）

<!--  
Now, download the iPhone distrobution from [openframeworks.cc/download][5]. Navigate to one of the example applcations. I picked the Touch/Accel example
-->


さあ、iPhone開発ディストリビューションを[openframeworks.cc/download][5]からダウンロードしましょう。

![22](22.jpg)

<!--
open it up
-->


開きます。

![23](23.jpg)

<!--
Click on the arrow next to 'Targets', and then double click on 'iPhone oF'
-->


「ターゲット」の横にある矢印をクリックして、'iPhone oF'をダブルクリックします。

![24](24.jpg)

<!--
The window that opens should look like this. Click on 'Build' from the choices up top
-->


このようなウィンドウが開いて見えるはずです。上にある「Build」をクリックします。


![25](25.jpg)

<!--
In this window, click on the Configuration, and select All Configurations.
-->


このウィンドウでは、Configurationをクリックして、All Configurationsを選びます。

![26](26.jpg)

<!--
Then go down to where the Code Signing Identity line is. Across from Any iPhone OS Device, click on where it says iPhone Developer: Mehmet Akten
-->


Code Signing Identityの行まで行きます。Any iPhone OS Deviceの、iPhone Developer: Mehmet Akten というところをクリックします。

![27](27.jpg)

<!--
Select 'iPhone Developer' from the automatic profile selectors. This should make the current automatic selection be your profile.
-->


'iPhone Developer' をAutomatic Profile Selectorsの中から選びます。こうしておくと現在のあなたのプロファイルを自動で選択してくれます。


![28](28.jpg)

<!--
At this point you might also want to rename the project. You might especially want to rename it if there are spaces in the title. Since we released ofxiPhone, Apple changed their rules about spaces in app titles (you cannot have them), and compiling without removing the space will produce an error. (Changing the name from 'oF iPhone' to 'oFiPhone' will do for now).
-->

ここでプロジェクトの名前を変更したくなるかもしれません。とくにタイトルに空白を含んだ名前に変たいと思うかもしれません。私達がofxiPhoneをリリースしてから、アップルは空白文字のアプリタイトルへの使用について変更しました（使うことができません）のでスペースを削除せずにコンパイルをするとエラーが発生します。（今は'oF iPhone'から'oFiPhone'へ名前を変更します）


![32](32.jpg)

<!--
Close that window, and click the triangle next to the data folder. Double click on the info.plist file.
-->

ウィンドウをとじて、データフォルダーの横の三角アイコンをクリックします。info.plistファイルをダブルクリックします。

![29](29.jpg)

<!--
Replace the part that says 'com.msavisuals' with the random numbers and letters you copied from the program portal a billion steps ago.
-->

'com.msavisuals'と書かれているところを、ずっと前の手順でプログラムポータルからコピーしたランダムな数字と文字に置き換えます。

![30](30.jpg)

<!--
It looked like this if you don't remember:
-->

あなたが思い出せないとしたら、それはこのように見えていたのです。

![21](21.jpg)

![31](31.jpg)

<!--
Once that's in, close and save the plist file, and hit Compile. Hopefully everything should just work! If you are on snow leopard with the new sdk and we haven't updated the examples yet you may need to change your base SDK to 3.0 so that it's not missing. This can be done in the target settings. Also, you will have to click on where it says 'device -- 2.2 | debug' in the screenshot above, and change that to Device -- 3.0 | Debug.
-->

ここまでできたら、保存してplistファイルを閉じます、そしてコンパイルを実行します。上手く行けば、動くはずです！あなたがSnow Leopardで新しいSDKを使っていて、私たちがまだサンプルを更新してなければbase SDKを発見できるようにするために設定を3.0へと変更する必要があるかもしれません。これはターゲット設定で行います。また上のスクリーンショットのように'device -- 2.2 | debug'となっている箇所をクリックして、Device -- 3.0 | Debug　に変える必要があります。


<!--
If everything works properly, xcode will ask to codesign from your keychain. Hit 'Always Allow'.
-->


すべてが上手くいけば、Xcodeはキーチェーンからcodesignを使用することを要求します。
'Always Allow'をクリックしてください。

![33](33.jpg)

<!--See... Not so bad... Now go make something awesome!-->

どうでしょうか、悪くないですね、さあ素晴らしい何かを作ってください！

[0]: http://www.memo.tv/openframeworks_on_iphone_sample_1
[1]: http://www.memo.tv/ofxiphone
[2]: http://wiki.openframeworks.cc/index.php?title=OfxiPhone_comprehensive_guide
[3]: http://www.jeffcrouse.info/uncategorized/openframeworks-on-iphone/
[4]: http://personal-editor.com/#skipProvisioning
[5]: http://www.openframeworks.cc/download


