package org.it.jacopo.RedditApp.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "subreddits")
public class Subreddit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String name;

    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user; // Creatore del subreddit

    @OneToMany(mappedBy = "subreddit", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Post> posts;

    public Subreddit() {}
}