using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookQuerySystem
{
    /*
     * author:zhangjia
     * 时间:2014/9/30 21:47
     * 作用:字符串工具类
     */
    public class StringUtil
    {
        
        /**
	     * 判断是否是空
	     * @param str
	     * @return
	     */
        public static bool isEmpty(String str)
        {
            if ("".Equals(str) || str == null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /**
	     * 判断是否不是空
	     * @param str
	     * @return
	     */
        public static bool isNotEmpty(String str)
        {
            if (!"".Equals(str) && str != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}