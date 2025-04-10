package com.example.model;

public class Sales {
    private int salesID;
    private String salespersonName;
    private int target;
    private int numberOfUnits;
    private int numberOfUnitsSold;
    private String completionStatus;

    // Getters and Setters
    public int getSalesID() {
        return salesID;
    }

    public void setSalesID(int salesID) {
        this.salesID = salesID;
    }

    public String getSalespersonName() {
        return salespersonName;
    }

    public void setSalespersonName(String salespersonName) {
        this.salespersonName = salespersonName;
    }

    public int getTarget() {
        return target;
    }

    public void setTarget(int target) {
        this.target = target;
    }

    public int getNumberOfUnits() {
        return numberOfUnits;
    }

    public void setNumberOfUnits(int numberOfUnits) {
        this.numberOfUnits = numberOfUnits;
    }

    public int getNumberOfUnitsSold() {
        return numberOfUnitsSold;
    }

    public void setNumberOfUnitsSold(int numberOfUnitsSold) {
        this.numberOfUnitsSold = numberOfUnitsSold;
    }

    public String getCompletionStatus() {
        return completionStatus;
    }

    public void setCompletionStatus(String completionStatus) {
        this.completionStatus = completionStatus;
    }
}
