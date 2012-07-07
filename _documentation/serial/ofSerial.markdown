#class ofSerial


##Description


<!--
ofSerial provides a cross platform system for interfacing with the serial port. You can choose the port and baud rate, and then read and send data. 
Please note that the port must be set manually in the code, so you should be clear what port your device is on.
 For example, Arduino users should check the arduino app to see what port their device is on. Alternatively the ofSerial class can attempt to communicate with the first available device it finds.
-->

ofSerial はシリアルポート間のインターフェースのためのクロスプラットフォームシステムを提供します。
ポートとボー率を選択することができ、それを使ってデータを読み書きします。
使用するデバイスでどのポートが使えるかを明確にして、コードの中で直接でポートを設定することに注意してください。

例えば、Arduino ユーザーが Arduino 用のアプリを作るときは、それらがどのポートを見て、どのデバイスがオンになっているかを確認してください。

代わりに ofSerial クラスでは一番最初に発見した使用可能なデバイスと通信を試みるようにすることも出来ます。






  







##Methods



### ofSerial()

<!--
_syntax: ofSerial()_
_name: ofSerial_
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


<!--
This initializes the serial connection, but doesn't actually open the connection to any devices. You'll need to use the setup() method before doing that.
-->
シリアル通信を初期化しますが、各デバイスとの通信は結びません。それをする前に setup() メソッドを使う必要があります。



<!----------------------------------------------------------------------------->

### ~ofSerial()

<!--
_syntax: ~ofSerial()_
_name: ~ofSerial_
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

###void enumerateDevices()

<!--
_syntax: enumerateDevices()_
_name: enumerateDevices_
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

使用可能なシリアルデバイスを出力します。
Mac と Linux では以下のようなリストになります。
<!--
Prints out the available serial devices:
On mac and linux it might list something like this:
-->
~~~~{.cpp}

device 0 - cu.modem 
device 1 - cu.USA19H181P1.1
~~~~

PC では以下のようになります。
<!--and on a pc, like:-->
~~~~{.cpp}

device 0 - COM2 
device 1 - COM4
~~~~






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
<!--
Closes the connection to the serial device. 
-->
シリアルデバイスとの通信を切断します。




<!----------------------------------------------------------------------------->

###bool setup()

<!--
_syntax: setup()_
_name: setup_
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

9600 のボー率で最初に使用可能なデバイスにセットアップを試みます。

<!--Attempts to setup the first available device at a baud rate of 9600. -->
~~~~{.cpp}

ofSerial mySerial;
if( mySerial.setup() ){
	printf("serial is setup!");	
}
~~~~






<!----------------------------------------------------------------------------->

###bool setup(portName,baudrate)

<!--
_syntax: setup(portName,baudrate)_
_name: setup_
_returns: bool_
_returns_description: _
_parameters: string portName, int baudrate_
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

名前とボー率を与えて、シリアルポートを開きます。
Mac と Linux では以下のようになるでしょう。
<!--Opens the serial port, with the given name and baud rate. On mac and linux, it might look like:
-->
~~~~{.cpp}

ofSerial mySerial;
mySerial.setup("/dev/cu.USA19H181P1.1", 9600);
~~~~

PC ではこのようになるでしょう。
<!--and on a pc, like:-->
~~~~{.cpp}

ofSerial mySerial;
mySerial.setup("COM4", 9600);
~~~~






<!----------------------------------------------------------------------------->

###bool setup(deviceNumber,baudrate)

<!--
_syntax: setup(deviceNumber,baudrate)_
_name: setup_
_returns: bool_
_returns_description: _
_parameters: int deviceNumber, int baudrate_
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

ボー率順でリスト化された番号を指定してシリアルポートを開きます。
以下のコードはシステムによって最初に発見されたシリアルデバイスを開くでしょう。

<!--Opens the serial port based on the order in which is listed and sets the baud rate. The code bellow would open the first serial device found by the system:-->
~~~~{.cpp}

ofSerial mySerial;
mySerial.setup(0, 9600);
~~~~






<!----------------------------------------------------------------------------->

###int readBytes(buffer,length)

<!--
_syntax: readBytes(buffer,length)_
_name: readBytes_
_returns: int_
_returns_description: _
_parameters: unsigned char * buffer, int length_
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

接続中のシリアルデバイスから、"length" で指定したバイト数分読み込みます。

ときどき、"length" のバイト数より少なく読み込む事があるので、
1 より大きいバイトデータを確実に読み込むためには、
返り値がリクエストしたバイト数と比較チェックして、
もしリクエストしたバイト数より読み込んだバイト数が少なかった場合は、もう一度コールする必要があります。

この関数は Serial.avaliable() が 0 より大きいバイト数があるときのみ呼び出すべきです。

確実に 8 バイト読み込む方法の一例はこちらです。

