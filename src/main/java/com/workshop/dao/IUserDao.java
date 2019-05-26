package com.workshop.dao;

import com.workshop.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {

    List<User> findAll();

    int delete(Long id);

    int updateByPrimaryKeySelective(User user);

    int insert(User user);

    int update(@Param("id") Integer id, @Param("password") String password);

    int updatetel(@Param("id") Integer id, @Param("telephone") String telephone);

}