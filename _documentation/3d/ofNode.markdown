#class ofNode


<!--
_visible: True_
_advanced: False_
_istemplated: False_
-->

##InlineDescription






##Description

ofNodeは3Dの基礎となるクラスです。3D空間の座標・向き・縮尺の表現の他、ノード同士の親子関係を作って一緒に動かすこともできます。これにより、手軽に互いに結合された複雑な3Dモデルを表現することが出来ます。丁度、あなたの手が手首と、手首が肘と繋がっているのと同じように。（繋がってますよね？）

ノードはofPrimitives, ofCamera, ofEasyCamera等のベースになっています。

現在の座標を取得するには、getX(), getY(), getZ()を使います。

ノードの軸の向きを取得するには、getXAxis()（y軸・z軸はgetYAxis()・getZAxis()）を使います。

他の便利な機能として、ノードの[オイラー角](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%82%A4%E3%83%A9%E3%83%BC%E8%A7%92)の取得はgetPitch(), getHeading(), getRoll()で取得できます。ofNodeのグローバル変換行列はgetGlobalTransformMatrix()で取得することができます。これは、OpenGL空間上のノード表現について考えるときに非常に便利です。

また、ノードの回転行列は、getGlobalOrientation()で取得することができます。これを用いて、ノードがOF空間において逆さまになっているか否かを簡単に調べることができます。（実際にはOF空間というのはOpenGLコンテキストの事なのですが、今はまだ深く説明しません。）




##Methods



###void boom(amount)

<!--
_syntax: boom(amount)_
_name: boom_
_returns: void_
_returns_description: _
_parameters: float amount_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標を+Y方向にamount分移動します。






<!----------------------------------------------------------------------------->

###void clearParent(bMaintainGlobalTransform = false)

<!--
_syntax: clearParent(bMaintainGlobalTransform = false)_
_name: clearParent_
_returns: void_
_returns_description: _
_parameters: bool bMaintainGlobalTransform=false_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

親ノードとの接続を解除します。

その際、変換行列（座標・向き・縮尺）は子ノードだったときの変換行列（座標・向き・縮尺）を引き継ぎます。






<!----------------------------------------------------------------------------->

###void createMatrix()

<!--
_syntax: createMatrix()_
_name: createMatrix_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードの変換行列を作成します。






<!----------------------------------------------------------------------------->

###void customDraw()

<!--
_syntax: customDraw()_
_name: customDraw_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードを独自の方法で描画する場合、draw()の代わりにこの関数をオーバーライドして下さい。

（customDraw()に記述された描画ロジックには、ノードの座標・向き・縮尺が適用されます。）





<!----------------------------------------------------------------------------->

###void dolly(amount)

<!--
_syntax: dolly(amount)_
_name: dolly_
_returns: void_
_returns_description: _
_parameters: float amount_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標を+Z方向にamount分移動します。






<!----------------------------------------------------------------------------->

###void draw()

<!--
_syntax: draw()_
_name: draw_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

描画関数。この関数はオーバーライドしないで下さい。

この関数をオーバーライドして描画を行った場合、ノードの座標・向き・縮尺が適用されません。
代わりに、customDraw()を使用して下さい。






<!----------------------------------------------------------------------------->

###ofQuaternion getGlobalOrientation()

