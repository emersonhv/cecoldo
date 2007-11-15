package com.cms.util;

import java.util.Vector;
	
public class Tree{
	
	private Node root;		// Class Node
	
	public Tree(){
		this.root = null;
	}
	
	public Node getRoot(){
		return this.root;
	}
	
	public void setRoot( Node root ){
		this.root = root;
	}
	
	/*public String getTreeStringHtml(Vector expandFolder){
		return this.root.getTreeStringHtml( false, expandFolder );
	}	*/
}
