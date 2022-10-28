package com.my.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeMapper {

    @Select("select now()")
    public String getTime();

    public String getTime2();
}
