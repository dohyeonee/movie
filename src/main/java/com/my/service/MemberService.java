package com.my.service;

import com.my.dto.MemberDTO;

public interface MemberService {
    MemberDTO login(MemberDTO dto);

    int join(MemberDTO dto);

    MemberDTO idChk(MemberDTO dto);

    MemberDTO getInfo(String id);

    int changeInfo(MemberDTO dto);
}
