VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CustomerBusinessObject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Dim dataObject As DataObjects.CustomerDataObject
Dim dotnetDataObject As New CustomerWrapper.CustomerDataObject


Private Sub Class_Initialize()
    Set dataObject = New DataObjects.CustomerDataObject
    Set dotnetDataObject = New CustomerWrapper.CustomerDataObject
End Sub

Function Save(name As String) As String
    Save = dataObject.Save(name)
End Function

Function Delete(name As String) As String
    Delete = dataObject.Delete(name)
End Function


Public Function List(useAPI As Boolean) As String
    If useAPI Then
        List = dotnetDataObject.List() + "---" + vbCrLf + "Source: Api Manager"
    Else
        List = dataObject.List() + "---" + vbCrLf + "Source: vb6 ActiveX Com Component"
    End If
End Function


