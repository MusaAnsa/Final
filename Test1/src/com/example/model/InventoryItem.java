package com.example.model;

public class InventoryItem {
    private String itemID;
    private String itemName;
    private int quantity;
    private int availableQuantity;
    private int daysOfSupply;
    private String recentSalesTrend;
    private int minimumStockLevel;

    // Default constructor
    public InventoryItem() {
    }

    // Getter and Setter methods
    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(int availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public int getDaysOfSupply() {
        return daysOfSupply;
    }

    public void setDaysOfSupply(int daysOfSupply) {
        this.daysOfSupply = daysOfSupply;
    }

    public String getRecentSalesTrend() {
        return recentSalesTrend;
    }

    public void setRecentSalesTrend(String recentSalesTrend) {
        this.recentSalesTrend = recentSalesTrend;
    }

    public int getMinimumStockLevel() {
        return minimumStockLevel;
    }

    public void setMinimumStockLevel(int minimumStockLevel) {
        this.minimumStockLevel = minimumStockLevel;
    }

    @Override
    public String toString() {
        return "InventoryItem{" +
                "itemID='" + itemID + '\'' +
                ", itemName='" + itemName + '\'' +
                ", quantity=" + quantity +
                ", availableQuantity=" + availableQuantity +
                ", daysOfSupply=" + daysOfSupply +
                ", recentSalesTrend=" + recentSalesTrend +
                ", minimumStockLevel=" + minimumStockLevel +
                '}';
    }
}
