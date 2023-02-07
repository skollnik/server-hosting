package models;

import java.util.ArrayList;
import java.util.Date;
import modellists.ModelList;

public class Person {

    private int id;
    private String firstName;
    private String lastName;
    private String address;
    private String companyName;
    private ArrayList<Server> servletList;

    public Person(int id, String firstName, String lastName, String address, ArrayList<Server> servletList) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.servletList = servletList;
    }

    public Person(int id, String firstName, String lastName, String address, String companyName, ArrayList<Server> servletList) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.companyName = companyName;
        this.servletList = servletList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public ArrayList<Server> getServletList() {
        return servletList;
    }

    public void setServletList(ArrayList<Server> servletList) {
        this.servletList = servletList;
    }

    public String getAllLeasedDedicatedServers(int id) {
        String output = "";
        for (Server s : ModelList.persons.get(id).getServletList()) {
            if (s.getServerType().equals("dedicated")) {
                output += "<div><b>Price: </b>" + s.getPrice() + " "
                        + " <b>CPU: </b>" + s.getCpu() + " "
                        + "<b>RAM: </b>" + s.getRam() + " "
                        + " <b>Disk Space: </b>" + s.getDiskSpace() + " " + "</div><br>";
            }
        }
        return output;
    }

    public static String getAllLeasedVirtualServers(int id) {
        String output = "";
        for (Server s : ModelList.persons.get(id).getServletList()) {
            float dateDifference = (s.getEndDate().getTime() - s.getStartDate().getTime()) / (1000 * 60 * 60 * 24);
            int intDifference = (int) dateDifference;
            if (s.getServerType().equals("virtual")) {
                output += "<div class='server'><b>CPU: </b>" + s.getCpu() + " "
                        + "<b>RAM: </b>" + s.getRam() + " "
                        + "<b>Disk Space: </b>" + s.getDiskSpace() + " "
                        + "<b>Bandwidth: </b>" + s.getBandwidth() + " "
                        + "<b>RAID: </b>" + s.getRaid() + " "
                        + "<b>OS: </b>" + s.getOs() + " "
                        + "<b>Start Date: </b>" + s.getStartDate() + " "
                        + "<b>End Date: </b>" + s.getEndDate() + " "
                        + "<b>Price: </b>€" + s.getPrice() + " "
                        + "<b>Expires in: </b><span>" + intDifference + " days </span><a href='./EditServerServlet?personId=" + id + "&serverId=" + s.getId() + "' class='btn btn-primary'>Edit Server</a></div>";
            }
        }
        return output;
    }

    public static String getAllLeasedVirtualServersByDate(int id, Date startDate, Date endDate) {
        String output = "";
        float price = 0;
        for (Server s : ModelList.persons.get(id).getServletList()) {
            if (s.getStartDate().getTime() >= startDate.getTime() && s.getEndDate().getTime() <= endDate.getTime()) {
                output += "<div class='server-by-date d-flex flex-column justify-content-center align-items-center'><span><b>CPU: </b>" + s.getCpu() + "</span>"
                        + "<span><b>RAM: </b>" + s.getRam() + "</span>"
                        + "<span><b>Disk Space: </b>" + s.getDiskSpace() + "</span>"
                        + "<span><b>Bandwidth: </b>" + s.getBandwidth() + "</span>"
                        + "<span><b>RAID: </b>" + s.getRaid() + "</span>"
                        + "<span><b>OS: </b>" + s.getOs() + "</span>"
                        + "<span><b>Start Date: </b>" + s.getStartDate() + "</span>"
                        + "<span><b>End Date: </b>" + s.getEndDate() + "</span>"
                        + "<span><b>Price: </b>€" + s.getPrice() + "</span></div>";
                price += s.getPrice();
            }
        }
        output += "<h3>Full price: €" + price + "</h3>";
        return output;
    }
}
