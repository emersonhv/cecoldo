package com.cms.vsystem.object.basic;

import java.util.Properties;

import com.cms.util.IntranetProperties;



public class Clip extends ExternalFile{
    	public Clip() throws Exception{
    	    super();
    	}
    	
		public void load() throws Exception{
			this.loadExternal();
		}
		
		public void commit() throws Exception{
			this.commitExternal();
		}
		
		public String getPreviewHtml(int width, int height){
			String html = "<table width='100%' cellpading='0' cellspacing='0' border='0'>" +
							"<tr>" +
	                       		"<td align=\"left\" valign=\"top\">" +
									"<p class=\"textos\">" +
										"<span class=\"textos_noticia\">" +
											"<b>" + this.getName() + "</b><br>" +
										"</span>" +
								  		"<br>" +
										( (this.getProperty("title") != null)? this.getProperty("title").getValue() + "" : "" ) +
										"<br>" +
	                              	"</p>" +
								"</td>" +
	                   		"</tr>" +
	                   		"</table>";
					
			return  html;
		}
		
		public String getHtml(Properties prop){
			String html = "<table width=\"95%\" cellpadding=\"3\"  cellspacing=\"0\" border=\"0\">" +
								"<tr>" +
									"<td class=\"titulos\" colspan=\"2\">" + 
										this.getName() +
									"</td>" +
								"</tr>" +
								"<tr>" +
									"<td width=\"16%\" class=\"textos_noticia\">TITULAR</td>" +
									"<td width=\"84%\" align=\"left\" class=\"textos\">" +
									( (this.getProperty("title") != null)? this.getProperty("title").getValue() : "" ) +
									"</td>" +
								"</tr>" +
								"<tr>" +
									"<td colspan=\"2\">&nbsp;</td>" +
								"</tr>" +
								"<tr>" +
									"<td class=\"textos_noticia\" align=\"center\" valign=\"middle\" colspan=\"2\">" +
										"<table width=\"200\" height=\"200\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border: 1px solid #666666;\">" +
											"<tr>" +
												"<td align=\"center\" valign=\"middle\">" +
													"<a href=\"" + IntranetProperties.INTRA_BASE_URL  + "servlet/ShowImage?idFile=" + this.getIdFile() + "\" target=\"_blank\" >" +
														"<img src=\"" + IntranetProperties.INTRA_BASE_URL + "servlet/ShowImage?idFile=" + this.getIdFile() + "&boundWidth=200&boundHeight=200\" width=200 height=200 border=\"0\">" +
													"</a>" +
												"</td>" +
											"</tr>" +
										"</table>" +
									"</td>" +
								"</tr>" +
								"<tr>" +
									"<td colspan=\"2\">&nbsp;</td>" +
								"</tr>" +
								"<tr>" +
									"<td class=\"textos_noticia\">MEDIO</td>" +
									"<td class=\"textos\">" + (this.getProperty("source") != null? this.getProperty("source").getValue() : "") + "</td>" +
								"</tr>" +
								"<tr>" +
									"<td class=\"textos_noticia\">FECHA</td>" +
									"<td class=\"textos_noticia\">" + (this.getProperty("date") != null? this.getProperty("date").getValue() : "") + "</td>" +
								"</tr>" +
								"<tr>" +
									"<td colspan=\"2\">&nbsp;</td>" +
								"</tr>" +
							"</table>";
					
			return html;
		}
	}
