package com.my.service;

import com.my.dto.BoardDTO;
import java.util.List;

public interface BoardService {
  void register(BoardDTO paramBoardDTO);
  
  BoardDTO get(Long paramLong);
  
  boolean modify(BoardDTO paramBoardDTO);
  
  boolean remove(Long paramLong);
  
  List<BoardDTO> getList();
}
