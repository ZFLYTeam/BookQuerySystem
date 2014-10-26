using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookQuerySystem
{
     /*
      * author:zhangjia
      * 时间:2014/10/01 22:43
      * 作用:model层User
      */
    public class User
    {
        private int userId;
        private string userName;
        private string password;
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public User(int userId, String userName, String password) {
		    this.userId = userId;
		    this.userName = userName;
		    this.password = password;
	    }
        public User(String userName, String password)
        {
            this.userName = userName;
            this.password = password;
        }
        //默认构造函数
        public User()
        {
        }
}
}