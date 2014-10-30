using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using BookQuerySystem;

namespace BookQuerySystem
{
   /*
    * author:zhangjia
    * 时间:2014/9/30 21:22
    * 作用:Book的增删改查
    */
    public class BookDao
    {
        DbUtil dbUtil = new DbUtil();
        SqlConnection sqlCon = null;

        //根据bookTypeName判断是否已经存在,返回true表示已经存在该书籍类别，否则不存在
        public bool existBook(Book book)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_book where bookName='" + book.BookName + "'";
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

        //插入一个传进来的不含bookTypeId属性的bookType对象，插入成功返回true，否则返回false
        public bool bookAdd(Book book)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "insert into t_book (bookTypeId,bookName,bookAuthor,bookCover,bookPrice,bookPublish,BookDesc) values("+book.BookTypeId+",'"+book.BookName+"','"+book.BookAuthor+"','"+book.BookCover+"','"+book.BookPrice+"','"+book.BookPublish+"','"+book.BookDesc+"') ";
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

        //根据传入对象的Book的bookId进行删除查询，删除成功返回true，否则返回false
        public bool bookDelete(string bookId)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "delete from t_book where bookId="+bookId;
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
        //根据传入对象的Book的bookId进行更新查询，更新成功返回true，否则返回false
        public bool bookUpdate(Book book)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "update t_book set bookTypeId="+book.BookTypeId+",bookName='"+book.BookName+"',bookAuthor='"+book.BookAuthor+"',bookCover='"+book.BookCover+"',bookPrice='"+book.BookPrice+"',bookPublish='"+book.BookPublish+"',bookDesc='"+book.BookDesc+"' where bookId="+book.BookId;
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
        public DataSet getBook()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from view_book";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "view_book");//填充
            return ds;
        }
        //根据主键查询某一个Book
        public Book findById(string bookId)
        {
            sqlCon = dbUtil.getCon();
            Book resultBook= null;
            string cmdText = "select * from t_book where bookId=" + bookId;//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultBook= new Book();
                resultBook.BookId = (int)sqlDr["bookId"];
                resultBook.BookTypeId = (int)sqlDr["bookTypeId"];
                resultBook.BookName = (string)sqlDr["bookName"];
                resultBook.BookAuthor=(string)sqlDr["bookAuthor"];
                resultBook.BookCover=(string)sqlDr["bookCover"];
                resultBook.BookPrice=(string)sqlDr["bookPrice"];
                resultBook.BookPublish=(string)sqlDr["bookPublish"];
                resultBook.BookDesc = (string)sqlDr["bookDesc"];
            }
            sqlDr.Close();
            dbUtil.close(sqlCon);
            return resultBook;
        }

        //根据传进来的[当前页码,每页记录条数]返回DataSet
        public DataSet getBook(string cmdText,int pageIndex, int pageSize)
        {
            //设置导入的起始地址
            int firstPage = pageIndex * pageSize;
            sqlCon = dbUtil.getCon();
            //string cmdText = "select * from view_book";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, firstPage, pageSize, "view_book");//填充
            return ds;
        }

        //获得查询数据的总条数
        public int GetAllCount(string cmdText)
        {
            sqlCon = dbUtil.getCon();
            //string cmdText = "select count(*) as COUNT from t_book";
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                return (int)sqlDr["COUNT"];
            }
            else {
                return -1;
            }
        }
        
    }
}