<!--Tries to read 'length' bytes from the connected serial device. In some cases it may read less than 'length' bytes, so for reliable reading of >1 bytes of data the return value must be checked against the number of bytes requested, and if fewer bytes than requested were read then the call must be tried again.

This function should only be called when Serial.available() is reporting >0 bytes available.

An example of how to reliably read 8 bytes:-->
~~~~{.cpp}

// 8 バイト読み込みたい
int bytesRequired = 8;
unsigned char bytes[bytesRequired];
int bytesRemaining = bytesRequired;

// 全て読み込まれるまでループ
while ( bytesRemaining > 0 )
{
  // check for data
  if ( serial.available() > 0 )
  {
    // 読み込んでみる
    // ※既にもっているバイトには上書きしないように bytes[] 配列をオフセットすることに注意
    int bytesArrayOffset = bytesRequired - bytesRemaining;
    int result = serial.readBytes( &bytes[bytesArrayOffset],
      bytesRemaining );

    // エラーコードをチェック
    if ( result == OF_SERIAL_ERROR )
    {
      // 何か悪い事が起きた
      ofLog( OF_LOG_ERROR, "シリアルから読み込む際の修復不可能なエラー" );
      // 脱出
      break;
    }
    else if ( result == OF_SERIAL_NO_DATA )
    {
      // 何も読み込めなかったのでトライアゲイン
    }
    else
    {
      // 何か読み込めた！
      bytes_remaining -= result;
    }
  }
}
$$/code






<!----------------------------------------------------------------------------->

###int writeBytes(buffer, length)

<!--
_syntax: writeBytes(buffer, length)_
_name: writeBytes_
_returns: int_
_returns_description: _
_parameters: unsigned char * buffer, int length_
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

接続中のシリアルデバイスへバイト型文字列を書き込みます。
readBytes() のようにで返り値をチェックし、
writeBytes() が正しく、書き込んだかをチェックします。
残りのデータが全て書き終わるまで writeBytes() を繰り返す必要があります。

<!--Writes a string of bytes to the connected serial device. As with readBytes() the return code should be checked and the call to writeBytes() repeated with the remaining data until all bytes have been written.-->
~~~~{.cpp}

ofSerial mySerial;
mySerial.setup(0, 9600);
int numSent = mySerial.writeBytes("Hello World");
// numSent にはどれだけ書き込まれたかが入ります。
// 例えば numSent が 3 ならば "Hel" が書き込まれていて、
// 書き込みを完全にするために "lo World" を含めてリトライすべきです。
-->$$/code






<!----------------------------------------------------------------------------->

###bool writeByte(singleByte)

<!--
_syntax: writeByte(singleByte)_
_name: writeByte_
_returns: bool_
_returns_description: _
_parameters: unsigned char singleByte_
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
Writes a single byte to the connected serial device. Check the return value to be sure the data was written.
-->

接続しているシリアルデバイスへ単一バイトを書き込みます。
返り値で確かにデータが書き込まれたかを確認してください。

~~~~{.cpp}

ofSerial mySerial;
mySerial.setup(0, 9600);
unsigned char myByte = 225;
bool byteWasWritten = mySerial.writeByte(myByte);
if ( !byteWasWritten )
  printf("シリアルポートに何もバイトが書き込まれなかった");
~~~~







<!----------------------------------------------------------------------------->

###int readByte()

<!--
_syntax: readByte()_
_name: readByte_
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

要求するデバイスから単一バイトを読み込んで返します。

<!--Reads and returns a single byte from the requested device. -->
~~~~{.cpp}

ofSerial mySerial;
mySerial.setup(0, 9600);
int myByte = 0;
myByte = mySerial.readByte();
if ( myByte == OF_SERIAL_NO_DATA )
  printf("読み込めませんでした");
else if ( myByte == OF_SERIAL_ERROR )
  printf("何かエラーが起きました");
else
  printf("myByte は %d", myByte);
~~~~







<!----------------------------------------------------------------------------->

###void flush(flushIn, flushOut)

<!--
_syntax: flush(flushIn, flushOut)_
_name: flush_
_returns: void_
_returns_description: _
_parameters: bool flushIn, bool flushOut_
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

シリアルバッファの片方または両方からのデータをクリアします。
クリアされたバッファの各データは捨てられます。
flushIn が true だと入力データをクリアし、
flushOut が true だと出力データをクリアします。
<!--
Clears data from one or both of the serial buffers. Any data in the cleared buffers is discarded. flushIn = true clears the incoming data buffer and  fluhOut = true clear the outcoming data buffer. 
-->






<!----------------------------------------------------------------------------->

###int available()

<!--
_syntax: available()_
_name: available_
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

available メソッドはどれだけのバイトがシリアルポートで使用可能かを知りたいときに便利です。例えば、8 バイト待ってから読み込みたいだけならば、このようにします。
<!--
The available method is useful when you want to know how many bytes are available in the serial port. For instance, if you only want to read when there are 8 bytes waiting for you, you would do:
-->

