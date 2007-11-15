package com.cms.vsystem.object.basic;

import java.util.Properties;

import com.cms.util.IntranetProperties;
import com.cms.util.Util;



public class Download extends ExternalFile{
    	public Download() throws Exception{
    	    super();
    	    
    	    this.idFile = 0;
    	}
    	
		public void commit() throws Exception{
			this.commitExternal();
		}
		
		public void load() throws Exception{
			this.loadExternal();
		}
		
		public String getPreviewHtml(int width, int height){
		    return "<table cellpadding='0' cellspacing='0' border='0'>" +
		    			"<tr>" +
		    				"<td class='textos_noticia'>" +
			    				"<p class=\"textos\">" +
									"<span class=\"textos_noticia\">" +
										"<b>" + this.getName() + "</b><br>" +
									"</span>" +
							  		"<br>" +
									( (this.getProperty("description") != null)? this.getProperty("description").getValue() : "" ) +
									"<br>" +
								"</p>" +
		    				"</td>" +
		    			"</tr>" +
		    		"</table>";
		}
		
		public String getHtml(Properties prop){
		    
		    String html = "<table cellpadding='3' cellspacing='0' border='0' width='95%'>" +
								"<tr>" +
								"<td class='textos_noticia'>" + this.getName() + "</td>" +
							"</tr>" +
							"<tr>" +
								"<td class='textos'>" + ( (this.getProperty("description") != null)? this.getProperty("description").getValue() : "" ) + "</td>" +
							"</tr>";
		    
		    for(int i = 0; i < this.getFileContentCount(); i++){
		        html += "<tr>" +
		        			"<td class='textos'>" +
		        				"<a href='/servlet/Download?idFile=" + this.idFile + "&idExternalFile=" + this.idExternalFile + "&name=" + this.getFileContent(i).get("name") + "' style='text-decoration: none;'>" +
		        					"<img src='" + IntranetProperties.INTRA_BASE_URL + "imagenes/tipos/" + Util.getImageType(this.getFileContent(i).get("name").toString()) + "' border=0 align='middle' width='17' >&nbsp;&nbsp;" + this.getFileContent(i).get("name") +
		        				"</a>" +
		        			"</td>" +
		        		"</tr>";
		    }
		        
			html +=		"</table>";
		    
		    return  html;
		}
	}
