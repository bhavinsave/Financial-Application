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
public partial class Admin_LRLR : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into LRLR_Details values('" + DropDownList1.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        Label1.Text = "Record Saved Successfully";
        SqlDataSource1.SelectCommand = "select * from LRLR_Details";
        DropDownList1.SelectedIndex = 0;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.SelectedItem.Text = GridView1.SelectedRow.Cells[1].Text;
        TextBox1.Text = GridView1.SelectedRow.Cells[2].Text;
        TextBox2.Text = GridView1.SelectedRow.Cells[3].Text;
        TextBox3.Text = GridView1.SelectedRow.Cells[4].Text;
        TextBox4.Text = GridView1.SelectedRow.Cells[5].Text;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from LRLR_Details where IType='" + DropDownList1.SelectedItem.Text + "',Institution='" + TextBox1.Text + "',Interest_Rate='" + TextBox2.Text + "',Time_Frame='" + TextBox3.Text + "',Details='" + TextBox4.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        Label1.Text = "Record Deleted Successfully";
        SqlDataSource1.SelectCommand = "select * from LRLR_Details";
        DropDownList1.SelectedIndex = 0;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
}
