/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.impl.client;

import com.ou.pojos.Dish;
import com.ou.repository.client.DishRepository;
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
public class DishRepositoryImpl implements DishRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Dish> getListDish() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Dish> query = builder.createQuery(Dish.class);
        Root root = query.from(Dish.class);
        query = query.select(root);

        List<Predicate> predicates = new java.util.ArrayList<>();

        Predicate p = builder.isTrue(root.get("dishIsActive").as(boolean.class));
        predicates.add(p);

        query = query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public Dish getDishById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        return session.get(Dish.class, id);
    }

}
