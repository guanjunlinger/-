package com.example.pojo;

import java.util.Date;
import java.util.Random;

public class StringUtil {
public static String  generateOrderID(String vip_ID){
    StringBuilder sb=new StringBuilder("");
    sb.append(vip_ID);
    sb.append("--");
    long timestamp=new Date().getTime();
    sb.append(timestamp);
    sb.append("--");
    Random r=new Random();
    int rand=r.nextInt()%10000;
    sb.append(rand);
    return sb.toString();
    }
}
