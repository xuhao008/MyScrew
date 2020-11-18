package com.atoz.screw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-11-13 14:42
 */
@Controller
@RequestMapping("/page")
public class PageController {
    @RequestMapping(value = "/{page}",method = RequestMethod.GET)
    public String page(@PathVariable("page")String page){
        return page;
    }
}
