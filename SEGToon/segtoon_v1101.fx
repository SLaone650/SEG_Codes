float4x4 gWVP : WorldViewProjection ; 
float4x4 gW : World; 
float4x4 gWIT : WorldInverseTranspose;
float4x4 gVP : ViewProjection ;
float4x4 gVI : ViewInverse;

uniform SamplerState Sampler_Wrap {
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = WRAP; 
    AddressV = WRAP;
};

 //Light
float3 gLight0Dir : DIRECTION <
    string Object = "Light 0";
    string UIName = "Light 0 Direction";
    string Space = "World";
    int UIOrder = 200;
>;

//teststruct

uniform float3 gNormalColor<
    string UIName = "BaseColor";
    string UIWidget = "ColorPicker";
    int UIOrder = 0 ; 
    string UIGroup = "Base";

> = {0.5,0.5,0.5};

uniform float3 gShadeColor < 
    string UIName = "shade color ";
    int UIOrder = 11;
    string UIWidget = "ColorPicker";
    string UIGroup = "Shadow";
> = {0.2,0.2,0.2};



uniform Texture2D gNormalColorTexture <
    string UIName =  "Base Texture";
    string UIWidget = "FilePicker";
    int UIOrder = 3; 
    string UIGroup = "Base";
>;

/*
uniform Texture2D gShaderColorTexture < 
    string UIName = "Shadow Texture";
    string UIWidget = "FilePicker";
    string UIGroup = "Shadow";

    int UIOrder = 13;
>;
*/




//bool

uniform bool gusetexture < 
    string UIName = "Use Texture";
    int UIOrder = 2;
    string UIGroup = "Base";
> = false ;
/*
uniform bool guseshadetexture < 
    string UIName = "Use ShadeTexture";
    int UIOrder = 12;
    string UIGroup = "Shadow";
> = false ;
*/


//hensuu
uniform bool gShadowSwitch<
    string UIName = "Shadow Switch";
    string UIGroup = "Shadow";
    int UIOrder = 10;
> = true;

uniform float gToonThreshold <
    string UIName = "Toon Map";
    float UIMax = 1.0;
    float UIMin = -1.0;
    float UIStep = 0.01;
    int UIOrder = 14 ;
    string UIGroup = "Shadow";
> = 0.5; 

uniform float gToonSmooth <
    string UIName ="Smooth";
    string UIGroup ="Shadow";
    float UISoftMax = 1.0;
    float UISoftMin = 0.0;
    int UIOrder = 16;

> = 0.0;

uniform bool gShadowMaskSwitch <
    string UIName = "Shadow Mask Switch";
    string UIGroup = "Shadow";
    int UIOrder = 17;
> = false;

uniform Texture2D gShadowMaskTex<
    string UIName = "Shadow Mask Texture";
    string UIGroup ="Shadow";
    int UIOrder =18;
    string UIWidget = "FiilePicker";

>;

uniform bool gUVSwitch <
    string UIName ="UVSwitch";
    string UIGroup = "Shadow";
    int UIOrder = 20;
> = false;

uniform bool gUseNormal<
    string UIGroup = "Outline";
    string UIName ="Outline";
    int UIOrder = 20;
> = true;

uniform float gNormalLength <
    string UIGroup ="Outline";
    string UIName = "FaceNormal";
    int UIOrder= 21;

> = 0.1;

uniform float3 gOutlineColor<
    string UIWidget ="ColorPicker";
    string UIGroup ="Outline";
    string UIName = "Outline Color";
    int UIOrder =22;
> = {0.0,0.0,0.0};


//float gvdn = max(0.0,dot(VS_TO_PS.View,VS_TO_PS.Normal));

//フレネル

float schlick_frasnel(float f0, float vdn ,float exp)
{
    return f0 + (1.0 - f0)*pow(1.0 - vdn, exp);
    // vdn = max(0.0,dot(In.View,In.Normal));
}

