VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CustomerDataObject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Private Sub Class_Initialize()
    Set customers = New Collection
End Sub

Public Function ConnectToDatabase() As ADODB.Connection
    Dim conn As ADODB.Connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = "<DB Connection>"
    conn.Open
    Set ConnectToDatabase = conn
End Function

Public Function Save(name As String) As String

    Dim conn As ADODB.Connection
    Set conn = ConnectToDatabase()
    conn.Execute "Insert into Customers(CustomerName) values ('" + name + "')", , adCmdText
    
    Save = name + " saved!"
End Function

Public Function Delete(name As String) As String
    Dim conn As ADODB.Connection
    Set conn = ConnectToDatabase()
       
    conn.Execute "Delete from Customers where CustomerName like '" + name + "'", , adCmdText
    Delete = name + " deleted!"
End Function


Public Function List() As String
    Dim toReturn As String
   
    Dim conn As ADODB.Connection
    Set conn = ConnectToDatabase()

    Dim rst As New ADODB.Recordset
    Set rst.ActiveConnection = conn
    rst.Source = "SELECT CustomerName From Customers"
    rst.Open

    ' Display the data in the recordset.
    While (Not rst.EOF)
       toReturn = toReturn + rst.Fields("CustomerName").Value + vbCrLf
       rst.MoveNext
    Wend

    conn.Close
    
    List = toReturn
End Function

