#class ofVideoPlayer


##Description

ofVidePlayer クラスは Windows と Mac の Quicktime または Linux の gstreamer によってムービーファイルをロードし、ムービーを再生して、ムービーのプロパティをコントロールして、フレーム毎のピクセルにアクセスするためのさまざまなコントロールを提供します。

<!--
The ofVideoPlayer class loads in a movie file via quicktime in windows and mac  or gstreamer in linux, and offers various controls to play the movie, control the properties of the movie, and to access the pixels of a given frame.
-->
Example:
~~~~{.cpp}
ofVideoPlayer myPlayer;
~~~~




##Methods



### ofVideoPlayer()

<!--
_syntax: ofVideoPlayer()_
_name: ofVideoPlayer_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void start()

<!--
_syntax: start()_
_name: start_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _

ムービーを再生し、ムービーが読み込まれて開始されているかの両方をチェックします。ロード済みだけども映像は開始されていない場合は、初期化済みか、再生完了後か、さもなくば再生中です。
<!--
Starts the movie, checking for whether the movie has been both loaded and if it has been started. If it has been loaded but not started the movie is initialized and then played, otherwise it is just played.
-->




<!----------------------------------------------------------------------------->

###void ~ofVideoPlayer()

<!--
_syntax: ~ofVideoPlayer()_
_name: ~ofVideoPlayer_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void createImgMemAndGWorld()

<!--
_syntax: createImgMemAndGWorld()_
_name: createImgMemAndGWorld_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool loadMovie(name)

<!--
_syntax: loadMovie(name)_
_name: loadMovie_
_returns: bool_
_returns_description: _
_parameters: string name_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Load a movie file (fileName) into that object. It will look for the movie file inside of the data/ folder. The movie does not automatically play once loaded.
-->
name に指定したパスのムービーファイルを読み込みます。data/ フォルダの中のムービーファイルを参照します。ムービーは読み込み後自動的には再生されません。

Example:
~~~~{.cpp}
ofVideoPlayer myPlayer;
myPlayer.loadMovie('myMovie.mov');
~~~~






<!----------------------------------------------------------------------------->

###void seek_lock()

<!--
_syntax: seek_lock()_
_name: seek_lock_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void closeMovie()

<!--
_syntax: closeMovie()_
_name: closeMovie_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

ムービーファイルを閉じて、メモリリソースを解放します。
<!--Closes the movie file and de-allocates resources.
-->

Example:
~~~~{.cpp}
ofVideoPlayer myPlayer;
myPlayer.loadMovie("myMovie.mov"); //ビデオリソースを読み込み
myPlayer.closeMovie(); //ビデオリソースを破棄する
~~~~






<!----------------------------------------------------------------------------->

###void seek_unlock()

<!--
_syntax: seek_unlock()_
_name: seek_unlock_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void close()

<!--
_syntax: close()_
_name: close_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Calls the closeMovie() function, which closes the movie file and de-allocates resources.-->

closeMovie() 関数をコールすれば、ムービーファイルを閉じて、メモリリソースを解放します。




<!----------------------------------------------------------------------------->

###void gstHandleMessage()

<!--
_syntax: gstHandleMessage()_
_name: gstHandleMessage_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void update()

<!--
_syntax: update()_
_name: update_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Calls the idleMovie() function. This function idles the movie player, so that the movie can play. If you don't call it, when the movie is playing then you may encounter problems, especially on windows machines. 
-->
idleMovie() 関数をコールしてください。この関数でムービープレイヤーを待機状態にすると、ムービーが再生可能になります。もしこれをコールしないと、ムービーはが再生されているとき、とりわけ Windows マシンで問題に遭遇するでしょう。




<!----------------------------------------------------------------------------->

###bool allocate()

<!--
_syntax: allocate()_
_name: allocate_
_returns: bool_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void idleMovie()

<!--
_syntax: idleMovie()_
_name: idleMovie_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
This function idles the movie player, so that the movie can play. If you don't call it, when the movie is playing then you may encouter problems, especially on winodws machines.
-->

この関数でムービープレイヤーを待機状態にすると、ムービーが再生可能になります。もしこれをコールしないと、ムービーが再生されているとき、とりわけ Windows マシンで問題に遭遇するでしょう。




<!----------------------------------------------------------------------------->

###void play()

<!--
_syntax: play()_
_name: play_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Plays the movie. If the movie has been stopped or paused it will the continue playback at the point it was stopped. 
-->

ムービーを再生します。ムービーがストップまたはポーズしているときは、停止している地点からプレイバックを再開します。




<!----------------------------------------------------------------------------->

###void stop()

<!--
_syntax: stop()_
_name: stop_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Stops the movie. 
-->

ムービーを停止します。




<!----------------------------------------------------------------------------->

