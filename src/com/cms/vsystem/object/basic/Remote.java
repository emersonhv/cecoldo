package com.cms.vsystem.object.basic;


public class Remote extends ExternalFile {
    
    public Remote() throws Exception{
        super();
    }

    public void load() throws Exception {
        this.loadExternal();
    }

    public void commit() throws Exception {
        this.commitExternal();
    }
}