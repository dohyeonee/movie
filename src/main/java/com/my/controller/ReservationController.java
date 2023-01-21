package com.my.controller;

import com.my.dto.MovieDTO;
import com.my.service.ReservationService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ReservationController {
    private static final Logger log = Logger.getLogger(ReservationController.class);

    private ReservationService service;

    @Autowired
    public ReservationController(ReservationService service) {
        this.service = service;
    }

    @RequestMapping({"/reservationForm"})
    public String reservationForm(HttpServletRequest req, MovieDTO movieDTO) {
        HttpSession session = req.getSession();
        session.setAttribute("getMovie", service.getMovie());
        session.setAttribute("movieNo", movieDTO.getMovieNo());
        System.out.println("movieDTO = " + movieDTO);
        return "/reservation/reservation";
    }

    @GetMapping({"/seat"})
    public String seat() {
        return "/reservation/seat";
    }


    @GetMapping("/selectSeat")
    public String selectSeat() {
        return "/reservation/selectSeat";
    }

    @PostMapping("/selectSeat")
    @ResponseBody
    public String selectSeat(@RequestParam String movie,
                             @RequestParam String city,
                             @RequestParam String theater,
                             @RequestParam String date,
                             @RequestParam String time,
                             HttpServletRequest req ) {
        HttpSession session = req.getSession();
        session.setAttribute("movie", movie);
        session.setAttribute("city", city);
        session.setAttribute("theater", theater);
        session.setAttribute("date", date);
        session.setAttribute("time", time);

        System.out.println("movie = " + movie);
        System.out.println("city = " + city);
        System.out.println("theater = " + theater);
        System.out.println("date = " + date);
        System.out.println("time = " + time);
        return "성공";
    }

    @PostMapping("/movieReservation")
    @ResponseBody
    public String movieReservation(@RequestParam(required=false, defaultValue ="aa") String movie,
                                   @RequestParam(required=false, value="aa") String theater,
                                   @RequestParam(required=false, value="aa") String date,
                                   @RequestParam(required=false, value="aa") String time,
                                   @RequestParam(required=false, value="aa") String price,
                                   @RequestParam(required=false, value="aa") String seat) {
        System.out.println("movie = " + movie);
        System.out.println("theater = " + theater);
        System.out.println("date = " + date);
        System.out.println("time = " + time);
        System.out.println("price = " + price);
        System.out.println("seat = " + seat);
        return "ok";
    }
}
