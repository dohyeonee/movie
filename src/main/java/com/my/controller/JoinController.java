package com.my.controller;

import com.my.dto.JoinDTO;
import com.my.service.JoinServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class JoinController {

    private JoinServiceImpl service;

    @Autowired
    public JoinController(JoinServiceImpl service) {
        this.service = service;
    }

    @RequestMapping  (value = "/join", method = RequestMethod.POST)
    public String register(JoinDTO dto, RedirectAttributes rttr) throws Exception{
        System.out.println("dto = " + dto);
        int join_ok = service.join(dto);
        if(join_ok == 0) {
            rttr.addFlashAttribute("msg", 0);
        } else {
            rttr.addFlashAttribute("msg", 1);
        }

        return "redirect:/";
    }

    @RequestMapping(value= "/login", method = RequestMethod.GET)
    public String login(JoinDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        HttpSession session = req.getSession();
        JoinDTO login = service.login(dto);

        if(login == null) {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
            System.out.println("로그인 실패");
        } else {
            session.setAttribute("member", login);
            System.out.println("로그인 성공");
        }

        return "redirect:/";
    }

    @RequestMapping("/joinForm")
    public String registerForm() {
        return "joinForm";
    }
}