###bool isFrameNew()

<!--
_syntax: isFrameNew()_
_name: isFrameNew_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--For example, if the pixels are new, you could then process them.-->
例えば、ピクセルが新しい場合、処理を行う事が出来ます。
~~~~{.cpp}

if (myMovie.isFrameNew()){
	;	// 何かする
}
~~~~






<!----------------------------------------------------------------------------->

###unsigned char * getPixels()

<!--
_syntax: getPixels()_
_name: getPixels_
_returns: unsigned char *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--For example, to get the red green and blue of the pixel (100,20):-->
ピクセル(100,20) の RGB を取得する例。
~~~~{.cpp}
unsigned char * pixels = myMovie.getPixels();
int widthOfLine = myMovie.width * w;  // 一行のピクセル数がどれだけあるか
int red 	= pixels[(20 * widthOfLine) + 100 * 3    ];
int green 	= pixels[(20 * widthOfLine) + 100 * 3 + 1];
int blue 	= pixels[(20 * widthOfLine) + 100 * 3 + 2];
~~~~






<!----------------------------------------------------------------------------->

###float getPosition()

<!--
_syntax: getPosition()_
_name: getPosition_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###float getSpeed()

<!--
_syntax: getSpeed()_
_name: getSpeed_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--note: 1 = normal speed, 0 = paused, -1 = backwards. -->

注：1 = ノーマル速度、0 = ポーズ、-1 = 巻き戻し




<!----------------------------------------------------------------------------->

###float getDuration()

<!--
_syntax: getDuration()_
_name: getDuration_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool getIsMovieDone()

<!--
_syntax: getIsMovieDone()_
_name: getIsMovieDone_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setPosition(pct)

<!--
_syntax: setPosition(pct)_
_name: setPosition_
_returns: void_
_returns_description: _
_parameters: float pct_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Sets the position of the playhead to a given percentage through the movie. Can be used to scrub through a movie. 
-->

ムービーを通してのパーセンテージを与えて再生位置を設定します。
ムービーのスクラブをするのに使う事が出来ます。




<!----------------------------------------------------------------------------->

###void setVolume(volume)

<!--
_syntax: setVolume(volume)_
_name: setVolume_
_returns: void_
_returns_description: _
_parameters: int volume_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Sets the volume of a movie - default = 0, silent -->

ムービーの音量を設定します。デフォルトは 0 で無音です。




<!----------------------------------------------------------------------------->

###void setLoopState(state)

<!--
_syntax: setLoopState(state)_
_name: setLoopState_
_returns: void_
_returns_description: _
_parameters: int state_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_description: _

<!--
Sets the looping state of the movie. Deafult behavior is to loop. There are three options:-->
ムービーのループ状態を設定します。デフォルトの動作はループするです。3 つのオプションがあります。
~~~~{.cpp}
OF_LOOP_NONE - ループしない、ムービーは最終フレームで停止する (逆再生をしている場合は最初のフレーム)
OF_LOOP_NORMAL - 通常再生 (最終フレームから最初のフレームへループする)
OF_LOOP_PALINDROME - 逆へ前へループする (訳注：通常再生と逆再生を繰り返す)
~~~~






<!----------------------------------------------------------------------------->

###void setSpeed(speed)

<!--
_syntax: setSpeed(speed)_
_name: setSpeed_
_returns: void_
_returns_description: _
_parameters: float speed_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Sets the speed of the movie that is playing. 1 = normal, 2 = 2x as fast, 0 = stopped, -1 = backwards, etc; -->

ムービー再生の速度を設定します。1 = 通常、2 = 倍速、0 = 停止、-1 = 逆再生




<!----------------------------------------------------------------------------->

###void setFrame(frame)

<!--
_syntax: setFrame(frame)_
_name: setFrame_
_returns: void_
_returns_description: _
_parameters: int frame_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Sets the current frame of the video. Should be used only if you know the bounds of the movie ( using totalNumberFrames() ) or store a location using getCurrentFrame();
-->

ビデオの現在のフレームを設定します。ムービーの長さ ( totalNumberFrames() を使う ) を知っているときか、getCurrentFrame() を使って位置を保存したいときに使うべきです。




<!----------------------------------------------------------------------------->

###void setUseTexture(bUse)

<!--
_syntax: setUseTexture(bUse)_
_name: setUseTexture_
_returns: void_
_returns_description: _
_parameters: bool bUse_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

このオブジェクトのなかのテクスチャの使用方法を設定します。
一般的には、ムービーをスクリーンに描画したいとき、テクスチャを使うのが必要不可欠ですが、さらによいパフォーマンスのためにメモリをセーブして、テクスチャーを使わないケースがあります。テクスチャの内部使用を不可にし、ムービーをこのように読み込む事ができます。


