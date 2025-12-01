struct GSOutput{
	float4 Pos : SV_Position;
	float3 Normal : NORMAL;
};

float3 CalculateNormalFromTriangle(float4 In1, float4 In2, float4 In3){
	
	float4 PlaneVec1 = In2 - In1;
	float4 PlaneVec2 = In3 - In2;
	return normalize(cross(PlaneVec1.xyz,PlaneVec2).xyz);
}

[maxvertexcount(9)]
void GSEntry(triangle float4 InputTri[3] : SV_Position, inout TriangleStream<GSOutput> OutStream){
	float4 MidPoint = (InputTri[0] + InputTri[1] + InputTri[2])/3;
	GSOutput Output;
	
	
	Output.Normal = CalculateNormalFromTriangle(InputTri[0],InputTri[1],MidPoint);
	Output.Pos = InputTri[0];
	OutStream.Append(Output);
	Output.Pos = InputTri[1];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	Output.Normal = CalculateNormalFromTriangle(InputTri[1],InputTri[2],MidPoint);
	Output.Pos = InputTri[1];
	OutStream.Append(Output);
	Output.Pos = InputTri[2];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	Output.Normal = CalculateNormalFromTriangle(InputTri[2],InputTri[0],MidPoint);
	Output.Pos = InputTri[2];
	OutStream.Append(Output);
	Output.Pos = InputTri[0];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	
}