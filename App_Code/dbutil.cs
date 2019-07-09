using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Data.OleDb;
using System.IO;



/// <summary>
/// Class to access data from database syntax DBUtil(ArtarWeb|Menaitech|Actatek,Nav)
/// Author : Rommel Pineda
/// </summary>
public class DBUtil
{

    #region Member Variables
    //Connection Strings from web.config
    private const string ArtarConString = "Artar_Bonyan";
    private const string MenaConString = "MenaITechConnectionString";
    private const string ActatekConString = "ACtatek_WebdbConnectionString";
    private const string MSDBConnectionString = "MSDBConnectionString";
    private const string Nav2k9ConnectionString = "NAVConnectionString";
    private const string Excel2k7 = "Excel07ConString";
    private const string Excel2k3 = "Excel03ConString";
    private const string OracleConString = "OracleConString";
    private const string GROUP_NOT_FOUND = "Group {0} not found. Please register the group before the summary.";
    private string DBConnectionString;
    private SqlConnection sqlcon;
    private DataTable dt;
    private SqlCommand sqlcmd;

    //private OracleConnection Osqlcon;
    //private OracleCommand Osqlcmd;
    #endregion

    #region Constant Error Messages
    private const string DEF_ERRORMESSAGE = "Error on  Class:'{0}',Function: '{1}', keyword: '{2}' Details:{3}";
    private const string DEF_ERRORMESSAGE_SAVING = "Error Occur:{0}";
    #endregion

    #region Property
    public enum DBNames
    {
        ArtarWeb,
       
    }
    #endregion

    #region Constructor
    public DBUtil()//default constructor
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DBUtil(string DBName)
    {
        if (DBName == DBNames.ArtarWeb.ToString())
        {
            DBConnectionString = ConfigurationManager.ConnectionStrings[ArtarConString].ToString();
        }
        //else if (DBName == DBNames.Menaitech.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[MenaConString].ToString();
        //}
        //else if (DBName == DBNames.Actatek.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[ActatekConString].ToString();
        //}
        //else if (DBName == DBNames.Excel2k7.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[Excel2k7].ToString();
        //}
        //else if (DBName == DBNames.Msdb.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[MSDBConnectionString].ToString();
        //}      
        //else if (DBName == DBNames.Nav2k9.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[Nav2k9ConnectionString].ToString();
        //}
        //else if (DBName == DBNames.Oracle.ToString())
        //{
        //    DBConnectionString = ConfigurationManager.ConnectionStrings[OracleConString].ToString();
        //}   
        //else
        //{
        //    DBConnectionString = "Undefine";
        //}

    }
    #endregion


    #region Methods

    //OverLoads Methods /static
    /// <summary>
    /// Get data from MS SQL
    /// return type : Datatable
    /// </summary>
   /* public DataTable GetOracleData(string OracleQuery, string ErrKeyword)
    {
        DataTable result = new DataTable();
        try
        {
            //sqlcon = new SqlConnection(this.DBConnectionString);
            OracleConnection Osqlcon = new OracleConnection(this.DBConnectionString);
            Osqlcmd = new OracleCommand(OracleQuery, Osqlcon);
            if (Osqlcon.State == ConnectionState.Closed)
            {
                Osqlcon.Open();
            }
            using (OracleDataAdapter sda = new OracleDataAdapter())
            {
                Osqlcmd.CommandType = CommandType.Text;
                sda.SelectCommand = Osqlcmd;
                sda.Fill(result);
            }
        }
        catch (Exception ex)
        {

            throw new Exception(String.Format(DEF_ERRORMESSAGE, "DBUtil", "GetOracleData", ErrKeyword, ex.Message.ToString()));
        }
        return result;
    }*/

