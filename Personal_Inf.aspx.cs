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
public partial class Personal_Inf : System.Web.UI.Page
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
            cmd.CommandText = "select * from Per_Inf where U_No='" + Session["User"].ToString() + "'";
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
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();


            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox6.Text != "" && TextBox7.Text != "" && TextBox8.Text != "" && TextBox9.Text != "" && TextBox10.Text != "" && TextBox11.Text != "" && TextBox12.Text != "" && TextBox13.Text != "" && TextBox14.Text != "")
            {
                double fn = double.Parse(TextBox1.Text);
                double fb = double.Parse(TextBox2.Text);
                double diff = fn - fb;
                double per = (diff / fn) * 100;
                Label1.Text = per.ToString();
                if (Label1.Text == "-Infinity")
                {
                    Label1.Text = "0";
                }
                Label2.Text = diff.ToString();

                fn = double.Parse(TextBox3.Text);
                fb = double.Parse(TextBox4.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label3.Text = per.ToString();
                if (Label3.Text == "-Infinity")
                {
                    Label3.Text = "0";
                }
                Label4.Text = diff.ToString();

                fn = double.Parse(TextBox5.Text);
                fb = double.Parse(TextBox6.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label5.Text = per.ToString();
                if (Label5.Text == "-Infinity")
                {
                    Label5.Text = "0";
                }
                Label6.Text = diff.ToString();

                fn = double.Parse(TextBox7.Text);
                fb = double.Parse(TextBox8.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label7.Text = per.ToString();
                if (Label7.Text == "-Infinity")
                {
                    Label7.Text = "0";
                }
                Label8.Text = diff.ToString();

                fn = double.Parse(TextBox9.Text);
                fb = double.Parse(TextBox10.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label9.Text = per.ToString();
                if (Label9.Text == "-Infinity")
                {
                    Label9.Text = "0";
                }
                Label10.Text = diff.ToString();

                fn = double.Parse(TextBox11.Text);
                fb = double.Parse(TextBox12.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label11.Text = per.ToString();
                if (Label11.Text == "-Infinity")
                {
                    Label11.Text = "0";
                }
                Label12.Text = diff.ToString();

                fn = double.Parse(TextBox13.Text);
                fb = double.Parse(TextBox14.Text);
                diff = fn - fb;
                per = (diff / fn) * 100;
                Label13.Text = per.ToString();
                if (Label13.Text == "-Infinity")
                {
                    Label13.Text = "0";
                }
                Label14.Text = diff.ToString();

                //fn = double.Parse(TextBox3.Text);
                //fb = double.Parse(TextBox4.Text);
                //diff = fn - fb;
                //per = (diff / fn) * 100;
                //Label3.Text = per.ToString();
                //Label4.Text = diff.ToString();

                per = (double.Parse(Label1.Text) + double.Parse(Label3.Text) + double.Parse(Label5.Text) + double.Parse(Label7.Text) + double.Parse(Label9.Text) + double.Parse(Label11.Text) + double.Parse(Label13.Text));

                per = per / 7;

                Label15.Text = "Report : You Pay " + per.ToString() + " Extra";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from Per_Inf where U_No='" + Session["User"].ToString() + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Per_Inf values('" + Session["User"].ToString() + "'," + TextBox1.Text + "," + TextBox2.Text + "," + TextBox3.Text + "," + TextBox4.Text + "," + TextBox5.Text + "," + TextBox6.Text + "," + TextBox7.Text + "," + TextBox8.Text + "," + TextBox9.Text + "," + TextBox10.Text + "," + TextBox11.Text + "," + TextBox12.Text + "," + TextBox13.Text + "," + TextBox14.Text + ")";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        double fn = double.Parse(TextBox1.Text);
        double fb = double.Parse(TextBox2.Text);
        double diff = fn - fb;
        double per = (diff / fn)*100;
        Label1.Text = per.ToString();
        if (Label1.Text == "-Infinity")
        {
            Label1.Text = "0";
        }
        Label2.Text = diff.ToString();

        fn = double.Parse(TextBox3.Text);
        fb = double.Parse(TextBox4.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label3.Text = per.ToString();
        if (Label3.Text == "-Infinity")
        {
            Label3.Text = "0";
        }
        Label4.Text = diff.ToString();

        fn = double.Parse(TextBox5.Text);
        fb = double.Parse(TextBox6.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label5.Text = per.ToString();
        if (Label5.Text == "-Infinity")
        {
            Label5.Text = "0";
        }
        Label6.Text = diff.ToString();

        fn = double.Parse(TextBox7.Text);
        fb = double.Parse(TextBox8.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label7.Text = per.ToString();
        if (Label7.Text == "-Infinity")
        {
            Label7.Text = "0";
        }
        Label8.Text = diff.ToString();

        fn = double.Parse(TextBox9.Text);
        fb = double.Parse(TextBox10.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label9.Text = per.ToString();
        if (Label9.Text == "-Infinity")
        {
            Label9.Text = "0";
        }
        Label10.Text = diff.ToString();

        fn = double.Parse(TextBox11.Text);
        fb = double.Parse(TextBox12.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label11.Text = per.ToString();
        if (Label11.Text == "-Infinity")
        {
            Label11.Text = "0";
        }
        Label12.Text = diff.ToString();

        fn = double.Parse(TextBox13.Text);
        fb = double.Parse(TextBox14.Text);
        diff = fn - fb;
        per = (diff / fn) * 100;
        Label13.Text = per.ToString();
        if (Label13.Text == "-Infinity")
        {
            Label13.Text = "0";
        }
        Label14.Text = diff.ToString();

        //fn = double.Parse(TextBox3.Text);
        //fb = double.Parse(TextBox4.Text);
        //diff = fn - fb;
        //per = (diff / fn) * 100;
        //Label3.Text = per.ToString();
        //if (Label3.Text == "-Infinity")
        //{
        //    Label3.Text = "0";
        //}
        //Label4.Text = diff.ToString();

        per = (double.Parse(Label1.Text) + double.Parse(Label3.Text) + double.Parse(Label5.Text) + double.Parse(Label7.Text) + double.Parse(Label9.Text) + double.Parse(Label11.Text) + double.Parse(Label13.Text));

        per = per / 7;

        Label15.Text = "Report : You Pay " + per.ToString() + "% Extra";

        HyperLink1.Visible = true;

    }
}
