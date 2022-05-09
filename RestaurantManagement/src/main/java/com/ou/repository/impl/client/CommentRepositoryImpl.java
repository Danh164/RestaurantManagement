/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.impl.client;

import com.ou.pojos.Bill;
import com.ou.pojos.Comment;
import com.ou.pojos.Order;
import com.ou.repository.client.CommentRepository;
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
public class CommentRepositoryImpl implements CommentRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Comment> getListCommentByLobbyId(int id, int x) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Comment.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(root.get("lobby").get("id"), id));
        q.where(pre.toArray(new Predicate[]{}));

        q.orderBy(b.desc(root.get("id")));
        q.multiselect(root.get("id"), root.get("user"), root.get("cmtStar"),
                root.get("cmtContent"), root.get("createdDay"));
        Query query = session.createQuery(q);
        
        query.setMaxResults(2);
        query.setFirstResult((x-1) * 2);
        return query.getResultList();
    }

    @Override
    public int countUserInBill(int user_id, int lob_id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootB = q.from(Bill.class);
        Root rootO = q.from(Order.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(rootB.get("id"), rootO.get("id")));
        pre.add(b.equal(rootB.get("userId"), user_id));
        pre.add(b.equal(rootO.get("lob").get("id"), lob_id));
        pre.add(b.isTrue(rootB.get("billIsPayment")));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(rootB.get("id"));
        q = q.groupBy(rootB.get("id"));
        Query query = session.createQuery(q);

        return query.getResultList().size();
    }

    @Override
    public int countUserInComment(int user_id, int lob_id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Comment.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(root.get("user").get("id"), user_id));
        pre.add(b.equal(root.get("lobby").get("id"), lob_id));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(root.get("id"));
        q = q.groupBy(root.get("id"));
        Query query = session.createQuery(q);

        return query.getResultList().size();
    }

    @Override
    public boolean saveComment(Comment comment) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(comment);
            return true;
        } catch (HibernateException ex) {
            System.err.println("Error: " + ex);
            return false;
        }
    }

    @Override
    public int countCommentByLobId(int lob_id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Comment.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(root.get("lobby").get("id"), lob_id));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(root.get("id"));
        q = q.groupBy(root.get("id"));
        Query query = session.createQuery(q);

        return query.getResultList().size();
    }

    @Override
    public int totalStarsByLobId(int lob_id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Comment.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(root.get("lobby").get("id"), lob_id));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(b.sum(root.get("cmtStar")));
        q.groupBy(root.get("lobby").get("id"));
        Query query = session.createQuery(q);
        if(!query.getResultList().isEmpty())
            return Integer.parseInt(query.getResultList().get(0).toString());
        return 0;
    }
        
    public List<Comment> getListStarDetailByLobId(int lob_id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();

        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root root = q.from(Comment.class);
        List<Predicate> pre = new ArrayList<>();
        pre.add(b.equal(root.get("lobby").get("id"), lob_id));
        q.where(pre.toArray(new Predicate[]{}));

        q.multiselect(root.get("cmtStar"),b.count(root.get("cmtStar")));
        q = q.groupBy(root.get("cmtStar"));
        q = q.orderBy(b.asc(root.get("cmtStar")));
        Query query = session.createQuery(q);

        return query.getResultList();
    }
}
