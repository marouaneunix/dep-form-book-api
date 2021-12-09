package fr.norsys.depapi.controller;

public class UserDTO {
    public Long userId;
    public String name;

    public UserDTO(long id, String name) {
        this.userId = id;
        this.name = name;
    }
}
