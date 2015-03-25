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
public partial class Growth : System.Web.UI.Page
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
             cmd.CommandText = "select * from Growth where U_No='" + Session["User"].ToString() + "'";
             rs = cmd.ExecuteReader();
             while (rs.Read())
             {
                 DropDownList1.SelectedItem.Text = rs.GetValue(1).ToString();
                 DropDownList2.SelectedItem.Text = rs.GetValue(2).ToString();
                 DropDownList3.SelectedItem.Text = rs.GetValue(3).ToString();
             }
             rs.Close();
             cmd.Dispose();
             cn.Close();

             int l, m, h;
             l = 0;
             m = 0;
             h = 0;
             l = int.Parse(DropDownList1.SelectedItem.Text);
             m = int.Parse(DropDownList2.SelectedItem.Text);
             h = int.Parse(DropDownList3.SelectedItem.Text);

             int tot = l + m + h;
             if (tot == 100)
             {
                 int lamt = l * 1000;
                 int mamt = m * 1000;
                 int hamt = h * 1000;

                 lamt = (13 * lamt) / 100;
                 mamt = (20 * mamt) / 100;
                 hamt = (50 * hamt) / 100;

                 Label1.Text = lamt.ToString();
                 Label2.Text = mamt.ToString();
                 Label3.Text = hamt.ToString();

                 int gtot = lamt + mamt + hamt;

                 double per = (gtot / 100000) * 100;

                 Label4.Text = "With Above Design you may have Growth Rate of " + per.ToString() + "%";
             }
             else
             {
                 Label4.Text = "Please Re-Allocate % to Invest";
             }
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from Growth where U_No='" + Session["User"].ToString() + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Growth values('" + Session["User"].ToString() + "'," + DropDownList1.SelectedItem.Text + "," + DropDownList2.SelectedItem.Text + "," + DropDownList3.SelectedItem.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        int l, m, h;
        l = 0;
        m = 0;
        h = 0;
        l = int.Parse(DropDownList1.SelectedItem.Text);
        m = int.Parse(DropDownList2.SelectedItem.Text);
        h = int.Parse(DropDownList3.SelectedItem.Text);

        int tot = l + m + h;
        if (tot == 100)
        {
            int lamt = l*1000;
            int mamt = m*1000;
            int hamt = h*1000;

            lamt = (13 * lamt) / 100;
            mamt = (20 * mamt) / 100;
            hamt = (50 * hamt) / 100;

            Label1.Text = lamt.ToString();
            Label2.Text = mamt.ToString();
            Label3.Text = hamt.ToString();

            int gtot = lamt + mamt + hamt;

            double per = 0;
            per = gtot * 100;
            per = per / 100000;
            per = System.Math.Round(per, 2);
            Label4.Text = "With Above Design you may have Growth Rate of " + per.ToString() + "%";
        }
        else
        {
            Label4.Text = "Please Re-Allocate % to Invest";
        }
    }
}
