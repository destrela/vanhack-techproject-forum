package techproject.forum.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TBL_TOPIC")
public class Topic {

	@Id
	@Column(name = "TOPIC_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name = "HEADLINE")
	private String headline;
	
	@Column(name = "TEXT")
	private String text;
	
	@Column(name = "AUTHOR")
	private String author;
	
	@Column(name = "CREATED")
	private Date created;
	
	@OneToMany(mappedBy = "topic", targetEntity=Post.class, fetch = FetchType.EAGER)
	private Collection<Post> posts;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getHeadline() {
		return headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Collection<Post> getPosts() {
		return posts;
	}
}
