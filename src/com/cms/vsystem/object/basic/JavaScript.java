package com.cms.vsystem.object.basic;


public class JavaScript extends ExternalFile {
    
    public JavaScript() throws Exception{
        super();
    }

    public void load() throws Exception {
        this.loadExternal();
    }

    public void commit() throws Exception {
        this.commitExternal();
    }
}