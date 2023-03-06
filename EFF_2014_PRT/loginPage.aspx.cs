using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace EFF_2014_PRT
{
    public partial class loginPage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-39IN9RH\\SQLEXPRESS;Initial Catalog=EFF_2014_PRATIQUE;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("select idprofesseur from professeur where idprofesseur = '" + txtidprof.Text+"' and pass = '"+txtpass.Text+"' ",connection);

             command.ExecuteScalar();
            if (command.ExecuteScalar() != null)
            {
                Session["idprof"] = command.ExecuteScalar().ToString();
                 Response.Redirect("Welcome.aspx");

            }
            else
            {
                Response.Write("<script>alert('pass Incorrect')</script>");
                txtidprof.Text = "";
                txtpass.Text = "";
            }

            //if (reader.Read())
            //{
            //    while (reader.Read())
            //    {
            //        Dernier_Detail_Commande.idprof = reader.GetValue(0).ToString();
            //        Session["idprof"] = reader.GetString(0);

            //    }

            //    Response.Redirect("Welcome.aspx");


            //}
            //else
            //{
            //    Response.Write("<script>alert('pass Incorrect')</script>");
            //}


            connection.Close();

        }
    }
}