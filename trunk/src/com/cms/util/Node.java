package com.cms.util;

import java.util.Vector;

public class Node{
		
		private String name;   	// String
		private int id;
		private String image;		// String
		private boolean expanded;	// int
		private String url;			// String
		private String target;		// String
		private String color;
		private String BASE_URL;
		private String style;
		private boolean shared;
		private Object object;

		private Vector childs;			//	Class Hoja

		public Node(){
			this.id = 0;
			this.shared = false;
			this.childs = new Vector();
		}
		
		 /**
          * @return Returns the bASE_URL.
          */
        public String getBaseUrl() {
            return BASE_URL;
        }
        /**
         * @param base_url
         *            The bASE_URL to set.
         */
        public void setBaseUrl(String base_url) {
            BASE_URL = base_url;
        }
        /**
         * @return Returns the color.
         */
        public String getColor() {
            return color;
        }
        /**
         * @param color
         *            The color to set.
         */
        public void setColor(String color) {
            this.color = color;
        }
        /**
         * @return Returns the expanded.
         */
        public boolean isExpanded() {
            return expanded;
        }
        /**
         * @param expanded
         *            The expanded to set.
         */
        public void setExpanded(boolean expanded) {
            this.expanded = expanded;
        }
        /**
         * @return Returns the id.
         */
        public int getId() {
            return id;
        }
        /**
         * @param id
         *            The id to set.
         */
        public void setId(int id) {
            this.id = id;
        }
        /**
         * @return Returns the image.
         */
        public String getImage() {
            return image;
        }
        /**
         * @param image
         *            The image to set.
         */
        public void setImage(String image) {
            this.image = image;
        }
        /**
         * @return Returns the name.
         */
        public String getName() {
            return name;
        }
        /**
         * @param name
         *            The name to set.
         */
        public void setName(String name) {
            this.name = name;
        }
        /**
         * @return Returns the object.
         */
        public Object getObject() {
            return object;
        }
        /**
         * @param object
         *            The object to set.
         */
        public void setObject(Object object) {
            this.object = object;
        }
        /**
         * @return Returns the style.
         */
        public String getStyle() {
            return style;
        }
        /**
         * @param style
         *            The style to set.
         */
        public void setStyle(String style) {
            this.style = style;
        }
        /**
         * @return Returns the target.
         */
        public String getTarget() {
            return target;
        }
        /**
         * @param target
         *            The target to set.
         */
        public void setTarget(String target) {
            this.target = target;
        }
        /**
         * @return Returns the url.
         */
        public String getUrl() {
            return url;
        }
        /**
         * @param url
         *            The url to set.
         */
        public void setUrl(String url) {
            this.url = url;
        }
        
        /**
         * @return Returns if is shared.
         */
        public boolean isShared( ) {
            return shared;
        }
        /**
         * @param shared
         */
        public void setShared(boolean shared) {
            this.shared = shared;
        }
        
        public void setChilds( Vector newChilds ){
			this.childs = new Vector();
			
			for( int i = 0; i < newChilds.size(); i++ ){
				this.childs.addElement(newChilds.get(i));
			}
		}
		
		public void addChild( Node leaf ){
			this.childs.addElement(leaf);
		}
		
		public Vector getChilds(){
		    return childs;
		}
		
		public Node getChildAt(int index){
		    if(index >= 0 && index < childs.size())
		        return (Node)childs.get(index);
		    
		    return null;
		}
		
		public int getChildCount(){
		    return childs.size();
		}
		
		public void showLeaf(){
			Log.print( "Nombre: " + this.name + "\n" + "imagen: " + this.image );
		}
				