<!--Set the usage of texture inside this object. Typically, you will want to draw the movie on screen, and so it will be necessary to use a texture, but there may be cases where it helps to not use a texture in order to save memory or for better performance. To disable the internal use of the texture, you can load the movie like this:-->
~~~~{.cpp}

myMovie.setUseTexture(false);
myMovie.loadMovie("blah.mov");
~~~~






<!----------------------------------------------------------------------------->

###ofTexture getTextureReference()

<!--
_syntax: getTextureReference()_
_name: getTextureReference_
_returns: ofTexture_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Returns a reference to the videoPlayer's texture.-->

videoPlayer のテクスチャの参照を返します。




<!----------------------------------------------------------------------------->

###void draw(x, y, w, h)

<!--
_syntax: draw(x, y, w, h)_
_name: draw_
_returns: void_
_returns_description: _
_parameters: float x, float y, float w, float h_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _
<!--
Draws the texture of the movie player class at the position (x,y) with the given width (w) and height (h). 
-->
ムービープレイヤークラスに位置 (x,y) と幅 (w) と高さ (h) を与えてテクスチャを描画します。




<!----------------------------------------------------------------------------->

###void draw(x, y)

<!--
_syntax: draw(x, y)_
_name: draw_
_returns: void_
_returns_description: _
_parameters: float x, float y_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Draws the texture of the movie player class as the position (x,y) with the internal width and height of the loaded movie. 
-->
ムービープレイヤークラスに位置 (x,y) を与えて読み込み済みムービーの幅と高さでテクスチャを描画します。




<!----------------------------------------------------------------------------->

###void setAnchorPercent(xPct, yPct)

<!--
_syntax: setAnchorPercent(xPct, yPct)_
_name: setAnchorPercent_
_returns: void_
_returns_description: _
_parameters: float xPct, float yPct_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: True_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setAnchorPoint(x, y)

<!--
_syntax: setAnchorPoint(x, y)_
_name: setAnchorPoint_
_returns: void_
_returns_description: _
_parameters: int x, int y_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: True_
-->

_description: _







<!----------------------------------------------------------------------------->

###void resetAnchor()

<!--
_syntax: resetAnchor()_
_name: resetAnchor_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: True_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setPaused(bPause)

<!--
_syntax: setPaused(bPause)_
_name: setPaused_
_returns: void_
_returns_description: _
_parameters: bool bPause_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--
Sets the paused state of the movie. Use "true" to pause and false to unpause. 
-->
ムービーのポーズ状態を設定します。true にするとポーズされ、false にすると解除されます。




<!----------------------------------------------------------------------------->

###int getCurrentFrame()

<!--
_syntax: getCurrentFrame()_
_name: getCurrentFrame_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###int getTotalNumFrames()

<!--
_syntax: getTotalNumFrames()_
_name: getTotalNumFrames_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void firstFrame()

<!--
_syntax: firstFrame()_
_name: firstFrame_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Moves the playhead to the first frame of the movie. This can also be accomplished using setCurrentFrame(0).
-->
再生ヘッドをムービーの最初のフレームに移動します。これは setCurrentFrame(0) のショートカットメソッドとして使用する事が出来ます。




<!----------------------------------------------------------------------------->

###void nextFrame()

<!--
_syntax: nextFrame()_
_name: nextFrame_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Advances the playhead by one frame.-->

再生位置をひとつフレームを進めます。




<!----------------------------------------------------------------------------->

###void previousFrame()

<!--
_syntax: previousFrame()_
_name: previousFrame_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Reverses the playhead by one frame.-->

再生位置をひとつフレームを巻戻します。




<!----------------------------------------------------------------------------->

###float getHeight()

<!--
_syntax: getHeight()_
_name: getHeight_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###float getWidth()

<!--
_syntax: getWidth()_
_name: getWidth_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setPlayer(newPlayer)

<!--
_syntax: setPlayer(newPlayer)_
_name: setPlayer_
_returns: void_
_returns_description: _
_parameters: ofPtr< ofBaseVideoPlayer > newPlayer_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofPtr getPlayer()

<!--
_syntax: getPlayer()_
_name: getPlayer_
_returns: ofPtr_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setPixelFormat(pixelFormat)

<!--
_syntax: setPixelFormat(pixelFormat)_
_name: setPixelFormat_
_returns: void_
_returns_description: _
_parameters: ofPixelFormat pixelFormat_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofPixelsRef getPixelsRef()

<!--
_syntax: getPixelsRef()_
_name: getPixelsRef_
_returns: ofPixelsRef_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setLoopState(state)

<!--
_syntax: setLoopState(state)_
_name: setLoopState_
_returns: void_
_returns_description: _
_parameters: ofLoopType state_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###int getLoopState()

