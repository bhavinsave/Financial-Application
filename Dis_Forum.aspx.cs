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
public partial class Dis_Forum : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    string fid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
        SqlDataSource1.SelectCommand = "select * from Discuss_Forum where D_Status='Approved'";

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            Auto_Gen();
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into Discuss_Forum values('" + fid + "','" + Session["User"].ToString() + "','" + System.DateTime.Now.ToShortDateString() + "','" + TextBox1.Text + "','Pending')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();

            TextBox1.Text = "";

            Label1.Text = "Data Posted successfully";
            SqlDataSource1.SelectCommand = "select * from Discuss_Forum";
            SqlDataSource1.SelectCommand = "select * from Discuss_Forum where D_Status='Approved'";

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
        cmd.CommandText = "select count(*) from Discuss_Forum";
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
            cmd.CommandText = "select max(D_No) from Discuss_Forum";
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
                id = "D000" + id;
            }
            else if (id.Length == 2)
            {
                id = "D00" + id;
            }
            else if (id.Length == 3)
            {
                id = "D0" + id;
            }
            else if (id.Length == 4)
            {
                id = "D" + id;
            }
            fid = id;
        }
        else
        {
            fid = "D0001";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Discuss"] = GridView1.SelectedRow.Cells[0].Text;
        Response.Redirect("Dis_Reply.aspx");
    }
}
