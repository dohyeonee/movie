package com.my.service;

import com.my.dto.JoinDTO;

public interface JoinService {
    JoinDTO login(JoinDTO paramJoinDTO);

    int join(JoinDTO paramJoinDTO);

    JoinDTO idChk(JoinDTO paramJoinDTO);
}
