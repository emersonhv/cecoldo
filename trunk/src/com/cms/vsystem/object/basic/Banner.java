package com.cms.vsystem.object.basic;


public class Banner extends ExternalFile{
    
	public Banner() throws Exception{
	    super();
	}
				
	public void load() throws Exception{
		this.loadExternal();
	}
	
	public void commit() throws Exception{
		this.commitExternal();
	}
}
