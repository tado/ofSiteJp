#coding:utf-8

#class ofMesh


<!--
_visible: True_
_advanced: False_
_istemplated: False_
-->

##InlineDescription






##Description

ofMeshは3D空間の頂点と、各頂点の法線・頂点色・テクスチャ座標の集まりを表します。これらのプロパティは、vectorに保持されます。

頂点情報はグラフィックカードに渡され、グラフィックカードはレンダリングパイプラインと呼ばれるプロセスで各頂点間の空間を描画します。レンダリングパイプラインは大体以下のように動作します。

1. 頂点同士の繋ぎ方を決める。
2. 頂点をいくつか作る。
3. 頂点の作成を終了する。

8つ頂点を作れば立方体を作れるのだろう、と思うかもしれません。しかし、実際はそれほど簡単ではありません。OpenGLレンダラーは頂点同士の繋ぎ方を複数用意していますが、どれも8つの頂点だけで立方体を作ってくれるほど賢くありません。

以下のような画像をどこかで見たことはありませんか。

![PRIMATIVES](primitives_new-640x269.gif)

一般的に、これらの中から描画モードを選択してそのwinding規則に沿うように頂点を作らなくてはなりません。頂点はモードのwinding規則によって決められた順番で他の頂点と繋がります。

これにより、求める形状をを作るために、同じ座標に複数の頂点が必要になる場合があります。例えば、立方体の場合は18個の頂点が必要です。8個ではありません。

上図を見ると、各々で頂点の順番の付け方が少しずつ違うことが分かるはずです（特に、GL_TRIANGLE_STRIP）。正しく形状を描画するには、現在どの描画モードを選択しているのかと、その描画モードの頂点の順番を把握する必要があります。

そんな面倒なことを考えずに描画する機能は無いのか？と思うでしょう。そこでメッシュの出番です。メッシュは、単に頂点情報と描画モードを抽象化しただけのものです。一見すると大した物では無いように見えるでしょうが、複雑な形状を扱う際は実に役立ちます。

典型的な使用法は、以下のようなものです。

