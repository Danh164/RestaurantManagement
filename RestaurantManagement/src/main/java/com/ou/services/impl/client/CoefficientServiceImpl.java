/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Coefficient;
import com.ou.repository.client.CoefficientRepository;
import com.ou.services.client.CoefficientService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class CoefficientServiceImpl implements CoefficientService{
    @Autowired
    private CoefficientRepository coefficientRepository;
    
    public List<Coefficient> getListCoef() {
        return this.coefficientRepository.getListCoef();
    }

    @Override
    public double getMinCof() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getMaxCof() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Coefficient getCoefficient(String lesson, String typeDay) {
        return this.coefficientRepository.getCoefficient(lesson, typeDay);
    }
    
}
