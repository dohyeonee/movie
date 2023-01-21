package com.my.service;

import com.my.dto.MovieDTO;
import com.my.dto.RegisterDTO;
import java.util.List;

public interface ReservationService {
  List<MovieDTO> getMovie();
  
  void register(RegisterDTO paramRegisterDTO);
  
  List<RegisterDTO> list();
}
