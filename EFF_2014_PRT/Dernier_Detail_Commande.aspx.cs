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
    public partial class Dernier_Detail_Commande : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-39IN9RH\\SQLEXPRESS;Initial Catalog=EFF_2014_PRATIQUE;Integrated Security=True");
        public static string idprof;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["idprof"] == null)
            {
                Response.Redirect("loginpage.aspx");
            }
            else
            {
                
              
            }
           


        }

        protected void afficherBTN_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("select nomlycee,ville from detail_demande dd,demande d,lycee l  where d.iddemande = dd.iddemande# and dd.idlycee# = l.idlycee and  dd.iddemande#  = (select top 1 iddemande from demande where idprofesseur# = '" + txtidprof.Text + "'  order by iddemande desc) ", connection);
            SqlDataReader reader = command.ExecuteReader();
            DEMANDEGRID.DataSource = reader;
            DEMANDEGRID.DataBind();
            connection.Close();
        }
    }
}