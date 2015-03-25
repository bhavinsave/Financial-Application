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
using System.Data.SqlClient;
public partial class Admin_Forum : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            s = Session["User"].ToString();
            if (s == "")
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[0].Text;
        DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "update Discuss_Forum set D_Status='" + DropDownList1.SelectedItem.Text + "' where D_No='" + TextBox1.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        TextBox1.Text = "";
        DropDownList1.SelectedIndex = 0;
        Label1.Text = "Status Updated";
        SqlDataSource1.SelectCommand = "select * from Discuss_Forum";
    }
}
