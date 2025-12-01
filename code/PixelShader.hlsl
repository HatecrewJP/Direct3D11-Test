cbuffer CBuffer{
	float RotationAngle;
	float Width;
	float Height;
	float ColorR;
	float ColorG;
	float ColorB;
	float ColorA;
};

struct ps_input
{
	float4 vPosition : SV_Position;
	float3 Normal : NORMAL;
};

struct ps_output
{
	float4 color : SV_Target0;
};

ps_output PSEntry(const ps_input input)
{
	ps_output output;
	float4 Color = float4(ColorR,ColorG,ColorB,ColorA);
	
	
	output.color = Color;
	return output;
}