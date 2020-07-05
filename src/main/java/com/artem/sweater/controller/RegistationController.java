package com.artem.sweater.controller;

import com.artem.sweater.domain.Role;
import com.artem.sweater.domain.User;
import com.artem.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistationController {
    @Autowired
    private UserRepo userRepo;
    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if(userFromDb != null) {
            model.put("messages", "User is exist!");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);
        return "redirect:/login" ;
    }
}
