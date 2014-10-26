using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using BookQuerySystem;

namespace BookQuerySystem
{
    public class DatadicDao
    {
        DbUtil dbUtil = new DbUtil();
        SqlConnection con = null;
        //添加数据
        public bool datadicAdd(Datadic datadic)
        {
            con = dbUtil.getCon();
            string comText = "insert into t_datadic(ddTypeId,ddValue,ddDesc)values(" + datadic.DdTypeId + ",'" + datadic.DdValue + "','" + datadic.DdDesc + "') ";
            SqlCommand sqlcom = new SqlCommand(comText, con);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(con);
                return true;
            }
            else
            {
                dbUtil.close(con);
                return false;
            }
        }
        //根据传入对象的datadic的ddId进行删除查询，删除成功返回true，否则返回false
        public bool datadicDelete(Datadic datadic)
        {
            con = dbUtil.getCon();
            string cmdText = "delete from t_datadic where ddId=" + datadic.DdId;
            SqlCommand sqlcom = new SqlCommand(cmdText, con);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(con);
                return true;
            }
            else
            {
                dbUtil.close(con);
                return false;
            }
        }
        //根据传入对象的datadic的ddId进行更新查询，更新成功返回true，否则返回false
        public bool datadicUpdate(Datadic datadic)
        {
            con = dbUtil.getCon();
            string cmdText = "update t_datadic set ddTypeId=" + datadic.DdTypeId + ",ddValue='" + datadic.DdValue + "',ddDesc='" + datadic.DdDesc + "' where ddId=" + datadic.DdId;
            SqlCommand sqlcom = new SqlCommand(cmdText, con);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(con);
                return true;
            }
            else
            {
                dbUtil.close(con);
                return false;
            }
        }
        //查询所有的，返回一个Dataset
        public DataSet getDatadic()
        {
            con = dbUtil.getCon();
            string cmdText = "select * from t_datadic";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, con);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "t_datadic");//填充
            return ds;
        }

        //根据主键查询某一个Datadic
        public Datadic findById(int ddId)
        {
            con = dbUtil.getCon();
            Datadic resultDatadic = null;
            string cmdText = "select * from t_datadic where ddId=" + ddId;//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, con);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultDatadic = new Datadic();
                resultDatadic.DdId = (int)sqlDr["ddId"];
                resultDatadic.DdTypeId = (int)sqlDr["ddTypeId"];
                resultDatadic.DdValue = (string)sqlDr["ddValue"];
                resultDatadic.DdDesc = (string)sqlDr["ddDesc"];
            }
            sqlDr.Close();
            dbUtil.close(con);
            return resultDatadic;
        }
    }
}