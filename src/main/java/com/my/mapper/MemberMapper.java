package com.my.mapper;

import com.my.dto.MemberDTO;

public interface MemberMapper {
  MemberDTO login(MemberDTO dto);
  
  int join(MemberDTO dto);
  
  MemberDTO idChk(MemberDTO dto);

  MemberDTO getInfo(String id);

  int changeInfo(MemberDTO dto);
}
