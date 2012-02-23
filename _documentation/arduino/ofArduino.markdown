#class ofArduino


##Description

FirmataライブラリがインストールされたArduinoをoFからコントロールします。FirmataをArduinoにロードするには、まずArduino開発環境を起動し、「Example > Firmata > StandardFirmata」のスケッチを開きます。次にArduinoのボードにスケッチをアップロードします。
ofArduinoのインスタンスがisArduinoReady()からtrueを返したら、sendDigitalPinMode()を利用してデジタルピンのモードを設定可能となります。
   
    ~~~~{.cpp}
	sendDigitalPinMode(9, ARD_INPUT)
	~~~~

ボタンが押されたことを検知するために、9番ピンをインプットに設定します。

    ~~~~{.cpp}
	sendDigitalPinMode(9, ARD_PWM)
	~~~~

9番ピンをPWMとして設定します。この操作はPWMが利用可能なピンに限られることに注意してください。


##Methods



###void ofStandardFirmata()

<!--
_syntax: ofStandardFirmata()_
_name: ofStandardFirmata_
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

###void sendDigitalPinReporting(pin, mode)

<!--
_syntax: sendDigitalPinReporting(pin, mode)_
_name: sendDigitalPinReporting_
_returns: void_
_returns_description: _
_parameters: int pin, int mode_
_access: protected_
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

### ofArduino()

<!--
_syntax: ofArduino()_
_name: ofArduino_
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

###void processSysExData(data)

<!--
_syntax: processSysExData(data)_
_name: processSysExData_
_returns: void_
_returns_description: _
_parameters: vector< unsigned char > data_
_access: protected_
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

###void ~ofStandardFirmata()

<!--
_syntax: ~ofStandardFirmata()_
_name: ~ofStandardFirmata_
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

###void sendDigitalPortReporting(port, mode)

<!--
_syntax: sendDigitalPortReporting(port, mode)_
_name: sendDigitalPortReporting_
_returns: void_
_returns_description: _
_parameters: int port, int mode_
_access: protected_
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

### ~ofArduino()

<!--
_syntax: ~ofArduino()_
_name: ~ofArduino_
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

###bool connect(device, baud)

<!--
_syntax: connect(device, baud)_
_name: connect_
_returns: bool_
_returns_description: _
_parameters: string device, int baud_
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

Arduinoに接続するためのシリアルポートを開く






<!----------------------------------------------------------------------------->

###void processData(inputData)

<!--
_syntax: processData(inputData)_
_name: processData_
_returns: void_
_returns_description: _
_parameters: unsigned char inputData_
_access: protected_
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

###int connect(device, baud)

<!--
_syntax: connect(device, baud)_
_name: connect_
_returns: int_
_returns_description: _
_parameters: string device, int baud_
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







<!----------------------------------------------------------------------------->

###void disconnect()

<!--
_syntax: disconnect()_
_name: disconnect_
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

シリアルポートの接続を閉じる。Arduinoを停止するわけではない。






<!----------------------------------------------------------------------------->

###void processDigitalPort(port, value)

<!--
_syntax: processDigitalPort(port, value)_
_name: processDigitalPort_
_returns: void_
_returns_description: _
_parameters: int port, unsigned char value_
_access: protected_
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

###bool isArduinoReady()

<!--
_syntax: isArduinoReady()_
_name: isArduinoReady_
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

シリアルポートからデータを取得する。この命令は定期的に呼ばれるようにすべきである。






<!----------------------------------------------------------------------------->

###void processSysExData(data)

<!--
_syntax: processSysExData(data)_
_name: processSysExData_
_returns: void_
_returns_description: _
_parameters: vector< unsigned char > data_
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

###void setUseDelay(bDelay)

<!--
_syntax: setUseDelay(bDelay)_
_name: setUseDelay_
_returns: void_
_returns_description: _
_parameters: bool bDelay_
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

###bool isInitialized()

<!--
_syntax: isInitialized()_
_name: isInitialized_
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

正しく接続が確立したらtrueを返し、Arduinoはファームウェアに通知する。