/*
float schlick_vdn (float3 v,float3 n){

    return max(0.0,dot(v,n));

}*/

uniform float f0<
    string UIName = "Reflect Fraction";
    int UIOrder = 48;
    float UIStep = 0.01 ;
    string UIGroup= "Frasnel";
    float UISoftMin = 0.0;

    
> = 0.00;


uniform float exponent<
    string UIName = "Base Reflect";
    int UIOrder = 48;
    int UISoftMin = 0;
    int UISoftMax= 10;
    float UIStep = 0.01;
    string UIGroup ="Frasnel";

> = 0.5;

uniform bool gUseFrasnelMask<
    string UIName = "FrasnelMask";//+value
    string UIGroup = "Frasnel";
    int UIOrder = 45;

> = false;

uniform Texture2D gFrasnelTexture <
    string UIWidget = "FilePicker";
    string UIName ="Franel Texture";
    int UIOrder = 46 ;
    string UIGroup ="Frasnel";
>;

uniform bool gInvertFrasnel<
    string UIName = "Invert";
    string UIGroup = "Frasnel";
    int UIOrder = 41;
> = false;

uniform bool gfrasnelswitch<
    string UIName ="Use Frasnel";
    int UIOrder = 40 ;
    string UIGroup = "Frasnel";
> = false ;

uniform float gFrasnelAlpha<
    string UIName ="Frasnel Alpha";
    string UIGroup = "Frasnel";
    int UIOrder =43 ;
> = 1.0;
/*
uniform int gLayerFrasnel<
    string UIName = "Layer";
    string UIGroup = "Frasnel";
> = 41;
*/
uniform float3 gFrasnelColor<
    string UIName ="Frasnel Color";
    string UIWidget ="ColorPicker";
    string UIGroup ="Frasnel";
    int UIOrder = 47; 
> = {0.0,0.0,0.0};

uniform bool gFrasnelToonSwitch <
    string UIname = "ToonSwitch";
    string UIGroup = "Frasnel";
    int UIOrder = 49;
> = false;

uniform float gFrasnelToonSmooth<
    string UIName ="FrasnelSmooth";
    string UIGroup = "Frasnel";
    float UIStep = 0.01;
    int UIOrder = 49;
> = 0.0;


//Frasnel Shadow
uniform float Sf0<
    string UIName = "Reflect Fraction";
    int UIOrder = 58;
    float UIStep = 0.01 ;
    string UIGroup= "SFrasnel";
> = 0.00;


uniform float Sexponent<
    string UIName = "Base Reflect";
    int UIOrder = 59;
    int UISoftMin = 0;
    int UISoftMax= 10;
    float UIStep = 0.01;
    string UIGroup ="SFrasnel";

> = 0.5;

uniform bool gUseSFrasnel<
    string UIName = "ShadowFrasnel";
    string UIGroup ="SFrasnel";
    int UIOrder = 50;
> = false;

uniform bool gUseSFrasnelMask<
    string UIName = "ShadowFrasnelMask";//+value
    string UIGroup = "SFrasnel";
    int UIOrder = 55;

> = false;

uniform Texture2D gSFrasnelTexture <
    string UIWidget = "FilePicker";
    string UIName ="ShadowFranelTexture";
    int UIOrder = 56 ;
    string UIGroup ="SFrasnel";
>;

uniform bool gInvertSFrasnel<
    string UIName = "Invert";
    string UIGroup = "SFrasnel";
    int UIOrder = 51;
> = false;

uniform float gSFrasnelAlpha<
    string UIName ="Frasnel Alpha";
    string UIGroup = "Frasnel";
    int UIOrder =53 ;
> = 1.0;

uniform bool gSFrasnelTextureInvert<
    string UIGroup = "SFrasnel";
    string UIName = "Invert Texture";
    int UIOrder =57;
> = false;

uniform float3 gSFrasnelColor<
    string UIName ="Frasnel Color";
    string UIWidget ="ColorPicker";
    string UIGroup ="SFrasnel";
    int UIOrder = 57; 
