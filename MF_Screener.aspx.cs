using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
public partial class MF_Screener : System.Web.UI.Page
{
    System.Data.Odbc.OdbcConnection conn;
    DataTable dt;
    System.Data.Odbc.OdbcDataAdapter da;
    System.Data.Odbc.OdbcCommand cmd;
    System.Data.Odbc.OdbcDataReader rs;
    string connectionString;
    string importFolder;
    string fileName;

    SqlConnection scn = new SqlConnection();
    SqlCommand scmd = new SqlCommand();

    ArrayList f = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        scn.ConnectionString = "Data Source=ANIRUDHIYENGAR;Initial Catalog=FinAppln;Integrated Security=True";
        if (!IsPostBack)
        {
            scn.Open();
            scmd.Connection = scn;
            scmd.CommandText = "delete from MF_Temp";
            scmd.ExecuteNonQuery();
            scmd.Dispose();
            scn.Close();
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 1)
        {
            HighCalc(2);
        }
        else if (DropDownList1.SelectedIndex == 2)
        {
            LowCalc(2);
        }
        else if (DropDownList1.SelectedIndex == 3)
        {
            HighCalc(2);
        }
        else if (DropDownList1.SelectedIndex == 4)
        {
            LowCalc(2);
        }
    }

    public void HighCalc(int no)
    {
        importFolder = MapPath("~\\MFDATA");

        fileName = "MF260412.csv";
        ArrayList a = new ArrayList();
        a.Clear();
        connectionString = @"Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + importFolder + ";";

        conn = new System.Data.Odbc.OdbcConnection(connectionString);
        conn.Open();
        cmd = new System.Data.Odbc.OdbcCommand();
        cmd.Connection = conn;
        cmd.CommandText = "select * from [" + fileName + "]";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            a.Add(rs.GetValue(4).ToString());
        }
        rs.Close();
        cmd.Dispose();
        conn.Close();

        fileName = "LIST.CSV";
        f.Clear();
        conn.Open();
        cmd = new System.Data.Odbc.OdbcCommand();
        cmd.Connection = conn;
        cmd.CommandText = "select * from [" + fileName + "]";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            f.Add(rs.GetString(0));
        }
        rs.Close();
        cmd.Dispose();
        conn.Close();

        int i = 0;
        int j = 0;
        int fg = 0;
        double hh = 0;
        double hg = 0;
        ArrayList sah = new ArrayList();
        sah.Clear();
        for (i = 0; i < a.Count; i++)
        {
            string sn = a[i].ToString();
            int io = sn.IndexOf("'");
            if (io == -1)
            {
                fg = 0;
                hh = 0;
                for (j = f.Count - no; j < f.Count; j++)
                {
                    fileName = f[j].ToString();
                    hg = 0;
                    conn = new System.Data.Odbc.OdbcConnection(connectionString);
                    conn.Open();
                    cmd = new System.Data.Odbc.OdbcCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select NAV from [" + fileName + "] where Scheme_Name='" + sn + "'";
                    rs = cmd.ExecuteReader();
                    while (rs.Read())
                    {
                        hg = double.Parse(rs.GetValue(0).ToString());
                    }
                    rs.Dispose();
                    rs.Close();
                    cmd.Dispose();
                    conn.Close();
                    conn.Dispose();
                    if (fg == 0)
                    {
                        hh = hg;
                        fg = 1;
                    }
                    else
                    {
                        if (hg > hh)
                        {
                            hh = hg;
                        }
                    }
                }
                if (hh == hg)
                {
                    sah.Add(sn);
                }
            }

        }
        scn.Open();
        scmd.Connection = scn;
        scmd.CommandText = "delete from MF_Temp";
        scmd.ExecuteNonQuery();
        scmd.Dispose();
        scn.Close();
        for (i = 0; i < sah.Count; i++)
        {
            //Fetch
            string s1 = "";
            string s2 = "";
            string s3 = "";
            string s4 = "";
            string s5 = "";
            string s6 = "";
            string s7 = "";
            string s8 = "";
            importFolder = MapPath("~\\MFDATA");

            fileName = "MF260412.csv";

            connectionString = @"Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + importFolder + ";";

            conn = new System.Data.Odbc.OdbcConnection(connectionString);
            conn.Open();
            cmd = new System.Data.Odbc.OdbcCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from [" + fileName + "] where Scheme_Name='" + sah[i].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                s1 = rs.GetValue(0).ToString();
                s2 = rs.GetValue(1).ToString();
                s3 = rs.GetValue(2).ToString();
                s4 = rs.GetValue(3).ToString();
                s5 = rs.GetValue(4).ToString();
                s6 = rs.GetValue(5).ToString();
                s7 = rs.GetValue(6).ToString();
                s8 = rs.GetValue(7).ToString();
            }
            rs.Close();
            cmd.Dispose();
            conn.Close();

            scn.Open();
            scmd.Connection = scn;
            scmd.CommandText = "insert into MF_Temp values('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + s6 + "','" + s7 + "','" + s8 + "')";
            scmd.ExecuteNonQuery();
            scmd.Dispose();
            scn.Close();
        }

        SqlDataSource1.SelectCommand = "select * from MF_Temp";
    }

    public void LowCalc(int no)
    {
        importFolder = MapPath("~\\MFDATA");

        fileName = "MF260412.csv";
        ArrayList a = new ArrayList();
        a.Clear();
        connectionString = @"Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + importFolder + ";";

        conn = new System.Data.Odbc.OdbcConnection(connectionString);
        conn.Open();
        cmd = new System.Data.Odbc.OdbcCommand();
        cmd.Connection = conn;
        cmd.CommandText = "select * from [" + fileName + "]";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            a.Add(rs.GetValue(4).ToString());
        }
        rs.Close();
        cmd.Dispose();
        conn.Close();

        fileName = "LIST.CSV";
        f.Clear();
        conn.Open();
        cmd = new System.Data.Odbc.OdbcCommand();
        cmd.Connection = conn;
        cmd.CommandText = "select * from [" + fileName + "]";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            f.Add(rs.GetString(0));
        }
        rs.Close();
        cmd.Dispose();
        conn.Close();

        int i = 0;
        int j = 0;
        int fg = 0;
        double hh = 0;
        double hg = 0;
        ArrayList sah = new ArrayList();
        sah.Clear();
        for (i = 0; i < a.Count; i++)
        {
            string sn = a[i].ToString();
            int io = sn.IndexOf("'");
            if (io == -1)
            {
                fg = 0;
                hh = 0;
                for (j = f.Count - no; j < f.Count; j++)
                {
                    fileName = f[j].ToString();
                    hg = 0;
                    conn = new System.Data.Odbc.OdbcConnection(connectionString);
                    conn.Open();
                    cmd = new System.Data.Odbc.OdbcCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select NAV from [" + fileName + "] where Scheme_Name='" + sn + "'";
                    rs = cmd.ExecuteReader();
                    while (rs.Read())
                    {
                        hg = double.Parse(rs.GetValue(0).ToString());
                    }
                    rs.Dispose();
                    rs.Close();
                    cmd.Dispose();
                    conn.Close();
                    conn.Dispose();
                    if (fg == 0)
                    {
                        hh = hg;
                        fg = 1;
                    }
                    else
                    {
                        if (hg < hh)
                        {
                            hh = hg;
                        }
                    }
                }
                if (hh == hg)
                {
                    sah.Add(sn);
                }
            }

        }
        scn.Open();
        scmd.Connection = scn;
        scmd.CommandText = "delete from MF_Temp";
        scmd.ExecuteNonQuery();
        scmd.Dispose();
        scn.Close();
        for (i = 0; i < sah.Count; i++)
        {
            //Fetch
            string s1 = "";
            string s2 = "";
            string s3 = "";
            string s4 = "";
            string s5 = "";
            string s6 = "";
            string s7 = "";
            string s8 = "";
            importFolder = MapPath("~\\MFDATA");

            fileName = "MF260412.csv";

            connectionString = @"Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + importFolder + ";";

            conn = new System.Data.Odbc.OdbcConnection(connectionString);
            conn.Open();
            cmd = new System.Data.Odbc.OdbcCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from [" + fileName + "] where Scheme_Name='" + sah[i].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                s1 = rs.GetValue(0).ToString();
                s2 = rs.GetValue(1).ToString();
                s3 = rs.GetValue(2).ToString();
                s4 = rs.GetValue(3).ToString();
                s5 = rs.GetValue(4).ToString();
                s6 = rs.GetValue(5).ToString();
                s7 = rs.GetValue(6).ToString();
                s8 = rs.GetValue(7).ToString();
            }
            rs.Close();
            cmd.Dispose();
            conn.Close();

            scn.Open();
            scmd.Connection = scn;
            scmd.CommandText = "insert into MF_Temp values('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + s6 + "','" + s7 + "','" + s8 + "')";
            scmd.ExecuteNonQuery();
            scmd.Dispose();
            scn.Close();
        }

        SqlDataSource1.SelectCommand = "select * from MF_Temp";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[5].Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        scn.Open();
        scmd.Connection = scn;
        scmd.CommandText = "insert into Res_Alloc values('" + Session["User"].ToString() + "','MRMR','" + TextBox1.Text + "','Mutual Fund'," + TextBox2.Text + ")";
        scmd.ExecuteNonQuery();
        scmd.Dispose();
        scn.Close();
        TextBox1.Text = "";
        TextBox2.Text = "";
        Label1.Text = "Record Saved";
    }
}
