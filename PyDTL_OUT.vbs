Dim oAnsoftApp 
 Dim oDesktop 
 Dim oProject 
 Dim oDesign 
 Dim oEditor
 Dim oModule 
 Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop") 
 Set oDesktop = oAnsoftApp.GetAppDesktop() 
 oDesktop.RestoreWindow 
 Set oProject = oDesktop.NewProject 
 oProject.InsertDesign "HFSS", "HFSSDesign1", "DrivenModal", "" 
 Set oDesign = oProject.SetActiveDesign("HFSSDesign1") 
 Set oEditor = oDesign.SetActiveEditor("3D Modeler")




oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.692cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.4798679656cm", "Y:=", "1.08786796564cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.392cm", "Y:=", "1.3cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.392cm", "Y:=", "1.8cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.5096034931cm", "Y:=", "2.21753443853cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.8278375184cm", "Y:=", "2.51231010592cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.6063526408cm", "Y:=", "4.4440438162cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.7169005889cm", "Y:=", "4.48495539397cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.8339541918cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "1.0cm", "Z:=", "0cm")  _ 
),   _
Array("NAME:PolylineSegments",Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 1, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 3, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 4, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 6, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 7, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 9, "NoOfPoints:=", 2), _ 
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 10, "NoOfPoints:=", 2) ), _
Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_l0", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "0cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.229cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.44113203436cm", "Y:=", "1.08786796564cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.529cm", "Y:=", "1.3cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.529cm", "Y:=", "1.8cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.41139650691cm", "Y:=", "2.21753443853cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.09316248161cm", "Y:=", "2.51231010592cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.31464735919cm", "Y:=", "4.4440438162cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.20409941108cm", "Y:=", "4.48495539397cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.08704580819cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "0cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "0cm", "Y:=", "1.0cm", "Z:=", "0cm")  _ 
),   _
Array("NAME:PolylineSegments",Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 1, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 3, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 4, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 6, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 7, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 9, "NoOfPoints:=", 2), _ 
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 10, "NoOfPoints:=", 2) ), _
Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_r0", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_r0"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 

oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_l0"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 







oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "44.048cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.743cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.5308679656cm", "Y:=", "1.08786796564cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.443cm", "Y:=", "1.3cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.443cm", "Y:=", "1.8cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.561804216cm", "Y:=", "2.21949052899cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "35.8829307598cm", "Y:=", "2.5143879494cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "39.7140012461cm", "Y:=", "4.44534246838cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "39.823386046cm", "Y:=", "4.48528922241cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "39.9390445212cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "44.048cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "44.048cm", "Y:=", "1.0cm", "Z:=", "0cm")  _ 
),   _
Array("NAME:PolylineSegments",Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 1, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 3, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 4, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 6, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 7, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 9, "NoOfPoints:=", 2), _ 
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 10, "NoOfPoints:=", 2) ), _
Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_l1", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.223cm", "Y:=", "1.0cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.4351320344cm", "Y:=", "1.08786796564cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.523cm", "Y:=", "1.3cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.523cm", "Y:=", "1.8cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.404195784cm", "Y:=", "2.21949052899cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "30.0830692402cm", "Y:=", "2.5143879494cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "26.2519987539cm", "Y:=", "4.44534246838cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "26.142613954cm", "Y:=", "4.48528922241cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "26.0269554788cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "4.49885cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "21.958cm", "Y:=", "1.0cm", "Z:=", "0cm")  _ 
),   _
Array("NAME:PolylineSegments",Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 1, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 3, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 4, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 6, "NoOfPoints:=", 2), _ 
 Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", 7, "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 9, "NoOfPoints:=", 2), _ 
Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 10, "NoOfPoints:=", 2) ), _
Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_r1", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_r1"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 

oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_l1"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 







