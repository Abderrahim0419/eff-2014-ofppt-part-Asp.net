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
    public partial class Demandepage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-39IN9RH\\SQLEXPRESS;Initial Catalog=EFF_2014_PRATIQUE;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idprof"] == null)
            {
                Response.Redirect("loginPage.aspx");
            }
            else
            {
                
            }
        }

        int verifier;
        private void demandeverifier()
        {
            connection.Open();
            SqlCommand command = new SqlCommand("select dbo.calcul('"+txtidprof.Text+"')",connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                verifier = int.Parse(reader.GetValue(0).ToString());
            }
            connection.Close();

        }
        protected void validerbtn_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("insert into demande values('"+DateTime.Today.Date.ToString()+"','"+txtidprof.Text+"')",connection);
            command.ExecuteNonQuery();
            connection.Close();
            Session["idprofa"] = txtidprof.Text;

            Response.Redirect("detail_commande.aspx");


        }

        protected void verifierdemandeBTN_Click(object sender, EventArgs e)
        {
            demandeverifier();
            if (verifier < 20)
            {
                verifierdemandelabel.Text = "demande non favorable ";
                verifierdemandelabel.ForeColor = System.Drawing.Color.Red ;
            }
            else if (verifier > 20 && verifier <= 30)
            {
                verifierdemandelabel.Text = "demande normal ";
                verifierdemandelabel.ForeColor = System.Drawing.Color.Black;
            }
            else if (verifier > 30)
            {
                verifierdemandelabel.Text = "demande  favorable ";
                verifierdemandelabel.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}