> = {1.0,1.0,1.0};

//#############################

uniform bool guseOpacityLayer <
    string UIName = "Opacity Layer Switch";
    int UIOrder = 100 ;
    string UIGroup = "Outline";
> = false;

uniform float3 gOpacityOffset<
    string UIname = "Opacity Offset";
    string UIGroup = "Outline";
    int UIOrder = 102;

> = 0.0;

uniform float gOpas<
    string UIName ="Opacity Value";
    string UIGroup = "Outline";
    int UIOrder = 99;

> = 1.0;

uniform Texture2D gOpacityTexture<
    string UIName = "Opacity Mask";
    string UIGroup = "Outline";
    int UIOrder =101;
>;

uniform bool gOpacityInvert<
    string UIName = "Mask Invert";
    string UIGroup = "Outline";
    int UIOrder = 102;
> = false;

/*
uniform bool gInsideMaskSwitch<
    string UIName ="Inside Mask";
    string UIGroup ="Outline";
    int UIOrder = 103;
> = false;
uniform bool gInsideMaskInvert<
    string UIName = "Inside Mask Invert";
    string UIGroup ="Outline";
    int UIOrder =104;
> = false;
uniform float gInsideMaskValue<
    string UIName ="MaskValue";
    string UIGroup ="Outline";
    int UIOrder = 104;

> = 0.0;
uniform float gOFrasnelAlpha<
    string UIName ="Frasnel Alpha";
    string UIGroup = "Outline";
    int UIOrder =1999 ;
> = 1.0;
uniform float Of0<
    string UIName = "Reflect Fraction";
    int UIOrder = 2000;
    float UIStep = 0.01 ;
    string UIGroup= "Outline";
    float UISoftMin = 0.0;
> = 0.00;
uniform float Oexponent<
    string UIName = "Base Reflect";
    int UIOrder = 2000;
    int UISoftMin = 0;
    int UISoftMax= 10;
    float UIStep = 0.01;
    string UIGroup ="Outline";
> = 0.5;
*/

uniform bool guseInside<
    string UIName = "use Parallax";
    string UIGroup ="Parallax";
    int UIOrder =999;

> = false;

uniform bool guseInsideAlpha<
    string UIName = "use Inside Alpha";
    string UIGroup ="Parallax";
    int UIOrder =999;

> = true;

uniform Texture2D gInsideAlpha<
    string UIName ="Inside Alpha Texture";
    string UIGroup = "Parallax";
    int UIOrder =1000;
>;

uniform float gInsideOffset<
    string UIName = "Offset Normal";
    string UIGroup = "Parallax";
    int UIOrder = 1001;

> = 0.17;

uniform float If0<
    string UIName = "Reflect Fraction";
    int UIOrder = 58;
    float UIStep = 0.01 ;
    string UIGroup= "Parallax";
> = 0.00;


uniform float Iexponent<
    string UIName = "Base Reflect";
    int UIOrder = 58;
    int UISoftMin = 0;
    int UISoftMax= 10;
    float UIStep = 0.01;
    string UIGroup ="Parallax";

> = 0.5;

uniform float ITransToon<
    string UIName = "Contrast";
    string UIGroup ="Parallax";
    int UIOrder =1010;

> = 0.5;

uniform bool IInv<
    string UIName = "Invert";
    string UIGroup = "Parallax";
    int UIOrder = 1012;
> = false;
//################
struct VS_INPUT {
    float3 Pos : POSITION;
    float4 Normal : NORMAL;
    float2 UV : TEXCOORD0;
    float4 VertexColor : COLOR0;
};

struct VS_TO_PS {
    float4 HPos:SV_Position;
    float4 Normal : NORMAL;
    float3 View : TEXCOORD1;
    float2 UV : TEXCOORD0; 
    float4 VertexColor : COLOR0;
};

uniform float atai = 1.0;


