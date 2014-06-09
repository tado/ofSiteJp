#class ofPath


##Description

ofPathクラスは、一点のパス、又は複数点から成るパスを定義します。複数点から成るパスをひとつのベクターデータオブジェクトとして連結させて、画面への描画、パスの操作、サブパスの操作等が行えます。
ofPolylineに比べて複雑な図形を扱う事に優れ、またofPolyline, ofSubPathのインスタンスに比べて入り組んだ親子関係を持った線や図形の管理を簡単に行う事が出来ます。ofPathは、デフォルトでofSubPathインスタンスを使用します。パスを閉じる時、自動的に新しいパスを追加します。


~~~~{.cpp}
for( int i = 0; i < 5; i++) {
	path.arc( i * 50 + 20, i * 50 + 20, i * 40 + 10, i * 40 + 10, 0, 360); // creates a new ofSubPath
	path.close();
}
~~~~


ofPolylineのインスタンスを使用するには、POLYLINESモードをセットします。

~~~~{.cpp}
path.setMode(POLYLINES);
~~~~








##Methods



### ofPath()

<!--
_syntax: ofPath()_
_name: ofPath_
_returns: _
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


新しいofPathクラスのインスタンスを生成します。




<!----------------------------------------------------------------------------->

###void clear()

<!--
_syntax: clear()_
_name: clear_
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


ofPathのインスタンスから、全てのサブパスを消去します。




<!----------------------------------------------------------------------------->

###void newSubPath()

<!--
_syntax: newSubPath()_
_name: newSubPath_
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



ofPolylineか、ofSubPathどちらかの任意の新しいインスタンスを生成します。
ofSubPathへの呼び出し後に追加された全てのパスは、新しいサブパスが生成された時に完成します。
close() メソッドを呼ぶと、自動的に newSubPath() が呼び出されます。
既に閉じられているパスへはポイントの追加を行いません。



<!----------------------------------------------------------------------------->

###void close()

<!--
_syntax: close()_
_name: close_
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



現在のサブパスを閉じ、newSubPath() を呼んで ofPolyline, ofSubPath どちらか任意の新しいサブパスを生成します。
既に閉じられているパスへはポイントの追加を行いません。



<!----------------------------------------------------------------------------->

###void lineTo(&p)

<!--
_syntax: lineTo(&p)_
_name: lineTo_
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


現在の描画位置から、p の位置までの直線を描画します。



<!----------------------------------------------------------------------------->

###void lineTo(x, y)

<!--
_syntax: lineTo(x, y)_
_name: lineTo_
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


現在の描画位置から、x, y の位置までの直線を描画します。




<!----------------------------------------------------------------------------->

###void lineTo(x, y, z)

<!--
_syntax: lineTo(x, y, z)_
_name: lineTo_
_returns: void_
_returns_description: _
_parameters: float x, float y, float z_
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



現在の描画位置から、x, y, z の位置までの直線を描画します。



<!----------------------------------------------------------------------------->

###void moveTo(&p)

<!--
_syntax: moveTo(&p)_
_name: moveTo_
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


p の位置へ、描画位置を移動します。
lineTo(), curveTo() 等を連続して呼んだ場合、描画位置 p から、新しい描画位置へ移動します。




<!----------------------------------------------------------------------------->

###void moveTo(x, y, z = 0)

<!--
_syntax: moveTo(x, y, z = 0)_
_name: moveTo_
_returns: void_
_returns_description: _
_parameters: float x, float y, float z=0_
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



p の位置へ、描画位置を移動します。
lineTo(), curveTo() 等を連続して呼んだ場合、描画位置 x, y, z から、新しい描画位置へ移動します。



<!----------------------------------------------------------------------------->

###void curveTo(&p)

<!--
_syntax: curveTo(&p)_
_name: curveTo_
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



現在の描画位置から p への曲線を描画します。



<!----------------------------------------------------------------------------->

###void curveTo(x, y)

<!--
_syntax: curveTo(x, y)_
_name: curveTo_
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



