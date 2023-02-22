using System;
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
using BillSystem.Classes;

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

        //[WebMethod]
        //[ScriptMethod]
        //public List<string> Itemcode(string ItemCode)
        //{
            
        //    SqlConnection con = new SqlConnection(connectionString);
        //    SqlCommand cmd = new SqlCommand("spSelectItemCode", con);
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@ItemCode", ItemCode);
        //    //cmd.Parameters.AddWithValue("@ItemName", ItemName);
        //    con.Open();
        //    SqlDataReader rdr = cmd.ExecuteReader();
        //    List<string> listitemcode = new List<string>();
        //    while (rdr.Read())
        //    {
        //        //listitemcode.Add(new Itemfetch() {ItemCode = Convert.ToString(rdr["ItemCode"]),ItemName = Convert.ToString(rdr["ItemName"]),GST = Convert.ToString(rdr["GST"]), Price= Convert.ToString(rdr["Price"]), Discount = Convert.ToString(rdr["Discount"]) });
        //        listitemcode.Add(rdr["ItemCode"].ToString());
        //        //listitemcode.Add(rdr["ItemName"].ToString());
        //    }
        //    con.Close();
        //    return listitemcode;
        //}

        //[WebMethod]
        //[ScriptMethod]
        //public List<string> Itemname(string ItemName)
        //{
        //    List<string> listitemname = new List<string>();
        //    SqlConnection con = new SqlConnection(connectionString);
        //    SqlCommand cmd = new SqlCommand("spSelectItemName", con);
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@ItemName", ItemName);
        //    con.Open();
        //    SqlDataReader rdr = cmd.ExecuteReader();
        //    while (rdr.Read())
        //    {
        //        listitemname.Add(rdr["ItemName"].ToString());
        //    }
        //    con.Close();
        //    return listitemname;
        //}

        [WebMethod]
        [ScriptMethod]
        public List<Itemfetch> Itemcode1(string ItemCode, string ItemName)
        {

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("spSelectItemCode1", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ItemCode", ItemCode);
            cmd.Parameters.AddWithValue("@ItemName", ItemName);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            List<Itemfetch> listitemcode = new List<Itemfetch>();
            while (rdr.Read())
            {
                listitemcode.Add(new Itemfetch() { ItemCode = Convert.ToString(rdr["ItemCode"]), ItemName = Convert.ToString(rdr["ItemName"]), GST = Convert.ToString(rdr["GST"]), Price = Convert.ToString(rdr["Price"]), Discount = Convert.ToString(rdr["Discount"]) });
                //listitemcode.Add(rdr["ItemCode"].ToString());
                //listitemcode.Add(rdr["ItemName"].ToString());
            }
            con.Close();
            return listitemcode;
        }

        public Result orderdetail(string orderdeta)
        {
            Result result = new Result();
            Itemfetch orderdetails = JsonConvert.DeserializeObject<Itemfetch>(orderdeta);

            SqlConnection sqlConnection = new SqlConnection(connectionString);
            using (SqlConnection con = sqlConnection)
            {
                SqlCommand cmd = new SqlCommand("spOrderdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@ItemCode",
                    Value = orderdetails.ItemCode
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@ItemName",
                    Value = orderdetails.ItemName
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@GST",
                    Value = orderdetails.GST
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Price",
                    Value = orderdetails.Price
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PricewithGST",
                    Value = orderdetails.priwithgst
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@GSTPricewithGSTPrice)",
                    Value = orderdetails.GST2
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@QTY",
                    Value = orderdetails.QTY
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Discount",
                    Value = orderdetails.Discount
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TotalGST",
                    Value = orderdetails.TotalGST
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@TotalwithGSTandDiscount",
                    Value = orderdetails.TotalwithGSTandDiscount
                });
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Customer",
                    Value = orderdetails.Customer
                });
                con.Open();
                int resultQuery = cmd.ExecuteNonQuery();
                con.Close();

                if (resultQuery == 1)
                {
                    result.success = true;
                }
                return result;
            }

            //return JsonConvert.SerializeObject(dt);
        }
    }
}
//ItemName = Convert.ToString(rdr["ItemName"])