<!----------------------------------------------------------------------------->

###void sendServo(pin, value, force)

<!--
_syntax: sendServo(pin, value, force)_
_name: sendServo_
_returns: void_
_returns_description: _
_parameters: int pin, int value, bool force_
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

Arduino Uno：9, 10ピン
作動させるには、ピンにサーボモーターを接続する






<!----------------------------------------------------------------------------->

###void setDigitalHistoryLength(length)

<!--
_syntax: setDigitalHistoryLength(length)_
_name: setDigitalHistoryLength_
_returns: void_
_returns_description: _
_parameters: int length_
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

###void sendServoAttach(pin, minPulse, maxPulse, angle)

<!--
_syntax: sendServoAttach(pin, minPulse, maxPulse, angle)_
_name: sendServoAttach_
_returns: void_
_returns_description: _
_parameters: int pin, int minPulse, int maxPulse, int angle_
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

Arduino Uno：サーボモータが接続された、9, 10ピン
Firmata 2.2では、angleパラメータは推奨されていない






<!----------------------------------------------------------------------------->

###void setAnalogHistoryLength(length)

<!--
_syntax: setAnalogHistoryLength(length)_
_name: setAnalogHistoryLength_
_returns: void_
_returns_description: _
_parameters: int length_
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

###void sendServoDetach(pin)

<!--
_syntax: sendServoDetach(pin)_
_name: sendServoDetach_
_returns: void_
_returns_description: _
_parameters: int pin_
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

Arduino Unoでは9, 10番でピンからサーボ機能を切り離す。ピンのモードはOUTPUTのまま保持される。
sendServoDetachはFirmata 2.2では推奨されていない。





<!----------------------------------------------------------------------------->

###void setStringHistoryLength(length)

<!--
_syntax: setStringHistoryLength(length)_
_name: setStringHistoryLength_
_returns: void_
_returns_description: _
_parameters: int length_
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

###int getServo(pin)

<!--
_syntax: getServo(pin)_
_name: getServo_
_returns: int_
_returns_description: _
_parameters: int pin_
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

もしピーンにサーボが設定されていたら、最後に設定されたサーボの値を返す。






<!----------------------------------------------------------------------------->

###void setSysExHistoryLength(nSysEx)

<!--
_syntax: setSysExHistoryLength(nSysEx)_
_name: setSysExHistoryLength_
_returns: void_
_returns_description: _
_parameters: int nSysEx_
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

###void sendDigitalPinMode(pin, mode)

<!--
_syntax: sendDigitalPinMode(pin, mode)_
_name: sendDigitalPinMode_
_returns: void_
_returns_description: _
_parameters: int pin, int mode_
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

Arduino Unoでは、pin：2-13に対応。mode：RD_INPUT, ARD_OUTPUT, ARD_PWM。ピンモードがARD_INPUTに設定されていたら、ポートにピンがONだと通知する。注意：アナログピン0-5はデジタルピンの16-21としても作動する、しかしそのなかの一つのピンでもARD_INPUTに設定されていたら、全てのアナログピンの反応は停止する。






<!----------------------------------------------------------------------------->

###void sendAnalogPinReporting(pin, mode)

<!--
_syntax: sendAnalogPinReporting(pin, mode)_
_name: sendAnalogPinReporting_
_returns: void_
_returns_description: _
_parameters: int pin, int mode_
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

###void sendDigital(pin, value, force)

<!--
_syntax: sendDigital(pin, value, force)_
_name: sendDigital_
_returns: void_
_returns_description: _
_parameters: int pin, int value, bool force_
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

###void sendPwm(pin, value, force)

<!--
_syntax: sendPwm(pin, value, force)_
_name: sendPwm_
_returns: void_
_returns_description: _
_parameters: int pin, int value, bool force_
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

Arduino Unoでは、3, 5, 6, 9, 10, 11ピン。値は0(完全にoff)から255(常にon)。ピンのモードはARD_PWMにしなくてはならない。





<!----------------------------------------------------------------------------->

###void sendSysEx(command, data)