現在の描画位置から x, y への曲線を描画します。
マウス座標位置に小さなバラ曲線（正葉曲線）を描画するサンプルコード:

~~~~{.cpp}
float scale = ofDist(mouseX, mouseY, px, py);

for( float theta = 0; theta < TWO_PI; theta += 0.1) 
{
	float r =  cos(theta * (scale/6)) * scale; 
	path.curveTo(mouseX + r * cos(theta), mouseY + r * sin(theta));
}

px = mouseX;
py = mouseY;
~~~~



<!----------------------------------------------------------------------------->

###void curveTo(x, y, z)

<!--
_syntax: curveTo(x, y, z)_
_name: curveTo_
_returns: void_
_returns_description: _
_parameters: float x, float y, float z_
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


現在の描画位置から x, y、z への曲線を描画します。



<!----------------------------------------------------------------------------->

###void bezierTo(&cp1, &cp2, &p)

<!--
_syntax: bezierTo(&cp1, &cp2, &p)_
_name: bezierTo_
_returns: void_
_returns_description: _
_parameters: const ofPoint &cp1, const ofPoint &cp2, const ofPoint &p_
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


現在の描画位置から p へ、ofPoint cp1, cp2のコントロールポイントを使った三次ベジェ曲線を描画します。
サンプルコード:
~~~~{.cpp}
line.addVertex(ofPoint(200, 400));
line.bezierTo(100, 100, 800, 100, 700, 400);
~~~~
このコードの実行結果:
![polyline bezier](bezier.png)
黄色の点がコントロールポイントです。




<!----------------------------------------------------------------------------->

###void bezierTo(cx1, cy1, cx2, cy2, x, y)

<!--
_syntax: bezierTo(cx1, cy1, cx2, cy2, x, y)_
_name: bezierTo_
_returns: void_
_returns_description: _
_parameters: float cx1, float cy1, float cx2, float cy2, float x, float y_
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



現在の描画位置から x, y へ、座標cx1, cy1, 座標cx2, cy2 のコントロールポイントを使った三次ベジェ曲線を描画します。




<!----------------------------------------------------------------------------->

###void bezierTo(cx1, cy1, cz1, cx2, cy2, cz2, x, y, z)

<!--
_syntax: bezierTo(cx1, cy1, cz1, cx2, cy2, cz2, x, y, z)_
_name: bezierTo_
_returns: void_
_returns_description: _
_parameters: float cx1, float cy1, float cz1, float cx2, float cy2, float cz2, float x, float y, float z_
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


現在の描画位置から x, y, z へ、座標cx1, cy1, cz1, 座標cx2, cy2, cz2 のコントロールポイントを使った三次ベジェ曲線を描画します。

~~~~{.cpp}

float cx = ofGetWidth()/2;
float cy = 200;
float step = TWO_PI / 60;
for (float i = 0.0; i < TWO_PI; i+=step) {
	
	
	if(i == 0.0) {
		line.addVertex(cx + (400*cos(i)), cy+400, 400 * sin(i));
	} else {
		line.bezierTo( cx - (200*cos(i)), cy-100, 400 * sin(i), 
					   cx + (200*cos(i)), cy+600, 400 * sin(i), 
					   cx + (400*cos(i)), cy+400, 400 * sin(i));
	}
}
~~~~




<!----------------------------------------------------------------------------->

###void quadBezierTo(&cp1, &cp2, &p)

<!--
_syntax: quadBezierTo(&cp1, &cp2, &p)_
_name: quadBezierTo_
_returns: void_
_returns_description: _
_parameters: const ofPoint &cp1, const ofPoint &cp2, const ofPoint &p_
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


現在の描画位置から、開始位置 cp1, コントロールポイント cp2, 終了位置 p の二次ベジェ曲線を3D空間に描画します。
![polyline curves](curves.png)




<!----------------------------------------------------------------------------->

###void quadBezierTo(cx1, cy1, cx2, cy2, x, y)

