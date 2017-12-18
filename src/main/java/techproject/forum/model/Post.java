package techproject.forum.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TBL_POST")
public class Post {

	@Id
	@Column(name = "POST_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@ManyToOne
    @JoinColumn(name = "TOPIC_ID", referencedColumnName = "TOPIC_ID")
    private Topic topic;
	
	@Column(name = "TEXT")
	private String text;
	
	@Column(name = "AUTHOR")
	private String author;
	
	@Column(name = "CREATED")
	private Date created;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
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
}
