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
public partial class Exp_Details : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
        if (!IsPostBack)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select * from Exp_Note where U_No='" + Session["User"].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                TextBox1.Text = rs.GetValue(1).ToString();
                TextBox2.Text = rs.GetValue(2).ToString();
                TextBox3.Text = rs.GetValue(3).ToString();
                TextBox4.Text = rs.GetValue(4).ToString();
                TextBox5.Text = rs.GetValue(5).ToString();
                TextBox6.Text = rs.GetValue(6).ToString();
                TextBox7.Text = rs.GetValue(7).ToString();
                TextBox8.Text = rs.GetValue(8).ToString();
                TextBox9.Text = rs.GetValue(9).ToString();
                TextBox10.Text = rs.GetValue(10).ToString();
                TextBox11.Text = rs.GetValue(11).ToString();
                TextBox12.Text = rs.GetValue(12).ToString();
                TextBox13.Text = rs.GetValue(13).ToString();
                TextBox14.Text = rs.GetValue(14).ToString();
                TextBox15.Text = rs.GetValue(15).ToString();
                TextBox16.Text = rs.GetValue(16).ToString();
                TextBox17.Text = rs.GetValue(17).ToString();
                TextBox18.Text = rs.GetValue(18).ToString();
                TextBox19.Text = rs.GetValue(19).ToString();
                TextBox20.Text = rs.GetValue(20).ToString();
                TextBox21.Text = rs.GetValue(21).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from Exp_Note where U_No='" + Session["User"].ToString() + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Exp_Note values('" + Session["User"].ToString() + "','" + TextBox1.Text + "'," + TextBox2.Text + "," + TextBox3.Text + ",'" + TextBox4.Text + "'," + TextBox5.Text + "," + TextBox6.Text + ",'" + TextBox7.Text + "'," + TextBox8.Text + "," + TextBox9.Text + ",'" + TextBox10.Text + "'," + TextBox11.Text + "," + TextBox12.Text + ",'" + TextBox13.Text + "'," + TextBox14.Text + "," + TextBox15.Text + ",'" + TextBox16.Text + "'," + TextBox17.Text + "," + TextBox18.Text + ",'" + TextBox19.Text + "'," + TextBox20.Text + "," + TextBox21.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        Label1.Text = "Expenses Saved";
        HyperLink1.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from Temp1";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Food'," + TextBox2.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Travel'," + TextBox5.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Clothes'," + TextBox8.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Rent'," + TextBox11.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Fees'," + TextBox14.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Bill'," + TextBox17.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Temp1 values('Misc'," + TextBox20.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        Response.Redirect("repExp.aspx");
    }
}
