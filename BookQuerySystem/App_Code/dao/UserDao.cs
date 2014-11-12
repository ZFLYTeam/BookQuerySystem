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
     * 时间:2014/9/30 21:22
     * 作用:User的增删改查
     */
    public class UserDao
    {
        DbUtil dbUtil = new DbUtil();
        SqlConnection sqlCon = null;

        //用户登陆验证Dao
        public User login(User user)
        {
            sqlCon = dbUtil.getCon();
            User resultUser = null;
            string cmdText = "select * from t_user where userName='" + user.UserName + "' and password='" + user.Password + "'";//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultUser = new User();
                resultUser.UserName = (string)sqlDr["userName"];
                resultUser.Password = (string)sqlDr["password"];
                resultUser.UserId =(int)sqlDr["userId"];
            }
            sqlDr.Close();
            dbUtil.close(sqlCon);
            return resultUser;
        }


        //用户是否存在
        public bool Exist(string userName)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_user where userName='" + userName+"'";//查询用户字符串
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

        //根据id查找
        public User findById(string str)
        {
            sqlCon = dbUtil.getCon();
            User resultUser = null;
            string cmdText = "select * from t_user where userId ="+ str;//查询用户字符串
            SqlCommand sqlCmd = new SqlCommand(cmdText, sqlCon);//查询对象
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();//创建逐行数据读取器对象
            if (sqlDr.Read())
            {
                resultUser = new User();
                resultUser.UserName = (string)sqlDr["userName"];
                resultUser.Password = (string)sqlDr["password"];
                resultUser.UserId = (int)sqlDr["userId"];
            }
            sqlDr.Close();
            dbUtil.close(sqlCon);
            return resultUser;
        }

        //插入一个传进来的不含userId属性的user对象，插入成功返回true，否则返回false
        public bool userAdd(User user)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "insert into t_user (userName,password) values('"+user.UserName+"','"+user.Password+"')";
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

        //更新用户信息,传入一个user对象，根据传入对象的userId进行更新查询，更新成功返回true，否则返回false
        public bool userUpdate(User user)
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "update t_user set password='"+user.Password+"',userName='"+user.UserName+"' where userId="+user.UserId;
            SqlCommand sqlcom = new SqlCommand(cmdText, sqlCon);
            int n = sqlcom.ExecuteNonQuery();//返回受影响的行数
            if (n == 1)
            {
                dbUtil.close(sqlCon);
                return true;
            }
            else {
                dbUtil.close(sqlCon);
                return false;
            }
        }

        //测试
        public User testUser()
        {
            sqlCon = dbUtil.getCon();
            string cmdText = "select * from t_user";
            User user = new User();
            SqlDataAdapter da = new SqlDataAdapter(cmdText, sqlCon);//创建数据适配器实例对象
            DataSet ds = new DataSet();//创建数据集示例对象
            da.Fill(ds, "t_user");//填充
            user.UserName = ds.Tables["t_user"].Rows[0]["userName"].ToString();
            user.Password = ds.Tables["t_user"].Rows[0]["password"].ToString();
            return user;
        }
    }
}