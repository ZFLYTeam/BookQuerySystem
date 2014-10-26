using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using BookQuerySystem;
using System.Data;

namespace BookQuerySystem
{
   /*
    * author:zhangjia
    * 时间:2014/10/06 01:53
    * 作用:BookType的增删改查
    */
    
    public class BookTypeDao
    {
        static DbUtil dbUtil = new DbUtil();
        SqlConnection sqlCon =null;

        //根据bookTypeName判断是否已经存在,返回true表示已经存在该书籍类别，否则不存在
        public bool existBookType(BookType bookType) {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_bookType where bookTypeName='"+bookType.BookTypeName+"'";
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                sqlDr.Close();
                dbUtil.close(sqlCon);
                return true;
            }
            else {
                sqlDr.Close();
                dbUtil.close(sqlCon);
                return false;
            }
        }
        //插入一个传进来的不含bookTypeId属性的bookType对象，插入成功返回true，否则返回false
        public bool bookTypeAdd(BookType bookType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "insert into t_bookType (bookTypeName,bookTypeDesc) values('" + bookType.BookTypeName + "','" + bookType.BookTypeDesc + "')";
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
        //更新书籍类别信息,传入一个BookType对象，根据传入对象的bookTypeId进行更新查询，更新成功返回true，否则返回false
        public bool bookTypeUpdate(BookType bookType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "update t_bookType set bookTypeName='" + bookType.BookTypeName + "',bookTypeDesc='" +bookType.BookTypeDesc+ "' where bookTypeId=" + bookType.BookTypeId;
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
        //删除书籍类别信息,传入一个BookType对象，根据传入对象的bookTypeId进行删除查询，更新成功返回true，否则返回false
        public bool bookTypeDelete(BookType bookType)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "delete from t_bookType where bookTypeId="+bookType.BookTypeId;
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
        public DataSet getBookType()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_bookType";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "t_bookType");//填充
            return ds;
        }

        //根据主键查询某一个BookType
        public BookType findById(int bookTypeId)
        {
            sqlCon = dbUtil.getCon();
            BookType resultBookType = null;
            string cmdText = "select * from t_bookType where bookTypeId="+bookTypeId;//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultBookType = new BookType();
                resultBookType.BookTypeId = (int)sqlDr["bookTypeId"];
                resultBookType.BookTypeName= (string)sqlDr["bookTypeName"];
                resultBookType.BookTypeDesc= (string)sqlDr["bookTypeDesc"];
            }
            sqlDr.Close();
            dbUtil.close(sqlCon);
            return resultBookType;
        }


        //根据传进来的[当前页码,每页记录条数]返回DataSet
        public DataSet getBookType(int pageIndex, int pageSize)
        {
            //设置导入的起始地址
            int firstPage = pageIndex * pageSize;
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_bookType";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, firstPage, pageSize, "t_bookType");//填充
            return ds;
        }

        //获得查询数据的总条数
        public int GetAllCount()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select count(*) as COUNT from t_bookType";
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                return (int)sqlDr["COUNT"];
            }
            else
            {
                return -1;
            }
        }
    }
}