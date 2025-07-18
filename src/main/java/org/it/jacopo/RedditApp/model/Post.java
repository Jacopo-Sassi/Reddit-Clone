package org.it.jacopo.RedditApp.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import javax.xml.stream.events.Comment;
import java.util.List;

@Setter
@Getter
@Entity
public class Post {
    @Id @GeneratedValue
    private Long id;
    private String title;
    private String content;
    private String author;

    public Post() {
        // Costruttore vuoto necessario per JPA
    }
}
