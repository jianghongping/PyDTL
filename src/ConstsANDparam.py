def header():
    header = 'Dim oAnsoftApp \n Dim oDesktop \n Dim oProject \n Dim oDesign \n'
    header = header + ' Dim oEditor\n Dim oModule \n Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")'
    header = header + ' \n Set oDesktop = oAnsoftApp.GetAppDesktop() \n'
    header = header + ' oDesktop.RestoreWindow \n Set oProject = oDesktop.NewProject'
    header = header + ' \n oProject.InsertDesign "HFSS", "HFSSDesign1", "DrivenModal", ""'
    header = header + ' \n Set oDesign = oProject.SetActiveDesign("HFSSDesign1")'
    header = header + ' \n Set oEditor = oDesign.SetActiveEditor("3D Modeler")'
    return(header)

def InitMeshSetting(ApplyCurveLinMesh):
    InitMeshSetScript = ''
    InitMeshSetScript = '\n Set oModule = oDesign.GetModule("MeshSetup")'
    InitMeshSetScript = InitMeshSetScript + '\n oModule.InitialMeshSettings Array("NAME:MeshSettings", Array("NAME:GlobalSurfApproximation", "CurvedSurfaceApproxChoice:=", _'
    InitMeshSetScript = InitMeshSetScript + '\n "UseSlider", "SliderMeshSettings:=", 5), Array("NAME:GlobalCurvilinear", "Apply:=", _'
    InitMeshSetScript = InitMeshSetScript + '\n ' + ApplyCurveLinMesh+ '), Array("NAME:GlobalModelRes", "UseAutoLength:=", true), "MeshMethod:=", "Auto")'
    return(InitMeshSetScript)

def SetUpAnalysis(start_freq,ConvergeOnRealFreq,NumModes,MaximumPasses,MaxDeltaFreq):
    SetUpAnalysis_script = '\n oDesign.SetSolutionType "Eigenmode", false \n Set oModule = oDesign.GetModule("AnalysisSetup")'
    SetUpAnalysis_script = SetUpAnalysis_script +'\n oModule.InsertSetup "HfssEigen", Array("NAME:Setup1", "MinimumFrequency:=", "' +str(start_freq)+'MHz", "NumModes:=", _'
    SetUpAnalysis_script = SetUpAnalysis_script +'\n '+str(NumModes)+', "MaxDeltaFreq:=", '+str(MaxDeltaFreq)+', "ConvergeOnRealFreq:=", '+ConvergeOnRealFreq+', "MaximumPasses:=", '+str(MaximumPasses)+', "MinimumPasses:=", _'
    SetUpAnalysis_script = SetUpAnalysis_script +'\n 1, "MinimumConvergedPasses:=", 1, "PercentRefinement:=", 30, "IsEnabled:=", _'
    SetUpAnalysis_script = SetUpAnalysis_script +'\n true, "BasisOrder:=", 2, "DoLambdaRefine:=", true, "DoMaterialLambda:=", true, "SetLambdaTarget:=", _'
    SetUpAnalysis_script = SetUpAnalysis_script +'\n false, "Target:=", 0.4, "UseMaxTetIncrease:=", false)'
    return(SetUpAnalysis_script)






