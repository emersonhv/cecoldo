package com.cms.vsystem.object;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;


public class FileProperty {
    private int idExternalFile;

    private String name;

    private String newName;

    private String value;

    private boolean newProperty;

    public FileProperty() throws Exception {
        this.newProperty = true;
    }

    /**
     * @return Returns the idExternalFile.
     */
    public int getIdExternalFile() {
        return idExternalFile;
    }

    /**
     * @param idExternalFile
     *            The idExternalFile to set.
     */
    public void setIdExternalFile(int idExternalFile) {
        this.idExternalFile = idExternalFile;
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
     * @return Returns the newName.
     */
    public String getNewName() {
        return newName;
    }

    /**
     * @param newName
     *            The newName to set.
     */
    public void setNewName(String newName) {
        this.newName = newName;
    }

    /**
     * @return Returns the newProperty.
     */
    public boolean isNewProperty() {
        return newProperty;
    }

    /**
     * @param newProperty
     *            The newProperty to set.
     */
    public void setNewProperty(boolean newProperty) {
        this.newProperty = newProperty;
    }

    /**
     * @return Returns the value.
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value
     *            The value to set.
     */
    public void setValue(String value) {
        this.value = value;
    }

    public void commit() throws Exception {
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "";

        if (this.newProperty) {
            sql = "INSERT INTO " + "file_properties "
                    + "(id_external_file, name, value ) " + "VALUES " + "("
                    + this.idExternalFile + ", '" + this.name + "', '"
                    + this.value + "' )";
        } else {
            sql = "UPDATE file_properties " + "SET name='" + this.newName
                    + "', " + "value='" + this.value + "' " + "WHERE name='"
                    + this.name + "' AND id_external_file="
                    + this.idExternalFile;

            this.name = this.newName;
        }

        dataBase.db_query(sql, false, null);
        
        dataBase.close();
        dataBase = null;
    }
}