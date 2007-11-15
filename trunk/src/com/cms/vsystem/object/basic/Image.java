package com.cms.vsystem.object.basic;


public class Image extends ExternalFile {
    
    public Image() throws Exception{
        super();
    }

    public void load() throws Exception {
        this.loadExternal();
    }

    public void commit() throws Exception {
        this.commitExternal();
    }
}