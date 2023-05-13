package project.md4_case_shop.model;

import java.util.HashSet;
import java.util.Set;

public class User {
    private int id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String avatar = "https://firebasestorage.googleapis.com/v0/b/project-e0da8.appspot.com/o/avatar%20default.jpg?alt=media&token=2b58c903-0e85-4ef0-a11f-4057c2f076ff";
    Set<Role> roleSet = new HashSet<>();

    public User() {
    }

    public User(String name, String username, String email, String password, Set<Role> roleSet) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.roleSet = roleSet;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Set<Role> getRoleSet() {
        return roleSet;
    }

    public void setRoleSet(Set<Role> roleSet) {
        this.roleSet = roleSet;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                ", roleSet=" + roleSet +
                '}';
    }
}
