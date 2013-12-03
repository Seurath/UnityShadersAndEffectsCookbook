#ifndef LIGHTING_BASIC_DIFFUSE
#define LIGHTING_BASIC_DIFFUSE

// Custom basic diffuse lighting.

inline float4 LightingBasicDiffuse (SurfaceOutput surfaceOutput, fixed3 lightDir, fixed atten)
{
	float diffuseLight = max(0, dot(surfaceOutput.Normal, lightDir));
	float halfLambert = (diffuseLight * 0.5) + 0.5;
	
	float4 outputColour;
	outputColour.rgb = surfaceOutput.Albedo * _LightColor0.rgb * atten * halfLambert;
	outputColour.a = surfaceOutput.Alpha;
	return outputColour;
}

#endif // LIGHTING_BASIC_DIFFUSE
