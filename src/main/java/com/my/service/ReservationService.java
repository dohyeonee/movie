package com.my.service;

import com.my.dto.MovieDTO;
import com.my.dto.RegisterDTO;
import java.util.List;

public interface ReservationService {
  List<MovieDTO> getMovie();

  int registerMovie(RegisterDTO dto);

  List<RegisterDTO> getReservation(String id);

  int cancelReservation(int rno);

}
