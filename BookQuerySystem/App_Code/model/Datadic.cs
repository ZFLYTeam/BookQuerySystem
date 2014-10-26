using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookQuerySystem
{
    /*  author:Fangmiao
     *  time:2014/10/15
     * 作用:model层Datadic
     */
    public class Datadic
    {
        private int ddId;
        private int ddTypeId;
        private string ddValue;
        private string ddDesc;

        public int DdId
        {
            get { return ddId; }
            set { ddId = value; }
        }
        public int DdTypeId
        {
            get { return ddTypeId; }
            set { ddTypeId = value; }
        }
        public string DdValue
        {
            get { return ddValue; }
            set { ddValue = value; }
        }
        public string DdDesc
        {
            get { return ddDesc; }
            set { ddDesc = value; }
        }
        public Datadic()
        {

        }
        //不带id的构造函数
        public Datadic(int ddId, int ddTypeId, string ddValue, string ddDesc)
        {
            this.ddId = ddId;
            this.ddTypeId = ddTypeId;
            this.ddValue = ddValue;
            this.ddDesc = ddDesc;
        }
    }
}