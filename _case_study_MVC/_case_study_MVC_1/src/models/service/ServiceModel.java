package models.service;

public class ServiceModel {
    private int serviceId;
    private String serviceName;
    private int serviceArea;
    private double serviceCost;
    private int serviceMaxPeople;
    private int rentTypeId;
    private String rentTypeName;
    private double rentTypeCost;
    private int serviceTypeId;
    private String serviceTypeName;
    private String standardRoom;
    private String otherConvenient;
    private Double poolArea;
    private int numberOfFloor;

    public ServiceModel() {
    }

    public ServiceModel(int serviceId, String serviceName, int serviceArea, double serviceCost
            , int serviceMaxPeople, String rentTypeName, double rentTypeCost, String serviceTypeName
            , String standardRoom, String otherConvenient, Double poolArea, int numberOfFloor) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.rentTypeName = rentTypeName;
        this.rentTypeCost = rentTypeCost;
        this.serviceTypeName = serviceTypeName;
        this.standardRoom = standardRoom;
        this.otherConvenient = otherConvenient;
        this.poolArea = poolArea;
        this.numberOfFloor = numberOfFloor;
    }

    public ServiceModel(int serviceId, int serviceArea, double serviceCost, int serviceMaxPeople
            , int rentTypeId, int serviceTypeId, String serviceTypeName, String standardRoom
            , String otherConvenient, Double poolArea, int numberOfFloor) {
        this.serviceId = serviceId;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.serviceTypeName = serviceTypeName;
        this.standardRoom = standardRoom;
        this.otherConvenient = otherConvenient;
        this.poolArea = poolArea;
        this.numberOfFloor = numberOfFloor;
    }

    public int getServiceId() {
        return serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public int getServiceArea() {
        return serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public int getServiceMaxPeople() {
        return serviceMaxPeople;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public double getRentTypeCost() {
        return rentTypeCost;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public String getOtherConvenient() {
        return otherConvenient;
    }

    public Double getPoolArea() {
        return poolArea;
    }

    public int getNumberOfFloor() {
        return numberOfFloor;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setServiceArea(int serviceArea) {
        this.serviceArea = serviceArea;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public void setServiceMaxPeople(int serviceMaxPeople) {
        this.serviceMaxPeople = serviceMaxPeople;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }

    public void setRentTypeCost(double rentTypeCost) {
        this.rentTypeCost = rentTypeCost;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public void setOtherConvenient(String otherConvenient) {
        this.otherConvenient = otherConvenient;
    }

    public void setPoolArea(Double poolArea) {
        this.poolArea = poolArea;
    }

    public void setNumberOfFloor(int numberOfFloor) {
        this.numberOfFloor = numberOfFloor;
    }
//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
