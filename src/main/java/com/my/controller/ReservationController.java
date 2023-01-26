package com.my.controller;

import com.my.dto.RegisterDTO;
import com.my.service.ReservationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ReservationController {
    private static final Logger log = Logger.getLogger(ReservationController.class);

    private ReservationService service;

    @Autowired
    public ReservationController(ReservationService service) {
        this.service = service;
    }

    @RequestMapping({"/reservationForm"})
    public String reservationForm(Model model) {
        model.addAttribute("getMovie", service.getMovie());
        return "/reservation/reservationForm";
    }

    @RequestMapping("/reservationChk")
    public String reservationChk(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("id");
        List<RegisterDTO> dto = service.getReservation(id);
        model.addAttribute("reservationList", dto);

        return "/reservation/reservationChk";
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
                             @RequestParam String time,HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();

        session.setAttribute("movie", movie);
        session.setAttribute("city", city);
        session.setAttribute("theater", theater);
        session.setAttribute("date", date);
        session.setAttribute("time", time);

        return "성공";
    }

    @PostMapping("/movieReservation")
    @ResponseBody
    public String movieReservation(RegisterDTO dto) {

        int registerSuccess = service.registerMovie(dto);
        if(registerSuccess == 1) {
            return "success";
        }
        return "fail";
    }

    @PostMapping("/cancelReservation")
    @ResponseBody
    public String cancelReservation(@RequestParam int rno) {
        int cancelSuccess = service.cancelReservation(rno);
        if(cancelSuccess == 1) {
            return "success";
        }
        return "fail";
    }
}
