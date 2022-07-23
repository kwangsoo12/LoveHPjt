package com.loveandheart.LH.util;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class ConfigUtil {
	static String resource = "config/app.properties";
	static Properties properties = new Properties();

	public static String getHomeId() {
		String home_id = "";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            properties.load(reader);
            System.out.println(properties.getProperty("home_id"));
            System.out.println(properties.getProperty("main_mobile_second_menu_id"));
            home_id = properties.getProperty("home_id");
        } catch (IOException e) {
            e.printStackTrace();
        }	
        return home_id;
	}
	
	public static String getMenuId() {
		String menu_id = "";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            properties.load(reader);
            System.out.println(properties.getProperty("home_id"));
            System.out.println(properties.getProperty("main_mobile_second_menu_id"));
            menu_id = properties.getProperty("main_mobile_second_menu_id");
        } catch (IOException e) {
            e.printStackTrace();
        }	
        return menu_id;
	}
	

}