~~~~{.cpp}
ofMesh mesh;
for (int y = 0; y < height; y++){
	for (int x = 0; x<width; x++){
		mesh.addVertex(ofPoint(x,y,0)); // 頂点を作成する
		mesh.addColor(ofFloatColor(0,0,0));  // 頂点色を設定	}
}

// 正しい形状にするには、各々の頂点を正しく接続しなくてはなりません。
// それは、indices（頂点インデックスリスト）を用いて行われ、以下のように設定できます。
for (int y = 0; y<height-1; y++){
	for (int x=0; x<width-1; x++){
		mesh.addIndex(x+y*width);				// 0
		mesh.addIndex((x+1)+y*width);			// 1
		mesh.addIndex(x+(y+1)*width);			// 10

		mesh.addIndex((x+1)+y*width);			// 1
		mesh.addIndex((x+1)+(y+1)*width);		// 11
		mesh.addIndex(x+(y+1)*width);			// 10
	}
}
~~~~





##Methods



###void addColor(&c)

<!--
_syntax: addColor(&c)_
_name: addColor_
_returns: void_
_returns_description: _
_parameters: const ofFloatColor &c_
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


頂点色をメッシュの頂点色リストの末尾に追加します。頂点色は同じ位置の頂点に関連付けられます。







<!----------------------------------------------------------------------------->

###void addColors(&cols)

<!--
_syntax: addColors(&cols)_
_name: addColors_
_returns: void_
_returns_description: _
_parameters: const vector< ofFloatColor > &cols_
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


頂点色（ofFloatColor）のリストをメッシュの頂点色リストの末尾に追加します。リスト中の各々のofFloatColorが、対応する頂点の頂点色として追加されます。






<!----------------------------------------------------------------------------->

###void addColors(*cols, amt)

<!--
_syntax: addColors(*cols, amt)_
_name: addColors_
_returns: void_
_returns_description: _
_parameters: const ofFloatColor *cols, int amt_
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


頂点色（ofFloatColor）の配列をメッシュの頂点色リストの末尾に追加します。

配列ポインタで指定するので、引数``amt``に配列の要素数をセットする必要があります。







<!----------------------------------------------------------------------------->

###void addIndex(i)

<!--
_syntax: addIndex(i)_
_name: addIndex_
_returns: void_
_returns_description: _
_parameters: ofIndexType i_
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

頂点インデックスを、メッシュの頂点インデックスリストの末尾に追加します。

頂点インデックスは頂点の接続順を表します。頂点インデックスリストとofPrimitiveModeで設定されたプリミティブモードによって、頂点同士の繋ぎ方が決まります。

重要：頂点インデックスリストに同じ頂点を複数回追加することもできます。（同じ頂点が複数の面で使用されることがあるため）

~~~~{.cpp}
    ofMesh mesh;
    mesh.setMode(OF_PRIMITIVE_TRIANGLES);
    mesh.addVertex(ofPoint(0,-200,0));
    mesh.addVertex(ofPoint(200, 0, 0 ));
    mesh.addVertex(ofPoint(-200, 0, 0 ));
    mesh.addVertex(ofPoint(0, 200, 0 ));
    mesh.addIndex(0); //面の最初の頂点v0を
    mesh.addIndex(1); //頂点v1に繋ぎ、
    mesh.addIndex(2); //頂点v2に繋いで面を完成させる
    mesh.addIndex(1); //新しい面を作成。面の最初の頂点v1を
    mesh.addIndex(2); //頂点v2に繋ぎ、
    mesh.addIndex(3); //頂点v3に繋いで面を完成させる
~~~~

上記コードで以下の形状が作成されます。
![image of basic use of indices](index.jpg)







<!----------------------------------------------------------------------------->

###void addIndices(&inds)

<!--
_syntax: addIndices(&inds)_
_name: addIndices_
_returns: void_
_returns_description: _
_parameters: const vector< ofIndexType > &inds_
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

頂点インデックスのリストを頂点インデックスリストの末尾に追加します。







<!----------------------------------------------------------------------------->

###void addIndices(*inds, amt)

<!--
_syntax: addIndices(*inds, amt)_
_name: addIndices_
_returns: void_
_returns_description: _
_parameters: const ofIndexType *inds, int amt_
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


頂点インデックスの配列をメッシュの頂点インデックスリストの末尾に追加します。

配列ポインタで指定するので、引数``amt``に配列の要素数をセットする必要があります。






<!----------------------------------------------------------------------------->

###void addNormal(&n)

<!--
_syntax: addNormal(&n)_
_name: addNormal_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &n_
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


法線（3Dベクトル）をメッシュの法線リストの末尾に追加します（一般的には面に対して垂直なベクトルです）。

法線は、ライティングの際に各々の面がどのように照らされるか等、光に対する反応を決めるベクトルです。

面がどの程度光を反射するかは光の方向と法線の角度に比例し、角度が小さければ面はより明るくなります。

法線の計算方法は、normalExampleを参照して下さい。

addNormalメソッドは、法線リストの末尾に引数の3Dベクトルを追加します。法線を対応する面と同じインデックスに追加したことを確認して下さい。







<!----------------------------------------------------------------------------->

###void addNormals(&norms)

<!--
_syntax: addNormals(&norms)_
_name: addNormals_
_returns: void_
_returns_description: _
_parameters: const vector< ofVec3f > &norms_
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


法線のリストをメッシュの法線リストの末尾に追加します。

複数の法線を一度に追加することができます。








<!----------------------------------------------------------------------------->

###void addNormals(*norms, amt)

<!--
_syntax: addNormals(*norms, amt)_
_name: addNormals_
_returns: void_
_returns_description: _
_parameters: const ofVec3f *norms, int amt_
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

法線の配列をメッシュの法線リストの末尾に追加します。

配列ポインタで指定するので、引数amtに配列の要素数をセットする必要があります。






<!----------------------------------------------------------------------------->

###void addTexCoord(&t)

<!--
_syntax: addTexCoord(&t)_
_name: addTexCoord_
_returns: void_
_returns_description: _
_parameters: const ofVec2f &t_
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


テクスチャ座標（Vec2f）をメッシュテクスチャ座標リストの末尾に追加します。

OFはARBテクスチャを使用しているため、0〜1に正規化された座標ではなくピクセル座標を使用します。








<!----------------------------------------------------------------------------->

###void addTexCoords(&tCoords)

<!--
_syntax: addTexCoords(&tCoords)_
_name: addTexCoords_
_returns: void_
_returns_description: _
_parameters: const vector< ofVec2f > &tCoords_
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


テクスチャ座標のリストをメッシュのテクスチャ座標リストの末尾に追加します。

複数のテクスチャ座標を一度に追加することができます。







<!----------------------------------------------------------------------------->

###void addTexCoords(*tCoords, amt)

<!--
_syntax: addTexCoords(*tCoords, amt)_
_name: addTexCoords_
_returns: void_
_returns_description: _
_parameters: const ofVec2f *tCoords, int amt_
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


テクスチャ座標の配列をメッシュのテクスチャ座標リストの末尾に追加します。

配列ポインタで指定するので、引数amtに配列の要素数をセットする必要があります。







<!----------------------------------------------------------------------------->

###void addTriangle(index1, index2, index3)

<!--
_syntax: addTriangle(index1, index2, index3)_
_name: addTriangle_
_returns: void_
_returns_description: _
_parameters: ofIndexType index1, ofIndexType index2, ofIndexType index3_
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


三つの頂点インデックスを指定することで、指定した三頂点を持つ三角形をメッシュに追加します。

簡単にメッシュに三角形を追加できるメソッドです。








<!----------------------------------------------------------------------------->

###void addVertex(&v)

<!--
_syntax: addVertex(&v)_
_name: addVertex_
_returns: void_
_returns_description: _
_parameters: const ofVec3f &v_
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


メッシュの頂点リストの末尾に頂点を追加します。

頂点インデックスを指定しない場合、頂点を追加する順番によってポリゴンや辺の頂点の繋がり方が決まります。

詳細は、ofMeshのクラス説明を参照して下さい。








<!----------------------------------------------------------------------------->

###void addVertices(&verts)

<!--
_syntax: addVertices(&verts)_
_name: addVertices_
_returns: void_
_returns_description: _
_parameters: const vector< ofVec3f > &verts_
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

頂点のリストをメッシュの頂点リストの末尾に追加します。

複数の頂点を一度に追加することができます。







<!----------------------------------------------------------------------------->

###void addVertices(*verts, amt)

<!--
_syntax: addVertices(*verts, amt)_
_name: addVertices_
_returns: void_
_returns_description: _
_parameters: const ofVec3f *verts, int amt_
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


頂点の配列をメッシュの頂点リストの末尾に追加します。

配列ポインタで指定するので、引数amtに配列の要素数をセットする必要があります。







<!----------------------------------------------------------------------------->

###void append(&mesh)

<!--
_syntax: append(&mesh)_
_name: append_
_returns: void_
_returns_description: _
_parameters: ofMesh &mesh_
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


指定したメッシュの頂点・法線・テクスチャ座標・頂点インデックスのリストをメッシュに追加します。

各リストは、メッシュの各リストの末尾に追加されます。








<!----------------------------------------------------------------------------->

###ofMesh axis(size = 1.0)

<!--
_syntax: axis(size = 1.0)_
_name: axis_
_returns: ofMesh_
_returns_description: _
_parameters: float size=1.0_
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _










_description: _

XYZ座標系を表現するofMeshを返します。






<!----------------------------------------------------------------------------->

###ofMesh box(width, height, depth, resX = 2, resY = 2, resZ = 2)

<!--
_syntax: box(width, height, depth, resX = 2, resY = 2, resZ = 2)_
_name: box_
_returns: ofMesh_
_returns_description: _
_parameters: float width, float height, float depth, int resX=2, int resY=2, int resZ=2_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


直方体のメッシュを返すヘルパーメソッドです。各面は三角形の組み合わせで作られます。

幅・高さ・奥行きの解像度の設定（resX, resY, resZ）は任意（デフォルトは2）です。
~~~~{.cpp}
ofMesh mesh;
mesh = ofMesh::box(200.0, 200.0, 200.0);
~~~~

![image of a simple box](box.jpg)







<!----------------------------------------------------------------------------->

###void clear()

<!--
_syntax: clear()_
_name: clear_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全ての頂点・頂点色・頂点インデックス・テクスチャ座標を削除します。







<!----------------------------------------------------------------------------->

###void clearColors()

<!--
_syntax: clearColors()_
_name: clearColors_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全ての頂点色を削除します。







<!----------------------------------------------------------------------------->

###void clearIndices()

<!--
_syntax: clearIndices()_
_name: clearIndices_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全ての頂点インデックスを削除します。

これにより、メッシュは頂点のみが存在する状態になります。






<!----------------------------------------------------------------------------->

###void clearNormals()

<!--
_syntax: clearNormals()_
_name: clearNormals_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全ての法線を削除します。






<!----------------------------------------------------------------------------->

###void clearTexCoords()

<!--
_syntax: clearTexCoords()_
_name: clearTexCoords_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全てのテクスチャ座標を削除します。






<!----------------------------------------------------------------------------->

###void clearVertices()

<!--
_syntax: clearVertices()_
_name: clearVertices_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの全ての頂点を削除します。






<!----------------------------------------------------------------------------->

###ofMesh cone(radius, height, radiusSegments = 12, heightSegments = 6, capSegments = 2, mode = OF_PRIMITIVE_TRIANGLE_STRIP)

<!--
_syntax: cone(radius, height, radiusSegments = 12, heightSegments = 6, capSegments = 2, mode = OF_PRIMITIVE_TRIANGLE_STRIP)_
_name: cone_
_returns: ofMesh_
_returns_description: _
_parameters: float radius, float height, int radiusSegments=12, int heightSegments=6, int capSegments=2, ofPrimitiveMode mode=OF_PRIMITIVE_TRIANGLE_STRIP_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


円錐のメッシュを返すヘルパーメソッドです。各面は三角形の組み合わせで作られます。

円・高さ・底面の解像度の設定（radiusSegments, heightSegments, capSegments）は任意（円解像度のデフォルトは12、高さ解像度のデフォルトは6、底面解像度のデフォルトは2）です。

有効なモードは、デフォルトのOF_PRIMITIVE_TRIANGLE_STRIPか又はOF_PRIMITIVE_TRIANGLESのみです。
~~~~{.cpp}
ofMesh mesh;
mesh = ofMesh::cone(100.0, 200.0);
~~~~

![image of a simple cone](cone.jpg)







<!----------------------------------------------------------------------------->

###ofMesh cylinder(radius, height, radiusSegments = 12, heightSegments = 6, numCapSegments = 2, bCapped = true, mode = OF_PRIMITIVE_TRIANGLE_STRIP)

<!--
_syntax: cylinder(radius, height, radiusSegments = 12, heightSegments = 6, numCapSegments = 2, bCapped = true, mode = OF_PRIMITIVE_TRIANGLE_STRIP)_
_name: cylinder_
_returns: ofMesh_
_returns_description: _
_parameters: float radius, float height, int radiusSegments=12, int heightSegments=6, int numCapSegments=2, bool bCapped=true, ofPrimitiveMode mode=OF_PRIMITIVE_TRIANGLE_STRIP_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


円柱のメッシュを返すヘルパーメソッドです。各面は三角形の組み合わせで作られます。

円・高さ・底面の解像度の設定（radiusSegments, heightSegments, numCapSegments）は任意（円解像度のデフォルトは12、高さ解像度のデフォルトは6、底面解像度のデフォルトは2）です。底面をつける否かはbCappedで設定できます。

有効なモードは、デフォルトのOF_PRIMITIVE_TRIANGLE_STRIPか又はOF_PRIMITIVE_TRIANGLESのみです。
~~~~{.cpp}
ofMesh mesh;
mesh = ofMesh::cylinder(100.0, 200.0);
~~~~

![image of a simple cylinder](cylinder.jpg)







<!----------------------------------------------------------------------------->

###void disableColors()

<!--
_syntax: disableColors()_
_name: disableColors_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色を無効化します。enableColors()で再度有効化できます。






<!----------------------------------------------------------------------------->

###void disableIndices()

<!--
_syntax: disableIndices()_
_name: disableIndices_
_returns: void_
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


メッシュの頂点インデックスを無効化します。enableIndices()で再度有効化できます。







<!----------------------------------------------------------------------------->

###void disableNormals()

<!--
_syntax: disableNormals()_
_name: disableNormals_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線を無効化します。enableNormals()で再度有効化できます。







<!----------------------------------------------------------------------------->

###void disableTextures()

<!--
_syntax: disableTextures()_
_name: disableTextures_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標を無効化します。enableTextures()で再度有効化できます。








<!----------------------------------------------------------------------------->

###void draw()

<!--
_syntax: draw()_
_name: draw_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


setMode()で設定されたプリミティブモードでメッシュを描画します。

つまり、三角形を用いるプリミティブモードであれば、三角形の組み合わせで描画します。






<!----------------------------------------------------------------------------->

###void draw(renderType)

<!--
_syntax: draw(renderType)_
_name: draw_
_returns: void_
_returns_description: _
_parameters: ofPolyRenderMode renderType_
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


指定されたレンダータイプ（ofPolyRenderMode）でメッシュを描画します。

レンダータイプはsetMode()で設定されたプリミティブモードより優先されます。







<!----------------------------------------------------------------------------->

###void drawFaces()

<!--
_syntax: drawFaces()_
_name: drawFaces_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュを面の集まりとして描画します。







<!----------------------------------------------------------------------------->

###void drawVertices()

<!--
_syntax: drawVertices()_
_name: drawVertices_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュを頂点の集まりとして描画します。

つまり、点のみが描画されます。







<!----------------------------------------------------------------------------->

###void drawWireframe()

<!--
_syntax: drawWireframe()_
_name: drawWireframe_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュを線の集まり（GL_LINES）として描画します。

つまり、ワイヤフレームが描画されます。






<!----------------------------------------------------------------------------->

###void enableColors()

<!--
_syntax: enableColors()_
_name: enableColors_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色を有効化します。disableColors()で無効化できます。

頂点色は、メッシュに追加された時点ではデフォルトで有効化されています。








<!----------------------------------------------------------------------------->

###void enableIndices()

<!--
_syntax: enableIndices()_
_name: enableIndices_
_returns: void_
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


メッシュの頂点インデックスを有効化します。disableIndices()で無効化できます。

頂点インデックスは、メッシュに追加された時点ではデフォルトで有効化されています。








<!----------------------------------------------------------------------------->

###void enableNormals()

<!--
_syntax: enableNormals()_
_name: enableNormals_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線を有効化します。disableNormals()で無効化できます。

法線は、メッシュに追加された時点ではデフォルトで有効化されています。







<!----------------------------------------------------------------------------->

###void enableTextures()

<!--
_syntax: enableTextures()_
_name: enableTextures_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標を有効化します。disableTextures()で無効化できます。

テクスチャ座標は、メッシュに追加された時点ではデフォルトで有効化されています。








<!----------------------------------------------------------------------------->

###ofVec3f getCentroid()

<!--
_syntax: getCentroid()_
_name: getCentroid_
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


メッシュの全頂点の重心を返します。






<!----------------------------------------------------------------------------->

###ofFloatColor getColor(i)

<!--
_syntax: getColor(i)_
_name: getColor_
_returns: ofFloatColor_
_returns_description: _
_parameters: ofIndexType i_
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


指定されたインデックスの頂点色を返します。







<!----------------------------------------------------------------------------->

###vector< ofFloatColor > & getColors()

<!--
_syntax: getColors()_
_name: getColors_
_returns: vector< ofFloatColor > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色リストを返します。

このメソッドはキャッシュを強制的に初期化するので、頂点色を変更する場合のみこのメソッドを使ってください。







<!----------------------------------------------------------------------------->

###const vector< ofFloatColor > & getColors()

<!--
_syntax: getColors()_
_name: getColors_
_returns: const vector< ofFloatColor > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色リストを返します。（読み取り専用）







<!----------------------------------------------------------------------------->

###ofFloatColor * getColorsPointer()

<!--
_syntax: getColorsPointer()_
_name: getColorsPointer_
_returns: ofFloatColor *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色リストの配列ポインタを返します。

このメソッドはキャッシュを強制的に初期化するので、頂点色を変更する場合のみこのメソッドを使ってください。








<!----------------------------------------------------------------------------->

###const ofFloatColor * getColorsPointer()

<!--
_syntax: getColorsPointer()_
_name: getColorsPointer_
_returns: const ofFloatColor *_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色リストの配列ポインタを返します。








<!----------------------------------------------------------------------------->

###vector< int > & getFace(faceId)

<!--
_syntax: getFace(faceId)_
_name: getFace_
_returns: vector< int > &_
_returns_description: _
_parameters: int faceId_
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


指定されたインデックスに対応する、メッシュの面を構成する頂点インデックスのリストを返します。

※ 現在は未実装です。







<!----------------------------------------------------------------------------->

###vector< ofVec3f > getFaceNormals(perVetex = false)

<!--
_syntax: getFaceNormals(perVetex = false)_
_name: getFaceNormals_
_returns: vector< ofVec3f >_
_returns_description: _
_parameters: bool perVetex=false_
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

メッシュの各面の法線のリストを返します。

デフォルトでは面毎の法線のみを返しますが、設定(perVertex = true)により、面を構成する３頂点それぞれの法線を返します（法線のベクトルは3つとも同じです）。








<!----------------------------------------------------------------------------->

###ofIndexType getIndex(i)

<!--
_syntax: getIndex(i)_
_name: getIndex_
_returns: ofIndexType_
_returns_description: _
_parameters: ofIndexType i_
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


指定されたインデックスに対応する頂点インデックスを返します。

各々の頂点インデックスは頂点リスト中の頂点のインデックスを示します。

頂点インデックスは、頂点リストをプリミティブに変換するためにどのような順番で頂点同士を繋げるかを決めます。







<!----------------------------------------------------------------------------->

###ofIndexType * getIndexPointer()

<!--
_syntax: getIndexPointer()_
_name: getIndexPointer_
_returns: ofIndexType *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点インデックスリストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###const ofIndexType * getIndexPointer()

<!--
_syntax: getIndexPointer()_
_name: getIndexPointer_
_returns: const ofIndexType *_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点インデックスリストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###vector< ofIndexType > & getIndices()

<!--
_syntax: getIndices()_
_name: getIndices_
_returns: vector< ofIndexType > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _



メッシュの頂点インデックスリストを返します。

このメソッドはキャッシュを強制的に初期化するので、頂点インデックスを変更する場合のみこのメソッドを使ってください。








<!----------------------------------------------------------------------------->

###const vector< ofIndexType > & getIndices()

<!--
_syntax: getIndices()_
_name: getIndices_
_returns: const vector< ofIndexType > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点インデックスリストを返します。（読み取り専用）







<!----------------------------------------------------------------------------->

###ofMesh getMeshForIndices(startIndex, endIndex)

<!--
_syntax: getMeshForIndices(startIndex, endIndex)_
_name: getMeshForIndices_
_returns: ofMesh_
_returns_description: _
_parameters: int startIndex, int endIndex_
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


指定したインデックス範囲（startIndex〜endIndex）の頂点インデックスリストから新しいメッシュを作成して返します。

新しいメッシュは元のメッシュのモード・頂点色・テクスチャ座標・法線を含みます。







<!----------------------------------------------------------------------------->

###ofMesh getMeshForIndices(startIndex, endIndex, startVertIndex, endVertIndex)

<!--
_syntax: getMeshForIndices(startIndex, endIndex, startVertIndex, endVertIndex)_
_name: getMeshForIndices_
_returns: ofMesh_
_returns_description: _
_parameters: int startIndex, int endIndex, int startVertIndex, int endVertIndex_
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








<!----------------------------------------------------------------------------->

###ofPrimitiveMode getMode()

<!--
_syntax: getMode()_
_name: getMode_
_returns: ofPrimitiveMode_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _

メッシュの現在のプリミティブモードを返します。







<!----------------------------------------------------------------------------->

###ofVec3f getNormal(i)

<!--
_syntax: getNormal(i)_
_name: getNormal_
_returns: ofVec3f_
_returns_description: _
_parameters: ofIndexType i_
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


指定されたインデックスに対応する法線を返します。







<!----------------------------------------------------------------------------->

###vector< ofVec3f > & getNormals()

<!--
_syntax: getNormals()_
_name: getNormals_
_returns: vector< ofVec3f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線リストを返します。

このメソッドはキャッシュを強制的に初期化するので、法線を変更する場合のみこのメソッドを使ってください。






<!----------------------------------------------------------------------------->

###const vector< ofVec3f > & getNormals()

<!--
_syntax: getNormals()_
_name: getNormals_
_returns: const vector< ofVec3f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線リストを返します。（読み取り専用）







<!----------------------------------------------------------------------------->

###ofVec3f * getNormalsPointer()

<!--
_syntax: getNormalsPointer()_
_name: getNormalsPointer_
_returns: ofVec3f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線リストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###const ofVec3f * getNormalsPointer()

<!--
_syntax: getNormalsPointer()_
_name: getNormalsPointer_
_returns: const ofVec3f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線リストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###int getNumColors()

<!--
_syntax: getNumColors()_
_name: getNumColors_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点色リストの要素数を返します。

メッシュが持つ頂点色の数を調べることができます。







<!----------------------------------------------------------------------------->

###int getNumIndices()

<!--
_syntax: getNumIndices()_
_name: getNumIndices_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点インデックスリストの要素数を返します。

メッシュが持つ頂点インデックスの数を調べることができます。








<!----------------------------------------------------------------------------->

###int getNumNormals()

<!--
_syntax: getNumNormals()_
_name: getNumNormals_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線リストの要素数を返します。

メッシュが持つ法線の数を調べることができます。







<!----------------------------------------------------------------------------->

###int getNumTexCoords()

<!--
_syntax: getNumTexCoords()_
_name: getNumTexCoords_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標リストの要素数を返します。

メッシュが持つテクスチャ座標の数を調べることができます。







<!----------------------------------------------------------------------------->

###int getNumVertices()

<!--
_syntax: getNumVertices()_
_name: getNumVertices_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点リストの要素数を返します。

メッシュが持つ頂点の数を調べることができます。








<!----------------------------------------------------------------------------->

###ofVec2f getTexCoord(i)

<!--
_syntax: getTexCoord(i)_
_name: getTexCoord_
_returns: ofVec2f_
_returns_description: _
_parameters: ofIndexType i_
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


指定されたインデックスに対応するテクスチャ座標を返します。

OFはARBテクスチャを使用しているため、0〜1に正規化された座標ではなくピクセル座標を返します。








<!----------------------------------------------------------------------------->

###vector< ofVec2f > & getTexCoords()

<!--
_syntax: getTexCoords()_
_name: getTexCoords_
_returns: vector< ofVec2f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標リストを返します。

OFはARBテクスチャを使用しているため、0〜1に正規化された座標ではなくピクセル座標を返します。

このメソッドはキャッシュを強制的に初期化するので、テクスチャ座標を変更する場合のみこのメソッドを使ってください。








<!----------------------------------------------------------------------------->

###const vector< ofVec2f > & getTexCoords()

<!--
_syntax: getTexCoords()_
_name: getTexCoords_
_returns: const vector< ofVec2f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _



メッシュのテクスチャ座標リストを返します（読み取り専用）。

OFはARBテクスチャを使用しているため、0〜1に正規化された座標ではなくピクセル座標を返します。







<!----------------------------------------------------------------------------->

###ofVec2f * getTexCoordsPointer()

<!--
_syntax: getTexCoordsPointer()_
_name: getTexCoordsPointer_
_returns: ofVec2f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標リストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###const ofVec2f * getTexCoordsPointer()

<!--
_syntax: getTexCoordsPointer()_
_name: getTexCoordsPointer_
_returns: const ofVec2f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _



メッシュのテクスチャ座標リストの配列ポインタを返します。








<!----------------------------------------------------------------------------->

###const vector< ofMeshFace > & getUniqueFaces()

<!--
_syntax: getUniqueFaces()_
_name: getUniqueFaces_
_returns: const vector< ofMeshFace > &_
_returns_description: _
_parameters: _
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


メッシュを構成するofMeshFaceのリスト（重複無し）を返します。







<!----------------------------------------------------------------------------->

###ofVec3f getVertex(i)

<!--
_syntax: getVertex(i)_
_name: getVertex_
_returns: ofVec3f_
_returns_description: _
_parameters: ofIndexType i_
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


インデックスに対応する頂点を返します。







<!----------------------------------------------------------------------------->

###vector< ofVec3f > & getVertices()

<!--
_syntax: getVertices()_
_name: getVertices_
_returns: vector< ofVec3f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点リストを返します。







<!----------------------------------------------------------------------------->

###const vector< ofVec3f > & getVertices()

<!--
_syntax: getVertices()_
_name: getVertices_
_returns: const vector< ofVec3f > &_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点リストを返します。








<!----------------------------------------------------------------------------->

###ofVec3f * getVerticesPointer()

<!--
_syntax: getVerticesPointer()_
_name: getVerticesPointer_
_returns: ofVec3f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0.8.0_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点リストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###const ofVec3f * getVerticesPointer()

<!--
_syntax: getVerticesPointer()_
_name: getVerticesPointer_
_returns: const ofVec3f *_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点リストの配列ポインタを返します。







<!----------------------------------------------------------------------------->

###bool hasColors()

<!--
_syntax: hasColors()_
_name: hasColors_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュが頂点色を持つか否かを返します。







<!----------------------------------------------------------------------------->

###bool hasIndices()

<!--
_syntax: hasIndices()_
_name: hasIndices_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュが頂点インデックスを持つか否かを返します。







<!----------------------------------------------------------------------------->

###bool hasNormals()

<!--
_syntax: hasNormals()_
_name: hasNormals_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュが法線を持つか否かを返します。







<!----------------------------------------------------------------------------->

###bool hasTexCoords()

<!--
_syntax: hasTexCoords()_
_name: hasTexCoords_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュがテクスチャ座標を持つか否かを返します。






<!----------------------------------------------------------------------------->

###bool hasVertices()

<!--
_syntax: hasVertices()_
_name: hasVertices_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュが頂点を持つか否かを返します。







<!----------------------------------------------------------------------------->

###bool haveColorsChanged()

<!--
_syntax: haveColorsChanged()_
_name: haveColorsChanged_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _



メッシュの頂点色が変更・追加・削除されたか否かを返します。







<!----------------------------------------------------------------------------->

###bool haveIndicesChanged()

<!--
_syntax: haveIndicesChanged()_
_name: haveIndicesChanged_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点インデックスが変更・追加・削除されたか否かを返します。







<!----------------------------------------------------------------------------->

###bool haveNormalsChanged()

<!--
_syntax: haveNormalsChanged()_
_name: haveNormalsChanged_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの法線が変更・追加・削除されたか否かを返します。







<!----------------------------------------------------------------------------->

###bool haveTexCoordsChanged()

<!--
_syntax: haveTexCoordsChanged()_
_name: haveTexCoordsChanged_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのテクスチャ座標が変更・追加・削除されたか否かを返します。







<!----------------------------------------------------------------------------->

###bool haveVertsChanged()

<!--
_syntax: haveVertsChanged()_
_name: haveVertsChanged_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュの頂点が変更・追加・削除されたか否かを返します。







<!----------------------------------------------------------------------------->

###ofMesh icosahedron(radius)

<!--
_syntax: icosahedron(radius)_
_name: icosahedron_
_returns: ofMesh_
_returns_description: _
_parameters: float radius_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###ofMesh icosphere(radius, iterations = 2)

<!--
_syntax: icosphere(radius, iterations = 2)_
_name: icosphere_
_returns: ofMesh_
_returns_description: _
_parameters: float radius, int iterations=2_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###void load(path)

<!--
_syntax: load(path)_
_name: load_
_returns: void_
_returns_description: _
_parameters: string path_
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


指定したパスのファイルからメッシュ情報を読み込みます。

これにより、メッシュの既存情報が全て上書きされます。

ファイルは[PLY Format](http://en.wikipedia.org/wiki/PLY_(file_format))で記述されている必要があります。また、PLY ASCIIフォーマットのみサポートしています（バイナリフォーマットはサポートしていません）。







<!----------------------------------------------------------------------------->

###void mergeDuplicateVertices()

<!--
_syntax: mergeDuplicateVertices()_
_name: mergeDuplicateVertices_
_returns: void_
_returns_description: _
_parameters: _
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








<!----------------------------------------------------------------------------->

### ofMesh()

<!--
_syntax: ofMesh()_
_name: ofMesh_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュをOF_PRIMITIVE_TRIANGLESモードで作成します（初期状態では頂点を持ちません）。






<!----------------------------------------------------------------------------->

### ofMesh(mode, &verts)

<!--
_syntax: ofMesh(mode, &verts)_
_name: ofMesh_
_returns: _
_returns_description: _
_parameters: ofPrimitiveMode mode, const vector< ofVec3f > &verts_
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


メッシュを指定したプリミティブモード（OF_PRIMITIVE_TRIANGLES, OF_PRIMITIVE_TRIANGLE_STRIP, OF_PRIMITIVE_TRIANGLE_FAN, OF_PRIMITIVE_LINES, OF_PRIMITIVE_LINE_STRIP, OF_PRIMITIVE_LINE_LOOP, OF_PRIMITIVE_POINTS）で作成します。

モードの詳細は、[ofGLUtils](../gl/ofGLUtils.htm)を参照してください。

また、頂点リストvertsをメッシュの初期状態の頂点リストとして設定します。








<!----------------------------------------------------------------------------->

###ofMesh plane(width, height, columns = 2, rows = 2, mode = OF_PRIMITIVE_TRIANGLE_STRIP)

<!--
_syntax: plane(width, height, columns = 2, rows = 2, mode = OF_PRIMITIVE_TRIANGLE_STRIP)_
_name: plane_
_returns: ofMesh_
_returns_description: _
_parameters: float width, float height, int columns=2, int rows=2, ofPrimitiveMode mode=OF_PRIMITIVE_TRIANGLE_STRIP_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###void removeColor(index)

<!--
_syntax: removeColor(index)_
_name: removeColor_
_returns: void_
_returns_description: _
_parameters: ofIndexType index_
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


指定したインデックスの頂点色を削除します。







<!----------------------------------------------------------------------------->

###void removeIndex(index)

<!--
_syntax: removeIndex(index)_
_name: removeIndex_
_returns: void_
_returns_description: _
_parameters: ofIndexType index_
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


指定したインデックスの頂点インデックスを削除します。







<!----------------------------------------------------------------------------->

###void removeNormal(index)

<!--
_syntax: removeNormal(index)_
_name: removeNormal_
_returns: void_
_returns_description: _
_parameters: ofIndexType index_
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


指定したインデックスの法線を削除します。







<!----------------------------------------------------------------------------->

###void removeTexCoord(index)

<!--
_syntax: removeTexCoord(index)_
_name: removeTexCoord_
_returns: void_
_returns_description: _
_parameters: ofIndexType index_
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


指定したインデックスのテクスチャ座標を削除します。







<!----------------------------------------------------------------------------->

###void removeVertex(index)

<!--
_syntax: removeVertex(index)_
_name: removeVertex_
_returns: void_
_returns_description: _
_parameters: ofIndexType index_
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


指定したインデックスの頂点を削除します。







<!----------------------------------------------------------------------------->

###void save(path, useBinary = false)

<!--
_syntax: save(path, useBinary = false)_
_name: save_
_returns: void_
_returns_description: _
_parameters: string path, bool useBinary=false_
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


指定されたパスにメッシュを[PLY Format](http://en.wikipedia.org/wiki/PLY_(file_format))で保存します。

PLYにはバイナリフォーマットとASCIIフォーマットの二種類のフォーマットオプションた用意されています。デフォルトでは、ASCIIフォーマットで保存します。``useBinary``引数に``true``をセットすることで、バイナリフォーマットで保存されます。

もしメッシュを再度ofMeshに読み込む場合、現在はASCIIフォーマットの読み込みしかサポートされていません。

さらに詳しい情報は、[PLY format specification](http://paulbourke.net/dataformats/ply/)を参照してください。







<!----------------------------------------------------------------------------->

###void setColor(index, &c)

<!--
_syntax: setColor(index, &c)_
_name: setColor_
_returns: void_
_returns_description: _
_parameters: ofIndexType index, const ofFloatColor &c_
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


指定したインデックスの頂点色に``c``をセットします。







<!----------------------------------------------------------------------------->

###void setColorForIndices(startIndex, endIndex, color)

<!--
_syntax: setColorForIndices(startIndex, endIndex, color)_
_name: setColorForIndices_
_returns: void_
_returns_description: _
_parameters: int startIndex, int endIndex, ofColor color_
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








<!----------------------------------------------------------------------------->

###void setFromTriangles(&tris, bUseFaceNormal = false)

<!--
_syntax: setFromTriangles(&tris, bUseFaceNormal = false)_
_name: setFromTriangles_
_returns: void_
_returns_description: _
_parameters: const vector< ofMeshFace > &tris, bool bUseFaceNormal=false_
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








<!----------------------------------------------------------------------------->

###void setIndex(index, val)

<!--
_syntax: setIndex(index, val)_
_name: setIndex_
_returns: void_
_returns_description: _
_parameters: ofIndexType index, ofIndexType val_
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


指定したインデックスの頂点インデックスに``i``をセットします。







<!----------------------------------------------------------------------------->

###void setMode(mode)

<!--
_syntax: setMode(mode)_
_name: setMode_
_returns: void_
_returns_description: _
_parameters: ofPrimitiveMode mode_
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


メッシュのプリミティブモードを設定します。

有効なモードは、OF_PRIMITIVE_TRIANGLES, OF_PRIMITIVE_TRIANGLE_STRIP, OF_PRIMITIVE_TRIANGLE_FAN, OF_PRIMITIVE_LINES, OF_PRIMITIVE_LINE_STRIP, OF_PRIMITIVE_LINE_LOOP, OF_PRIMITIVE_POINTSです。







<!----------------------------------------------------------------------------->

###void setNormal(index, &n)

<!--
_syntax: setNormal(index, &n)_
_name: setNormal_
_returns: void_
_returns_description: _
_parameters: ofIndexType index, const ofVec3f &n_
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








<!----------------------------------------------------------------------------->

###void setTexCoord(index, &t)

<!--
_syntax: setTexCoord(index, &t)_
_name: setTexCoord_
_returns: void_
_returns_description: _
_parameters: ofIndexType index, const ofVec2f &t_
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








<!----------------------------------------------------------------------------->

###void setVertex(index, &v)

<!--
_syntax: setVertex(index, &v)_
_name: setVertex_
_returns: void_
_returns_description: _
_parameters: ofIndexType index, const ofVec3f &v_
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








<!----------------------------------------------------------------------------->

###void setupIndicesAuto()

<!--
_syntax: setupIndicesAuto()_
_name: setupIndicesAuto_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: _
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _


頂点を追加した後にこのメソッドを呼ぶと、自動的に頂点インデックスが設定されます。







<!----------------------------------------------------------------------------->

###void smoothNormals(angle)

<!--
_syntax: smoothNormals(angle)_
_name: smoothNormals_
_returns: void_
_returns_description: _
_parameters: float angle_
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








<!----------------------------------------------------------------------------->

###ofMesh sphere(radius, res = 12, mode = OF_PRIMITIVE_TRIANGLE_STRIP)

<!--
_syntax: sphere(radius, res = 12, mode = OF_PRIMITIVE_TRIANGLE_STRIP)_
_name: sphere_
_returns: ofMesh_
_returns_description: _
_parameters: float radius, int res=12, ofPrimitiveMode mode=OF_PRIMITIVE_TRIANGLE_STRIP_
_access: public_
_version_started: 0073_
_version_deprecated: _
_summary: _
_constant: False_
_static: True_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###bool usingColors()

<!--
_syntax: usingColors()_
_name: usingColors_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###bool usingIndices()

<!--
_syntax: usingIndices()_
_name: usingIndices_
_returns: bool_
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








<!----------------------------------------------------------------------------->

###bool usingNormals()

<!--
_syntax: usingNormals()_
_name: usingNormals_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

###bool usingTextures()

<!--
_syntax: usingTextures()_
_name: usingTextures_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _








_description: _








<!----------------------------------------------------------------------------->

### ~ofMesh()

<!--
_syntax: ~ofMesh()_
_name: ~ofMesh_
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








<!----------------------------------------------------------------------------->

##Variables



###bool bColorsChanged

<!--
_name: bColorsChanged_
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

###bool bFacesDirty

<!--
_name: bFacesDirty_
_type: bool_
_access: private_
_version_started: 0073_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###bool bIndicesChanged

<!--
_name: bIndicesChanged_
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

###bool bNormalsChanged

<!--
_name: bNormalsChanged_
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

###bool bTexCoordsChanged

<!--
_name: bTexCoordsChanged_
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

###bool bVertsChanged

<!--
_name: bVertsChanged_
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

###ofFloatColor colors

<!--
_name: colors_
_type: ofFloatColor_
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

###ofMeshFace faces

<!--
_name: faces_
_type: ofMeshFace_
_access: private_
_version_started: 0073_
_version_deprecated: _
_summary: _
_visible: True_
_constant: False_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###ofIndexType indices

<!--
_name: indices_
_type: ofIndexType_
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

###ofPrimitiveMode mode

<!--
_name: mode_
_type: ofPrimitiveMode_
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

###ofVec3f normals

<!--
_name: normals_
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








<!----------------------------------------------------------------------------->

###ofVec2f texCoords

<!--
_name: texCoords_
_type: ofVec2f_
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

###bool useColors

<!--
_name: useColors_
_type: bool_
_access: private_
_version_started: 0071_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###bool useIndices

<!--
_name: useIndices_
_type: bool_
_access: private_
_version_started: 0072_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###bool useNormals

<!--
_name: useNormals_
_type: bool_
_access: private_
_version_started: 0071_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###bool useTextures

<!--
_name: useTextures_
_type: bool_
_access: private_
_version_started: 0071_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###ofVec3f vertices

<!--
_name: vertices_
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








<!----------------------------------------------------------------------------->