<!--
_syntax: quadBezierTo(cx1, cy1, cx2, cy2, x, y)_
_name: quadBezierTo_
_returns: void_
_returns_description: _
_parameters: float cx1, float cy1, float cx2, float cy2, float x, float y_
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


現在の描画位置から、開始位置座標cx1, cy1, コントロールポイント座標 cx2, cy2, 終了位置座標 x, y の二次ベジェ曲線を2D空間に描画します。




<!----------------------------------------------------------------------------->

###void quadBezierTo(cx1, cy1, cz1, cx2, cy2, cz2, x, y, z)

<!--
_syntax: quadBezierTo(cx1, cy1, cz1, cx2, cy2, cz2, x, y, z)_
_name: quadBezierTo_
_returns: void_
_returns_description: _
_parameters: float cx1, float cy1, float cz1, float cx2, float cy2, float cz2, float x, float y, float z_
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




現在の描画位置から、開始位置座標cx1, cy1, cz1 コントロールポイント座標 cx2, cy2, cz2 終了位置座標 x, y, z の二次ベジェ曲線を3D空間に描画します。




<!----------------------------------------------------------------------------->

###void arc(&centre, radiusX, radiusY, angleBegin, angleEnd)

<!--
_syntax: arc(&centre, radiusX, radiusY, angleBegin, angleEnd)_
_name: arc_
_returns: void_
_returns_description: _
_parameters: const ofPoint &centre, float radiusX, float radiusY, float angleBegin, float angleEnd_
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



centre の位置に円弧を描画します。radiusX, radiusY の半径と、円弧開始アングル、円弧終了アングルを指定出来ます。
座標 100, 100 の位置に半径50pxの円弧を描くサンプルコード:

~~~~{.cpp}
path.arc( 100, 100, 50, 50, 0, 360);
~~~~

angleEnd は angleBegin より大きい数字である必要があります。
例えば、0, 180 はOKです。180, 0 は正しくありません。



<!----------------------------------------------------------------------------->

###void arc(x, y, radiusX, radiusY, angleBegin, angleEnd)

<!--
_syntax: arc(x, y, radiusX, radiusY, angleBegin, angleEnd)_
_name: arc_
_returns: void_
_returns_description: _
_parameters: float x, float y, float radiusX, float radiusY, float angleBegin, float angleEnd_
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


座標 x, y の位置に円弧を描画します。radiusX, radiusY の半径と、円弧開始アングル、円弧終了アングルを指定出来ます。
座標 300, 300 の位置に半径200pxの円弧を描くサンプルコード:

~~~~{.cpp}
path.moveTo(300, 300);
path.arc( 300, 300, 200, 200, 0, 271); // note 271, not 270 for precision
~~~~

![ofPath arc](ofPath_arc.png)

angleEnd は angleBegin より大きい数字である必要があります。
例えば、0, 180 はOKです。180, 0 は正しくありません。


<!----------------------------------------------------------------------------->

###void arc(x, y, z, radiusX, radiusY, angleBegin, angleEnd)

<!--
_syntax: arc(x, y, z, radiusX, radiusY, angleBegin, angleEnd)_
_name: arc_
_returns: void_
_returns_description: _
_parameters: float x, float y, float z, float radiusX, float radiusY, float angleBegin, float angleEnd_
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


座標 x, y, z の位置に円弧を描画します。radiusX, radiusY の半径と、円弧開始アングル、円弧終了アングルを指定出来ます。



<!----------------------------------------------------------------------------->

###void setPolyWindingMode(mode)

<!--
_syntax: setPolyWindingMode(mode)_
_name: setPolyWindingMode_
_returns: void_
_returns_description: _
_parameters: ofPolyWindingMode mode_
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

サブパス内各ポイントの繋がり方を指定します。
OpenGLは凸ポリゴンのみをレンダリング出来ます。それ以外（凹ポリゴン等）はテセレーションしてからでなければ描画が出来ません。
もしofPathのインスタンスがfilledであれば、この処理は自動的に行われます。
指定可能なオプションは以下の通りです。

