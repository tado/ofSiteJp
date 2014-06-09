#class ofSoundPlayer


##Description

<!--The ofSoundPlayer class wraps one of several underlying audio utility libraries, depending on your OS and your configuration that can be Fmod, Quicktime, or OpenAL. The ofSoundPlayer is primarily to allow you to load sound files and control and manipulate their playback and properties, if you want more low level access to sound data and to your sound card then you should take a look at the ofSoundStream class. -->

ofSoundPlayer クラスは OS や設定に依存する部分を Fmod や Quicktime、OpenAL など幾つかのオーディオユーティリティーライブラリでラップしています。ofSoundPlayer は主にサウンドファイルのロードや操作、プレイバックや値の取得が提供されます。もしサウンドデータやサウンドカードによりローレベルでアクセスしたい場合は、そのときは ofSoundStream クラスを参照するとよいでしょう。




##Methods



### ofSoundPlayer()

<!--
_syntax: ofSoundPlayer()_
_name: ofSoundPlayer_
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

<!--Creates the ofSoundPlayer instance and initializes the underlying properties in the underlying engine.-->

ofSoundPlayer インスタンスを生成して、基本エンジンのプロパティをイニシャライズします。




<!----------------------------------------------------------------------------->

###void ~ofSoundPlayer()

<!--
_syntax: ~ofSoundPlayer()_
_name: ~ofSoundPlayer_
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

###void loadSound(fileName, stream)

<!--
_syntax: loadSound(fileName, stream)_
_name: loadSound_
_returns: void_
_returns_description: _
_parameters: string fileName, bool stream_
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

<!--Loads a sound file given by fileName. Sound files can be in .wav, .aif, .mp3, .mp2, .ogg or .raw format. The program will look for the file relative to the data/ folder. If you set the optional 'bool stream' argument to true the file will be streamed from disk instead of being completely loaded into memory. It makes a lot of sense to stream files if you are dynamically loading large sound files into your program, which would normally cause the program to freeze for a short time as the whole sound is read into memory. -->

fileName で指定したサウンドファイルをロードします。サウンドファイルは .wav, .aif, .mp3, mp2, .ogg, .raw フォーマットが使えます。オプションの 'bool stream' 引数に true をセットすると、メモリに完全にロードしてからではなく、ディスクからストリームされるようになります。一般的にはダイナミックに大きなサウンドファイル全体をメモリに読み込むと少しの時間プログラムがフリーズする原因になるので、ファイルをストリームするのは大変有効です。

Examples:

<!--Load a Sound-->
サウンドをロードする
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.loadSound("beat.mp3");
~~~~


<!--Load a Sound with Folder Path-->
フォルダパスを指定してサウンドをロードする
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.loadSound("sounds/beat.mp3");
~~~~




<!----------------------------------------------------------------------------->

###void unloadSound()

<!--
_syntax: unloadSound()_
_name: unloadSound_
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

<!--Stops and unloads the current sound.-->

現在のサウンドを停止してアンロードします。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.unloadSound(); //Stops sound from playing, unloads "beat.mp3"
~~~~






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

<!--Plays the sound. If setMultiPlay() has been set to true each play() command will spawn a new copy of the sound on a new channel, letting the existing sounds continue until they are finished. If setMultiPlay() is set to false it will restart the playback of the song.-->

サウンドを再生します。setMultiPlay() が true にセットされていると、各 play() コマンドでは新しいサウンドチャンネルにコピーされ、それらが終了するまで既存のサウンドは継続して残しておかれます。setMultiPlayer() が false にセットされている場合は、曲の再生はリスタートされます。

Examples:

Normal Playback:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play(); //Plays sound
mySound.play(); //Restarts and plays sound
~~~~


Multiplay:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.setMultiPlay(true);
mySound.load("beat.mp3");
mySound.play(); //Plays sound
mySound.play(); // 新しいサウンドチャンネルにコピーされ、現在再生中の音に重なって再生されます
~~~~





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

