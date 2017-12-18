package techproject.forum.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import techproject.forum.model.Post;
import techproject.forum.model.Topic;
import techproject.forum.model.dao.PostDAO;
import techproject.forum.model.dao.TopicDAO;

@Service
@Transactional
public class TopicService {
	
	@Autowired
	TopicDAO topicDAO;
	
	@Autowired
	PostDAO postDAO;
	
	public Topic create(Topic topic) {
		return this.topicDAO.create(topic);
	}

	public List<Topic> findAll(String orderBy) {
		return this.topicDAO.findAll(orderBy);
	}
	
	public List<Topic> findAll(String search, String orderBy) {
		return this.topicDAO.findAll(search, orderBy);
	}
	
	public Topic find(long id) {
		return this.topicDAO.find(id);
	}

	public void post(String text, String author, long topicId) {
		Topic topic = this.find(topicId);
		if (topic != null) {
			Post post = new Post();
			post.setTopic(topic);
			post.setText(text);
			post.setAuthor(author);
			post.setCreated(new Date());
			
			this.postDAO.create(post);
		}
	}
}
