package com.cms.util;


import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;
import java.util.Calendar;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.vsystem.object.Folder;
	
public class Util{
		private static Hashtable contentTypes;
		private static Hashtable imageTypes;
		private static Document fileObjects;
		private static Document pagesObjects;
		private static Document publishConf;
		private static Document mvcFiles;
		private static final String hexDigits = "0123456789abcdef";
		public static int LEFT_ALIGN = 0;
		public static int RIGHT_ALIGN = 1;
		
		static{
		    contentTypes = new Hashtable();

			/* VIDEO TYPES */
		    contentTypes.put("asf", "video/x-ms-asf");
		    contentTypes.put("avi", "video/avi");
		    contentTypes.put("mpg", "video/mpeg");
		    contentTypes.put("mpeg", "video/mpeg");
		    contentTypes.put("wmv", "video/x-ms-wvx");
		    contentTypes.put("wvx", "video/x-ms-wvx");

			/* IMAGE TYPES */
		    contentTypes.put("gif", "image/gif");
		    contentTypes.put("jpg", "image/jpeg");
		    contentTypes.put("jpeg", "image/jpeg");


			/* AUDIO TYPES */
		    contentTypes.put("au", "audio/basic");
		    contentTypes.put("snd", "audio/basic");
		    contentTypes.put("aif", "audio/x-aiff");
		    contentTypes.put("aiff", "audio/x-aiff");
		    contentTypes.put("aifc", "audio/x-aiff");
		    contentTypes.put("mid", "audio/mid");
		    contentTypes.put("rmi", "audio/mid");
		    contentTypes.put("wav", "audio/x-wav");
		    contentTypes.put("mpa", "audio/x-mpeg");
		    contentTypes.put("mp1", "audio/mpeg");
		    contentTypes.put("mp2", "audio/mpeg");
		    contentTypes.put("mp3", "audio/mpeg");
		    contentTypes.put("mp4", "audio/mpeg");
		    contentTypes.put("aif", "audio/x-aiff");
		    contentTypes.put("aifc", "audio/x-aiff");
		    contentTypes.put("aifc", "audio/x-aiff");
		    contentTypes.put("abs", "audio/x-mpeg");
		    contentTypes.put("mpega", "audio/x-mpeg");
		    contentTypes.put("mp2a", "audio/x-mpeg-2");
		    contentTypes.put("mpa2", "audio/x-mpeg-2");
		    contentTypes.put("es", "audio/echospeech");
		    contentTypes.put("vox", "audio/voxware");
		    contentTypes.put("lcc", "application/fastman");
		    contentTypes.put("ra", "application/x-pn-realaudio");
		    contentTypes.put("ram", "application/x-pn-realaudio");
		    contentTypes.put("mmid", "x-music/x-midi");
		    contentTypes.put("talk", "text/x-speech");

			/* APPLICATION TYPES */
		    contentTypes.put("doc", "application/msword");
		    contentTypes.put("ppt", "application/vnd.ms-powerpoint");
		    contentTypes.put("zip", "application/zip");
		    contentTypes.put("asf", "application/vnd.ms-excel");
		    contentTypes.put("rtf", "application/rtf");
		    contentTypes.put("pdf", "application/pdf");

			/* TEXT TYPES */
		    contentTypes.put("htm", "text/html");
		    contentTypes.put("html", "text/html");
		    contentTypes.put("xml", "text/xml");
		    contentTypes.put("xsl", "text/xsl");
		    contentTypes.put("css", "text/css");
		    contentTypes.put("php", "text/php");
		    contentTypes.put("jsp", "text/jsp");
		    contentTypes.put("asp", "text/asp");
		    
		    imageTypes = new Hashtable();
		    imageTypes.put("mpg", "sonido.gif");
		    imageTypes.put("mpeg", "sonido.gif");
		    imageTypes.put("mp3", "sonido.gif");
			imageTypes.put("m4a", "sonido.gif");
			imageTypes.put("wmv", "sonido.gif");
		    imageTypes.put("wav", "sonido.gif");
		    imageTypes.put("avi", "sonido.gif");
		    imageTypes.put("asf", "sonido.gif");
		    imageTypes.put("rtf", "doc.gif");
		    imageTypes.put("doc", "doc.gif");
		    imageTypes.put("ppt", "ppt.gif");
		    imageTypes.put("zip", "zip.gif");
		    imageTypes.put("xls", "xls.gif");
		    imageTypes.put("gif", "img.gif");
		    imageTypes.put("jpg", "img.gif");
		    imageTypes.put("jpeg", "img.gif");
		    imageTypes.put("htm", "html.gif");
		    imageTypes.put("html", "html.gif");
		    imageTypes.put("xsl", "html.gif");
		    imageTypes.put("pdf", "pdf.gif");
		    imageTypes.put("txt", "log.gif");
		    imageTypes.put("java", "java.gif");
		    imageTypes.put("exe", "exe.gif");
		    imageTypes.put("bat", "bat.gif");
		    imageTypes.put("asp", "php.gif");
		    imageTypes.put("css", "php.gif");
		    imageTypes.put("xml", "php.gif");
		    imageTypes.put("jsp", "php.gif");
		    imageTypes.put("php", "php.gif");
		    
		    try{
		        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		        DocumentBuilder builder = factory.newDocumentBuilder();
		        fileObjects = builder.parse( new File(IntranetProperties.BASE_PATH + "WEB-INF" + File.separator + "webconfig.xml") );
		        
		        builder = factory.newDocumentBuilder();
		        pagesObjects = builder.parse( new File(IntranetProperties.BASE_PATH + "cms" + File.separator + "WEBAPP" + File.separator + "webconfig.xml") );
		        
		        builder = factory.newDocumentBuilder();
		        publishConf = builder.parse( new File(IntranetProperties.BASE_PATH + "cms" + File.separator + "WEBAPP" + File.separator + "publish.xml") );
		        
		        builder = factory.newDocumentBuilder();
		        mvcFiles = builder.parse( new File(IntranetProperties.BASE_PATH + "cms" + File.separator + "WEBAPP" + File.separator + "object_view.xml") );
		    }catch(SAXException e){
		       e.printStackTrace();
		    }catch(ParserConfigurationException e){
		        e.printStackTrace();
		    }catch(IOException e){
		        e.printStackTrace();
		    }
		}
		
