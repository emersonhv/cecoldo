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
@Table(name = "report_chart")
@NamedQueries({@NamedQuery(name = "ReportChart.findByChartId", query = "SELECT r FROM ReportChart r WHERE r.chartId = :chartId"), @NamedQuery(name = "ReportChart.findByName", query = "SELECT r FROM ReportChart r WHERE r.name = :name"), @NamedQuery(name = "ReportChart.findByDescription", query = "SELECT r FROM ReportChart r WHERE r.description = :description"), @NamedQuery(name = "ReportChart.findByChartType", query = "SELECT r FROM ReportChart r WHERE r.chartType = :chartType"), @NamedQuery(name = "ReportChart.findByWidth", query = "SELECT r FROM ReportChart r WHERE r.width = :width"), @NamedQuery(name = "ReportChart.findByHeight", query = "SELECT r FROM ReportChart r WHERE r.height = :height"), @NamedQuery(name = "ReportChart.findByXAxisLabel", query = "SELECT r FROM ReportChart r WHERE r.xAxisLabel = :xAxisLabel"), @NamedQuery(name = "ReportChart.findByYAxisLabel", query = "SELECT r FROM ReportChart r WHERE r.yAxisLabel = :yAxisLabel"), @NamedQuery(name = "ReportChart.findByShowLegend", query = "SELECT r FROM ReportChart r WHERE r.showLegend = :showLegend"), @NamedQuery(name = "ReportChart.findByShowTitle", query = "SELECT r FROM ReportChart r WHERE r.showTitle = :showTitle"), @NamedQuery(name = "ReportChart.findByShowValues", query = "SELECT r FROM ReportChart r WHERE r.showValues = :showValues"), @NamedQuery(name = "ReportChart.findByPlotOrientation", query = "SELECT r FROM ReportChart r WHERE r.plotOrientation = :plotOrientation")})
public class ReportChart implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "CHART_ID", nullable = false)
    private Integer chartId;
    @Column(name = "NAME", nullable = false)
    private String name;
    @Column(name = "DESCRIPTION", nullable = false)
    private String description;
    @Lob
    @Column(name = "CHART_QUERY", nullable = false)
    private String chartQuery;
    @Column(name = "CHART_TYPE", nullable = false)
    private int chartType;
    @Column(name = "WIDTH", nullable = false)
    private int width;
    @Column(name = "HEIGHT", nullable = false)
    private int height;
    @Column(name = "X_AXIS_LABEL")
    private String xAxisLabel;
    @Column(name = "Y_AXIS_LABEL")
    private String yAxisLabel;
    @Column(name = "SHOW_LEGEND", nullable = false)
    private boolean showLegend;
    @Column(name = "SHOW_TITLE", nullable = false)
    private boolean showTitle;
    @Column(name = "SHOW_VALUES", nullable = false)
    private boolean showValues;
    @Column(name = "PLOT_ORIENTATION")
    private Integer plotOrientation;
    @JoinColumn(name = "DATASOURCE_ID", referencedColumnName = "DATASOURCE_ID")
    @ManyToOne
    private ReportDatasource datasourceId;
    @JoinColumn(name = "REPORT_ID", referencedColumnName = "REPORT_ID")
    @ManyToOne
    private Report reportId;
    @OneToMany(mappedBy = "overlayChartId")
    private Collection<ReportChart> reportChartCollection;
    @JoinColumn(name = "OVERLAY_CHART_ID", referencedColumnName = "CHART_ID")
    @ManyToOne
    private ReportChart overlayChartId;
    @OneToMany(mappedBy = "chartId")
    private Collection<Report> reportCollection;

    public ReportChart() {
    }

    public ReportChart(Integer chartId) {
        this.chartId = chartId;
    }

    public ReportChart(Integer chartId, String name, String description, String chartQuery, int chartType, int width, int height, boolean showLegend, boolean showTitle, boolean showValues) {
        this.chartId = chartId;
        this.name = name;
        this.description = description;
        this.chartQuery = chartQuery;
        this.chartType = chartType;
        this.width = width;
        this.height = height;
        this.showLegend = showLegend;
        this.showTitle = showTitle;
        this.showValues = showValues;
    }

    public Integer getChartId() {
        return chartId;
    }

    public void setChartId(Integer chartId) {
        this.chartId = chartId;
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

    public String getChartQuery() {
        return chartQuery;
    }

    public void setChartQuery(String chartQuery) {
        this.chartQuery = chartQuery;
    }

    public int getChartType() {
        return chartType;
    }

    public void setChartType(int chartType) {
        this.chartType = chartType;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public String getXAxisLabel() {
        return xAxisLabel;
    }

    public void setXAxisLabel(String xAxisLabel) {
        this.xAxisLabel = xAxisLabel;
    }

    public String getYAxisLabel() {
        return yAxisLabel;
    }

    public void setYAxisLabel(String yAxisLabel) {
        this.yAxisLabel = yAxisLabel;
    }

    public boolean getShowLegend() {
        return showLegend;
    }

    public void setShowLegend(boolean showLegend) {
        this.showLegend = showLegend;
    }

    public boolean getShowTitle() {
        return showTitle;
    }

    public void setShowTitle(boolean showTitle) {
        this.showTitle = showTitle;
    }

    public boolean getShowValues() {
        return showValues;
    }

    public void setShowValues(boolean showValues) {
        this.showValues = showValues;
    }

    public Integer getPlotOrientation() {
        return plotOrientation;
    }

    public void setPlotOrientation(Integer plotOrientation) {
        this.plotOrientation = plotOrientation;
    }

    public ReportDatasource getDatasourceId() {
        return datasourceId;
    }

    public void setDatasourceId(ReportDatasource datasourceId) {
        this.datasourceId = datasourceId;
    }

    public Report getReportId() {
        return reportId;
    }

    public void setReportId(Report reportId) {
        this.reportId = reportId;
    }

    public Collection<ReportChart> getReportChartCollection() {
        return reportChartCollection;
    }

    public void setReportChartCollection(Collection<ReportChart> reportChartCollection) {
        this.reportChartCollection = reportChartCollection;
    }

    public ReportChart getOverlayChartId() {
        return overlayChartId;
    }

    public void setOverlayChartId(ReportChart overlayChartId) {
        this.overlayChartId = overlayChartId;
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
        hash += (chartId != null ? chartId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportChart)) {
            return false;
        }
        ReportChart other = (ReportChart) object;
        if ((this.chartId == null && other.chartId != null) || (this.chartId != null && !this.chartId.equals(other.chartId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.ReportChart[chartId=" + chartId + "]";
    }

}
