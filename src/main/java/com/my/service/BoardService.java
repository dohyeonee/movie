package com.my.service;

import com.my.dto.BoardDTO;
import java.util.List;

public interface BoardService {
  void register(BoardDTO dto);
  
  BoardDTO get(Long bno);
  
  boolean modify(BoardDTO dto);
  
  boolean remove(Long bno);
  
  List<BoardDTO> getList();
}
