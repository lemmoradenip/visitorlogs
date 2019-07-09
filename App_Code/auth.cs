using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for auth
/// </summary>
public class AUTH
{
    DBUtil dbutil = new DBUtil(DBUtil.DBNames.ArtarWeb.ToString());
    public string Username { get; set; }
    public string Password { get; set; }
    public AUTH()
    {
        //
        // TODO: Add constructor logic here
        //

    }


    public int ValidateAuth(string username,string password)
    {
        try
        {
            string qry = " select top 1 username from users where username='{0}' and password='{1}'";
            return dbutil.GetData(string.Format(qry, username, password), "ValidateAuth()").Rows.Count;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message.ToString());
            
        }
    }
    
}