OF_POLY_WINDING_ODD
OF_POLY_WINDING_NONZERO
OF_POLY_WINDING_POSITIVE
OF_POLY_WINDING_NEGATIVE
OF_POLY_WINDING_ABS_GEQ_TWO

![ofPath winding modes](winding_modes.gif)

サンプルコード:

~~~~{.cpp}
void testApp::setup(){
	
	path.lineTo(0, 400);
	path.lineTo(400, 400);
	path.lineTo(400, 0);
	path.lineTo(0, 0); // outer
	path.close();
	path.moveTo(100, 100);
	path.lineTo(100, 300);
	path.lineTo(300, 300);
	path.lineTo(300, 100); 
	path.lineTo(100, 100); // inner 1
	path.close();
	path.moveTo(250, 150);
	path.lineTo(150, 150);
	path.lineTo(150, 250);
	path.lineTo(250, 250); 
	path.lineTo(250, 150); // inner 2 (backwards)
	
	
	path2.lineTo(0, 400);
	path2.lineTo(400, 400);
	path2.lineTo(400, 0);
	path2.lineTo(0, 0); // outer
	path2.close();
	path2.moveTo(100, 100);
	path2.lineTo(300, 100);
	path2.lineTo(300, 300);
	path2.lineTo(100, 300); 
	path2.lineTo(100, 100); // inner 1
	path2.close();
	path2.moveTo(150, 150);
	path2.lineTo(250, 150);
	path2.lineTo(250, 250);
	path2.lineTo(150, 250); 
	path2.lineTo(150, 150); // inner 2 (fwds)

}

void testApp::draw(){
	
	ofTranslate(40,40);
	path.draw();
	ofTranslate(410, 0);
	path2.draw();
	
}

void testApp::keyPressed(int key){
	
	mode++;
	if( mode > 4 ) mode = 0;
	
	path.setPolyWindingMode((ofPolyWindingMode) mode);
	path2.setPolyWindingMode((ofPolyWindingMode) mode);

}
~~~~

non zeroとpositiveでは、挙動が違う事が確認出来ます。

![ofPath winding](path_winding.png)



<!----------------------------------------------------------------------------->

###void setFilled(hasFill)

<!--
_syntax: setFilled(hasFill)_
_name: setFilled_
_returns: void_
_returns_description: _
_parameters: bool hasFill_
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


パスがワイヤーフレームとして描画されるか、塗りつぶして描画されるかを指定します。



<!----------------------------------------------------------------------------->

###void setStrokeWidth(width)

<!--
_syntax: setStrokeWidth(width)_
_name: setStrokeWidth_
_returns: void_
_returns_description: _
_parameters: float width_
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


描画線の幅を指定します。
ofPathがワイヤーフレームとして描画される場合以外の時に有効です。



<!----------------------------------------------------------------------------->

###void setColor(&color)

<!--
_syntax: setColor(&color)_
_name: setColor_
_returns: void_
_returns_description: _
_parameters: const ofColor &color_
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


パスの色を指定します。
パスがワイヤーフレームとして描画される場合の描画線色、塗りつぶしとして描画される場合の塗りつぶし色、両方に適用されます。
ofPathインスタンス内全てのサブパスに対して色指定が行われます。



<!----------------------------------------------------------------------------->

###void setHexColor(hex)

<!--
_syntax: setHexColor(hex)_
_name: setHexColor_
_returns: void_
_returns_description: _
_parameters: int hex_
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



パスの色を指定します。
パスがワイヤーフレームとして描画される場合の描画線色、塗りつぶしとして描画される場合の塗りつぶし色、両方に適用されます。
ofPathインスタンス内全てのサブパスに対して色指定が行われます。



<!----------------------------------------------------------------------------->

###void setFillColor(&color)

<!--
_syntax: setFillColor(&color)_
_name: setFillColor_
_returns: void_
_returns_description: _
_parameters: const ofColor &color_
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


