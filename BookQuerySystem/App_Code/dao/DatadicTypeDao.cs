using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using BookQuerySystem;
using System.Data;


namespace BookQuerySystem
{

    public class DatadicTypeDao
    {
        static DbUtil dbUtil = new DbUtil();
        SqlConnection sqlCon = null;

        //根据ddTypeName判断是否已经存在,返回true表示已经存在该类别，否则不存在
        public bool existDatadicType(DatadicType datadicType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_datadicType where ddTypeName='" + datadicType.DdTypeName + "'";
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                sqlDr.Close();
                dbUtil.close(sqlCon);
                return true;
            }
            else
            {
                sqlDr.Close();
                dbUtil.close(sqlCon);
                return false;
            }
        }
        //插入一个传进来的不含ddTypeId属性的ddType对象，插入成功返回true，否则返回false
        public bool datadicTypeAdd(DatadicType datadicType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "insert into t_datadicType (ddTypeName, ddTypeDesc) values('" + datadicType.DdTypeName + "','" + datadicType.DdTypeDesc + "')";
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(sqlCon);
                return true;
            }
            else
            {
                dbUtil.close(sqlCon);
                return false;
            }
        }
        //更新书籍类别信息,传入一个DatadicType对象，根据传入对象的ddTypeId进行更新查询，更新成功返回true，否则返回false
        public bool datadicTypeUpdate(DatadicType datadicType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "update t_datadicType set ddTypeName='" + datadicType.DdTypeName + "',   ddTypeDesc='" + datadicType.DdTypeDesc + "' where ddTypeId=" + datadicType.DdTypeId;
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(sqlCon);
                return true;
            }
            else
            {
                dbUtil.close(sqlCon);
                return false;
            }
        }
        //删除书籍类别信息,传入一个DatadicType对象，根据传入对象的ddTypeId进行删除查询，更新成功返回true，否则返回false
        public bool datadicTypeDelete(DatadicType datadicType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "delete from t_datadicType where ddTypeId=" + datadicType.DdTypeId;
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(sqlCon);
                return true;
            }
            else
            {
                dbUtil.close(sqlCon);
                return false;
            }
        }

        //查询所有的，返回一个Dataset
        public DataSet getDatadicType()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_datadicType";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "t_datadicType");//填充
            return ds;
        }

        //根据主键查询某一个DatadicType
        public DatadicType findById(int ddTypeId)
        {
            sqlCon = dbUtil.getCon();
            DatadicType resultDatadicType = null;
            string cmdText = "select * from t_datadicType where ddTypeId=" + ddTypeId;//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultDatadicType = new DatadicType();
                resultDatadicType.DdTypeId = (int)sqlDr["ddTypeId"];
                resultDatadicType.DdTypeName = (string)sqlDr["ddTypeName"];
                resultDatadicType.DdTypeDesc = (string)sqlDr["ddTypeDesc"];
            }
            sqlDr.Close();
            dbUtil.close(sqlCon);
            return resultDatadicType;
        }
    }
}