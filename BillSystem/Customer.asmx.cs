﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using Newtonsoft.Json;

namespace BillSystem
{
    /// <summary>
    /// Summary description for Customer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class Customer : System.Web.Services.WebService
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["BillSystem"].ConnectionString;



        [WebMethod]
        [ScriptMethod]
        public List<string> GetCustomer(string CustomerFirstName)
        {
            List<string> listcustomer = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("spSelectAllCustomers", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CustomerFirstName", CustomerFirstName);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            //DataTable dt = new DataTable();
            //DataSet ds = new DataSet();
            //sda.Fill(dt);
            while (rdr.Read()) 
            {
                listcustomer.Add(rdr["CustomerFirstName"].ToString());
            }
            con.Close();
            return listcustomer;

            //return JsonConvert.SerializeObject(dt);
        }

        [WebMethod]
        [ScriptMethod]
        public List<string> Itemcode(string ItemCode)
        {
            List<string> listitemcode = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("spSelectItemCode", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ItemCode", ItemCode);
            //cmd.Parameters.AddWithValue("@ItemName", ItemName);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                listitemcode.Add(rdr["ItemCode"].ToString());
                //listitemcode.Add(rdr["ItemName"].ToString());
            }
            con.Close();
            return listitemcode;
        }

        [WebMethod]
        [ScriptMethod]
        public List<string> Itemname(string ItemName)
        {
            List<string> listitemname = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("spSelectItemName", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ItemName", ItemName);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                listitemname.Add(rdr["ItemName"].ToString());
            }
            con.Close();
            return listitemname;
        }
    }
}