		/*public String getTreeStringHtml( boolean showRoot, Vector expandFolder ){
			String html = "";
			String url = ( this.url != null ? this.url.replaceAll( "\"", "\\\"" ).replaceAll( "'", "\\'" ) : "" );

            if( showRoot == false ){ 
                 html += "" +
				 	"<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" > <tr><td> "; 
                 for( int i = 0; i < this.childs.size(); i++ ) 
                    html += ((Node)childs.get(i)).getTreeStringHtml(true, expandFolder);
                 
                 html += " </td></tr> </table>"; 
            }else{ 
                boolean useBold = false; 
                
                if( expandFolder != null ){
                    for(int i = 0; i < expandFolder.size(); i++){
                        if(this.id == Integer.parseInt(expandFolder.get(i).toString())){
                            this.expanded = true;
                            break;
                        }
                    }
              
                    useBold = (Integer.parseInt(expandFolder.get(0).toString()) == this.id)? true : false;
                }
              
                html = "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" >" + 
                			"<tr>" + 
                				"<td width=\"5%\" class=\"left bottom\">";
                
                if( this.childs.size() > 0 ) 
                    html += "<img src=\"" + this.BASE_URL + "cms/images/menu/menu_corner_" + ( ( this.expanded )? "minus" : "plus" ) + ".gif\" border=\"0\" onClick=\"cambiarModo( this )\" id=\"corner_" + this.id + "\" alt=\"\" />"; 
                else 
                    html += "<div style=\"width: 18px;\">&nbsp;</div>";
              
                html += 		"</td>"; 
                
                if ( this.image != "" )	{ 
					if ( this.shared )	{
						html += "" + 
						"<td width=\"5%\" background=\"" + this.BASE_URL + this.image + "\" class=\"shared_tree\">" + 
						"	<a href=\"#\" onClick=\"changeTreeState(" + this.id + ");openLocation('" + url + "', '" + this.id + "' ); return false;\" ondblclick=\"if ( typeof( selectedTree ) == 'function' ) selectedTree('" + url + "', '" + this.id + "' ); return false;\" >" + 
						"		<img src=\"" + this.BASE_URL + this.image + "\" name=\"imagen" + this.id + "\" id=\"" + this.id + "\" border=\"0\" width=\"20\" alt=\"\" />" + 
						//"		<img src=\"" +  IntranetProperties.INTRA_BASE_URL + "cms/images/types/shared.gif\" name=\"imagen" + this.id + "\" border=\"0\" width=\"20\" >" + 
						"	</a>" + 
						"</td>"; 
					}
					else	{
						html += "" + 
						"<td width=\"5%\">" + 
						"	<a href=\"#\" onClick=\"changeTreeState(" + this.id + ");openLocation('" + url + "', '" + this.id + "' ); return false;\" ondblclick=\"if ( typeof( selectedTree ) == 'function' ) selectedTree('" + url + "', '" + this.id + "' ); return false;\" >" + 
						"		<img src=\"" + this.BASE_URL + this.image + "\" name=\"imagen" + this.id + "\" id=\"" + this.id + "\" border=\"0\" width=\"20\" alt=\"\" />" + 
						"	</a>" + 
						"</td>"; 
					}
               }
                
               html += 		"<td class=\"textos\" align=\"left\" width=\"90%\">" + 
               					"<a href=\"#\" onClick=\"changeTreeState(" + this.id + "); openLocation('" + url + "', '" + this.id + "' ); return false;\" ondblclick=\"if ( typeof( selectedTree ) == 'function' ) selectedTree('" + url + "', '" + this.id + "' ); return false;\" >" +
	               					"<span class=\"textos\">" +
	               						"<font " + (this.color != null? " color=\"" + this.color + "\"" : "") + " " + (useBold? "class=\"boldFont\"" : "") + " style=\"white-space:nowrap\" id=\"" + this.id + "\">" +
	               								this.name +
	                                    "</font>" +
	                              	"</span>" + 
                                "</a>" +
                            "</td>" + 
                         "</tr>";
               
             if( this.childs.size() > 0 ){ 
                 html += "<tr style=\"display: " + ( ( this.expanded )? "" : "none" ) + ";\" >" + 
                 			"<td align=\"center\" valign=\"top\" class=\"left\" >&nbsp;</td>" + 
                 			"<td colspan=\"" + ( ( this.image != "" )? "2" : "3" ) + "\" >";
                 
                 for( int i = 0; i < this.childs.size(); i++ )
                     html += ((Node)this.childs.get(i)).getTreeStringHtml(true, expandFolder);
              
                 html += 	"</td>" + 
                 		"</tr>"; 
             } 
             html += "</table>"; 
          }
           
          return html;
         
		}*/
}