/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.util;

import com.dimar.cecoldo.webmapping.Controller;

/**
 *
 * @author user
 */
public class CecoldoPropertiesProvider {
    private static CecoldoPropertiesProvider instance;
    private Controller controller;
    public static CecoldoPropertiesProvider getInstance(){
        if(instance == null){
            instance = new CecoldoPropertiesProvider();
        }
        return instance;
    }
    private CecoldoPropertiesProvider(){
        controller = new Controller();
    }
    public String getValue(String key){
        return controller.getPropertyValue(key).getPropertyValue();
    }
}
