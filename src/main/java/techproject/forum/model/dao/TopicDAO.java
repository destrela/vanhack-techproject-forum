package techproject.forum.model.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import techproject.forum.model.Topic;

@Repository
public class TopicDAO extends GenericDAO<Topic> {

	public List<Topic> findAll(String search, String orderBy) {
		final Query query = this.em.createQuery(
        		"select o from Topic o " +
        		" where (headline like :SEARCH or text like :SEARCH) " +
        		" order by " + orderBy)
			.setParameter("SEARCH", "%" + search + "%");
        
        return (List<Topic>)query.getResultList();
	}	
}