		public static String getContentType(String fileName){
			String ext = fileName.substring( fileName.lastIndexOf(".") + 1, fileName.length());
			String contentType = (String)contentTypes.get( ext.toLowerCase() );
			
			return (contentType != null)? contentType : "application/octet-stream";
		}
		
		public static String getImageType(String fileName){
		    String ext = fileName.substring( fileName.lastIndexOf(".") + 1, fileName.length());
		    String imageName = (String)imageTypes.get( ext.toLowerCase() );
			
			return (imageName != null)? imageName : "no.gif";
		}
		
		public static NodeList getPublishBehavior(String fileType) throws Exception{
		    org.w3c.dom.Node xml = publishConf.getFirstChild();
		    NodeList childNodes = xml.getChildNodes();
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeName().equals("object_display")){
		            NodeList displayObjects = childNodes.item(i).getChildNodes();
		            for(int j = 0; j < displayObjects.getLength(); j++){
		                if(displayObjects.item(j).getNodeName().equals("object")){
			                NamedNodeMap att = displayObjects.item(j).getAttributes();
			                if(att.getNamedItem("class").getNodeValue().equals(fileType)){
			                    NodeList displayProperties = displayObjects.item(j).getChildNodes();
			                    
			                    return displayProperties;
			                }
		                }
		            }
		        }
		    }
		    
		    return null;
		}
		
		public static File[] orderArrayFiles (File[] array) {
            for (int i = 0; i < array.length; i++) {
                for (int j = i; j < array.length; j++) {
                    if (array[i].getName().toLowerCase().compareTo(array[j].getName().toLowerCase()) > 0){
                        File tmp = array[i];
                        array[i] = array[j];
                        array[j]  = tmp;
                    }
                }
            }
            return array;
		}

		public static String getViewFile(String fileType, String siteName) throws Exception{
		    org.w3c.dom.Node xml = mvcFiles.getFirstChild();
		    NodeList childNodes = xml.getChildNodes();
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeName().equals("site")){
			        NamedNodeMap att = childNodes.item(i).getAttributes();
			        if(att.getNamedItem("name").getNodeValue().equals(siteName.toLowerCase())){
			            NodeList views = childNodes.item(i).getChildNodes();
		                for(int j = 0; j < views.getLength(); j++){
					        if(views.item(j).getNodeName().equals("object")){
					            att = views.item(j).getAttributes();
					            if(att.getNamedItem("file_type").getNodeValue().equals(fileType)){
					                return att.getNamedItem("file").getNodeValue();
					            }
					        }
		                }
			        }
		        }
		    }
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeName().equals("site")){
		            NamedNodeMap att = childNodes.item(i).getAttributes();
			        
			        if(att.getNamedItem("name").getNodeValue().equals("default")){
			            NodeList views = childNodes.item(i).getChildNodes();
		                for(int j = 0; j < views.getLength(); j++){
					        if(views.item(j).getNodeName().equals("object")){
					            att = views.item(j).getAttributes();
					            if(att.getNamedItem("file_type").getNodeValue().equals(fileType)){
					                return att.getNamedItem("file").getNodeValue();
					            }
					        }
		                }
			        }
		        }
		    }
		    
		    return null;
		}
		
		public static NodeList getPublishProperties(String fileType) throws Exception{
		    org.w3c.dom.Node xml = publishConf.getFirstChild();
		    NodeList childNodes = xml.getChildNodes();
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeName().equals("object_properties")){
		            NodeList displayObjects = childNodes.item(i).getChildNodes();
		            for(int j = 0; j < displayObjects.getLength(); j++){
		                if(displayObjects.item(j).getNodeName().equals("object")){
			                NamedNodeMap att = displayObjects.item(j).getAttributes();
			                if(att.getNamedItem("class").getNodeValue().equals(fileType)){
			                    NodeList displayProperties = displayObjects.item(j).getChildNodes();
			                    
			                    return displayProperties;
			                }
		                }
		            }
		        }
		    }
		    
		    return null;
		}
		/**
		 * TODO DELETE
		 * @param folderName
		 * @return
		 * @throws Exception
		 */
		public static com.cms.vsystem.File lookUpObject(String folderName) throws Exception{
		    org.w3c.dom.Node xml = fileObjects.getFirstChild();
		    NodeList childNodes = xml.getChildNodes();
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeType() == 1){
		            NamedNodeMap att = childNodes.item(i).getAttributes();
		            
		            if(att.getNamedItem("function").getNodeValue().equals(folderName)){		                
		                Folder folder = new Folder();
		                folder.setIdFile(Integer.parseInt(att.getNamedItem("name").getNodeValue()));
		                folder.load();
		                
		                return folder;
		            }
		        }
		    }
		    
			return null;
		}
		/**
		 * TODO DELETE
		 * @param pageName
		 * @return
		 */
		public static String lookUpPage(String pageName){
		    org.w3c.dom.Node xml = pagesObjects.getFirstChild();
		    NodeList childNodes = xml.getChildNodes();
		    
		    for(int i = 0; i < childNodes.getLength(); i++){
		        if(childNodes.item(i).getNodeType() == 1){
		            NamedNodeMap att = childNodes.item(i).getAttributes();
		            if(att.getNamedItem("function").getNodeValue().equals(pageName)){		                
		                return att.getNamedItem("name").getNodeValue();
		            }
		        }
		    }
		    
			return "home.jsp";
		}
	
		/**
		 * TODO DELETE
		 * @param root
		 * @param idObject
		 * @param nodeArray
		 * @param prop
		 * @param idSite
		 * @return
		 */
		public static Tree buildTree(Node root, int idObject, Vector nodeArray, Properties prop, int idSite){
			
		    Hashtable row;
		    int parentFileId;
		    
			for(int c = 0; c < nodeArray.size(); c++){
			    row = (Hashtable)nodeArray.get(c);
			    parentFileId = (row.get("PARENT_FILE") != null)? Integer.parseInt(row.get("PARENT_FILE").toString()) : 0;
			    
				if(parentFileId == idObject){
				    
					Node node = new Node();
					node.setId( Integer.parseInt(row.get("ID_FILE").toString()) );
					node.setName( row.get("NAME").toString() );
					
					node.setShared ( row.get("ID_SITE").toString() != idSite + "" );
					
					String url  = (prop != null? prop.getProperty("url", "content.jsp") : "content.jsp" );
					url += (url.indexOf("?") != -1)? "&" : "?";
					url += (prop != null? prop.getProperty("sub_url", "openFolder") : "openFolder" );
					url += "=" + node.getId();
					
					node.setUrl( url );
					node.setTarget( (prop != null)? prop.getProperty("target", "show") : "show" );
					node.setImage( (prop != null)? prop.getProperty("image", "cms/images/types/folder.gif") : row.get("IMAGE").toString());
					node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
					
					node.setChilds( Util.searchChildFilesFrom(-1, node, nodeArray, prop, idSite ) );
					root.addChild( node );
				}
			}
			
			Tree tree = new Tree();
			tree.setRoot( root );
			
			return tree;
		}
		
		public static Vector searchChildFilesFrom(int index, Node parent, Vector nodeArray, Properties prop, int idSite ){
		    Hashtable row;
		    int parentFileId;
		    Vector childs = new Vector();
		    
			for (int c = index + 1; c < nodeArray.size(); c++){
			    row = (Hashtable)nodeArray.get(c);
			    parentFileId = (row.get("PARENT_FILE") != null)? Integer.parseInt(row.get("PARENT_FILE").toString()) : 0;
			    
				if (parent.getId() == parentFileId){
					Node node = new Node();
					node.setId( Integer.parseInt(row.get("ID_FILE").toString()) );
					node.setName( row.get("NAME").toString() );
					node.setShared ( row.get("ID_SITE").toString() != idSite + "" );

					String url  = (prop != null? prop.getProperty("url", "content.jsp") : "content.jsp" );
					url += (url.indexOf("?") != -1)? "&" : "?";
					url += (prop != null? prop.getProperty("sub_url", "openFolder") : "openFolder" );
					url += "=" + node.getId();
					
					node.setUrl( url );
					node.setTarget( (prop != null)? prop.getProperty("target", "show") : "show" );
					node.setImage( (prop != null)? prop.getProperty("image", "cms/images/types/folder.gif") : row.get("IMAGE").toString());
					node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
					
					node.setChilds( Util.searchChildFilesFrom(-1, node, nodeArray, prop, idSite) );
					childs.addElement( node );
				}
			}
			
			return childs;
		}
		
		public static String encryptPassword(String name) throws Exception{
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(name.getBytes());
	        
	        return byteArrayToHexString(md.digest());
	    }
		
		public static String byteArrayToHexString(byte[] b) {
	        StringBuffer buf = new StringBuffer();

	        for (int i = 0; i < b.length; i++) {
	            int j = ((int) b[i]) & 0xFF;
	            buf.append(hexDigits.charAt(j / 16));
	            buf.append(hexDigits.charAt(j % 16));
	        }
	    
	        return buf.toString();
	    }
	    
	    public static byte[] hexStringToByteArray(String hexa) throws IllegalArgumentException {
		
		    if (hexa.length() % 2 != 0) {
		        throw new IllegalArgumentException("String hexa inválida");
		    }
		
		    byte[] b = new byte[hexa.length() / 2];
		
		    for (int i = 0; i < hexa.length(); i+=2) {
		        b[i / 2] = (byte) ((hexDigits.indexOf(hexa.charAt(i)) << 4) |
		            (hexDigits.indexOf(hexa.charAt(i + 1))));
		    }
		    return b;
	    }
	    
	    public static String ucWords(String source){
	        String parts[] = source.split("[ ]");
	        String dest = new String();
	        
	        for(int i = 0; i < parts.length; i++){
	            char characters[] = new char[parts[i].length()];
	            parts[i].getChars(0, parts[i].length(), characters, 0);
	            
	            if(parts[i].length() > 2)
	                characters[0] = Character.toUpperCase(characters[0]);
	            
	            dest += new String(characters);
	            
	            if(i < parts.length - 1)
	                dest += " ";
	        }
	        
	        return dest;
	    }
	    
	    public static String getMonthName(int month){
	        switch(month){
				case 0:
					return "Enero";
				case 1:
					return "Febrero";
				case 2:
					return "Marzo";
				case 3:
					return "Abril";
				case 4:
				    return "Mayo";
				case 5:
				    return "Junio";
				case 6:
				    return "Julio";
				case 7:
				    return "Agosto";
				case 8:
				    return "Septiembre";
				case 9:
				    return "Octubre";
				case 10:
				    return "Noviembre";
				case 11:
				    return "Diciembre";
	        }
	        
	        return "";
	    }
	    
	    public static Tree getFileSystemTree( ) {
			return getFileSystemTree( "" );
	    }
	    
	    public static Tree getFileSystemTree( String rootPath ) {
	        Tree fileSystem = new Tree( );
	        Node root = new Node( );
	        File serverRoot = new File( IntranetProperties.BASE_PATH + rootPath );
	        File files[] = serverRoot.listFiles( new FileSystemFilter( ) );
	        files = orderArrayFiles( files );
	        for ( int i = 0; i < files.length; i ++ ) {
	            Node node = new Node( );
	            node.setId( files[i].getAbsolutePath( ).hashCode( ) );
	            node.setName( files[i].getName( ) );
	            node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
	            node.setImage( "cms/images/" + ( files[i].isDirectory( )? "types/folder.gif" : "types/" + Util.getImageType( files[i].getName( ) ) ) );
	            if ( files[i].isDirectory( ) )
	                node.setChilds( Util.getFolderChilds( files[i] ));
	            
	            root.addChild( node );
	        }
	        fileSystem.setRoot( root );
	        return fileSystem;
	    }
	    
	    public static Vector getFolderChilds(File parentFolder){
	        Vector childs = new Vector();
	        File files[] = parentFolder.listFiles(new FileSystemFilter());
	        files = orderArrayFiles( files );
	        for(int i = 0; i < files.length; i++){
	            Node node = new Node();
	            node.setId(files[i].getAbsolutePath().hashCode());
	            node.setName(files[i].getName());
	            node.setBaseUrl(IntranetProperties.INTRA_BASE_URL);
				node.setShared ( false );
	            node.setImage("cms/images/" + (files[i].isDirectory()? "types/folder.gif" : "types/" + Util.getImageType(files[i].getName())));
	            
	            if(files[i].isDirectory())
	                node.setChilds(Util.getFolderChilds(files[i]));
	            
	            childs.addElement(node);
	        }
	        
	        return childs;
	    }
	    
	    public static String completeWhiteSpace(String word, int spaces, int align){
	        String whiteSpaces = "";
	        
	        for(int i = word.length(); i < spaces; i++)
	            whiteSpaces += " ";
	        
	        if(align == RIGHT_ALIGN)
	            return whiteSpaces + word;
	        else
	            return word + whiteSpaces;
	    }
	    
	    public static Vector getSites() throws Exception{
	        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
	        try{
	            String sql = "SELECT id_site, name, main_site " +
	            				"FROM sites " +
	            				"ORDER BY main_site DESC, name";
	            dataBase.db_query(sql, false, null);
	            Hashtable row;
	            Vector sites = new Vector();
	            
	            while((row = dataBase.db_fetch_array()) != null)
	                sites.addElement(row);
	            
	            dataBase.close();
	            dataBase = null;
	            
	            return sites;
	        }catch(Exception e){
	            try{dataBase.close();}catch(Exception exc){}
	            dataBase = null;
	            
	            throw e;
	        }
	    }
		
		public static void receivePayState(String ticketID, String codeTrans, boolean success) throws Exception{
	        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			if(ticketID.length() > 4){
				int transactionType = Integer.parseInt(ticketID.substring(0, 1));
				int idSite = Integer.parseInt(ticketID.substring(1, 4));
				String idPago = ticketID.substring(4, ticketID.length());
				String sql = "";
				
				try{
					switch(transactionType){
						case 1:
							sql = "UPDATE orders SET " +
									"pse_value = '" + codeTrans + "', " +
									"order_state = " + (success? "6" : "7") + " " + 
									"WHERE id_order = (" +
										"SELECT reference_file " +
										"FROM files " +
										"WHERE id_site = " + idSite + " AND name = 'W" + idPago + "' ) ";
							break;
						case 2:
							sql = "UPDATE agr_pagos SET " + 
									"pse_value = '" + codeTrans + "', " +
									"estado_pago = " + (success? "1" : "2") + " " + 
									"WHERE id_site = " + idSite + " " +
									"AND id_pago = " + idPago;
							break;
						case 3:
							sql = "UPDATE agr_pagos_nf SET " +
									"pse_value = '" + codeTrans + "', " +
									"estado_pago = " + (success? "1" : "2") + " " +
									"WHERE id_site = " + idSite + " " +
									"AND id_pago = " + idPago;
							break;
						default:
							dataBase.close();
							dataBase = null;
							return;		
					}
				
					dataBase.db_query(sql, false, null);
					dataBase.close();
					dataBase = null;
				}catch(Exception e){
					try{dataBase.close();}catch(Exception exc){}
					dataBase = null;
					throw e;
				}
			}	
	    }
		
		public static Calendar getValidDate(Calendar date, int moveDate) throws Exception{
	        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
	        try{
				Vector dnh = new Vector();
				date.set(Calendar.DATE, date.get(Calendar.DATE) + moveDate);
				String sql = "";
				
				if(moveDate < 0){
					sql = "SELECT no_habil " +
							"FROM agr_no_habil " +
							"WHERE no_habil <= '" + date.get(Calendar.YEAR) + "-" + (date.get(Calendar.MONTH) + 1) + "-" + date.get(Calendar.DATE) + "' " +
							"ORDER BY no_habil DESC " +
							"LIMIT 10";
	            }else{
					sql = "SELECT no_habil " +
							"FROM agr_no_habil " +
							"WHERE no_habil >= '" + date.get(Calendar.YEAR) + "-" + (date.get(Calendar.MONTH) + 1) + "-" + date.get(Calendar.DATE) + "' " +
							"ORDER BY no_habil ASC " +
							"LIMIT 10";
				}
				
				dataBase.db_query(sql, false, null);
				Hashtable row;
				while((row = dataBase.db_fetch_array()) != null)
					dnh.addElement(row.get("NO_HABIL").toString());
				
				while( dnh.contains( date.get(Calendar.YEAR) + "-" + (date.get(Calendar.MONTH) + 1 < 10? "0" : "") + (date.get(Calendar.MONTH) + 1) + "-" + (date.get(Calendar.DATE) < 10? "0" : "") + date.get(Calendar.DATE) ) ){
					if(moveDate < 0)
						date.set(Calendar.DATE, date.get(Calendar.DATE) - 1);
					else
						date.set(Calendar.DATE, date.get(Calendar.DATE) + 1);	
				}
				
	            dataBase.close();
	            dataBase = null;
	            
	            return date;
	        }catch(Exception e){
	            try{dataBase.close();}catch(Exception exc){}
	            dataBase = null;
	            
	            throw e;
	        }
	    }
		
		public static String zeroFill(int number, int digits){
			String numberString = String.valueOf(number);
			int numberDigits = numberString.length();
			
			if(numberDigits < digits){
				for(int i = 0; i < digits - numberDigits; i++){
					numberString = "0" + numberString;
				}
			}
			
			return numberString;
		}
	}