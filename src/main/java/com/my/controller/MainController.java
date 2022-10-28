package com.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/index")
    public String index() {

        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "loginForm";
    }

}
