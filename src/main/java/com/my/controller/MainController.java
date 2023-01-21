package com.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping({"/loginForm"})
    public String login() {
        return "loginForm";
    }

    @RequestMapping({"/"})
    public String main() {
        return "index";
    }
}
