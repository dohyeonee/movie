package com.my.mapper;

import com.my.dto.BoardDTO;
import java.util.List;

public interface BoardMapper {
  List<BoardDTO> getList();
  
  void insert(BoardDTO dto);
  
  BoardDTO read(Long bno);
  
  int delete(Long bno);
  
  int update(BoardDTO dto);
}
