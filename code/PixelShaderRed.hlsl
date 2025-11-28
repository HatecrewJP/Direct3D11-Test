
struct ps_input
{
	float4 vPosition : SV_Position;
	float3 Normal : NORMAL;
};

struct ps_output
{
	float4 color : SV_Target0;
};
float3 LightSource = {-1.0f,3.0f,-2.0f};

ps_output PSEntry(const ps_input input)
{
	ps_output output;
	
	float dp = dot(input.Normal.xyz,LightSource);
	if(dp>0){	
		output.color = float4(1,0,0,1);
	}
	else{
		output.color = float4(0,1,0,1);
	}
	
	return output;
}