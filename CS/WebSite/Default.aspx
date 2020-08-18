<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Use custom callbacks to obtain focused row data</title>
<script language="javascript" type="text/javascript">
function UpdateFocusedTotalText() {
    var discount = document.getElementById("txtDiscount").value;
    grid.GetValuesOnCustomCallback(grid.GetFocusedRowIndex() + '|' + discount, OnGetValues);
}
function OnGetValues(values) {
    var txtTotals = document.getElementById("txtTotals");
    txtTotals.value = values != null ? values : "";
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" Width="100%" AutoGenerateColumns="False" OnCustomDataCallback="grid_CustomDataCallback">
        <Columns>
            <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="0">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="1">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="2">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="c">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <ClientSideEvents FocusedRowChanged="function(s, e) { UpdateFocusedTotalText(); }" />
    </dxwgv:ASPxGridView>
    <br/>
    Discount: <input type="text" id="txtDiscount" style="width:120px" value="10" onchange="UpdateFocusedTotalText()" />
    Totals : <input type="text" id="txtTotals" disabled="disabled" style="width:120px" />
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