VS_TO_PS VS(VS_INPUT In){

    VS_TO_PS Out;
    float4 WorldPos = mul(float4(In.Pos,1),gW);

    
    Out.HPos = mul (float4(In.Pos,1),gWVP);
    
    Out.Normal = mul(In.Normal,gWIT);//ノーマルをワールド逆転置でかけて正規化
    
    float2 uv = In.UV;
    /*
    float2 uvtile = floor(uv);
    float2 localuv = frac(uv);
    float2 tilescale = 1.0/atai;
    float2 tileoffset = uvtile * tilescale;
    
    Out.UV = float2(localuv * tilescale + tileoffset);
    */
    Out.UV=float2(In.UV.x,1-In.UV.y);
    Out.View = normalize(gVI[3].xyz - WorldPos);
    //Out.Camera = normalize(gVI[3] +  WorldPos);
    return Out;
}

VS_TO_PS VS_outline(VS_INPUT In){
    VS_TO_PS Out;
    Out.UV = float2 (In.UV.x,1.0-In.UV.y);
    //Out.View = normalize(gVI[3].xyz - WorldPos);

    if (gUseNormal == true){
        float3 WorldPos = mul(float4(In.Pos,1),gW).xyz;
        float4 WorldNormal = mul(In.Normal,gWIT);
        float strength = In.VertexColor.r;
        
        float4 ViewPos = mul(gVP,WorldPos);
        float2 LineTex =In.UV.xy;
        float3 WorldPosOffset = WorldNormal * -gNormalLength ;

        WorldPosOffset *=strength; 
        WorldPos += WorldPosOffset;

        Out.HPos = mul(float4(WorldPos,1.0),gVP);
        Out.View = normalize(gVI[3].xyz - WorldPos);
    }else{
        Out.HPos = mul (float4(In.Pos,1.0),gWVP);
        Out.Normal = mul(In.Normal,gWIT);
    }
    
    return Out;
}

VS_TO_PS VS_inside(VS_INPUT In){
    VS_TO_PS Out;
    Out.UV = float2 (In.UV.x,1.0-In.UV.y);
    //Out.View = normalize(gVI[3].xyz - WorldPos);

    if (guseInside == true){
        float3 WorldPos = mul(float4(In.Pos,1),gW).xyz;
        float4 WorldNormal = mul(In.Normal,gWIT);
        float strength = In.VertexColor.r;
        
        float4 ViewPos = mul(gVP,WorldPos);
        float2 LineTex =In.UV.xy;
        float3 WorldPosOffset = WorldNormal * -gInsideOffset ;

        WorldPosOffset *=strength; 
        WorldPos += WorldPosOffset;

        Out.HPos = mul(float4(WorldPos,1.0),gVP);
        Out.View = normalize(gVI[3].xyz - WorldPos);
    }else{
        Out.HPos = mul (float4(In.Pos,1.0),gWVP);
        Out.Normal = mul(In.Normal,gWIT);
    }
    
    return Out;
}