<!--
_syntax: getLoopState()_
_name: getLoopState_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void draw(&p)

<!--
_syntax: draw(&p)_
_name: draw_
_returns: void_
_returns_description: _
_parameters: const ofPoint &p_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void draw(&r)

<!--
_syntax: draw(&r)_
_name: draw_
_returns: void_
_returns_description: _
_parameters: const ofRectangle &r_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###void setAnchorPoint(x, y)

<!--
_syntax: setAnchorPoint(x, y)_
_name: setAnchorPoint_
_returns: void_
_returns_description: _
_parameters: float x, float y_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool isPaused()

<!--
_syntax: isPaused()_
_name: isPaused_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool isLoaded()

<!--
_syntax: isLoaded()_
_name: isLoaded_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool isPlaying()

<!--
_syntax: isPlaying()_
_name: isPlaying_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

##Variables



###int width

<!--
_name: width_
_type: int_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--Variable containing the width of the video.-->

ビデオの幅を表す変数です。




<!----------------------------------------------------------------------------->

###bool bStarted

<!--
_name: bStarted_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###int height

<!--
_name: height_
_type: int_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--Variable containing the height of the video.-->

ビデオの高さを表す変数です。




<!----------------------------------------------------------------------------->

###bool bPlaying

<!--
_name: bPlaying_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###float speed

<!--
_name: speed_
_type: float_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _
<!--
Contains the playback speed of the video. 1.0 is the normal speed. 2.0 is double the normal speed, -1 is backwards etc. 
-->

ビデオの再生速度です。1.0 は通常速度で、2.0 は 通常速度の倍で、-1 は巻き戻しなどです。



<!----------------------------------------------------------------------------->

###bool bPaused

<!--
_name: bPaused_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool bLoaded

<!--
_name: bLoaded_
_type: bool_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--A boolean that describes if the movie loaded properly. 
-->
ムービーが読み込まれているかどうかを表す論理値です。




<!----------------------------------------------------------------------------->

###bool bIsFrameNew

<!--
_name: bIsFrameNew_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###int nFrames

<!--
_name: nFrames_
_type: int_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _
<!--
Variable containing the number of frames of the video.-->

ビデオのフレーム数を表す変数です。




<!----------------------------------------------------------------------------->

###ofGstVideoData gstData

<!--
_name: gstData_
_type: ofGstVideoData_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###unsigned char * pixels

<!--
_name: pixels_
_type: unsigned char *_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _
<!--
Array of pixels that represents the current frame of live video. The data is stored as RGB in an array which is the size: width*height*3.
-->
起動中のビデオの現在のフレームに含まれるピクセルの配列です。データは RGB の配列で表されるため、その大きさは width*height*3 




<!----------------------------------------------------------------------------->

###bool bIsMovieDone

<!--
_name: bIsMovieDone_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool bHavePixelsChanged

<!--
_name: bHavePixelsChanged_
_type: bool_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--A boolean controlling if pixels have change.-->

ピクセルが変更されているかどうかの論理値です。




<!----------------------------------------------------------------------------->

###bool isStream

<!--
_name: isStream_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofTexture tex

<!--
_name: tex_
_type: ofTexture_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--ofTexture used by the video player class. -->

ビデオプレイヤークラスで使われている ofTexture です。




<!----------------------------------------------------------------------------->

###GstElement * gstPipeline

<!--
_name: gstPipeline_
_type: GstElement *_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool bUseTexture

<!--
_name: bUseTexture_
_type: bool_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _
<!--
bUseTexture enables and disables the use of ofTexture in our video player.
-->
bUseTexture はビデオプレイヤーで ofTexture を使用するかしないかを表します。




<!----------------------------------------------------------------------------->

###GstElement * gstSink

<!--
_name: gstSink_
_type: GstElement *_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool allocated

<!--
_name: allocated_
_type: bool_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _

<!--Boolean varible containing true if the texture has been already allocated inside our video player.
-->
テクスチャーがビデオプレイヤーの中で既にメモリを確保していた場合、true になります。




<!----------------------------------------------------------------------------->

###gint64 durationNanos

<!--
_name: durationNanos_
_type: gint64_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###int loopMode

<!--
_name: loopMode_
_type: int_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###bool posChangingPaused

<!--
_name: posChangingPaused_
_type: bool_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###pthread_mutex_t seek_mutex

<!--
_name: seek_mutex_
_type: pthread_mutex_t_
_access: protected_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofPtr player

<!--
_name: player_
_type: ofPtr_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofTexture playerTex

<!--
_name: playerTex_
_type: ofTexture_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofPixelFormat internalPixelFormat

<!--
_name: internalPixelFormat_
_type: ofPixelFormat_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