<!--Stops the sound currently playing. -->

現在再生しているサウンドを停止します。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play(); //Begins playback of sound
mySound.stop(); //Ends playback, stops audio
~~~~



<!----------------------------------------------------------------------------->

###void setVolume(vol)

<!--
_syntax: setVolume(vol)_
_name: setVolume_
_returns: void_
_returns_description: _
_parameters: float vol_
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

<!--Sets the volume (vol) of the sound. 0.0 - 1.0 range. 0.0 is silent and 1.0 is full volume. -->

サウンドの音量 (vol) を設定します。0.0 - 1.0 の範囲です。0.0 は無音で 1.0 がフルボリュームです。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.setVolume(0.1f); //Sets volume at 10% of maximum
~~~~




<!----------------------------------------------------------------------------->

###void setPan(vol)

<!--
_syntax: setPan(vol)_
_name: setPan_
_returns: void_
_returns_description: _
_parameters: float vol_
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

<!--Sets the pan position (pct) of the sound. 0.0 - 1.0 range. 0.5 is center pan, 0.0 is full left pan and 1.0 is full right pan. 
-->
サウンドのパン位置を設定します。0.0 - 1.0 の範囲です。 0.5 がセンター位置で、0.0 が完全に左位置、1.0 が完全に右位置にパンを振った状態になります。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.pan(0.2f); //Pans to the left
mySound.pan(0.8f); //Pans to the right
mySound.pan(0.5f); //Back to center
~~~~






<!----------------------------------------------------------------------------->

###void setSpeed(spd)

<!--
_syntax: setSpeed(spd)_
_name: setSpeed_
_returns: void_
_returns_description: _
_parameters: float spd_
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

<!--Sets the playback speed (spd) of the sound. 1.0 is the normal speed. 2.0 is double the normal speed etc. -->

サウンドの再生速度 (spd) を設定します。1.0 が通常速度で、2.0 がノーマル速度の倍です。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.loadSound("beat.mp3");
mySound.play();
mySound.setSpeed(2.0f); //Chipmunk Voice
mySound.setSpeed(0.2f); //Isaac Hayes on Muscle Relaxers
mySound.setSpeed(1.0f); //Normal again
~~~~




<!----------------------------------------------------------------------------->

###void setPaused(bP)

<!--
_syntax: setPaused(bP)_
_name: setPaused_
_returns: void_
_returns_description: _
_parameters: bool bP_
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

<!--Pauses and un-pauses the playback of the sound. -->

サウンドの再生を一時停止／再開します。

Example
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.setPaused(true); //Sound is paused
mySound.setPaused(false); //Sound is unpaused, playback continues
~~~~





<!----------------------------------------------------------------------------->

###void setLoop(bLp)

<!--
_syntax: setLoop(bLp)_
_name: setLoop_
_returns: void_
_returns_description: _
_parameters: bool bLp_
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

<!--Loops the sound if set to true. Does not loop the sound if set to false. Default is false.-->

true を設定すると、サウンドをループさせます。false に設定すると、サウンドはループしません。デフォルトは false です。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.setLoop(true); //Sound will loop
mySound.play();
~~~~





<!----------------------------------------------------------------------------->

###void setMultiPlay(bMp)

<!--
_syntax: setMultiPlay(bMp)_
_name: setMultiPlay_
_returns: void_
_returns_description: _
_parameters: bool bMp_
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

<!--Allows a sound to be played multiple times at once. When set to true the play() function will start playing the sound on a new channel, letting the old channels continue until they are done playing. When set to false the play() function will stop the channel before playing the sound.-->

サウンドが複数回再生することができるよう許可します。true に設定しているとき、 play() 関数は新しいサウンドチャンネルでサウンドが再生され、それらが再生完了するまでは古いチャンネルは継続して残されます。false に設定しているとき、play() 関数は以前に再生されていた音は停止されます。

Example:

