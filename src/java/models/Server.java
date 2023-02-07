package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Server {

    private int id;
    private String serverType;
    private float price;
    private String cpu;
    private String ram;
    private String diskSpace;
    private String bandwidth;
    private String raid;
    private String os;
    private Date startDate;
    private Date endDate;

    public Server(int id, String serverType, float price, String cpu, String ram, String diskSpace, String bandwidth, String raid, String os, Date startDate, Date endDate) {
        this.id = id;
        this.price = price;
        this.serverType = serverType;
        this.cpu = cpu;
        this.ram = ram;
        this.diskSpace = diskSpace;
        this.bandwidth = bandwidth;
        this.raid = raid;
        this.os = os;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Server(int id, String serverType, float price, String cpu, String ram, String diskSpace, String bandwidth, String raid, String os, Date startDate) {
        this.id = id;
        this.price = price;
        this.serverType = serverType;
        this.cpu = cpu;
        this.ram = ram;
        this.diskSpace = diskSpace;
        this.bandwidth = bandwidth;
        this.raid = raid;
        this.os = os;
        this.startDate = startDate;
        this.endDate = new Date(Long.MAX_VALUE);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServerType() {
        return serverType;
    }

    public void setServerType(String serverType) {
        this.serverType = serverType;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getDiskSpace() {
        return diskSpace;
    }

    public void setDiskSpace(String diskSpace) {
        this.diskSpace = diskSpace;
    }

    public String getBandwidth() {
        return bandwidth;
    }

    public void setBandwidth(String bandwidth) {
        this.bandwidth = bandwidth;
    }

    public String getRaid() {
        return raid;
    }

    public void setRaid(String raid) {
        this.raid = raid;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String formatDate(String dateString) {
        SimpleDateFormat originalFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");
        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        try {
            date = originalFormat.parse(dateString);
            String formattedDate = targetFormat.format(date);
            System.out.println(formattedDate);
            return formattedDate;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}
