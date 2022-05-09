package com.ou.repository.client;


import com.ou.pojos.Coefficient;
import java.util.List;

public interface CoefficientRepository {
    List<Coefficient> getListCoef();
    double getMinCof();
    double getMaxCof();
    Coefficient getCoefficient(String lesson, String typeDay);
}
