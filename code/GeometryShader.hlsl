struct GSOutput{
	float4 Pos : SV_Position;
};

[maxvertexcount(9)]
void GSEntry(triangle float4 InputTri[3] : SV_Position, inout TriangleStream<GSOutput> OutStream){
	float4 MidPoint = (InputTri[0] + InputTri[1] + InputTri[2])/3;
	GSOutput Output;

	Output.Pos = InputTri[0];
	OutStream.Append(Output);
	Output.Pos = InputTri[1];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	Output.Pos = InputTri[1];
	OutStream.Append(Output);
	Output.Pos = InputTri[2];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	Output.Pos = InputTri[2];
	OutStream.Append(Output);
	Output.Pos = InputTri[0];
	OutStream.Append(Output);
	Output.Pos = MidPoint;
	OutStream.Append(Output);
	OutStream.RestartStrip();
	
	
}