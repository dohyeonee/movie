package com.my.mapper;

import com.my.dto.MovieDTO;
import com.my.dto.RegisterDTO;
import java.util.List;

public interface ReservationMapper {
  List<MovieDTO> getMovie();
  
  void insert(RegisterDTO paramRegisterDTO);
  
  List<RegisterDTO> list();
}
