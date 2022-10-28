package com.my.service;

import com.my.dto.JoinDTO;

public interface JoinService {

    public JoinDTO login(JoinDTO dto) throws Exception;
    public int join(JoinDTO dto) throws Exception;
}