float4 PS (VS_TO_PS In) : SV_Target {
    float3 normalcolor;
    float3 shadecolor;
    float3 shademask;
    float3 values;
    float4 sRGB;
    float4 lRGB;
    float3 tooncolor;
    float3 N = normalize(In.Normal); 
    float3 L = normalize(-gLight0Dir); 

    float2 uv = In.UV.xy;
    int UVCount=24;

    if (gusetexture == true ){
        normalcolor = pow (gNormalColorTexture.Sample(Sampler_Wrap,In.UV).rgb,2.2);
        values = pow(gNormalColorTexture.Sample(Sampler_Wrap,In.UV).rgb,2.2);
        shadecolor = values*gShadeColor;

    }else{
        normalcolor = gNormalColor ;
        shadecolor = gShadeColor ;
    }

    float satNL = clamp(dot(N,L),-1.0,1.0);
    float toonshade = 0.0;
    float steps = step (gToonThreshold,satNL);
    float diffusetoon =smoothstep(gToonThreshold - gToonSmooth,gToonThreshold + gToonSmooth ,satNL);

    toonshade = diffusetoon;
    

    if (gShadowMaskSwitch == true){
        if(gUVSwitch ==true){ 
            shademask = pow(gShadowMaskTex.Sample(Sampler_Wrap,In.View).rgb,2.2);
        }else{
            shademask = pow(gShadowMaskTex.Sample(Sampler_Wrap,In.UV).rgb,2.2);
        }
        float3 shadowmaskspace =shadecolor + shademask;
        //normalcolor =normalcolor * shadowmaskspace;

        shadecolor = max(shadecolor,shadowmaskspace);
        shadecolor = min(shadecolor , normalcolor);
    }
    if (gShadowSwitch ==false){tooncolor = normalcolor;}
    else{ tooncolor = lerp(shadecolor , normalcolor ,toonshade);};



    
    sRGB = float4(tooncolor,1);


    if(gUseSFrasnel == true){
        float Svdn = max(0.0,dot(In.View,In.Normal));

        if (gInvertSFrasnel == true){
            Svdn=1-Svdn;
        }

        float Sf = schlick_frasnel(Sf0, Svdn, Sexponent);
        float Sff = -Sf;
        float3 Sfras = float3(1.0,1.0,1.0)*(1-gSFrasnelAlpha) + Sff -  -float3(1.0,1.0,1.0)*gSFrasnelAlpha;

        Sfras = Sfras * Sfras ;

        if(gUseSFrasnelMask == true){
            float3 Sfrastexture = pow(gSFrasnelTexture.Sample(Sampler_Wrap,In.UV).rbg,2.2);
            if (gSFrasnelTextureInvert == false){
                Sfrastexture.rgb= 1 - Sfrastexture.rgb;
            }
            
            //float3 frastest1 = fras - (frastexture* -fras);
            //float3 Sfrastest2 =1 - (1-Sfras) * (1 - Sfrastexture); 
            float3 Sfrastest2 =Sfras * (-Sfras + Sfrastexture);
            Sfras = Sfrastest2 ;    
        }

        float3 Scol = gSFrasnelColor - Sfras;
        Sfras = Sfras * Scol;

        sRGB = float4(tooncolor + Sfras,1);
        //return sRGB;
        
    }

    if(gfrasnelswitch == true){
        float vdn = max(0.0,dot(In.View,In.Normal));
        if (gInvertFrasnel == true){
            vdn=1-vdn;
        }

        float f = schlick_frasnel(f0, vdn, exponent);
        float ff = -f;
        float3 fras = float3(1.0,1.0,1.0)*(1-gFrasnelAlpha) + ff -  -float3(1.0,1.0,1.0)*gFrasnelAlpha;
        float3 fras2 = fras *fras;
        fras = fras*fras;

        if (gFrasnelToonSwitch == true){
            float3 frastoon = step(gFrasnelToonSmooth,fras);
            fras = frastoon;

        }

        if(gUseFrasnelMask == true){
            float3 frastexture = pow(gFrasnelTexture.Sample(Sampler_Wrap,In.UV).rbg,2.2);
            

            //float3 frastest2 =fras * (-fras + frastexture); 
            float3 frastest2 =fras * (frastexture - -fras); 
            
            fras = frastest2 ;
            
        }
        float3 col = gFrasnelColor - fras;
        fras = fras * col;


        //lRGB = float4 (1 - (1-fras) * (1-sRGB),1);
        lRGB = float4(sRGB + fras , 1);

        return lRGB;
    }
    return sRGB;
}
//############################

