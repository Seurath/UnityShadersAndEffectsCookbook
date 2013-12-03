Shader "Custom/BasicDiffuse" 
{
	Properties 
	{
		_EmissiveColour ("Emissive Colour", Color) = (1, 1, 1, 1)
		_AmbientColour ("Ambient Colour", Color) = (1, 1, 1, 1)
		_ColourIntensity ("Colour Intensity", Range(0.01, 2)) = 0.025
	}
	
	SubShader 
	{
		Tags { "RenderType" = "Opaque" }
		
		CGPROGRAM
		#pragma surface surf BasicDiffuse
		#include "BasicDiffuseLighting.cginc"
		
		float4 _EmissiveColour;
		float4 _AmbientColour;
		float _ColourIntensity;
		
		struct Input
		{
			float2 uv_MainTex;
		};
		
		void surf (Input input, inout SurfaceOutput surfaceOutput)
		{
			float4 combinedColour;
			combinedColour = pow((_EmissiveColour + _AmbientColour), _ColourIntensity);
			
			surfaceOutput.Albedo = combinedColour.rgb;
			surfaceOutput.Alpha = combinedColour.a;
		}
		
		ENDCG
	}
	FallBack "Diffuse"
}
