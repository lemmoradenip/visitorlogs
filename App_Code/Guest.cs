using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Guest
/// </summary>
public class Guest
{
    DBUtil dbutil = new DBUtil(DBUtil.DBNames.ArtarWeb.ToString());
    public Guest()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string Name { get; set; }
    public string Company { get; set; }
    public string Purpose { get; set; }
    public string Contactperson { get; set; }
    public string Gender { get; set; }
    public string Mobile { get; set; }
    public string Idnumber { get; set; }
    public string Notes { get; set; }
    public string Createdby { get; set; }
    public int Status { get; set; }
    public int Void { get; set; }
    public string Email { get; set; }
    public string Id { get; set; }


    public int AddGuest(int Id)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessVisitor");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@Name", this.Name);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@Company", this.Company);
        sqlcmd.Parameters.AddWithValue("@Purpose", this.Purpose);
        sqlcmd.Parameters.AddWithValue("@Contactperson", this.Contactperson);
        sqlcmd.Parameters.AddWithValue("@Gender", this.Gender);
        sqlcmd.Parameters.AddWithValue("@Mobile", this.Mobile);
        sqlcmd.Parameters.AddWithValue("@IdNumber", this.Idnumber);
        sqlcmd.Parameters.AddWithValue("@Notes", this.Notes);
        sqlcmd.Parameters.AddWithValue("@email", this.Email);
        sqlcmd.Parameters.AddWithValue("@Createdby", this.Createdby);
        return dbutil.ExecuteNonQuery(sqlcmd);
    }

    public int DeleteGuest(int GuestId)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessVisitor");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@Id", GuestId);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@TransactionType", "delete");//d=delete, i/u is null

        return dbutil.ExecuteNonQuery(sqlcmd);
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="GuestId"></param>
   /// <param name="CreatedBy"></param>
    /// <returns></returns>
    public int GuestOut(int GuestId)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessVisitor");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@Id", GuestId);
        sqlcmd.Parameters.AddWithValue("@Createdby", this.Createdby);
        sqlcmd.Parameters.AddWithValue("@TransactionType", "visitorout");//d=delete, i/u is null
        return dbutil.ExecuteNonQuery(sqlcmd);
    }


    /// <summary>
    /// Supply Guess Class Property
    /// </summary>
    /// <param name="GuestID"></param>
    /// <returns></returns>
    public int UpdateGuestInfo(int GuestID)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessVisitor");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@name", this.Name);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@company", this.Company);
        sqlcmd.Parameters.AddWithValue("@Purpose", this.Purpose);
        sqlcmd.Parameters.AddWithValue("@Contactperson", this.Contactperson);
        sqlcmd.Parameters.AddWithValue("@Gender", this.Gender);
        sqlcmd.Parameters.AddWithValue("@Mobile", this.Mobile);
        sqlcmd.Parameters.AddWithValue("@IdNumber", this.Idnumber);
        sqlcmd.Parameters.AddWithValue("@Notes", this.Notes);
        sqlcmd.Parameters.AddWithValue("@Createdby", this.Createdby);        
        sqlcmd.Parameters.AddWithValue("@Void", this.Void);
        sqlcmd.Parameters.AddWithValue("@email", this.Email);
        sqlcmd.Parameters.AddWithValue("@id", GuestID);
        return dbutil.ExecuteNonQuery(sqlcmd);

    }

}