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
    public partial class detail_commande : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-39IN9RH\\SQLEXPRESS;Initial Catalog=EFF_2014_PRATIQUE;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["idprofa"] == null)
            {
                Response.Redirect("Demande.aspx");
            }
            else
            {
                getidcommande();
                lyceeshow();
            }
        }
        string idcommande;
        private void getidcommande()
        {
            connection.Open();
            SqlCommand command = new SqlCommand("select  top 1 iddemande  from demande where idprofesseur# = '"+Session["idprofa"]+ "' order by iddemande desc ", connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                idcommande = reader.GetValue(0).ToString();
            }

            connection.Close();
        }

        private void lyceeshow()
        {
            connection.Open();
           SqlDataAdapter adapter = new SqlDataAdapter("select top 10 nomlycee,idlycee from lycee ",connection);
            DataSet set = new DataSet();
            adapter.Fill(set);
            lyceedropdown.DataSource = set;
            lyceedropdown.DataTextField = "nomlycee";
            lyceedropdown.DataValueField = "idlycee";
            lyceedropdown.DataBind();

            connection.Close();

        }

        protected void ajouterBTN_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("insert into detail_demande values('"+idcommande+"','"+lyceedropdown.SelectedValue.ToString()+"','"+txtnumorder.Text+"')",connection);
            command.ExecuteNonQuery();

            connection.Close();


        }


    }
}