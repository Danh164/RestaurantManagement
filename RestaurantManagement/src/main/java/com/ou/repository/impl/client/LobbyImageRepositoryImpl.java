package com.ou.repository.impl.client;

import com.ou.pojos.LobbyImage;
import com.ou.repository.client.LobbyImageRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class LobbyImageRepositoryImpl implements LobbyImageRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<LobbyImage> getListImage(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<LobbyImage> query = builder.createQuery(LobbyImage.class);
        Root root = query.from(LobbyImage.class);
        query = query.select(root);

        List<Predicate> predicates = new java.util.ArrayList<>();

        Predicate p = builder.equal(root.get("lob").get("id"), id);
        predicates.add(p);

        query = query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);

        return q.getResultList();
    }
    
}
