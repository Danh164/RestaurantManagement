/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.impl.client;

import com.ou.pojos.Feedback;
import com.ou.repository.client.FeedbackRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class FeedbackRepositoryImpl implements FeedbackRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addListCoef(Feedback feedback) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(feedback);
            return true;
        } catch (HibernateException ex) {
            System.err.println("Error: " + ex);
        }
        return false;
    }

    @Override
    public int countContiRead() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Feedback> query = builder.createQuery(Feedback.class);
        Root root = query.from(Feedback.class);
        query = query.select(root);

        Predicate p = builder.isFalse(root.get("feedIsRead"));
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList().size();

    }

    @Override
    public List<Feedback> getUser(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Feedback.class);
        if (kw != "") {
            query = query.where(builder.like(root.get("user").get("userUsename").as(String.class),
                    String.format("%%%s%%", kw)));
        }
        query.multiselect(root.get("id"), root.get("user"), root.get("feedContent"));

        query = query.orderBy(builder.desc(root.get("id")));
        query = query.groupBy(root.get("user"));

        query.multiselect(root.get("id"), root.get("user"), root.get("feedContent"));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Feedback> getFeedbackByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Feedback.class);
        query = query.where(builder.equal(root.get("user").get("userUsename"), username));

        query.multiselect(root.get("id"), root.get("feedContent"),
                root.get("user").get("userUsename"));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Feedback> getUnreadFeedbackByUsername() {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Feedback.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.isFalse(root.get("feedIsRead")));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(root.get("id"), root.get("user").get("userUsename"), b.count(root.get("user").get("userUsename")));
        q = q.groupBy(root.get("user"));
        Query query = session.createQuery(q);

        return query.getResultList();
    }

    @Override
    public List<Feedback> getListFeedbackByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Feedback> query = builder.createQuery(Feedback.class);
        Root root = query.from(Feedback.class);
        query = query.select(root);

        List<Predicate> predicates = new java.util.ArrayList<>();

        Predicate p = builder.equal(root.get("user").get("userUsename"), username);
        predicates.add(p);

        query = query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean setRead(Feedback f) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            session.update(f);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
//    update
    @Override
    public List<Feedback> getAllFeedBack() {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Feedback.class);
//        query = query.where(builder.isNotNull(root.get("user").get("userUsename")));

        query.multiselect(root.get("id"), root.get("feedContent"),
                root.get("user").get("userUsename"));
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

}
