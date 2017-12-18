package techproject.forum.model.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public abstract class GenericDAO<T> {

    @PersistenceContext
    protected EntityManager em;

    private Class<T> type;
    private String entity;

    public GenericDAO() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        type = (Class) pt.getActualTypeArguments()[0];
        entity = type.getSimpleName();
    }

    public T create(final T t) {
        this.em.persist(t);
        return t;
    }

    public void delete(final Object id) {
        this.em.remove(this.em.getReference(type, id));
    }

    public T find(final Object id) {
        return (T) this.em.find(type, id);
    }

    public T update(final T t) {
        return this.em.merge(t);    
    }
    
    public List<T> findAll(String orderBy) {
        final Query query = this.em.createQuery(
        		"select o from " + entity + " o order by " + orderBy);
        
        return (List<T>)query.getResultList();
    }
}