package com.my.mapper;

import com.my.dto.BoardDTO;
import java.util.List;

public interface BoardMapper {
  List<BoardDTO> getList();
  
  void insert(BoardDTO paramBoardDTO);
  
  BoardDTO read(Long paramLong);
  
  int delete(Long paramLong);
  
  int update(BoardDTO paramBoardDTO);
}
