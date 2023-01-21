package com.my.controller;

import com.my.dto.JoinDTO;
import com.my.service.JoinServiceImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JoinController {
    private JoinServiceImpl service;

    @Autowired
    public JoinController(JoinServiceImpl service) {
        this.service = service;
    }

    @RequestMapping(value = {"/join"}, method = {RequestMethod.POST})
    @ResponseBody
    public String register(JoinDTO dto) throws Exception {
        System.out.println("dto = " + dto);
        int join_ok = this.service.join(dto);
        if (join_ok == 1)
            return "success";
        return "fail";
    }

    @RequestMapping(value = {"/login"}, method = {RequestMethod.POST})
    @ResponseBody
    public String login(JoinDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        HttpSession session = req.getSession();
        JoinDTO login = this.service.login(dto);
        if (login == null) {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", Boolean.valueOf(false));
            return "로그인 실패";
        }
        session.setAttribute("member", login);
        session.setMaxInactiveInterval(3600);
        session.setAttribute("id", dto.getId());
        return dto.getId();
    }

    @RequestMapping(value = {"/login"}, method = {RequestMethod.GET})
    public String login() {
        return "loginForm";
    }

    @RequestMapping({"/logout"})
    public String logout(HttpServletRequest req) throws Exception {
        HttpSession session = req.getSession();
        session.invalidate();
        return "loginForm";
    }

    @RequestMapping({"/joinForm"})
    public String registerForm() {
        return "joinForm";
    }

    @RequestMapping(value = {"/idChk"}, method = {RequestMethod.POST})
    @ResponseBody
    public String idChk(JoinDTO dto) {
        JoinDTO id_chk = this.service.idChk(dto);
        if (id_chk == null)
            return "fail";
        return "success";
    }
}
