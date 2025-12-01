
struct DSInput{
	float4 Position : SV_Position;
};
struct DSOutput{
	float4 Position : SV_Position;
	float3 Normal : NORMAL;
};

struct ConstantOutputType{
	float Edges[3] : SV_TessFactor;
	float inside : SV_InsideTessFactor;
};


[domain("tri")]
DSOutput DSEntry(ConstantOutputType input, float3 UVWCoord : SV_DomainLocation, const OutputPatch<DSInput,3> patch){
	DSOutput Output;
	
	Output.Position = UVWCoord.x * patch[0].Position + UVWCoord.y * patch[1].Position + UVWCoord.z * patch[2].Position;
	Output.Normal = float3(0,0,0);
	return Output;
}