    public DataTable GetData(string Query, string ErrKeyword)
    {
        DataTable result = new DataTable();
        try
        {

            sqlcon = new SqlConnection(this.DBConnectionString);
            sqlcmd = new SqlCommand(Query, sqlcon);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                sqlcmd.CommandType = CommandType.Text;
				sqlcmd.CommandTimeout = 0;
                sda.SelectCommand = sqlcmd;
                sda.SelectCommand.CommandTimeout = 0;
                sda.Fill(result);
            }
        }
        catch (Exception ex)
        {

            throw new Exception(String.Format(DEF_ERRORMESSAGE, "DBUtil", "Getdata", ErrKeyword, ex.Message.ToString()));
        }
        return result;
    }

    public int ExecuteNonQuery(SqlCommand command)
    {
        DBUtil dbutil = new DBUtil(DBUtil.DBNames.ArtarWeb.ToString());
        SqlConnection connection = new SqlConnection(dbutil.DBConnectionString);

        int rowsAffected = 0;
        try
        {
            //command.CommandText = query;
            command.Connection = connection;
            command.CommandTimeout = connection.ConnectionTimeout;
            //command.CommandType = CommandType.Text;
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            rowsAffected = command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw new Exception(String.Format(DEF_ERRORMESSAGE_SAVING, (ex.Message.ToString().Contains("duplicate") ? "Record already Exist!" : ex.Message.ToString())));
        }
        finally
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
            connection.Dispose();
            command.Dispose();
        }
        return rowsAffected;
    }

    /// <summary>
    /// Extract the data from excel file and append to datatable
    /// </summary>
    /// <param name="Filepath">e.i C:\dir\filename</param>
    /// <param name="Extension"></param>
    /// <returns></returns>
    public DataTable Import_To_DataTable(string FilePath, string Extension, string FileName)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings[Excel2k3].ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings[Excel2k7].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

        string SheetName = "";
        SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "] where EmployeeCode<>'' ";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();
        return dt;
    }

    /// <summary>
    /// Download the file from server
    ///filepath : ~/folder/subfolder
    ///</summary>   
    public void DownloadFile(string filepath, string filename)
    {
        //using (var client = new WebClient())
        //{
        //    client.DownloadFile("http://localhost:58267/attendance/EmployeeList_Template.xls", @"C:\ARTAR_web\Attendance\EmployeeList_Template.xls");
        //}

        HttpContext.Current.Response.ContentType = "APPLICATION/OCTET-STREAM";

        string Header = "Attachment; Filename=" + filename + "";
        HttpContext.Current.Response.AppendHeader("Content-Disposition", Header);
        System.IO.FileInfo Dfile = new System.IO.FileInfo(HttpContext.Current.Server.MapPath(filepath + filename));
        HttpContext.Current.Response.WriteFile(Dfile.FullName);
        HttpContext.Current.Response.End();
    }


    /// <summary>
    /// Upload the file to server
    /// FolderPath : @"C:\\Folder\\SubFolder\\"
    /// Filename   : myFilename.extension
    /// </summary>
    public int UploadFile(FileUpload FileUploadControl, string FolderPath, string filename)
    {
        int returnval = 0;

        if (FileUploadControl.HasFile)//with file
        {
            try
            {
                //FileUploadControl.SaveAs(FolderPath + filename+);

                string Ext = Path.GetExtension(FileUploadControl.PostedFile.FileName);
                if (Ext == ".xls")//Accept only Excell 2007 +
                {
                    string FilePath = HttpContext.Current.Server.MapPath(FolderPath + filename + Ext);//X:\\directory\\file.ext
                    FileUploadControl.SaveAs(FilePath);
                    returnval = 1;
                }
                else
                {
                    returnval = 0;
                    throw new Exception("Attachment invalid format!");
                }

            }
            catch (Exception EX)
            {
                throw new Exception(String.Format(DEF_ERRORMESSAGE, "DBUtil", "UploadFile(agrs[3])", string.Empty, EX.Message.ToString()));
                returnval = 0;
            }
        }
        else//without the shit file!
        {
            returnval = 0;
        }
        return returnval;
    }


    



    #endregion
}