oEditor.Unite Array("NAME:Selections", "Selections:=","DT_h_r0,DT_h_l0,DT_h_r1,DT_h_l1"),Array("NAME:UniteParameters", "KeepOriginals:=",False)



 Set oModule = oDesign.GetModule("MeshSetup")
 oModule.InitialMeshSettings Array("NAME:MeshSettings", Array("NAME:GlobalSurfApproximation", "CurvedSurfaceApproxChoice:=", _
 "UseSlider", "SliderMeshSettings:=", 5), Array("NAME:GlobalCurvilinear", "Apply:=", _
 true), Array("NAME:GlobalModelRes", "UseAutoLength:=", true), "MeshMethod:=", "Auto")


 oDesign.SetSolutionType "Eigenmode", false 
 Set oModule = oDesign.GetModule("AnalysisSetup")
 oModule.InsertSetup "HfssEigen", Array("NAME:Setup1", "MinimumFrequency:=", "300MHz", "NumModes:=", _
 1, "MaxDeltaFreq:=", 1e-05, "ConvergeOnRealFreq:=", true, "MaximumPasses:=", 8, "MinimumPasses:=", _
 1, "MinimumConvergedPasses:=", 1, "PercentRefinement:=", 30, "IsEnabled:=", _
 true, "BasisOrder:=", 2, "DoLambdaRefine:=", true, "DoMaterialLambda:=", true, "SetLambdaTarget:=", _
 false, "Target:=", 0.4, "UseMaxTetIncrease:=", false)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "0cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "25.95cm", "Height:=",  _
"44.048cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"cylindrical_wall", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)







oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "21.9575cm", "YCenter:=",  _
"-25.95cm", "ZCenter:=", "0.0cm", "Radius:=", "1.0cm", "Height:=",  _
"1.0cm", "WhichAxis:=", "y", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"post_coupler_number_100", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.Unite Array("NAME:Selections", "Selections:=","post_coupler_number_100"),Array("NAME:UniteParameters", "KeepOriginals:=",False)





oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", "Mode:=", "Axis/Position", "OriginX:=", _
"18.0cm", "OriginY:=", "0mm", "OriginZ:=", "0mm", "XAxisXvec:=", "0mm", _
"XAxisYvec:=",  _ 
  "0.17364817766693041mm", "XAxisZvec:=", "0.984807753012208mm", "YAxisXvec:=",  _ 
"0mm", "YAxisYvec:=", "-0.984807753012208mm", "YAxisZvec:=",  _
"0.17364817766693028mm"), Array("NAME:Attributes", "Name:=", "RelCS4tuner_100")

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "25.95cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "5.0cm", "Height:=",  _
"-25.0cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"tuner_number_100", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"RelCS4tuner_100", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.SetWCS Array("NAME:SetWCS Parameter", "Working Coordinate System:=", "Global", "RegionDepCSOk:=",  _
 false)

oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", "Mode:=", "Axis/Position", "OriginX:=", _
"26.0cm", "OriginY:=", "0mm", "OriginZ:=", "0mm", "XAxisXvec:=", "0mm", _
"XAxisYvec:=",  _ 
  "0.7071067811865476mm", "XAxisZvec:=", "0.7071067811865475mm", "YAxisXvec:=",  _ 
"0mm", "YAxisYvec:=", "-0.7071067811865475mm", "YAxisZvec:=",  _
"0.7071067811865476mm"), Array("NAME:Attributes", "Name:=", "RelCS4tuner_101")

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "25.95cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "5.0cm", "Height:=",  _
"-25.0cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"tuner_number_101", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"RelCS4tuner_101", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.SetWCS Array("NAME:SetWCS Parameter", "Working Coordinate System:=", "Global", "RegionDepCSOk:=",  _
 false)

oEditor.Unite Array("NAME:Selections", "Selections:=","tuner_number_100,tuner_number_101"),Array("NAME:UniteParameters", "KeepOriginals:=",False)



oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", "cylindrical_wall",_ 
"Tool Parts:=", "DT_h_r0,post_coupler_number_100,tuner_number_100"),_
Array("NAME:SubtractParameters", _ 
 "KeepOriginals:=", False )



oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "7.24965cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.4cm", "Height:=",  _
"8.02395cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"axis_part_name100", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)





oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "29.23825cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.4cm", "Height:=",  _
"8.118cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"axis_part_name101", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)





oEditor.Unite Array("NAME:Selections", "Selections:=","axis_part_name100,axis_part_name101"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", "cylindrical_wall",_ 
"Tool Parts:=", "axis_part_name100"),_
Array("NAME:SubtractParameters", _ 
 "KeepOriginals:=", True )



