package model;

import java.time.LocalDate;

public class Post {
    private Long id;
    private String text;
    private LocalDate date;
    //User которому принадлежит пост
    private User user;

    public Post(Long id, String text, User user, LocalDate date) {
        this.id = id;
        this.text = text;
        this.user = user;
        this.date = date;
    }

    public Post(String text, User user, LocalDate date) {
        this.text = text;
        this.user = user;
        this.date = date;

    }

    public Long getId() {

        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Post post = (Post) o;

        if (id != null ? !id.equals(post.id) : post.id != null) return false;
        if (text != null ? !text.equals(post.text) : post.text != null) return false;
        if (user != null ? !user.equals(post.user) : post.user != null) return false;
        return date != null ? date.equals(post.date) : post.date == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", user=" + user +
                ", date=" + date +
                '}';
    }
}
