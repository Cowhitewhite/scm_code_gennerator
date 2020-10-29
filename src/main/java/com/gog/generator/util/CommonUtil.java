package com.gog.generator.util;

import org.apache.commons.lang3.StringUtils;

public class CommonUtil {

    public static String replaceUnderLineAndUpperCase(String str) {
        return replaceUnderLineAndUpperCase(str, false);
    }

    public static String replaceUnderLineAndUpperCase(String str, Boolean isDelPrefix) {
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        int count = sb.indexOf("_");
        if (count != -1 && isDelPrefix) {
            sb = sb.replace(0, count + 1, "");
            count = sb.indexOf("_");
        }
        while (count != -1 && count != 0) {
            int num = sb.indexOf("_", count);
            count = num + 1;
            if (num != -1) {
                char ss = sb.charAt(count);
                char ia = (char) (ss - 32);
                sb.replace(count, count + 1, ia + "");
            }
        }
        String result = sb.toString().replaceAll("_", "");
        return StringUtils.capitalize(result);
    }

    /**
     * 首字母转小写
     * @param s
     * @return
     */
    public static String toLowerCaseFirstOne(String s){
        if(Character.isLowerCase(s.charAt(0))) {
            return s;
        } else{
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
        }
    }

    public static void main(String[] args) {
//        String str = "cms_contract";
//        str = replaceUnderLineAndUpperCase(str, true);
//        System.out.println("str = " + str);
        System.out.println(toLowerCaseFirstOne("Warehouse"));
    }
}
