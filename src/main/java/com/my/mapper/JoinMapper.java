package com.my.mapper;

import com.my.dto.JoinDTO;

public interface JoinMapper {
  JoinDTO login(JoinDTO paramJoinDTO);
  
  int join(JoinDTO paramJoinDTO);
  
  JoinDTO idChk(JoinDTO paramJoinDTO);
}
