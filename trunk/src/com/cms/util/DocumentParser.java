/*
 * Created on 5/11/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.util;

import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class DocumentParser {
   private InputStream input = null;
   private Vector textNodes = null;
   private Hashtable searchKey = null;
   
   public DocumentParser(String URL) throws Exception{
       URL resource = new URL(URL);
       input = resource.openStream();
       searchKey = new Hashtable();
       textNodes = new Vector();
   }
   
   public void addSearchKey(String name, String pattern){
       searchKey.put(name, pattern);
   }
   
   public void parse() throws Exception{
       if(input != null){
           beginParse();
       }else
           throw new Exception("Input Strean is NULL");
   }
   
   protected void beginParse() throws Exception{
       int c;
       StringBuffer buffer =  new StringBuffer();
       
       
       while((c = input.read()) != -1){
           if((char)c != '\n' || (char)c != '\r' || (char)c != '\t'){
	           if((char)c == '<'){
	               if(buffer.length() > 0 && !buffer.toString().trim().equals("")){
	                   textNodes.addElement( buffer.toString().replaceAll( "&nbsp;", " " ).trim() );
	               }
	               
	               while((c = input.read()) != -1 && (char)c != '>');	               
	               
	               buffer = new StringBuffer();
	           }
	           
	           if((char)c != '>')
	               buffer.append((char)c);
           }
       }
	   
	   System.out.println( textNodes );
   }
   
   public Hashtable performSearch() throws Exception{
       Hashtable searchResults = null;
       
       Enumeration keys = searchKey.keys();
       while(keys.hasMoreElements()){
           Object key = keys.nextElement();
	       for(int i = 0; i < textNodes.size(); i++){
	          if(startWith(textNodes.get(i).toString(), key.toString())){
	              if(searchResults == null)
	                  searchResults = new Hashtable();
	              
	              ValueContainerDELETE valueC = createContainer(i, key);
	              searchResults.put(key, valueC);
	              break;
	          }
	       }
       }
       
       return searchResults;
   }
   
   public ValueContainerDELETE createContainer(int indexFound, Object key) throws Exception{
       String patternArray[] = searchKey.get(key).toString().split("[,]");
       
       if(patternArray.length < 3)
           throw new Exception("No hay suficientes parametros en el patron!");
       
       int startIndex = Integer.parseInt(patternArray[0].trim());
       int endIndex = Integer.parseInt(patternArray[1].trim()); 
       int complex = Integer.parseInt(patternArray[2].trim());
       
       ValueContainerDELETE container = new ValueContainerDELETE();
       container.setName(key.toString());
       List values = textNodes.subList(indexFound + startIndex, indexFound + endIndex);
       
       switch(complex){
       		case 1:
       		    for(int i = 0; i < values.size(); i++){
       		        if(isValidNumber(values.get(i).toString()))
       		            container.addValue(container.getName(), values.get(i).toString());
       		    }
       		    break;
       		
       		case 2:
       		    for(int i = 0; i < values.size(); i+=2){
       		        if(isValidNumber(values.get(i + 1).toString()))
       		            container.addValue(values.get(i).toString(), values.get(i + 1).toString());
       		    }
       		    break;
       }
       
       return container;
   }
   
   public boolean isValidNumber(String number){
       for(int i = 0; i < number.length(); i++){
           if(!isValidChar(number.charAt(i))){
               return false;
           }
       }
       
       return true;
   }
   
   public boolean isValidChar(char c){
       if( (c >= '0' &&  c <= '9') || 
            (c == ' ' || c == '%' || c == '$' || c == '.' || c == ',' || c == 'U' || c == 'S' ))
           return true;
       
       return false;
   }
   
   public boolean startWith(String source, String start){
       if(source.length() >= start.length()){
           String begin = source.substring(0, start.length());
           
           if(begin.equals(start))
               return true;
           else
               return false;
       }else
           return false;
   }
   
   public static void main(String args[]){
       try{
           /**
            * 	Pattern start_index, end_index, complex_asignation_values
            */
           
       }catch(Exception e){
           e.printStackTrace();
       }
   }
}
