float tesselationAmount = 3;

struct HsInput
{
	float4 Position : POSITION;

};

struct ConstantOutputType{
	float Edges[3] : SV_TessFactor;
	float inside : SV_InsideTessFactor;
};


struct HsOutput{
	float4 Position : POSITION;
};




ConstantOutputType PatchConstantFunction(InputPatch<HsInput,3> inputPatch, uint PatchID : SV_PrimitiveID){
	ConstantOutputType Output;
	
	Output.Edges[0] = tesselationAmount;
	Output.Edges[1] = tesselationAmount;
	Output.Edges[2] = tesselationAmount;
	
	Output.inside = tesselationAmount;
	
	return Output;
}
[domain("tri")]
[partitioning("integer")]
[outputtopology("triangle_cw")]
[outputcontrolpoints(3)]
[patchconstantfunc("PatchConstantFunction")]

HsOutput HSEntry(InputPatch<HsInput,3>patch, uint PointID : SV_OutputControlPointID, uint PatchID : SV_PrimitiveID){
	HsOutput Output;
	
	Output.Position = patch[PointID].Position;
	
	return Output;
}