float4 PS_outline (VS_TO_PS In):SV_Target {
    float3 outlinecolor = gOutlineColor;
    float4 outsRGB;
    float opp = gOpas;
    float3 mask = pow(gOpacityTexture.Sample(Sampler_Wrap,In.UV).rgb,2.2);
    /*float ovdn;
    float3 normalDir;
    ovdn = max(0.0,dot(In.View,In.Normal));


    if (gInsideMaskInvert == true) {
        ovdn = 1 - ovdn;
    }

    float of = schlick_frasnel(Of0, ovdn, Oexponent);
    float3 ofras = (1.0 - gOFrasnelAlpha) + of * gOFrasnelAlpha;
    ofras = saturate(ofras);  // 範囲を0~1にクランプ

    if (gInsideMaskSwitch == true) {
    float3 masktoon = step(gInsideMaskValue, ofras);
    opp -= masktoon;
    }
    */

    if (guseOpacityLayer == true){
        if(gOpacityInvert == true){mask = 1-mask;}

        opp = opp - mask ;

    }


    outsRGB = float4(outlinecolor,opp);
    return outsRGB;

}

float4 PS_inside(VS_TO_PS In) : SV_Target{
    float3 insidebase;
    float3 insidealpha;
    float4 insidesRGB= {0.0,0.0,0.0,0.0};
    float insideopp = 1.0;
/*
    float satNL = clamp(dot(N,L),-1.0,1.0);
    float toons = 0.0;
    float steps = step(gToonThreshold,satNL);
    float diffusetoon =smoothstep(gToonThreshold - gToonSmooth,gToonThreshold + gToonSmooth ,satNL);
*/

    float Ivdn = max(0.0,dot(In.View,In.Normal));

    float If = schlick_frasnel(If0, Ivdn, Iexponent);
    float3 Ifras = float3(1.0,1.0,1.0)*(1-gSFrasnelAlpha) + If -  -float3(1.0,1.0,1.0)*gSFrasnelAlpha;

    float3 Ifrass = If * If ;
    Ifrass = saturate(Ifrass);
    Ifrass = smoothstep(Ivdn - ITransToon ,Ivdn + ITransToon,Ifrass);
    
    if (guseInside == true){
        insidebase = pow(gNormalColorTexture.Sample(Sampler_Wrap,In.UV).rgb,2.2);
        
        if(guseInsideAlpha == true){
            insidealpha = pow(gInsideAlpha.Sample(Sampler_Wrap,In.UV).rgb,2.2);
            if (IInv ==true){
                insidealpha = 1-insidealpha;
            }

            insideopp = insideopp - insidealpha ;
            insidebase = insidebase  * insideopp;
            insideopp = insideopp * (1-Ifrass) ;
            
            return float4 (insidebase,insideopp );
            float4 insRGB = float4 (insidebase,insideopp);
        }else{
            insidesRGB =float4(insidebase,0);
            return insidesRGB;
        }
    

    }else{
        return float4 (0.0,0.0,0.0,0.0);
    }

    return insidesRGB;
}

//##########################
RasterizerState CullFront{CullMode = Back;};
RasterizerState CullBack{CullMode = Front;};

BlendState TransparentBlend {
    BlendEnable[0] = TRUE;
    SrcBlend = SRC_ALPHA;
    DestBlend = INV_SRC_ALPHA;
    BlendOp = ADD;
    RenderTargetWriteMask[0] = 0x0F;
};

BlendState Trans{
    BlendEnable[0]= TRUE;
    srcBlend = SRC_ALPHA;
    DestBlend = INV_SRC_ALPHA;
    BlendOp = ADD;
    RenderTargetWriteMask[0] = 0x0F;
};

technique11 toon{
    
    pass P0{
        SetVertexShader(CompileShader(vs_5_0,VS()));
        SetPixelShader(CompileShader(ps_5_0,PS()));
    }

    pass P1{
        SetRasterizerState(CullFront);
        SetBlendState(TransparentBlend, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
        SetVertexShader(CompileShader(vs_5_0,VS_outline()));
        SetPixelShader(CompileShader(ps_5_0,PS_outline()));
    }

    pass P2{
        SetRasterizerState(CullBack);
        SetBlendState(Trans, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
        SetVertexShader(CompileShader(vs_5_0,VS_inside()));
        SetPixelShader(CompileShader(ps_5_0,PS_inside()));
    }

}