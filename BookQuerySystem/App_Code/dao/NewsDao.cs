using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BookQuerySystem;
using System.Data.SqlClient;
using System.Data;

namespace BookQuerySystem
{
    /*
     * Aauthor:Youye
     * Time:2014/10/10
     * Function:News release,modify and delete
     */
    public class NewsDao
    {
        DbUtil dbUtil = new DbUtil();
        SqlConnection sqlCon = null;
        //插入一个传进来的不含newsId属性的news对象，插入成功返回true，否则返回false
        public bool newsAdd(News news)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "insert into t_news(newsTitle,userId,newsBody,newsRepTime,newsModifyTime)values('" + news.NewsTitle + "'," + news.UserId + ",'" + news.NewsBody + "','" + news.NewsRepTime + "','" + news.NewsModifyTime + "')";
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();       //返回受影响的数据行
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

        //根据传进来的news对象的newsId进行删除查询，删除成功返回true,失败返回false
        public bool newsDelete(string newsId)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "delete from t_news where newsId=" + newsId;
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();       //返回受影响的数据行
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

        //根据传入的news对象的nesId进行更新查询，更新成功返回true,失败返回false
        public bool newsModify(News news)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "update t_news set newsTitle='" + news.NewsTitle + "',userId=" + news.UserId + ",newsBody='" + news.NewsBody + "',newRepTime='" + news.NewsRepTime + "',newsModifyTime=" + news.NewsModifyTime;
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();       //返回受影响的数据行
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
        //查询所有的新闻，返回一个DataSet
        public DataSet getNews()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_news";
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "t_news");//填充
            return ds;
        }
    }
}