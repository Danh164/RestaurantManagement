/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.impl.client;

import com.ou.pojos.Service;
import com.ou.repository.client.ServiceRepository;
import java.util.List;
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

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class ServiceRepositoryImpl implements ServiceRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Service> getListService() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Service> query = builder.createQuery(Service.class);
        Root root = query.from(Service.class);
        query = query.select(root);

        List<Predicate> predicates = new java.util.ArrayList<>();

        Predicate p = builder.isTrue(root.get("serIsActive").as(boolean.class));
        predicates.add(p);

        query = query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);
        q.setMaxResults(1);
        return q.getResultList();
    }
    
    @Override
    public List<Service> getListServices() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Service> query = builder.createQuery(Service.class);
        Root root = query.from(Service.class);
        query = query.select(root);

        List<Predicate> predicates = new java.util.ArrayList<>();

        Predicate p = builder.isTrue(root.get("serIsActive").as(boolean.class));
        predicates.add(p);

        query = query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    
    @Override
    public Service getServiceById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Service.class, id);
    }

}