<!--
_syntax: sendSysEx(command, data)_
_name: sendSysEx_
_returns: void_
_returns_description: _
_parameters: int command, vector< unsigned char > data_
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

###void sendString(str)

<!--
_syntax: sendString(str)_
_name: sendString_
_returns: void_
_returns_description: _
_parameters: string str_
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

Firmataは12文字以上の文字列は扱えない






<!----------------------------------------------------------------------------->

###void sendProtocolVersionRequest()

<!--
_syntax: sendProtocolVersionRequest()_
_name: sendProtocolVersionRequest_
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

###void sendFirmwareVersionRequest()

<!--
_syntax: sendFirmwareVersionRequest()_
_name: sendFirmwareVersionRequest_
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

###void sendReset()

<!--
_syntax: sendReset()_
_name: sendReset_
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

Arduinoをリセットして内部のプログラムを再起動する。





<!----------------------------------------------------------------------------->

###void sendSysExBegin()

<!--
_syntax: sendSysExBegin()_
_name: sendSysExBegin_
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

###void sendSysExEnd()

<!--
_syntax: sendSysExEnd()_
_name: sendSysExEnd_
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

###void sendByte(byte)

<!--
_syntax: sendByte(byte)_
_name: sendByte_
_returns: void_
_returns_description: _
_parameters: unsigned char byte_
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

Firmataのメッセージとして、ラッピングすることなくバイトを送出する。データは、0から127の範囲。127より大きな値は、コマンドとして解釈される。






<!----------------------------------------------------------------------------->

###void sendValueAsTwo7bitBytes(value)

<!--
_syntax: sendValueAsTwo7bitBytes(value)_
_name: sendValueAsTwo7bitBytes_
_returns: void_
_returns_description: _
_parameters: int value_
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

###int getPwm(pin)

<!--
_syntax: getPwm(pin)_
_name: getPwm_
_returns: int_
_returns_description: _
_parameters: int pin_
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

Arduino Unoの場合
ピン：3, 5, 6, 9, 10 and 11
指定したピンの最後にセットされたPWMの値を返す
ピンのモードは、ARD_PWMにする
注意：アナログ入力0-5がデジタルピンとして使用されていれば、16-21のピンとして使用可能






<!----------------------------------------------------------------------------->

###int getDigital(pin)

<!--
_syntax: getDigital(pin)_
_name: getDigital_
_returns: int_
_returns_description: _
_parameters: int pin_
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

Arduino Unoでは、ピン：2-13
もしピンモードがARD_INPUTだったら最後に受信した値、ピンモードがARD_OUTPUTだったら最後に設定した値を返す
注意：アナログ入力0-5がデジタルピンとして使用されていれば、16-21のピンとして使用可能
返り値が、1か0か、highかlowかに関わらず、if()を用いて下記のようなステイトメントで値をテストすることができる

~~~~{.cpp}
if(arduino.getDigital(pin)){
    // do something on high
}else{
    // do something on low
}
~~~~






<!----------------------------------------------------------------------------->

###int getAnalog(pin)

<!--
_syntax: getAnalog(pin)_
_name: getAnalog_
_returns: int_
_returns_description: _
_parameters: int pin_
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

現在指定したピンが読み込んでいるアナログ値を返す。Arduinoは10ビットのADCを持つので、0〜1024の値を持つことができる





<!----------------------------------------------------------------------------->

###vector< unsigned char > getSysEx()

<!--
_syntax: getSysEx()_
_name: getSysEx_
_returns: vector< unsigned char >_
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

最後に受信したSysExメッセージを返す






<!----------------------------------------------------------------------------->

###string getString()

<!--
_syntax: getString()_
_name: getString_
_returns: string_
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

最後に受信した文字列を返す






<!----------------------------------------------------------------------------->

###int getMajorProtocolVersion()

<!--
_syntax: getMajorProtocolVersion()_
_name: getMajorProtocolVersion_
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
_advanced: True_
-->

_description: _

ファームウェアのメジャーバージョンを返す






<!----------------------------------------------------------------------------->

###int getMinorProtocolVersion()

