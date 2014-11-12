using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BookQuerySystem
{
    /*
     * Author:Youye
     * Time:2014/10/10
     * Function:the News class in the model layer
     */

    public class News
    {
        private int newsId;
        private int userId;
        private string newsTitle;
        private string newsBody;
        private string newsRepTime;
        private string newsModifyTime;

        /*
         * get/set是new一个对象，然后给对象的一个个属性赋值
         * 方便返回和设定的简写函数
         * 保护好类内的数据变量，不会暴露出类的结构，防止用内存修改器改变类中数据
         * get/set 属性设定工具
         */
        public int NewsId
        {
            get { return newsId; }
            set { newsId = value; }
        }
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        public string NewsTitle
        {
            get { return newsTitle; }
            set { newsTitle = value; }
        }
        public string NewsBody
        {
            get { return newsBody; }
            set { newsBody = value; }
        }
        public string NewsRepTime
        {
            get { return newsRepTime; }
            set { newsRepTime = value; }
        }
        public string NewsModifyTime
        {
            get { return newsModifyTime; }
            set { newsModifyTime = value; }
        }

        //默认的构造函数
        public News()
        {

        }
    }
}
