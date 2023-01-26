package com.my.controller;

import com.my.dto.MemberDTO;
import com.my.service.MemberServiceImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
    private MemberServiceImpl service;

    @Autowired
    public MemberController(MemberServiceImpl service) {
        this.service = service;
    }

    @RequestMapping(value = {"/join"}, method = {RequestMethod.POST})
    @ResponseBody
    public String register(MemberDTO dto) throws Exception {
        System.out.println("dto = " + dto);
        int join_ok = service.join(dto);
        if (join_ok == 1)
            return "success";
        return "fail";
    }

    @RequestMapping(value = {"/login"}, method = {RequestMethod.POST})
    @ResponseBody
    public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        HttpSession session = req.getSession();
        MemberDTO login = service.login(dto);
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

    @RequestMapping(value = {"/login", "/loginForm"}, method = {RequestMethod.GET})
    public String login() {
        return "/member/loginForm";
    }

    @RequestMapping({"/logout"})
    public String logout(HttpServletRequest req) throws Exception {
        HttpSession session = req.getSession();
        session.invalidate();
        return "/member/loginForm";
    }

    @RequestMapping({"/joinForm"})
    public String registerForm() {
        return "/member/joinForm";
    }

    @RequestMapping(value = {"/idChk"}, method = {RequestMethod.POST})
    @ResponseBody
    public String idChk(MemberDTO dto) {
        MemberDTO id_chk = service.idChk(dto);
        if (id_chk == null)
            return "fail";
        return "success";
    }

    @RequestMapping("/infoForm")
    public String myInfoForm() {
        return "/member/infoForm";
    }

    @RequestMapping("/getInfo")
    @ResponseBody
    public MemberDTO getInfo(HttpServletRequest req) {
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("id");
        MemberDTO dto = service.getInfo(id);
        return dto;
    }

    @PostMapping("/infoChange")
    @ResponseBody
    public String myInfoChange(MemberDTO dto) {
        int changeInfo = service.changeInfo(dto);
        if (changeInfo == 1) {
            return "success";
        }
        return "fail";
    }
}
