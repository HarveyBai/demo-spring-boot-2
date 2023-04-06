package com.wee0.demo.springBoot2.controller;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author baihw
 * @Description 功能描述
 * <pre>
 * 补充说明
 * </pre>
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/hello")
    public String hello(String name) {
        return "hello, " + (StringUtils.hasText(name) ? name : "defUser") + "!";
    }

}