~~~~{.cpp}
ofSoundPlayer mySound;
mySound.setMultiPlay(true);
mySound.load("beat.mp3");
mySound.play(); //Plays sound
mySound.play(); //Adds new copy of sound to channel and plays over currently playing sound
~~~~





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

<!--Sets the playback-head to the position (pct) specified. 0.0 - 1.0 range. 0.0 is the beginning of the sound file and 1.0 is the end.-->

任意の再生ヘッド位置 (pct) を設定します。0.0 - 1.0 の範囲です。0.0 はサウンドファイルの始まりで、1.0 はその終わりです。

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.setPosition(0.5f); //Moves the playhead to halfway through the sound
mySound.setPosition(0.0f); //Moves the playhead back to the beginning of the sound
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

<!--0.0 is the beginning of the sound file and 1.0 is the end.-->

0.0 はサウンドファイルの始まりで、1.0 は終わりです。

Example:

~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.getPosition(); //Returns the current position as a percent 0.0-1.0
~~~~
<!--Returns the current position of the playback-head in the sound. 0.0 - 1.0
range.-->

現在のサウンドの再生ヘッド位置を返します。0.0 - 1.0 の範囲です。





<!----------------------------------------------------------------------------->

###bool getIsPlaying()

<!--
_syntax: getIsPlaying()_
_name: getIsPlaying_
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

Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.getIsPlaying(); //Returns false
mySound.play();
mySound.getIsPlaying(); //Returns true
~~~~
<!--Returns true if sound is currently playing, otherwise returns false.-->

現在再生中ならば true、そうでなければ false を返します。



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


Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.getSpeed(); //Returns 1.0
mySound.setSpeed(2.0f);
mySound.getSpeed(); //Returns 2.0f
~~~~





<!----------------------------------------------------------------------------->

###float getPan()

<!--
_syntax: getPan()_
_name: getPan_
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

<!--0.5 is center pan, 0.0 is full left pan and 1.0 is full right pan. Default is 0.5-->

0.5 はセンター位置で、0.0 は完全に左位置、1.0 は完全に右位置にパンが振っている状態です。デフォルトは 0.5 です。



Example:
~~~~{.cpp}
ofSoundPlayer mySound;
mySound.load("beat.mp3");
mySound.play();
mySound.getPan();//Returns 0.5
mySound.setPan(0.2f);
mySound.getPan();//Returns 0.2
~~~~
<!--Returns the pan position of the sound. 0.0 - 1.0 range.-->

サウンドのパン位置を返します。0.0 - 1.0 の範囲です。





<!----------------------------------------------------------------------------->

###void setPlayer(newPlayer)

<!--
_syntax: setPlayer(newPlayer)_
_name: setPlayer_
_returns: void_
_returns_description: _
_parameters: ofPtr< ofBaseSoundPlayer > newPlayer_
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

<!--
ofSoundPlayer actually wraps a dynamic instance of a sound player, that is, it contains an interface to the sound engine being used to load and playback sounds. If you want to set the interface that your system uses, you can pass an ofPtr to an ofSoundPlayer into the ofSoundPlayer and have the ofSoundPlayer manipulate that one instead.
-->

ofSoundPlayer は実はサウンドプレイヤーのインスタンスを動的にラップでき、サウンドエンジンがサウンドを読み込み再生するのに使う事ができるインターフェースを含んでいます。お使いのシステムが使っているものにインターフェースを設定したい場合は、ofSoundPlayer の ofPtr を of SoundPlayer インスタンスに渡せば、ofSoundPlayer として操作できます。

~~~~{.cpp}
ofPtr<ofBaseSoundPlayer> soundPtr(new ofOpenALSoundPlayer());
player.setPlayer(soundPtr);
~~~~



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

<!--ofSoundPlayer actually wraps a dynamic instance of a specific sound player for a specific engine, that is, it contains an interface to the sound engine being used to load and playback sounds. This allows you access to the pointer that contains the specific interface.-->

