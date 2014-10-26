using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookQuerySystem
{
    /*
     * author:Yujian
     * 时间:2014/10/08 21:00
     * 作用:model层DatadicType
     */
    public class DatadicType
    {
        private int ddTypeId;
        private string ddTypeName;
        private string ddTypeDesc;

        public int DdTypeId
        {
            get { return ddTypeId; }
            set { ddTypeId = value; }
        }

        public string DdTypeName
        {
            get { return ddTypeName; }
            set { ddTypeName = value; }
        }

        public string DdTypeDesc
        {
            get { return ddTypeDesc; }
            set { ddTypeDesc = value; }
        }
        //无参构造函数
        public DatadicType() { }
        //不含id的构造函数
        public DatadicType(string ddTypeName, string ddTypeDesc)
        {
            this.ddTypeName = ddTypeName;
            this.ddTypeDesc = ddTypeDesc;
        }
    }
}