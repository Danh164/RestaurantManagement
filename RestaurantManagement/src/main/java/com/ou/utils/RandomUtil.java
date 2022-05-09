/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.utils;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;

/**
 *
 * @author Admin
 */
public class RandomUtil {
    public static Integer[] getListRandom(int len, int n, int x){
        Integer[] arr = new Integer[len];
        Integer[] arrRandom = new Integer[n];
        for (int i = 0; i < arr.length; i++) {
            if (i != x)
                arr[i] = i;
            else {
                if (i > 0 && i-1 != x)
                    arr[i] = i-1;
                else if(i < len -2 && i + 1 != x)
                    arr[i] = i +1;
                }
        }
        Collections.shuffle(Arrays.asList(arr));
        LinkedHashSet<Integer> hashSet = new LinkedHashSet<>(Arrays.asList(arr));
        arr = hashSet.toArray(new Integer[0]);

        for (int i = 0; i < n; i++) {
            arrRandom[i] = arr[i];
        }
        return arrRandom;
    }
    
    public static int RandomInt(){
        double randomDouble = Math.random();
        randomDouble = randomDouble * 999999 + 100000;
        return (int) randomDouble;
    }
}
