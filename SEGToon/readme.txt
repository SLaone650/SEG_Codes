パラメータ
	Base
		BaseColor：カラーピッカーです。
		UseTexture：テクスチャのON/OFFです。
		BaseTexture：テクスチャファイルです。

	Shadow
		Shadow Switch：影のON/OFFです。
		shade color　  ：影色です。
		Toon Map　　 ：トーンマップです。AiToonのTonemapと近い挙動しますがまだ影が１段階しか入りません。
		Smooth	　：影の境目をぼかします。
		ShadowMaskSwitch：ShadowMaskのON/OFFです。
		ShadowMaskTexture：影をマスクすることが出来ます。
		UVSwitch（修正予定）：ビルボードのような感じでマスクすることが出来ます。

	Outline
		Outline	：アウトラインのON/OFFです。
		OutlineColor	：アウトラインの色です。
		Opacity Value：アウトラインアルファです。
	OpacityLayerSwitch：アウトラインマスクのON/OFFです。背面法なのでUVが参照されます。
		OpacityMask：アウトラインのマスクファイルです。
		MaskInvert　：OpacityMaskのアルファ情報を反転します。
		gOpacityOffset：（未実装です。）

※フレネルはFrasnelとShadowFrasnelがありますが色の乗り方は同じです。
	Frasnel
		Use Frasnel	：フレネルのON/OFFです。
		Invert		：フレネルを反転します。
		FrasnelMask ：フレネルマスクのON/OFFです。
		Frasnel Texture：フレネルマスクのマスクファイルです。
		Frasnel Color：フレネルのカラーです
		ReflectFraction：フレネルのウェイトのような感じです。
		Base Reflect ：フレネルがかかっていないところのウェイトです。
		
		gFrasnelToonSwitch
			テスト実装です。フレネルをトゥーン化します。

※Parallaxは視差マップです。法線方向に押し出したものにフレネルとテクスチャでマスクして使うことを前提としています。
	Parallax
		ReflectFraction：フレネルのウェイトのような感じです。
		Base Reflect ：フレネルがかかっていないところのウェイトです。
		use Parallax  ：パララックスのON/OFFです。
		use Inside Alpha：マスクのON/OFFです。基本的にONで使います。
	InsideAlpha Texture：マスクファイルです。
		OffsetNormal：視差マップのウェイトです。値が大きいとより手前に、大きく動きます。
		Contrast　　：フレネルのぼかし具合です。
		Invert		：マスクテクスチャの反転です。


#maked : Seg_Other
#Gmail: seg4r8other@gmail.com
#2024/11/01


				
Parameter
Base
BaseColor: Color picker.
UseTexture: Texture ON/OFF.
BaseTexture: Texture file.

Shadow
Shadow Switch: Shadow ON/OFF.
Shade color ：Shade color.
Toon Map ：Tone map, similar to AiToon's Tonemap, but only one level of shadow is added.
Smooth ：Blur the border of the shadow.
ShadowMaskSwitch: ShadowMask ON/OFF.
ShadowMaskTexture: Shadow mask can be used to mask the shadow.
UVSwitch (to be fixed): Masks shadows like billboards.

Outline
Outline ：Outline ON/OFF.
OutlineColor ：Outline color.
Opacity Value ：Outline alpha.
OpacityLayerSwitch：On/Off for the outline mask. UV is referenced since it is a back surface method.
OpacityMask：Outline mask file.
MaskInvert ：Inverts the alpha information of OpacityMask.
gOpacityOffset: (Not implemented yet.)


*Fresnel is available in Frasnel and ShadowFrasnel, but the color ride is the same.
Frasnel
Use Frasnel ：Turns Fresnel ON/OFF.
Invert ：Invert Fresnel.
FrasnelMask ：Fresnel mask ON/OFF.
Frasnel Texture: Mask file for the Fresnel mask.
Frasnel Color：Fresnel color.
ReflectFraction ：It is like a Fresnel weight.
Base Reflect ： It is the weight of the area where Fresnel is not applied.

gFrasnelToonSwitch
This is a test implementation. Toons the Fresnel.

Parallax is a parallax map. It is assumed to be used by masking Fresnel and texture on the extruded normal direction.
Parallax
ReflectFraction: It is like a weight of Fresnel.
Base Reflect ： Weight of the area where Fresnel is not applied.
use Parallax ： Parallax ON/OFF.
use Inside Alpha: Mask ON/OFF. Basically, it is used with ON.
InsideAlpha Texture：Mask file.
OffsetNormal：Weight of parallax map. The larger the value, the more it moves to the front.
Contrast ： Fresnel blur.
Invert ：Invert mask texture.


#maked : Seg_Other
#Gmail: seg4r8other@gmail.com
#2024/11/01