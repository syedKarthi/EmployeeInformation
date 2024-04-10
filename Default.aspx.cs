using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Globalization;

namespace EmployeeInformation
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddata();
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
              
                DateTime eventDateTime = DateTime.Parse(DatePickerTextBox.Text);
                var DOB = eventDateTime.ToString("dd/MM/yyyy");

                using (SqlCommand cmd = new SqlCommand("Insert into EmployeeInfoDetails (EmployeeID,EmployeeName,EmployeeEmailID,EmployeeMobileNo,EmployeeDateofBirth,LastModifiedDate)  Values ('"+txtEmpID.Text+"','" + TxtEmpName.Text + "','" + txtEmpEmailid.Text + "','" + TxtMobileNo.Text + "','" +DOB +"','" + DateTime.Now + "')"))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Inserted');", true);
                    loaddata();
                    Reset();
                }
            }
        }

        void loaddata()
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {

                SqlCommand cmd = new SqlCommand("select * from EmployeeInfoDetails", con);

                SqlDataAdapter data = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                data.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update  EmployeeInfoDetails set EmployeeName='" + TxtEmpName.Text + "',EmployeeEmailID='" + txtEmpEmailid.Text + "',EmployeeMobileNo='" + TxtMobileNo.Text + "',EmployeeDateofBirth='" + DatePickerTextBox.Text + "',LastModifiedDate='" + DateTime.Now + "' where EmployeeEmailID='" + txtEmpEmailid.Text + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Updated');", true);
                loaddata();
                Reset();
            }

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from EmployeeInfoDetails where EmployeeName='" + TxtEmpName.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Deleted');", true);
                loaddata();
                Reset();

            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select EmployeeID,EmployeeName,EmployeeEmailID,EmployeeMobileNo,FORMAT(EmployeeDateofBirth, 'dd-MM-yyyy') ,LastModifiedDate from EmployeeInfoDetails where  EmployeeID='" + txtEmpID.Text + "'",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select EmployeeID,EmployeeName,EmployeeEmailID,EmployeeMobileNo,EmployeeDateofBirth  from EmployeeInfoDetails where  EmployeeID='" + txtEmpID.Text + "'",con);
                SqlDataReader r = cmd.ExecuteReader();
                while (r.Read())
                {
                   txtEmpID.Text = r.GetValue(0).ToString();
                   TxtEmpName.Text =r.GetValue(1).ToString();
                   txtEmpEmailid.Text = r.GetValue(2).ToString();
                   TxtMobileNo.Text = r.GetValue(3).ToString();
                   DatePickerTextBox.Text = r.GetValue(4).ToString();
                    

                }
                con.Close();



            }
        }


        void Reset()
        {
            txtEmpID.Text = string.Empty;
            TxtEmpName.Text = string.Empty;
            txtEmpEmailid.Text = string.Empty;
            TxtMobileNo.Text = string.Empty;
            DatePickerTextBox.Text = string.Empty;
            // so on youe all controls
        }
    }
}
