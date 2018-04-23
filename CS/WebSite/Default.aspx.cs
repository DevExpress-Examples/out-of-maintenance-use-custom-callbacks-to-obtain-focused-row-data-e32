using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grid_CustomDataCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomDataCallbackEventArgs e) {
        int discount = 0;
        int focusedRow = 0;
        string[] parameters = e.Parameters.Split('|');
        if(parameters.Length != 2) return;
        if(!int.TryParse(parameters[0], out focusedRow)) return;
        if(!int.TryParse(parameters[1], out discount)) return;
        if(discount < 0 || discount > 100) return;
        object[] values = (object[])grid.GetRowValues(focusedRow, "Quantity", "UnitPrice");
        if(values[0] == null || values[1] == null) return;
        int quantity = Convert.ToInt32(values[0]);
        decimal unitPrice = Convert.ToDecimal(values[1]);
        e.Result = string.Format("{0:c}", quantity * (unitPrice * (100 - discount) / 100));
    }
}
