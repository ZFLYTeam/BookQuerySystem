
using System.Data.SqlClient;
using System;
using System.Data;
using System.Configuration;
namespace BookQuerySystem
{
    /*
     * author:zhangjia
     * 时间:2014/9/30 21:22
     * 作用:数据库工具类
     */
    public class DbUtil
    {
        //打开数据库连接,返回一个SqlConnection对象
        public SqlConnection getCon()
        {
            //string conStr = "Server=localhost;Database=db_BQS;uid=sa;pwd=";
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlConnection sqlCon = new SqlConnection(conStr);
            sqlCon.Open();
            return sqlCon;
        }
        //关闭数据库连接，要传入需要关闭的sqlCon对象
        public void close(SqlConnection sqlCon)
        {
            if (sqlCon != null)
            {
                sqlCon.Close();
            }
        }
    }
}