<!--
_syntax: getGlobalOrientation()_
_name: getGlobalOrientation_
_returns: ofQuaternion_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバルの[クォータニオン](http://ja.wikipedia.org/wiki/%E5%9B%9B%E5%85%83%E6%95%B0)を返します。







<!----------------------------------------------------------------------------->

###ofVec3f getGlobalPosition()

<!--
_syntax: getGlobalPosition()_
_name: getGlobalPosition_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバル座標を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getGlobalScale()

<!--
_syntax: getGlobalScale()_
_name: getGlobalScale_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0072_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _







_description: _

ノードのグローバルの縮尺を返します。






<!----------------------------------------------------------------------------->

###ofMatrix4x4 getGlobalTransformMatrix()

<!--
_syntax: getGlobalTransformMatrix()_
_name: getGlobalTransformMatrix_
_returns: ofMatrix4x4_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバル変換行列（座標・位置・縮尺）を返します。






<!----------------------------------------------------------------------------->

###float getHeading()

<!--
_syntax: getHeading()_
_name: getHeading_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルのオイラー角のヘディング（y軸回りの回転角）を返します。






<!----------------------------------------------------------------------------->

###const ofMatrix4x4 & getLocalTransformMatrix()

<!--
_syntax: getLocalTransformMatrix()_
_name: getLocalTransformMatrix_
_returns: const ofMatrix4x4 &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル変換行列（座標・位置・縮尺）を返します。







<!----------------------------------------------------------------------------->

###ofVec3f getLookAtDir()

<!--
_syntax: getLookAtDir()_
_name: getLookAtDir_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの-Z軸の向きを返します。






<!----------------------------------------------------------------------------->

###ofVec3f getOrientationEuler()

<!--
_syntax: getOrientationEuler()_
_name: getOrientationEuler_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルのオイラー角を返します。






<!----------------------------------------------------------------------------->

###ofQuaternion getOrientationQuat()

<!--
_syntax: getOrientationQuat()_
_name: getOrientationQuat_
_returns: ofQuaternion_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの[クォータニオン](http://ja.wikipedia.org/wiki/%E5%9B%9B%E5%85%83%E6%95%B0)を返します。






<!----------------------------------------------------------------------------->

###ofNode * getParent()

<!--
_syntax: getParent()_
_name: getParent_
_returns: ofNode *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードの親ノードのポインタを返します。






<!----------------------------------------------------------------------------->

###float getPitch()

<!--
_syntax: getPitch()_
_name: getPitch_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルのオイラー角のピッチ（x'軸回りの回転角）を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getPosition()

<!--
_syntax: getPosition()_
_name: getPosition_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標を返します。






<!----------------------------------------------------------------------------->

###float getRoll()

<!--
_syntax: getRoll()_
_name: getRoll_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルのオイラー角のロール（z''軸回りの回転角）を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getScale()

<!--
_syntax: getScale()_
_name: getScale_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの縮尺を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getSideDir()

<!--
_syntax: getSideDir()_
_name: getSideDir_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの+X軸の向きを返します。





<!----------------------------------------------------------------------------->

###ofVec3f getUpDir()

<!--
_syntax: getUpDir()_
_name: getUpDir_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの+Y軸の向きを返します。






<!----------------------------------------------------------------------------->

###float getX()

<!--
_syntax: getX()_
_name: getX_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルX座標を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getXAxis()

<!--
_syntax: getXAxis()_
_name: getXAxis_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの+X軸の向きを返します。






<!----------------------------------------------------------------------------->

###float getY()

<!--
_syntax: getY()_
_name: getY_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルY座標を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getYAxis()

<!--
_syntax: getYAxis()_
_name: getYAxis_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの+Y軸の向きを返します。






<!----------------------------------------------------------------------------->

###float getZ()

<!--
_syntax: getZ()_
_name: getZ_
_returns: float_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルZ座標を返します。






<!----------------------------------------------------------------------------->

###ofVec3f getZAxis()

<!--
_syntax: getZAxis()_
_name: getZAxis_
_returns: ofVec3f_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの+Z軸の向きを返します。






<!----------------------------------------------------------------------------->

###void lookAt(&lookAtPosition, upVector = ofVec3f(0, 1, 0))

<!--
_syntax: lookAt(&lookAtPosition, upVector = ofVec3f(0, 1, 0))_
_name: lookAt_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &lookAtPosition, ofVec3f upVector=ofVec3f(0, 1, 0)_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバルの-z軸が座標lookAtPosition方向を向くように回転します。






<!----------------------------------------------------------------------------->

###void lookAt(&lookAtNode, &upVector = ofVec3f(0, 1, 0))

<!--
_syntax: lookAt(&lookAtNode, &upVector = ofVec3f(0, 1, 0))_
_name: lookAt_
_returns: void_
_returns_description: _
_parameters: const ofNode &lookAtNode, const ofVec3f &upVector=ofVec3f(0, 1, 0)_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバルの-z軸がノードlookAtNode方向を向くように回転します。





<!----------------------------------------------------------------------------->

###void move(x, y, z)

<!--
_syntax: move(x, y, z)_
_name: move_
_returns: void_
_returns_description: _
_parameters: float x, float y, float z_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標を(x,y,z)分移動します。






<!----------------------------------------------------------------------------->

###void move(&offset)

<!--
_syntax: move(&offset)_
_name: move_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &offset_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標をベクトルoffset分移動します。






<!----------------------------------------------------------------------------->

### ofNode()

<!--
_syntax: ofNode()_
_name: ofNode_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ofNodeのコンストラクタです。






<!----------------------------------------------------------------------------->

###void onOrientationChanged()

<!--
_syntax: onOrientationChanged()_
_name: onOrientationChanged_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きが変更された際に呼び出される関数です。

向きが変更された際に独自の処理を行う場合、この関数をオーバーライドして下さい。






<!----------------------------------------------------------------------------->

###void onPositionChanged()

<!--
_syntax: onPositionChanged()_
_name: onPositionChanged_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標が変更された際に呼び出される関数です。

座標が変更された際に独自の処理を行う場合、この関数をオーバーライドして下さい。






<!----------------------------------------------------------------------------->

###void onScaleChanged()

<!--
_syntax: onScaleChanged()_
_name: onScaleChanged_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの縮尺が変更された際に呼び出される関数です。

縮尺が変更された際に独自の処理を行う場合、この関数をオーバーライドして下さい。






<!----------------------------------------------------------------------------->

###void orbit(longitude, latitude, radius, &centerPoint = ofVec3f(0, 0, 0))

<!--
_syntax: orbit(longitude, latitude, radius, &centerPoint = ofVec3f(0, 0, 0))_
_name: orbit_
_returns: void_
_returns_description: _
_parameters: float longitude, float latitude, float radius, const ofVec3f &centerPoint=ofVec3f(0, 0, 0)_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

座標centerPointを中心する半径radiusの球があったと仮定し、ノードを経度longitude・緯度latitudeの座標に移動します。

また、ノードのグローバルの-z軸が座標centerPoint方向を向きます。






<!----------------------------------------------------------------------------->

###void orbit(longitude, latitude, radius, &centerNode)

<!--
_syntax: orbit(longitude, latitude, radius, &centerNode)_
_name: orbit_
_returns: void_
_returns_description: _
_parameters: float longitude, float latitude, float radius, ofNode &centerNode_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードcenterNodeを中心する半径radiusの球があったと仮定し、ノードを経度longitude・緯度latitudeの座標に移動します。

また、ノードのグローバルの-z方向がノードccenterNode方向を向きます。






<!----------------------------------------------------------------------------->

###void pan(degrees)

<!--
_syntax: pan(degrees)_
_name: pan_
_returns: void_
_returns_description: _
_parameters: float degrees_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きを+Y方向を中心軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void resetTransform()

<!--
_syntax: resetTransform()_
_name: resetTransform_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ローカル変換行列を初期状態に戻します。






<!----------------------------------------------------------------------------->

###void restoreTransformGL()

<!--
_syntax: restoreTransformGL()_
_name: restoreTransformGL_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

transformGL()による変形を元に戻します。






<!----------------------------------------------------------------------------->

###void roll(degrees)

<!--
_syntax: roll(degrees)_
_name: roll_
_returns: void_
_returns_description: _
_parameters: float degrees_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きを+Z方向を中心軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void rotate(&q)

<!--
_syntax: rotate(&q)_
_name: rotate_
_returns: void_
_returns_description: _
_parameters: const ofQuaternion &q_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きを[クォータニオン](http://ja.wikipedia.org/wiki/%E5%9B%9B%E5%85%83%E6%95%B0)qで回転します。






<!----------------------------------------------------------------------------->

###void rotate(degrees, &v)

<!--
_syntax: rotate(degrees, &v)_
_name: rotate_
_returns: void_
_returns_description: _
_parameters: float degrees, const ofVec3f &v_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きをベクトルvを回転軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void rotate(degrees, vx, vy, vz)

<!--
_syntax: rotate(degrees, vx, vy, vz)_
_name: rotate_
_returns: void_
_returns_description: _
_parameters: float degrees, float vx, float vy, float vz_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きをベクトル(vx,vy,vz)を回転軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void rotateAround(&q, &point)

<!--
_syntax: rotateAround(&q, &point)_
_name: rotateAround_
_returns: void_
_returns_description: _
_parameters: const ofQuaternion &q, const ofVec3f &point_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードを座標pointを中心として[クォータニオン](http://ja.wikipedia.org/wiki/%E5%9B%9B%E5%85%83%E6%95%B0)qで回転します。






<!----------------------------------------------------------------------------->

###void rotateAround(degrees, &axis, &point)

<!--
_syntax: rotateAround(degrees, &axis, &point)_
_name: rotateAround_
_returns: void_
_returns_description: _
_parameters: float degrees, const ofVec3f &axis, const ofVec3f &point_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードを座標pointを中心とし、ベクトルvを回転軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void setGlobalOrientation(&q)

<!--
_syntax: setGlobalOrientation(&q)_
_name: setGlobalOrientation_
_returns: void_
_returns_description: _
_parameters: const ofQuaternion &q_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きを[オイラー角](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%82%A4%E3%83%A9%E3%83%BC%E8%A7%92)でセットします。






<!----------------------------------------------------------------------------->

###void setGlobalPosition(px, py, pz)

<!--
_syntax: setGlobalPosition(px, py, pz)_
_name: setGlobalPosition_
_returns: void_
_returns_description: _
_parameters: float px, float py, float pz_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバル座標に座標(px,py,pz)をセットします。






<!----------------------------------------------------------------------------->

###void setGlobalPosition(&p)

<!--
_syntax: setGlobalPosition(&p)_
_name: setGlobalPosition_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &p_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのグローバル座標に座標pをセットします。






<!----------------------------------------------------------------------------->

###void setOrientation(&q)

<!--
_syntax: setOrientation(&q)_
_name: setOrientation_
_returns: void_
_returns_description: _
_parameters: const ofQuaternion &q_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きに[クォータニオン](http://ja.wikipedia.org/wiki/%E5%9B%9B%E5%85%83%E6%95%B0)qをセットします。






<!----------------------------------------------------------------------------->

###void setOrientation(&eulerAngles)

<!--
_syntax: setOrientation(&eulerAngles)_
_name: setOrientation_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &eulerAngles_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きに[オイラー角](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%82%A4%E3%83%A9%E3%83%BC%E8%A7%92)eulerAnglesをセットします。







<!----------------------------------------------------------------------------->

###void setParent(&parent, bMaintainGlobalTransform = false)

<!--
_syntax: setParent(&parent, bMaintainGlobalTransform = false)_
_name: setParent_
_returns: void_
_returns_description: _
_parameters: ofNode &parent, bool bMaintainGlobalTransform=false_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードに親ノードを接続します。

親ノードを接続すると、グローバル座標・位置・向きに親ノードの座標・位置・向きが反映されます。

親ノードが不要な場合は、NULLをセットして下さい。（デフォルト値はNULLです。）

bMaintainGlobalTransformにtrueを設定すると、ノードのグローバル座標・位置・向きが親ノード接続後も保持されます。







<!----------------------------------------------------------------------------->

###void setPosition(px, py, pz)

<!--
_syntax: setPosition(px, py, pz)_
_name: setPosition_
_returns: void_
_returns_description: _
_parameters: float px, float py, float pz_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _

ノードのローカル座標に座標(px,py,pz)をセットします。






_description: _








<!----------------------------------------------------------------------------->

###void setPosition(&p)

<!--
_syntax: setPosition(&p)_
_name: setPosition_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &p_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標に座標pをセットします。






<!----------------------------------------------------------------------------->

###void setScale(s)

<!--
_syntax: setScale(s)_
_name: setScale_
_returns: void_
_returns_description: _
_parameters: float s_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル縮尺をセットします。






<!----------------------------------------------------------------------------->

###void setScale(sx, sy, sz)

<!--
_syntax: setScale(sx, sy, sz)_
_name: setScale_
_returns: void_
_returns_description: _
_parameters: float sx, float sy, float sz_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル縮尺をセットします。






<!----------------------------------------------------------------------------->

###void setScale(&s)

<!--
_syntax: setScale(&s)_
_name: setScale_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &s_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル縮尺をセットします。






<!----------------------------------------------------------------------------->

###void setTransformMatrix(&m44)

<!--
_syntax: setTransformMatrix(&m44)_
_name: setTransformMatrix_
_returns: void_
_returns_description: _
_parameters: const ofMatrix4x4 &m44_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル変換行列に直接、変換行列m44をセットします。






<!----------------------------------------------------------------------------->

###void tilt(degrees)

<!--
_syntax: tilt(degrees)_
_name: tilt_
_returns: void_
_returns_description: _
_parameters: float degrees_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカルの向きを+X方向を中心軸としてdegrees度回転します。






<!----------------------------------------------------------------------------->

###void transformGL()

<!--
_syntax: transformGL()_
_name: transformGL_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

グローバル変換行列に従ってノードを変形します。






<!----------------------------------------------------------------------------->

###void truck(amount)

<!--
_syntax: truck(amount)_
_name: truck_
_returns: void_
_returns_description: _
_parameters: float amount_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ノードのローカル座標を+X方向にamount分移動します。






<!----------------------------------------------------------------------------->

### ~ofNode()

<!--
_syntax: ~ofNode()_
_name: ~ofNode_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

ofNodeのデストラクタです。






<!----------------------------------------------------------------------------->

##Variables



###ofVec3f axis

<!--
_name: axis_
_type: ofVec3f_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードのローカルの回転軸です。






<!----------------------------------------------------------------------------->

###ofMatrix4x4 localTransformMatrix

<!--
_name: localTransformMatrix_
_type: ofMatrix4x4_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードのローカルの回転行列です。






<!----------------------------------------------------------------------------->

###ofQuaternion orientation

<!--
_name: orientation_
_type: ofQuaternion_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードのローカルの向きです。






<!----------------------------------------------------------------------------->

###ofNode parent

<!--
_name: parent_
_type: ofNode_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードの親ノードです。






<!----------------------------------------------------------------------------->

###ofVec3f position

<!--
_name: position_
_type: ofVec3f_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードのローカル座標です。






<!----------------------------------------------------------------------------->

###ofVec3f scale

<!--
_name: scale_
_type: ofVec3f_
_access: private_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _

ノードのローカルの縮尺です。






<!----------------------------------------------------------------------------->

