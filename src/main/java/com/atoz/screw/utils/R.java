package com.atoz.screw.utils;


import lombok.Data;

import java.io.Serializable;

/**
 * 响应信息主体
 *
 * @author ruoyi
 */
@Data
public class R<T> implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 成功 */
    public static final int SUCCESS = 200;

    /** 失败 */
    public static final int FAIL = 500;

    private int code;

    private String msg;

    private T data;

    public static <T> R<T> ok()
    {
        return restResult(null, SUCCESS, null);
    }

    public static <T>  R<T> ok(T data)
    {
        return restResult(data, SUCCESS, null);
    }

    public static <T>  R<T> ok(T data, String msg)
    {
        return restResult(data, SUCCESS, msg);
    }

    public static <T>  R<T> fail()
    {
        return restResult(null, FAIL, null);
    }

    public static <T>  R<T> fail(String msg)
    {
        return restResult(null, FAIL, msg);
    }

    public static <T>  R<T> fail(T data)
    {
        return restResult(data, FAIL, null);
    }

    public static <T>  R<T> fail(T data, String msg)
    {
        return restResult(data, FAIL, msg);
    }

    public static <T>  R<T> fail(int code, String msg)
    {
        return restResult(null, code, msg);
    }

    private static <T>  R<T> restResult(T data, int code, String msg)
    {
         R<T> apiResult = new  R<>();
        apiResult.setCode(code);
        apiResult.setData(data);
        apiResult.setMsg(msg);
        return apiResult;
    }
    
}
