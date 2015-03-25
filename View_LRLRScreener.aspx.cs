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
public partial class View_LRLRScreener : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select * from LRLR_Details";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select * from LRLR_Details";
        SqlDataSource1.SelectCommand = "select * from LRLR_Details where IType='" + DropDownList1.SelectedItem.Text + "'";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Res_Alloc values('" + Session["User"].ToString() + "','LRLR','" + TextBox1.Text + "','" + TextBox2.Text + "'," + TextBox3.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        Label1.Text = "Record Saved";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[2].Text;
        TextBox2.Text = GridView1.SelectedRow.Cells[1].Text;
    }
}