<!--
_syntax: getMinorProtocolVersion()_
_name: getMinorProtocolVersion_
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
_advanced: True_
-->

_description: _

ファームウェアーのマイナーバージョンを返す






<!----------------------------------------------------------------------------->

###int getMajorFirmwareVersion()

<!--
_syntax: getMajorFirmwareVersion()_
_name: getMajorFirmwareVersion_
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
_advanced: True_
-->

_description: _

ファームウェアのメジャーバージョンを返す






<!----------------------------------------------------------------------------->

###int getMinorFirmwareVersion()

<!--
_syntax: getMinorFirmwareVersion()_
_name: getMinorFirmwareVersion_
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
_advanced: True_
-->

_description: _

ファームウェアーのマイナーバージョンを返す






<!----------------------------------------------------------------------------->

###string getFirmwareName()

<!--
_syntax: getFirmwareName()_
_name: getFirmwareName_
_returns: string_
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

ファームウェアの名前を返す






<!----------------------------------------------------------------------------->

###list< int > * getDigitalHistory(pin)

<!--
_syntax: getDigitalHistory(pin)_
_name: getDigitalHistory_
_returns: list< int > *_
_returns_description: _
_parameters: int pin_
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

Arduino Unoではピン：2-13
指定したピンのデジタルデータの履歴のリストへのポインタを返す
注意：アナログ入力0-5がデジタルピンとして使用されていれば、16-21のピンとして使用可能





<!----------------------------------------------------------------------------->

###list< int > * getAnalogHistory(pin)

<!--
_syntax: getAnalogHistory(pin)_
_name: getAnalogHistory_
_returns: list< int > *_
_returns_description: _
_parameters: int pin_
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

Arduino Unoでは、ピン：0-5
指定したピンのアナログデータの履歴のリスト







<!----------------------------------------------------------------------------->

###list< vector< unsigned char > > * getSysExHistory()

<!--
_syntax: getSysExHistory()_
_name: getSysExHistory_
_returns: list< vector< unsigned char > > *_
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

SysExメッセージの履歴のポインタを返す






<!----------------------------------------------------------------------------->

###list< string > * getStringHistory()

<!--
_syntax: getStringHistory()_
_name: getStringHistory_
_returns: list< string > *_
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

文字列の履歴のポインタを返す






<!----------------------------------------------------------------------------->

###int getDigitalPinMode(pin)

<!--
_syntax: getDigitalPinMode(pin)_
_name: getDigitalPinMode_
_returns: int_
_returns_description: _
_parameters: int pin_
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

デジタルピンのモードを返す：ARD_INPUT, ARD_OUTPUT, ARD_PWM, ARD_SERVO, ARD_ANALOG





<!----------------------------------------------------------------------------->

###int getAnalogPinReporting(pin)

<!--
_syntax: getAnalogPinReporting(pin)_
_name: getAnalogPinReporting_
_returns: int_
_returns_description: _
_parameters: int pin_
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


ARD_ON,またはARD_OFF






<!----------------------------------------------------------------------------->

###int getValueFromTwo7bitBytes(lsb, msb)

<!--
_syntax: getValueFromTwo7bitBytes(lsb, msb)_
_name: getValueFromTwo7bitBytes_
_returns: int_
_returns_description: _
_parameters: unsigned char lsb, unsigned char msb_
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

SysExメッセージのパースに使う







<!----------------------------------------------------------------------------->

###void initPins()

<!--
_syntax: initPins()_
_name: initPins_
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



###ofEvent< const int > EDigitalPinChanged

<!--
_name: EDigitalPinChanged_
_type: ofEvent< const int >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

もしデジタルルピンの値が変化したらトリガーされる。






<!----------------------------------------------------------------------------->

###ofEvent< const int > EAnalogPinChanged

<!--
_name: EAnalogPinChanged_
_type: ofEvent< const int >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when an analog pin changes value, the pin that changed is passed as an argument






<!----------------------------------------------------------------------------->

###ofEvent< const vector< unsigned char > > ESysExReceived

