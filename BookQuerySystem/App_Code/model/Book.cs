using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BookQuerySystem;

namespace BookQuerySystem
{
      /*
       * author:zhangjia
       * 时间:2014/10/03 22:43
       * 作用:model层Book
       */
    public class Book
    {
        private int bookId;
        private int bookTypeId;
        private string bookName;
        private string bookAuthor;
        private string bookDesc;
        private string bookCover;
        private string bookPrice;
        private string bookPublish;
        public int BookId
        {
            get { return bookId; }
            set { bookId = value; }
        }
        public int BookTypeId
        {
            get { return bookTypeId; }
            set { bookTypeId = value; }
        }
        public string BookName
        {
            get { return bookName; }
            set { bookName = value; }
        }
        public string BookDesc
        {
            get { return bookDesc; }
            set { bookDesc = value; }
        }
        public string BookAuthor
        {
            get { return bookAuthor; }
            set { bookAuthor = value; }
        }
        public string BookCover
        {
            get { return bookCover; }
            set { bookCover = value; }
        }
        public string BookPrice
        {
            get { return bookPrice; }
            set { bookPrice = value; }
        }
        public string BookPublish
        {
            get { return bookPublish; }
            set { bookPublish = value; }
        }

        //默认构造函数
        public Book()
        {

        }
        //不带id的构造函数
        public Book(int bookTypeId, string bookName, string bookAuthor, string bookDesc, string bookCover, string bookPrice, string bookPublish)
        {
            this.bookTypeId = bookTypeId;
            this.bookName = bookName;
            this.bookAuthor = bookAuthor;
            this.bookDesc = bookDesc;
            this.bookCover = bookCover;
            this.bookPrice = bookPrice;
            this.bookPublish = bookPublish;
        }
    }
}