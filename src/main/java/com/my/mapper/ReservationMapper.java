package com.my.mapper;

import com.my.dto.MovieDTO;
import com.my.dto.RegisterDTO;
import java.util.List;

public interface ReservationMapper {
  List<MovieDTO> getMovie();
  
  int registerMovie(RegisterDTO dto);

  List<RegisterDTO> getReservation(String id);

  int cancelReservation(int rno);

}
