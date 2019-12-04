VERSION 5.00
Begin VB.Form customerForm 
   Caption         =   "Test Data"
   ClientHeight    =   1500
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   3135
   LinkTopic       =   "Form1"
   ScaleHeight     =   1500
   ScaleWidth      =   3135
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox checkUseApi 
      Caption         =   "Use API Manager"
      Height          =   255
      Left            =   480
      TabIndex        =   5
      Top             =   1560
      Width           =   2055
   End
   Begin VB.CommandButton listButton 
      Caption         =   "List"
      Height          =   495
      Left            =   360
      TabIndex        =   4
      Top             =   840
      Width           =   735
   End
   Begin VB.CommandButton deleteButton 
      Caption         =   "Delete"
      Height          =   495
      Left            =   2040
      TabIndex        =   3
      Top             =   840
      Width           =   735
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Text            =   "DWS"
      Top             =   360
      Width           =   2415
   End
   Begin VB.CommandButton saveButton 
      Caption         =   "Save"
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblName 
      Caption         =   "Name"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   120
      Width           =   2655
   End
End
Attribute VB_Name = "customerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim customer As BusinessObjects.CustomerBusinessObject

Private Sub Form_Load()
    Set customer = New BusinessObjects.CustomerBusinessObject
End Sub

Private Sub listButton_Click()
    MsgBox customer.List(checkUseApi.Value)
End Sub

Private Sub saveButton_Click()
    MsgBox customer.Save(txtName.Text)
End Sub


Private Sub deleteButton_Click()
    MsgBox customer.Delete(txtName.Text)
End Sub

