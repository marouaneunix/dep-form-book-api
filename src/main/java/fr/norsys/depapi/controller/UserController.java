package fr.norsys.depapi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    @GetMapping("/users")
    public List<UserDTO> findUsers() {
        return List.of(new UserDTO(10L, "Predod 1"));
    }
}
