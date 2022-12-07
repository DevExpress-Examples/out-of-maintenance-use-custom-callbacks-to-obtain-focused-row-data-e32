Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub grid_CustomDataCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomDataCallbackEventArgs)
		Dim discount As Integer = 0
		Dim focusedRow As Integer = 0
		Dim parameters As String() = e.Parameters.Split("|"c)
		If parameters.Length <> 2 Then
		Return
		End If
		If (Not Integer.TryParse(parameters(0), focusedRow)) Then
		Return
		End If
		If (Not Integer.TryParse(parameters(1), discount)) Then
		Return
		End If
		If discount < 0 OrElse discount > 100 Then
		Return
		End If
		Dim values As Object() = CType(grid.GetRowValues(focusedRow, "Quantity", "UnitPrice"), Object())
		If values(0) Is Nothing OrElse values(1) Is Nothing Then
		Return
		End If
		Dim quantity As Integer = Convert.ToInt32(values(0))
		Dim unitPrice As Decimal = Convert.ToDecimal(values(1))
		e.Result = String.Format("{0:c}", quantity * (unitPrice * (100 - discount) / 100))
	End Sub
End Class
