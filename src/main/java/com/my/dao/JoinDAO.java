package com.my.dao;

import com.my.dto.JoinDTO;

public interface JoinDAO {

    //로그인
    public JoinDTO login(JoinDTO dto) throws Exception;

    public int join(JoinDTO dto) throws Exception;
}
