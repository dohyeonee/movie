package com.my.service;

import com.my.dto.MovieDTO;
import com.my.dto.RegisterDTO;
import com.my.mapper.ReservationMapper;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {
  private static final Logger log = Logger.getLogger(ReservationServiceImpl.class);
  
  private ReservationMapper mapper;
  @Autowired
  public ReservationServiceImpl(ReservationMapper mapper) {
    this.mapper = mapper;
  }
  
  public List<MovieDTO> getMovie() {
    log.info("getMovie");
    return this.mapper.getMovie();
  }
  
  public void register(RegisterDTO register) {
    this.mapper.insert(register);
  }
  
  public List<RegisterDTO> list() {
    return this.mapper.list();
  }
}
