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
public partial class Register : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
        Auto_Gen();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into User_Details values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox7.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','NA','" + TextBox6.Text + "','Off')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into User_Login values('" + Label1.Text + "','" + TextBox5.Text + "')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();

            Label1.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";


            Label2.Text = "User Registered Successfully";
    }

    private void Auto_Gen()
    {
        int cnt;
        string id;
        int temp;
        temp = 0;
        cnt = 0;
        id = "";
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from User_Details";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            cnt = int.Parse(rs.GetValue(0).ToString());
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();
        if (cnt > 0)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select max(U_No) from User_Details";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                id = rs.GetValue(0).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
            temp = int.Parse(id.Substring(1, 4));
            temp++;
            id = "";
            id = temp.ToString();
            if (id.Length == 1)
            {
                id = "U000" + id;
            }
            else if (id.Length == 2)
            {
                id = "U00" + id;
            }
            else if (id.Length == 3)
            {
                id = "U0" + id;
            }
            else if (id.Length == 4)
            {
                id = "U" + id;
            }
            Label1.Text = id;
        }
        else
        {
            Label1.Text = "U0001";
        }
        TextBox1.Focus();
    }
    
}
