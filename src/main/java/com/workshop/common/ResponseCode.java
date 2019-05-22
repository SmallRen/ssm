package com.workshop.common;


public enum ResponseCode {
    OK(1, "操作成功"),
    FAIL(-1, "操作失败");
    public Integer code;
    public String msg;

    ResponseCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}