パスの塗りつぶし色を指定します。
パスがワイヤーフレームとして描画される場合には、何も効果はありません。



<!----------------------------------------------------------------------------->

###void setFillHexColor(hex)

<!--
_syntax: setFillHexColor(hex)_
_name: setFillHexColor_
_returns: void_
_returns_description: _
_parameters: int hex_
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



パスの塗りつぶし色を指定します。
パスがワイヤーフレームとして描画される場合には、何も効果はありません。



<!----------------------------------------------------------------------------->

###void setStrokeColor(&color)

<!--
_syntax: setStrokeColor(&color)_
_name: setStrokeColor_
_returns: void_
_returns_description: _
_parameters: const ofColor &color_
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



パスの描画線色を指定します。
パスが塗りつぶしとして描画される場合には、何も効果はありません。



<!----------------------------------------------------------------------------->

###void setStrokeHexColor(hex)

<!--
_syntax: setStrokeHexColor(hex)_
_name: setStrokeHexColor_
_returns: void_
_returns_description: _
_parameters: int hex_
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


パスの描画線色を指定します。
パスが塗りつぶしとして描画される場合には、何も効果はありません。



<!----------------------------------------------------------------------------->

###ofPolyWindingMode getWindingMode()

<!--
_syntax: getWindingMode()_
_name: getWindingMode_
_returns: ofPolyWindingMode_
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


現在のpoly winding modeを返します。




<!----------------------------------------------------------------------------->

###bool isFilled()

<!--
_syntax: isFilled()_
_name: isFilled_
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



パスの塗りつぶしが有効か無効かを返します。



<!----------------------------------------------------------------------------->

###ofColor getFillColor()

<!--
_syntax: getFillColor()_
_name: getFillColor_
_returns: ofColor_
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



ofPathが使用している塗り描画色を返します。



<!----------------------------------------------------------------------------->

###ofColor getStrokeColor()

<!--
_syntax: getStrokeColor()_
_name: getStrokeColor_
_returns: ofColor_
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


ofPathが使用している線描画色を返します。




<!----------------------------------------------------------------------------->

###float getStrokeWidth()

<!--
_syntax: getStrokeWidth()_
_name: getStrokeWidth_
_returns: float_
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



描画線の幅を返します。



<!----------------------------------------------------------------------------->

###bool hasOutline()

<!--
_syntax: hasOutline()_
_name: hasOutline_
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

###void draw(x, y)

<!--
_syntax: draw(x, y)_
_name: draw_
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



座標 x, y の位置にパスを描画します。
draw() メソッドを呼ぶと、同時にtessllate() も呼ばれます。



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
_static: no_
_visible: True_
_advanced: False_
-->

_description: _


座標 0, 0 の位置にパスを描画します。
draw() メソッドを呼ぶと、同時にtessllate() も呼ばれます。



<!----------------------------------------------------------------------------->

###ofSubPath getSubPaths()

<!--
_syntax: getSubPaths()_
_name: getSubPaths_
_returns: ofSubPath_
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



ofSubPathインスタンスのベクターデータを返します。
ofPathインスタンス内でofPolylinesを使用している場合は、何も返しません。



<!----------------------------------------------------------------------------->

###ofPolyline getOutline()

<!--
_syntax: getOutline()_
_name: getOutline_
_returns: ofPolyline_
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


ofPathの外形をofPolylineで返します。




<!----------------------------------------------------------------------------->

###ofMesh getTessellation()

<!--
_syntax: getTessellation()_
_name: getTessellation_
_returns: ofMesh_
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

###void simplify(tolerance = 0.3)

<!--
_syntax: simplify(tolerance = 0.3)_
_name: simplify_
_returns: void_
_returns_description: _
_parameters: float tolerance=0.3_
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

###void flagShapeChanged()

<!--
_syntax: flagShapeChanged()_
_name: flagShapeChanged_
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







<!----------------------------------------------------------------------------->

###void setMode(mode)

