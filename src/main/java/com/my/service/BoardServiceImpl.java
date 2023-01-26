package com.my.service;

import com.my.dto.BoardDTO;
import com.my.mapper.BoardMapper;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
  private static final Logger log = Logger.getLogger(BoardServiceImpl.class);
  
  private BoardMapper mapper;

  @Autowired
  public BoardServiceImpl(BoardMapper mapper) {
    this.mapper = mapper;
  }
  
  public void register(BoardDTO board) {
    log.info("register....." + board);
    mapper.insert(board);
  }
  
  public BoardDTO get(Long bno) {
    log.info("get..........." + bno);
    return mapper.read(bno);
  }
  
  public boolean modify(BoardDTO board) {
    log.info("modify......" + board);
    return (mapper.update(board) == 1);
  }
  
  public boolean remove(Long bno) {
    log.info("remove......" + bno);
    return (mapper.delete(bno) == 1);
  }
  
  public List<BoardDTO> getList() {
    log.info("getList............");
    return mapper.getList();
  }
}
