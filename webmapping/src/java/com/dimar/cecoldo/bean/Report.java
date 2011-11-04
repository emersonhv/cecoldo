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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "report")
@NamedQueries({@NamedQuery(name = "Report.findByReportId", query = "SELECT r FROM Report r WHERE r.reportId = :reportId"), @NamedQuery(name = "Report.findByName", query = "SELECT r FROM Report r WHERE r.name = :name"), @NamedQuery(name = "Report.findByDescription", query = "SELECT r FROM Report r WHERE r.description = :description"), @NamedQuery(name = "Report.findByReportFile", query = "SELECT r FROM Report r WHERE r.reportFile = :reportFile"), @NamedQuery(name = "Report.findByPdfExport", query = "SELECT r FROM Report r WHERE r.pdfExport = :pdfExport"), @NamedQuery(name = "Report.findByCsvExport", query = "SELECT r FROM Report r WHERE r.csvExport = :csvExport"), @NamedQuery(name = "Report.findByXlsExport", query = "SELECT r FROM Report r WHERE r.xlsExport = :xlsExport"), @NamedQuery(name = "Report.findByHtmlExport", query = "SELECT r FROM Report r WHERE r.htmlExport = :htmlExport"), @NamedQuery(name = "Report.findByRtfExport", query = "SELECT r FROM Report r WHERE r.rtfExport = :rtfExport"), @NamedQuery(name = "Report.findByTextExport", query = "SELECT r FROM Report r WHERE r.textExport = :textExport"), @NamedQuery(name = "Report.findByExcelExport", query = "SELECT r FROM Report r WHERE r.excelExport = :excelExport"), @NamedQuery(name = "Report.findByImageExport", query = "SELECT r FROM Report r WHERE r.imageExport = :imageExport"), @NamedQuery(name = "Report.findByFillVirtual", query = "SELECT r FROM Report r WHERE r.fillVirtual = :fillVirtual"), @NamedQuery(name = "Report.findByHiddenReport", query = "SELECT r FROM Report r WHERE r.hiddenReport = :hiddenReport")})
public class Report implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "REPORT_ID", nullable = false)
    private Integer reportId;
    @Column(name = "NAME", nullable = false)
    private String name;
    @Column(name = "DESCRIPTION", nullable = false)
    private String description;
    @Column(name = "REPORT_FILE", nullable = false)
    private String reportFile;
    @Column(name = "PDF_EXPORT", nullable = false)
    private boolean pdfExport;
    @Column(name = "CSV_EXPORT", nullable = false)
    private boolean csvExport;
    @Column(name = "XLS_EXPORT", nullable = false)
    private boolean xlsExport;
    @Column(name = "HTML_EXPORT", nullable = false)
    private boolean htmlExport;
    @Column(name = "RTF_EXPORT", nullable = false)
    private boolean rtfExport;
    @Column(name = "TEXT_EXPORT", nullable = false)
    private boolean textExport;
    @Column(name = "EXCEL_EXPORT", nullable = false)
    private boolean excelExport;
    @Column(name = "IMAGE_EXPORT", nullable = false)
    private boolean imageExport;
    @Column(name = "FILL_VIRTUAL", nullable = false)
    private boolean fillVirtual;
    @Column(name = "HIDDEN_REPORT", nullable = false)
    private boolean hiddenReport;
    @Lob
    @Column(name = "REPORT_QUERY")
    private String reportQuery;
    @OneToMany(mappedBy = "reportId")
    private Collection<ReportChart> reportChartCollection;
    @OneToMany(mappedBy = "defaultReportId")
    private Collection<ReportUser> reportUserCollection;
    @JoinColumn(name = "CHART_ID", referencedColumnName = "CHART_ID")
    @ManyToOne
    private ReportChart chartId;
    @JoinColumn(name = "DATASOURCE_ID", referencedColumnName = "DATASOURCE_ID")
    @ManyToOne
    private ReportDatasource datasourceId;
    @JoinColumn(name = "EXPORT_OPTION_ID", referencedColumnName = "EXPORT_OPTION_ID")
    @ManyToOne
    private ReportExportOptions exportOptionId;

    public Report() {
    }

    public Report(Integer reportId) {
        this.reportId = reportId;
    }

    public Report(Integer reportId, String name, String description, String reportFile, boolean pdfExport, boolean csvExport, boolean xlsExport, boolean htmlExport, boolean rtfExport, boolean textExport, boolean excelExport, boolean imageExport, boolean fillVirtual, boolean hiddenReport) {
        this.reportId = reportId;
        this.name = name;
        this.description = description;
        this.reportFile = reportFile;
        this.pdfExport = pdfExport;
        this.csvExport = csvExport;
        this.xlsExport = xlsExport;
        this.htmlExport = htmlExport;
        this.rtfExport = rtfExport;
        this.textExport = textExport;
        this.excelExport = excelExport;
        this.imageExport = imageExport;
        this.fillVirtual = fillVirtual;
        this.hiddenReport = hiddenReport;
    }

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReportFile() {
        return reportFile;
    }

    public void setReportFile(String reportFile) {
        this.reportFile = reportFile;
    }

    public boolean getPdfExport() {
        return pdfExport;
    }

    public void setPdfExport(boolean pdfExport) {
        this.pdfExport = pdfExport;
    }

    public boolean getCsvExport() {
        return csvExport;
    }

    public void setCsvExport(boolean csvExport) {
        this.csvExport = csvExport;
    }

    public boolean getXlsExport() {
        return xlsExport;
    }

    public void setXlsExport(boolean xlsExport) {
        this.xlsExport = xlsExport;
    }

    public boolean getHtmlExport() {
        return htmlExport;
    }

    public void setHtmlExport(boolean htmlExport) {
        this.htmlExport = htmlExport;
    }

    public boolean getRtfExport() {
        return rtfExport;
    }

    public void setRtfExport(boolean rtfExport) {
        this.rtfExport = rtfExport;
    }

    public boolean getTextExport() {
        return textExport;
    }

    public void setTextExport(boolean textExport) {
        this.textExport = textExport;
    }

    public boolean getExcelExport() {
        return excelExport;
    }

    public void setExcelExport(boolean excelExport) {
        this.excelExport = excelExport;
    }

    public boolean getImageExport() {
        return imageExport;
    }

    public void setImageExport(boolean imageExport) {
        this.imageExport = imageExport;
    }

    public boolean getFillVirtual() {
        return fillVirtual;
    }

    public void setFillVirtual(boolean fillVirtual) {
        this.fillVirtual = fillVirtual;
    }

    public boolean getHiddenReport() {
        return hiddenReport;
    }

    public void setHiddenReport(boolean hiddenReport) {
        this.hiddenReport = hiddenReport;
    }

    public String getReportQuery() {
        return reportQuery;
    }

    public void setReportQuery(String reportQuery) {
        this.reportQuery = reportQuery;
    }

    public Collection<ReportChart> getReportChartCollection() {
        return reportChartCollection;
    }

    public void setReportChartCollection(Collection<ReportChart> reportChartCollection) {
        this.reportChartCollection = reportChartCollection;
    }

    public Collection<ReportUser> getReportUserCollection() {
        return reportUserCollection;
    }

    public void setReportUserCollection(Collection<ReportUser> reportUserCollection) {
        this.reportUserCollection = reportUserCollection;
    }

    public ReportChart getChartId() {
        return chartId;
    }

    public void setChartId(ReportChart chartId) {
        this.chartId = chartId;
    }

    public ReportDatasource getDatasourceId() {
        return datasourceId;
    }

    public void setDatasourceId(ReportDatasource datasourceId) {
        this.datasourceId = datasourceId;
    }

    public ReportExportOptions getExportOptionId() {
        return exportOptionId;
    }

    public void setExportOptionId(ReportExportOptions exportOptionId) {
        this.exportOptionId = exportOptionId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reportId != null ? reportId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Report)) {
            return false;
        }
        Report other = (Report) object;
        if ((this.reportId == null && other.reportId != null) || (this.reportId != null && !this.reportId.equals(other.reportId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.Report[reportId=" + reportId + "]";
    }

}