<!--
_syntax: setMode(mode)_
_name: setMode_
_returns: void_
_returns_description: _
_parameters: Mode mode_
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

###void setCurveResolution(curveResolution)

<!--
_syntax: setCurveResolution(curveResolution)_
_name: setCurveResolution_
_returns: void_
_returns_description: _
_parameters: int curveResolution_
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

###int getCurveResolution()

<!--
_syntax: getCurveResolution()_
_name: getCurveResolution_
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

###void setArcResolution(res)

<!--
_syntax: setArcResolution(res)_
_name: setArcResolution_
_returns: void_
_returns_description: _
_parameters: int res_
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

###int getArcResolution()

<!--
_syntax: getArcResolution()_
_name: getArcResolution_
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

###void setUseShapeColor(useColor)

<!--
_syntax: setUseShapeColor(useColor)_
_name: setUseShapeColor_
_returns: void_
_returns_description: _
_parameters: bool useColor_
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

###bool getUseShapeColor()

<!--
_syntax: getUseShapeColor()_
_name: getUseShapeColor_
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

###void tessellate()

<!--
_syntax: tessellate()_
_name: tessellate_
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







<!----------------------------------------------------------------------------->

###void translate(&p)

<!--
_syntax: translate(&p)_
_name: translate_
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

###void rotate(az, &axis)

<!--
_syntax: rotate(az, &axis)_
_name: rotate_
_returns: void_
_returns_description: _
_parameters: float az, const ofVec3f &axis_
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

###void scale(x, y)

<!--
_syntax: scale(x, y)_
_name: scale_
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


ofPathが保持しているofPolyline, ofSubPath のサイズを変更します。
この変更は、可逆ではありません。つまり、scale(0, 0) を実行するとパスデータは消失します。



<!----------------------------------------------------------------------------->

###ofSubPath lastPath()

<!--
_syntax: lastPath()_
_name: lastPath_
_returns: ofSubPath_
_returns_description: _
_parameters: _
_access: private_
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

###ofPolyline lastPolyline()

<!--
_syntax: lastPolyline()_
_name: lastPolyline_
_returns: ofPolyline_
_returns_description: _
_parameters: _
_access: private_
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

###void generatePolylinesFromPaths()

<!--
_syntax: generatePolylinesFromPaths()_
_name: generatePolylinesFromPaths_
_returns: void_
_returns_description: _
_parameters: _
_access: private_
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



###ofSubPath paths

<!--
_name: paths_
_type: ofSubPath_
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

###ofPolyWindingMode windingMode

<!--
_name: windingMode_
_type: ofPolyWindingMode_
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

###ofColor fillColor

<!--
_name: fillColor_
_type: ofColor_
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

###ofColor strokeColor

<!--
_name: strokeColor_
_type: ofColor_
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

###float strokeWidth

<!--
_name: strokeWidth_
_type: float_
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

###bool bFill

<!--
_name: bFill_
_type: bool_
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

###bool bUseShapeColor

<!--
_name: bUseShapeColor_
_type: bool_
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

###ofPolyline polylines

<!--
_name: polylines_
_type: ofPolyline_
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

###ofPolyline tessellatedContour

<!--
_name: tessellatedContour_
_type: ofPolyline_
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

###ofMesh cachedTessellation

<!--
_name: cachedTessellation_
_type: ofMesh_
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

###bool cachedTessellationValid

<!--
_name: cachedTessellationValid_
_type: bool_
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

###bool hasChanged

<!--
_name: hasChanged_
_type: bool_
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

###int prevCurveRes

<!--
_name: prevCurveRes_
_type: int_
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

###int curveResolution

<!--
_name: curveResolution_
_type: int_
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

###int arcResolution

<!--
_name: arcResolution_
_type: int_
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

###bool bNeedsTessellation

<!--
_name: bNeedsTessellation_
_type: bool_
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

###Mode mode

<!--
_name: mode_
_type: Mode_
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

###ofTessellator tessellator

<!--
_name: tessellator_
_type: ofTessellator_
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

