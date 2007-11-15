/*
 * Created on 18/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.util;

import java.io.File;
import java.io.FileFilter;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class FileSystemFilter implements FileFilter{
    public boolean accept(File file){
        if(!file.getName().equals("WEB-INF") && !file.getName().equals("cms") && !file.getName().startsWith(".") && (file.isDirectory() || file.getName().endsWith("jsp") || file.getName().endsWith("html") || file.getName().endsWith("htm") || file.getName().endsWith("txt") || file.getName().endsWith("js")))
            return true;
        
        return false;
    }
}
