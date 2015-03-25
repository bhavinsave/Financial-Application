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
public partial class Dis_Reply : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    string fid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
        if (!IsPostBack)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select D_Data from Discuss_Forum where D_No='" + Session["Discuss"].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                Label1.Text = rs.GetValue(0).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
        }
        SqlDataSource1.SelectCommand = "select * from Discuss_Reply where D_No='" + Session["Discuss"].ToString() + "'";

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            Auto_Gen();
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into Discuss_Reply values('" + fid + "','" + Session["Discuss"].ToString() + "','" + System.DateTime.Now.ToShortDateString() + "','" + Session["User"].ToString() + "','" + TextBox1.Text + "')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();

            TextBox1.Text = "";

            Label2.Text = "Reply Posted successfully";
            SqlDataSource1.SelectCommand = "select * from Discuss_Reply";
            SqlDataSource1.SelectCommand = "select * from Discuss_Reply where D_No='" + Session["Discuss"].ToString() + "'";
        }
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
        cmd.CommandText = "select count(*) from Discuss_Reply";
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
            cmd.CommandText = "select max(R_No) from Discuss_Reply";
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
                id = "R000" + id;
            }
            else if (id.Length == 2)
            {
                id = "R00" + id;
            }
            else if (id.Length == 3)
            {
                id = "R0" + id;
            }
            else if (id.Length == 4)
            {
                id = "R" + id;
            }
            fid = id;
        }
        else
        {
            fid = "R0001";
        }
    }
}
