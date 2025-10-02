package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.Persona;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;

@Slf4j
@Controller
public class ControladorInicio {

    @GetMapping("/")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/show")
    public String show(Model model) {
        Persona p1 = new Persona();
        Persona p2 = new Persona();
        p1.setNombre("Sergio");
        p1.setApellido("Ramos");
        p2.setNombre("Fabrizzio");
        p2.setApellido("Cazares");
        var personas = Arrays.asList(p1, p2);
        model.addAttribute("personas", personas);
        return "show";
    }

}
