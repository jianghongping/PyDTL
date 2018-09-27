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
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.8307cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.72463398282cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.6807cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.6807cm", "Y:=", "1.204cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.7189951858cm", "Y:=", "1.42118279101cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "3.82926177862cm", "Y:=", "1.61217013215cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.71070063245cm", "Y:=", "2.66262805286cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.79793088252cm", "Y:=", "2.72956217791cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "4.90527592101cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "0.0cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.4824cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.58846601718cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.6324cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.6324cm", "Y:=", "1.204cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.59111263785cm", "Y:=", "1.42923388657cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "2.47261951603cm", "Y:=", "1.6251785982cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "1.54853486211cm", "Y:=", "2.66783143928cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "1.46266858519cm", "Y:=", "2.73099305634cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "1.35844705569cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "0.0cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "0.0cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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







oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.68179784cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.5757318228cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.53179784cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.53179784cm", "Y:=", "0.904cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.5700930258cm", "Y:=", "1.12118279101cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "11.6803596186cm", "Y:=", "1.31217013215cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "12.8135283618cm", "Y:=", "2.66262805286cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "12.9007586119cm", "Y:=", "2.72956217791cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "13.0081036504cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_l2", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.30519784cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.4112638572cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.45519784cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.45519784cm", "Y:=", "0.904cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.4169026542cm", "Y:=", "1.12118279101cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "10.3066360614cm", "Y:=", "1.31217013215cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "9.17346731819cm", "Y:=", "2.66262805286cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "9.08623706812cm", "Y:=", "2.72956217791cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "8.97889202964cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "7.33618784cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_r2", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_r2"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 

oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_l2"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 







oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "22.2946616cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.18730192cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.0812359028cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.03730192cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.03730192cm", "Y:=", "0.904cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.0755971058cm", "Y:=", "1.12118279101cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "19.1858636986cm", "Y:=", "1.31217013215cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "20.3190324418cm", "Y:=", "2.66262805286cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "20.4062626919cm", "Y:=", "2.72956217791cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "20.5136077304cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "22.2946616cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "22.2946616cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_l3", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
true, _
Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.78060192cm", "Y:=", "0.5cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.8866679372cm", "Y:=", "0.543933982822cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.93060192cm", "Y:=", "0.65cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.93060192cm", "Y:=", "0.904cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.8923067342cm", "Y:=", "1.12118279101cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "17.7820401414cm", "Y:=", "1.31217013215cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "16.6488713982cm", "Y:=", "2.66262805286cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "16.5616411481cm", "Y:=", "2.72956217791cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "16.4542961096cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "2.75336cm", "Z:=", "0cm") , _ 
 Array("NAME:PLPoint", "X:=", "14.76527192cm", "Y:=", "0.5cm", "Z:=", "0cm")  _ 
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
  "Corner")), Array("NAME:Attributes", "Name:=", "DT_h_r3", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true, "IsMaterialEditable:=", true)



oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_r3"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 

oEditor.SweepAroundAxis _
	Array("NAME:Selections", "Selections:=", "DT_h_l3"), _
	Array("NAME:AxisSweepParameters", _ 
		"DraftAngle:=", 0, _ 
		"DraftType:=", "Round", _ 
		"SweepAxis:=", "x", _ 
		"SweepAngle:=", 360) 





oEditor.Unite Array("NAME:Selections", "Selections:=","DT_h_l1,DT_h_r1,DT_h_l2,DT_h_r2,DT_h_l3,DT_h_r3"),Array("NAME:UniteParameters", "KeepOriginals:=",False)



oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "7.06794892cm", "YCenter:=",  _
"0cm", "ZCenter:=", "2.55336cm", "Radius:=", "1.0cm", "Height:=",  _
"6.26314cm", "WhichAxis:=", "z", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"stem_1001", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "14.73119988cm", "YCenter:=",  _
"0cm", "ZCenter:=", "2.55336cm", "Radius:=", "1.0cm", "Height:=",  _
"6.26314cm", "WhichAxis:=", "z", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"stem_1002", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.Unite Array("NAME:Selections", "Selections:=","stem_1001,stem_1002"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "0.0cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "8.8165cm", "Height:=",  _
"7.33618784cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"Cavity_body1001", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "7.33618784cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "8.8165cm", "Height:=",  _
"7.42908408cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"Cavity_body1002", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "14.76527192cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "8.8165cm", "Height:=",  _
"7.52938968cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"Cavity_body1003", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.Unite Array("NAME:Selections", "Selections:=","Cavity_body1001,Cavity_body1002,Cavity_body1003"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "7.06794892cm", "YCenter:=",  _
"8.8165cm", "ZCenter:=", "0.0cm", "Radius:=", "1.0cm", "Height:=",  _
"-1.5cm", "WhichAxis:=", "y", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"PC_1001", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "14.73119988cm", "YCenter:=",  _
"-8.8165cm", "ZCenter:=", "0.0cm", "Radius:=", "1.0cm", "Height:=",  _
"1.5cm", "WhichAxis:=", "y", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"PC_1002", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)



oEditor.Unite Array("NAME:Selections", "Selections:=","PC_1001,PC_1002"),Array("NAME:UniteParameters", "KeepOriginals:=",False)




oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "0.0cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.1cm", "Height:=",  _
"7.33618784cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InDT_axis_body1001", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "2.23754cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.4cm", "Height:=",  _
"1.729695cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InGaP_axis_body1001", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "7.33618784cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.1cm", "Height:=",  _
"7.42908408cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InDT_axis_body1002", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "9.57372784cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.4cm", "Height:=",  _
"1.729695cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InGaP_axis_body1002", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "14.76527192cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.1cm", "Height:=",  _
"7.52938968cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InDT_axis_body1003", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "17.00281192cm", "YCenter:=",  _
"0cm", "ZCenter:=", "0cm", "Radius:=", "0.4cm", "Height:=",  _
"1.729695cm", "WhichAxis:=", "x", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _
"InGaP_axis_body1003", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
true)

oEditor.Unite Array("NAME:Selections", "Selections:=","InDT_axis_body1001,InDT_axis_body1002,InDT_axis_body1003"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.Unite Array("NAME:Selections", "Selections:=","InGaP_axis_body1001,InGaP_axis_body1002,InGaP_axis_body1003"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.Unite Array("NAME:Selections", "Selections:=","InDT_axis_body1001,InGaP_axis_body1001"),Array("NAME:UniteParameters", "KeepOriginals:=",False)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", "Cavity_body1001",_ 
"Tool Parts:=", "PC_1001,DT_h_l1,stem_1001"),_
Array("NAME:SubtractParameters", _ 
 "KeepOriginals:=", False )


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