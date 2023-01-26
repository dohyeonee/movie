package com.my.controller;

import com.my.dto.BoardDTO;
import com.my.service.BoardService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({"/board/*"})
public class BoardController {
    private static final Logger log = Logger.getLogger(BoardController.class);

    private BoardService service;

    @Autowired
    public BoardController(BoardService service) {
        this.service = service;
    }

    @GetMapping({"/list"})
    public void list(Model model) {
        log.info("list");
        model.addAttribute("list", service.getList());
    }

    @PostMapping({"/register"})
    public String register(BoardDTO board, RedirectAttributes rttr) {
        log.info("register: " + board);
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list";
    }

    @GetMapping({"/register"})
    public void register() {}

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model) {
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping({"/modify"})
    public String modify(BoardDTO board, RedirectAttributes rttr) {
        log.info("modify:" + board);
        if (service.modify(board))
            rttr.addFlashAttribute("result", "success");
        return "redirect:/board/list";
    }

    @PostMapping({"/remove"})
    public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
        log.info("remove..." + bno);
        if (service.remove(bno))
            rttr.addFlashAttribute("result", "success");
        return "redirect:/board/list";
    }
}
