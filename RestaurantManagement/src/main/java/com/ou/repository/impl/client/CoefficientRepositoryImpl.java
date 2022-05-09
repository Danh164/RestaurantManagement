/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.impl.client;

import com.ou.pojos.Coefficient;
import com.ou.repository.client.CoefficientRepository;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
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
public class CoefficientRepositoryImpl implements CoefficientRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Coefficient> getListCoef() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Coefficient> query = builder.createQuery(Coefficient.class);
        Root root = query.from(Coefficient.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    @Override
    public double getMinCof() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Coefficient> query = builder.createQuery(Coefficient.class);
        Root root = query.from(Coefficient.class);
        query = query.multiselect(root.get("coefValue"));
        query.orderBy(builder.asc(root.get("coefValue")));
        Query q = session.createQuery(query);
        return q.getFirstResult();
    }

    @Override
    public double getMaxCof() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Coefficient> query = builder.createQuery(Coefficient.class);
        Root root = query.from(Coefficient.class);
        query = query.multiselect(root.get("coefValue"));
        query.orderBy(builder.desc(root.get("coefValue")));
        Query q = session.createQuery(query);
        return q.getFirstResult();
    }

    @Override
    public Coefficient getCoefficient(String lesson, String typeDay) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Coefficient> query = builder.createQuery(Coefficient.class);
        Root root = query.from(Coefficient.class);
        query = query.select(root);
        query = query.where(builder.like(root.get("coefTypeDate").as(String.class), typeDay),
                builder.like(root.get("coefTypeLesson").as(String.class), lesson));
        Query q = session.createQuery(query);
        return (Coefficient) q.getResultList().get(0);
    }

}