ofSoundPlayer は実は、任意のエンジンのために任意のサウンドプレイヤーのダイナミックなインスタンスをラップする事ができ、サウンドエンジンがサウンドを読み込み再生するに使う事が出来るインターフェースを含めます。これは任意のインターフェースをもったポインタでアクセスする事が出来ます。



<!----------------------------------------------------------------------------->

###void setPositionMS(ms)

<!--
_syntax: setPositionMS(ms)_
_name: setPositionMS_
_returns: void_
_returns_description: _
_parameters: int ms_
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


<!--
This sets the position of the sound currently playing in milliseconds.-->

再生中のサウンド位置をミリ秒で設定できます。



<!----------------------------------------------------------------------------->

###int getPositionMS()

<!--
_syntax: getPositionMS()_
_name: getPositionMS_
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

<!--
This returns the milliseconds of the sound or file currently playing in milliseconds.
-->
現在の再生中のサウンドまたはファイルの再生位置をミリ秒で返します。




<!----------------------------------------------------------------------------->

##Variables



###bool isStreaming

<!--
_name: isStreaming_
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
This boolean variable tells if the sound we are using is streaming or not.
-->
サウンドがストリーミングを使っているかどうかを boolean 値で示します。





<!----------------------------------------------------------------------------->

###bool bMultiPlay

<!--
_name: bMultiPlay_
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

<!--Allows a sound to be played multiple times at once. See setMultiPlay(bool bMp) function for more info.
-->
複数回再生することができるかを許可します。詳しい情報は setMultiPlay(bool bMp) 関数を参照してください。




<!----------------------------------------------------------------------------->

###bool bLoop

<!--
_name: bLoop_
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

<!--bLoop variable controls if we are playing the sound as a loop.-->

bLoop 値はループサウンドとして再生しているかをコントロールします。




<!----------------------------------------------------------------------------->

###bool bLoadedOk

<!--
_name: bLoadedOk_
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

<!--bLoadedOk is a boolean variable containing true if the sound was successfully loaded.  -->

サウンドの読み込みが成功していた場合、bLoadedOk は論理値で true になります。




<!----------------------------------------------------------------------------->

###bool bPaused

<!--
_name: bPaused_
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

<!--bPaused contain true if we pause the sound.-->

サウンドをポーズしたときは bPaused は true になります。




<!----------------------------------------------------------------------------->

###float pan

<!--
_name: pan_
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

<!--Contains the pan position of the sound. Going from 0 to 1.-->

サウンドのパン位置です。0 から 1 を値をとります。




<!----------------------------------------------------------------------------->

###float volume

<!--
_name: volume_
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

<!--Contains the value of the volume of our sound.-->

サウンドのボリューム値です。





<!----------------------------------------------------------------------------->

###float internalFreq

<!--
_name: internalFreq_
_type: float_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: False_
_constant: False_
_advanced: False_
-->

_description: _

<!--Contains the frequency value of the sound. It is set by default to 44100.-->

サウンドの周波数です。デフォルトは 44100 が設定されています。




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

<!--Contains the playback speed of the sound. 1.0 is the normal speed. 2.0 is double the normal speed, -1 is backwards etc. -->

サウンドの再生速度です。1.0 は通常の速度です。2.0 は通常の速度の倍で、-1 は巻き戻しなどになります。





<!----------------------------------------------------------------------------->

###unsigned int length

<!--
_name: length_
_type: unsigned int_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###FMOD_RESULT result

<!--
_name: result_
_type: FMOD_RESULT_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: False_
_constant: False_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

###FMOD_CHANNEL * channel

<!--
_name: channel_
_type: FMOD_CHANNEL *_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _







<!----------------------------------------------------------------------------->

###FMOD_SOUND * sound

<!--
_name: sound_
_type: FMOD_SOUND *_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _







<!----------------------------------------------------------------------------->

###ofPtr player

<!--
_name: player_
_type: ofPtr_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _







<!----------------------------------------------------------------------------->