<!--
_name: ESysExReceived_
_type: ofEvent< const vector< unsigned char > >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when a SysEx message that isn't in the extended command set is received, the SysEx message is passed as an argument






<!----------------------------------------------------------------------------->

###ofEvent< const int > EProtocolVersionReceived

<!--
_name: EProtocolVersionReceived_
_type: ofEvent< const int >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when a protocol version is received, the major version is passed as an argument






<!----------------------------------------------------------------------------->

###ofEvent< const int > EFirmwareVersionReceived

<!--
_name: EFirmwareVersionReceived_
_type: ofEvent< const int >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when a firmware version is received, the major version is passed as an argument






<!----------------------------------------------------------------------------->

###ofEvent< const int > EInitialized

<!--
_name: EInitialized_
_type: ofEvent< const int >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when the firmware version is received upon connect, the major firmware version is passed as an argument
from this point it's safe to send to the Arduino.






<!----------------------------------------------------------------------------->

###ofEvent< const string > EStringReceived

<!--
_name: EStringReceived_
_type: ofEvent< const string >_
_access: public_
_version_started: 006_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: True_
-->

_description: _

triggered when a string is received, the string is passed as an argument






<!----------------------------------------------------------------------------->

###bool _initialized

<!--
_name: _initialized_
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

###bool bUseDelay

<!--
_name: bUseDelay_
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

###ofSerial _port

<!--
_name: _port_
_type: ofSerial_
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

###bool connected

<!--
_name: connected_
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

###int _portStatus

<!--
_name: _portStatus_
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

###float connectTime

<!--
_name: connectTime_
_type: float_
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

###int _analogHistoryLength

<!--
_name: _analogHistoryLength_
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

###int _servoValue

<!--
_name: _servoValue_
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

###int _digitalHistoryLength

<!--
_name: _digitalHistoryLength_
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

###float _temp

<!--
_name: _temp_
_type: float_
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

###int _stringHistoryLength

<!--
_name: _stringHistoryLength_
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

###float _humidity

<!--
_name: _humidity_
_type: float_
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

###int _sysExHistoryLength

<!--
_name: _sysExHistoryLength_
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

###int _waitForData

<!--
_name: _waitForData_
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

###int _executeMultiByteCommand

<!--
_name: _executeMultiByteCommand_
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

###int _multiByteChannel

<!--
_name: _multiByteChannel_
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

###unsigned char _storedInputData

<!--
_name: _storedInputData_
_type: unsigned char_
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

###vector< unsigned char > _sysExData

<!--
_name: _sysExData_
_type: vector< unsigned char >_
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

###int _majorProtocolVersion

<!--
_name: _majorProtocolVersion_
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

###int _minorProtocolVersion

<!--
_name: _minorProtocolVersion_
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

###int _majorFirmwareVersion

<!--
_name: _majorFirmwareVersion_
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

###int _minorFirmwareVersion

<!--
_name: _minorFirmwareVersion_
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

###string _firmwareName

<!--
_name: _firmwareName_
_type: string_
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

###list< vector< unsigned char > > _sysExHistory

<!--
_name: _sysExHistory_
_type: list< vector< unsigned char > >_
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

###list< string > _stringHistory

<!--
_name: _stringHistory_
_type: list< string >_
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

###list< int > _analogHistory

<!--
_name: _analogHistory_
_type: list< int >_
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

###list< int > _digitalHistory

<!--
_name: _digitalHistory_
_type: list< int >_
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

###int _digitalPinMode

<!--
_name: _digitalPinMode_
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

###int _digitalPinValue

<!--
_name: _digitalPinValue_
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

###int _digitalPortValue

<!--
_name: _digitalPortValue_
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

###int _digitalPortReporting

<!--
_name: _digitalPortReporting_
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

###int _digitalPinReporting

<!--
_name: _digitalPinReporting_
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

###int _analogPinReporting

<!--
_name: _analogPinReporting_
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

###int _totalDigitalPins

<!--
_name: _totalDigitalPins_
_type: int_
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

###int _firmwareVersionSum

<!--
_name: _firmwareVersionSum_
_type: int_
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