~~~~{.cpp}
if(device.available() > 8) {
  device.readBytes(buffer, 8);
}
~~~~
<!--
This is useful when you know how long a complete message from a device is going to be.
-->
デバイスにあるメッセージがどれぐらい長いかを知りたいときに便利です。


<!----------------------------------------------------------------------------->

###void setVerbose(bLoudmouth)

<!--
_syntax: setVerbose(bLoudmouth)_
_name: setVerbose_
_returns: void_
_returns_description: _
_parameters: bool bLoudmouth_
_access: public_
_version_started: 006_
_version_deprecated: 0.06_
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_description: _

<!--Enable or disable ofSerial messages and errors being sent to the console.
-->
ofSerial のメッセージとエラーをコンソールに送信するかしないか。




<!----------------------------------------------------------------------------->

###void listDevices()

<!--
_syntax: listDevices()_
_name: listDevices_
_returns: void_
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

使用可能なシリアルデバイスをコンソールか標準出力にリストで出力します。

OS X と Linux では全てのデバイスが /dev の下に tty と cu にあるように返るので、デバイスリストを元にして比較することによって、動的にデバイスに接続することができます。

<!--This lists out all the available serial devices to the console or standard output. 

On OSX and Linus this will return all the devices listed in /dev tty and cu, so you might want to compare it against a list of devices that you're expecting
 if you want to use it to dynamically connect to a device.
-->

<!----------------------------------------------------------------------------->

###ofSerialDeviceInfo getDeviceList()

<!--
_syntax: getDeviceList()_
_name: getDeviceList_
_returns: ofSerialDeviceInfo_
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
This returns a vector of ofSerialDeviceInfo instances with the devicePath, deviceName, deviceID set.
-->
devicePath と deviceName と deviceID が含まれる ofSerialDeviceInfo インスタンスの配列を返します。



<!----------------------------------------------------------------------------->

###int readBytes(*buffer, length)

<!--
_syntax: readBytes(*buffer, length)_
_name: readBytes_
_returns: int_
_returns_description: _
_parameters: unsigned char *buffer, int length_
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
This reads bytes from the serial buffer into the buffer pointer passed in:
-->
バッファポインタを渡してシリアルバッファからバイトを読み込みます。

~~~~{.cpp}
unsigned char* buf = new unsigned char[4];
device.readBytes(buf, 4);
// バッファに対して何かする
delete buf;  // 掃除
~~~~

<!--You can also use an array like so:-->
このように配列を使う事も出来ます。

~~~~{.cpp}
unsigned char buf[4];
device.readBytes(&buf[0], 4);
~~~~
<!--
Be aware that the type of your buffer can only be unsigned char. If you're trying to receieve ints or signed chars over a serial connection you'll need to do some bit manipulation to correctly interpret that values.
-->
unsigned char 型のバッファののみ使用可能です。
int や signed char をシリアル通信で受け取るには、手動でビット演算をして値を変換して使用してください。



<!----------------------------------------------------------------------------->

###int writeBytes(*buffer, length)

<!--
_syntax: writeBytes(*buffer, length)_
_name: writeBytes_
_returns: int_
_returns_description: _
_parameters: unsigned char *buffer, int length_
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


This writes bytes into the serial buffer from the buffer pointer passed in:

バッファポインタを渡してシリアルバッファにバイトを書き込みます。

~~~~{.cpp}
unsigned char buf[3] = {'o', 'f', '!'};
device.writeBytes(&buf[0], 3);
~~~~



<!----------------------------------------------------------------------------->

###void drain()

<!--
_syntax: drain()_
_name: drain_
_returns: void_
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
drain is only available on OSX and Linux and is very similar to flush(), but blocks until all the data has been written to or read from the serial port.
-->
drain は OSX と Linux でのみ使用可能で、flush() にとてもよく似ていますが、
シリアルポートからの全てのデータが読み書きされるまでブロックします。



<!----------------------------------------------------------------------------->

###void buildDeviceList()

<!--
_syntax: buildDeviceList()_
_name: buildDeviceList_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
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



###bool bVerbose

<!--
_name: bVerbose_
_type: bool_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: False_
_constant: False_
_advanced: False_
-->

_description: _
<!--
bVerbose is a boolean varible controlling verbosity on the ofSerial class. 
-->
bVerbose は ofSerial クラスを verbose モードにするかどうかの論理値です。




<!----------------------------------------------------------------------------->

###bool bInited

<!--
_name: bInited_
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

###int fd

<!--
_name: fd_
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

###struct termios oldoptions

<!--
_name: oldoptions_
_type: struct termios_
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

###string deviceType

<!--
_name: deviceType_
_type: string_
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

###ofSerialDeviceInfo devices

<!--
_name: devices_
_type: ofSerialDeviceInfo_
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

###bool bHaveEnumeratedDevices

<!--
_name: bHaveEnumeratedDevices_
_type: bool_
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

