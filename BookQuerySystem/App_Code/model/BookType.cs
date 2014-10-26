using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookQuerySystem
{
       /*
        * author:zhangjia
        * 时间:2014/10/03 22:43
        * 作用:model层BookType
        */
    public class BookType
    {
        private int bookTypeId;
        private string bookTypeName;
        private string bookTypeDesc;

        public int BookTypeId
        {
            get { return bookTypeId; }
            set { bookTypeId = value; }
        }

        public string BookTypeName
        {
            get { return bookTypeName; }
            set { bookTypeName = value; }
        }

        public string BookTypeDesc
        {
            get { return bookTypeDesc; }
            set { bookTypeDesc = value; }
        }
        //无参构造函数
        public BookType() { 
        }
        //不含id的构造函数
        public BookType(string bookTypeName,string bookTypeDesc) {
            this.bookTypeName = bookTypeName;
            this.bookTypeDesc = bookTypeDesc;
        }
    }
}