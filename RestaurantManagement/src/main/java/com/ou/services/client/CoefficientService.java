package com.ou.services.client;

import com.ou.pojos.Coefficient;

import java.util.List;

public interface CoefficientService {

    List<Coefficient> getListCoef();
    double getMinCof();
    double getMaxCof();
    Coefficient getCoefficient(String lesson, String typeDay);
}
