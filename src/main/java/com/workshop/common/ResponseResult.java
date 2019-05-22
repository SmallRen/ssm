package com.workshop.common;

public class ResponseResult<T> {
    private Integer status;

    private T data;

    private String msg;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public synchronized static <T> ResponseResult<T> e(ResponseCode code, T t) {
        ResponseResult<T> responseResult = new ResponseResult();
        responseResult.setStatus(code.code);
        responseResult.setMsg(code.msg);
        responseResult.setData(t);
        return responseResult;
    }
}