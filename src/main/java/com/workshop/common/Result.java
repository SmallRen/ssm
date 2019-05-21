package com.workshop.common;

import java.util.HashMap;

public class Result {
    public static int errorCode;

    private String message;

    HashMap<String, String> data;

    public static Result success(String fileName) {
        Result result = new Result();
        result.setErrorCode(0);
        result.setMessage("成功！");
        HashMap<String, String> map = new HashMap<>();
        map.put("imageUrl", fileName);
        result.setData(map);
        return result;
    }


    public static Result error() {
        Result result = new Result();
        result.setErrorCode(1);
        result.setMessage("失败！");
        return result;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public HashMap<String, String> getData() {
        return data;
    }

    public void setData(HashMap<String, String> data) {
        this.data = data;
    }
}
