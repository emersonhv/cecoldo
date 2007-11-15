/*
 * Created on 5/11/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.util;

import java.util.Hashtable;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ValueContainerDELETE {
    private String name;
    private Hashtable values;
    
    public ValueContainerDELETE(){
        values = new Hashtable();
    }
    /**
     * @return Returns the name.
     */
    public String getName() {
        return name;
    }
    /**
     * @param name The name to set.
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return Returns the values.
     */
    public Hashtable getValues() {
        return values;
    }
    /**
     * @param values The values to set.
     */
    public void setValues(Hashtable values) {
        this.values = values;
    }
    
    public void addValue(String name, String value){
        values.put(name, value);
    }
    
    public String getValue(String name){
        return (String)values.get(name);
    }
    
    public String toString(){
        return "[" + name + "], values=" + values.toString() + ", [values count=" + values.size() + "]"; 
    }
}
