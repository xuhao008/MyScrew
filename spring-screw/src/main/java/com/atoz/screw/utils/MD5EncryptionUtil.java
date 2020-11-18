package com.atoz.screw.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5EncryptionUtil {
	/**
	 * 将指定的字符进行MD5的转换 
	 * @param string 指定的字符 
	 * @return String 进行MD转换后的字符
	 * @author yanggl
	 * @since 2010/07/01 
	 */
	public static String convertMD5(String string){
		MessageDigest md;
		StringBuffer sb = new StringBuffer();

		try {
			md = MessageDigest.getInstance("MD5");
			md.update(string.getBytes());
			byte[] r = md.digest();
			for (int i = 0; i < r.length; i++) {
				byte b = r[i];
				sb.append(Character.forDigit((b >> 4 & 0x0F), 16));
				sb.append(Character.forDigit((b & 0x0F), 16));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return sb.toString();
	}

	public static void main(String[] args) {
		String s = convertMD5("123456");
		System.out.println(s);
	}
}
