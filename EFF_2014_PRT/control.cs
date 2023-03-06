using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace EFF_2014_PRT
{
    public class control
    {
        
        public static SqlConnection connection = new SqlConnection("Data Source=DESKTOP-39IN9RH\\SQLEXPRESS;Initial Catalog=EFF_2014_PRATIQUE;Integrated Security=True");
        public void connecter()
        {
            
        }

    }
}