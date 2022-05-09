package com.ou.repository.impl.client;

import com.ou.pojos.Lobby;
import com.ou.repository.client.LobbyRepository;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class LobbyRepositoryImpl implements LobbyRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public int countLobbby() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(*) FROM Lobby ");
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public List<Lobby> getLobbies(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Lobby> query = builder.createQuery(Lobby.class);
        Root root = query.from(Lobby.class);
        query = query.select(root);
        
        List<Predicate> predicates = new ArrayList<>();
        if (!kw.isEmpty() && kw != null) {
            Predicate p1 = builder.like(root.get("lobName").as(String.class),
                    String.format("%%%s%%", kw));
            predicates.add(p1);
        }
        
        Predicate p2 = builder.isTrue(root.get("lobIsActive").as(boolean.class));
            predicates.add(p2);
            
        query = query.where(predicates.toArray(new Predicate[]{}));
        
        Query q = session.createQuery(query);

        int max = 5;
        q.setMaxResults(max);
        q.setFirstResult((page-1) * max);

        return q.getResultList();
    }

    @Override
    public List<Lobby> getLobbiesByKw(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Lobby> query = builder.createQuery(Lobby.class);
        Root root = query.from(Lobby.class);
        query = query.select(root);
        
        List<Predicate> predicates = new ArrayList<>();
        if (!kw.isEmpty() && kw != null) {
            Predicate p1 = builder.like(root.get("lobName").as(String.class),
                    String.format("%%%s%%", kw));
            predicates.add(p1);
        }
        
        Predicate p2 = builder.isTrue(root.get("lobIsActive").as(boolean.class));
            predicates.add(p2);
            
        query = query.where(predicates.toArray(new Predicate[]{}));
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Lobby getLobbyById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Lobby.class, id);
    }
}
