/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "report_export_options")
@NamedQueries({@NamedQuery(name = "ReportExportOptions.findByExportOptionId", query = "SELECT r FROM ReportExportOptions r WHERE r.exportOptionId = :exportOptionId"), @NamedQuery(name = "ReportExportOptions.findByXlsRemoveEmptySpace", query = "SELECT r FROM ReportExportOptions r WHERE r.xlsRemoveEmptySpace = :xlsRemoveEmptySpace"), @NamedQuery(name = "ReportExportOptions.findByXlsOnePagePerSheet", query = "SELECT r FROM ReportExportOptions r WHERE r.xlsOnePagePerSheet = :xlsOnePagePerSheet"), @NamedQuery(name = "ReportExportOptions.findByXlsAutoDetectCell", query = "SELECT r FROM ReportExportOptions r WHERE r.xlsAutoDetectCell = :xlsAutoDetectCell"), @NamedQuery(name = "ReportExportOptions.findByXlsWhiteBackground", query = "SELECT r FROM ReportExportOptions r WHERE r.xlsWhiteBackground = :xlsWhiteBackground"), @NamedQuery(name = "ReportExportOptions.findByHtmlRemoveEmptySpace", query = "SELECT r FROM ReportExportOptions r WHERE r.htmlRemoveEmptySpace = :htmlRemoveEmptySpace"), @NamedQuery(name = "ReportExportOptions.findByHtmlWhiteBackground", query = "SELECT r FROM ReportExportOptions r WHERE r.htmlWhiteBackground = :htmlWhiteBackground"), @NamedQuery(name = "ReportExportOptions.findByHtmlUseImages", query = "SELECT r FROM ReportExportOptions r WHERE r.htmlUseImages = :htmlUseImages"), @NamedQuery(name = "ReportExportOptions.findByHtmlWrapBreak", query = "SELECT r FROM ReportExportOptions r WHERE r.htmlWrapBreak = :htmlWrapBreak")})
public class ReportExportOptions implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "EXPORT_OPTION_ID", nullable = false)
    private Integer exportOptionId;
    @Column(name = "XLS_REMOVE_EMPTY_SPACE", nullable = false)
    private boolean xlsRemoveEmptySpace;
    @Column(name = "XLS_ONE_PAGE_PER_SHEET", nullable = false)
    private boolean xlsOnePagePerSheet;
    @Column(name = "XLS_AUTO_DETECT_CELL", nullable = false)
    private boolean xlsAutoDetectCell;
    @Column(name = "XLS_WHITE_BACKGROUND", nullable = false)
    private boolean xlsWhiteBackground;
    @Column(name = "HTML_REMOVE_EMPTY_SPACE", nullable = false)
    private boolean htmlRemoveEmptySpace;
    @Column(name = "HTML_WHITE_BACKGROUND", nullable = false)
    private boolean htmlWhiteBackground;
    @Column(name = "HTML_USE_IMAGES", nullable = false)
    private boolean htmlUseImages;
    @Column(name = "HTML_WRAP_BREAK", nullable = false)
    private boolean htmlWrapBreak;
    @OneToMany(mappedBy = "exportOptionId")
    private Collection<Report> reportCollection;

    public ReportExportOptions() {
    }

    public ReportExportOptions(Integer exportOptionId) {
        this.exportOptionId = exportOptionId;
    }

    public ReportExportOptions(Integer exportOptionId, boolean xlsRemoveEmptySpace, boolean xlsOnePagePerSheet, boolean xlsAutoDetectCell, boolean xlsWhiteBackground, boolean htmlRemoveEmptySpace, boolean htmlWhiteBackground, boolean htmlUseImages, boolean htmlWrapBreak) {
        this.exportOptionId = exportOptionId;
        this.xlsRemoveEmptySpace = xlsRemoveEmptySpace;
        this.xlsOnePagePerSheet = xlsOnePagePerSheet;
        this.xlsAutoDetectCell = xlsAutoDetectCell;
        this.xlsWhiteBackground = xlsWhiteBackground;
        this.htmlRemoveEmptySpace = htmlRemoveEmptySpace;
        this.htmlWhiteBackground = htmlWhiteBackground;
        this.htmlUseImages = htmlUseImages;
        this.htmlWrapBreak = htmlWrapBreak;
    }

    public Integer getExportOptionId() {
        return exportOptionId;
    }

    public void setExportOptionId(Integer exportOptionId) {
        this.exportOptionId = exportOptionId;
    }

    public boolean getXlsRemoveEmptySpace() {
        return xlsRemoveEmptySpace;
    }

    public void setXlsRemoveEmptySpace(boolean xlsRemoveEmptySpace) {
        this.xlsRemoveEmptySpace = xlsRemoveEmptySpace;
    }

    public boolean getXlsOnePagePerSheet() {
        return xlsOnePagePerSheet;
    }

    public void setXlsOnePagePerSheet(boolean xlsOnePagePerSheet) {
        this.xlsOnePagePerSheet = xlsOnePagePerSheet;
    }

    public boolean getXlsAutoDetectCell() {
        return xlsAutoDetectCell;
    }

    public void setXlsAutoDetectCell(boolean xlsAutoDetectCell) {
        this.xlsAutoDetectCell = xlsAutoDetectCell;
    }

    public boolean getXlsWhiteBackground() {
        return xlsWhiteBackground;
    }

    public void setXlsWhiteBackground(boolean xlsWhiteBackground) {
        this.xlsWhiteBackground = xlsWhiteBackground;
    }

    public boolean getHtmlRemoveEmptySpace() {
        return htmlRemoveEmptySpace;
    }

    public void setHtmlRemoveEmptySpace(boolean htmlRemoveEmptySpace) {
        this.htmlRemoveEmptySpace = htmlRemoveEmptySpace;
    }

    public boolean getHtmlWhiteBackground() {
        return htmlWhiteBackground;
    }

    public void setHtmlWhiteBackground(boolean htmlWhiteBackground) {
        this.htmlWhiteBackground = htmlWhiteBackground;
    }

    public boolean getHtmlUseImages() {
        return htmlUseImages;
    }

    public void setHtmlUseImages(boolean htmlUseImages) {
        this.htmlUseImages = htmlUseImages;
    }

    public boolean getHtmlWrapBreak() {
        return htmlWrapBreak;
    }

    public void setHtmlWrapBreak(boolean htmlWrapBreak) {
        this.htmlWrapBreak = htmlWrapBreak;
    }

    public Collection<Report> getReportCollection() {
        return reportCollection;
    }

    public void setReportCollection(Collection<Report> reportCollection) {
        this.reportCollection = reportCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (exportOptionId != null ? exportOptionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportExportOptions)) {
            return false;
        }
        ReportExportOptions other = (ReportExportOptions) object;
        if ((this.exportOptionId == null && other.exportOptionId != null) || (this.exportOptionId != null && !this.exportOptionId.equals(other.exportOptionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.ReportExportOptions[exportOptionId=" + exportOptionId + "]";
    }

}
