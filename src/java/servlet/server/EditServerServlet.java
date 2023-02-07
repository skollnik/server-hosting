package servlet.server;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import modellists.ModelList;
import models.Person;
import models.Server;

public class EditServerServlet extends HttpServlet {

    int personId;
    int serverId;
    Person person;
    Server server;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./server/editserver.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personId = Integer.parseInt(request.getParameter("personId"));
        serverId = Integer.parseInt(request.getParameter("serverId"));
        person = findPerson(personId);
        server = findServer(serverId);
        request.setAttribute("person", person);
        request.setAttribute("server", server);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpu = request.getParameter("cpu");
        String ram = request.getParameter("ram");
        String diskSpace = request.getParameter("diskSpace");
        String bandwidth = request.getParameter("bandwidth");
        String raid = request.getParameter("raid");
        String os = request.getParameter("os");
        float price = Float.parseFloat(request.getParameter("price"));
        Date endDate;
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            endDate = format.parse(request.getParameter("endDate"));
            person.getServletList().get(serverId).setEndDate(endDate);
        } catch (ParseException ex) {
            Logger.getLogger(NewServerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        person.getServletList().get(serverId).setCpu(cpu);
        person.getServletList().get(serverId).setRam(ram);
        person.getServletList().get(serverId).setDiskSpace(diskSpace);
        person.getServletList().get(serverId).setBandwidth(bandwidth);
        person.getServletList().get(serverId).setRaid(raid);
        person.getServletList().get(serverId).setOs(os);
        person.getServletList().get(serverId).setPrice(price);
        Person.getAllLeasedVirtualServers(personId);
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Server findServer(int id) {
        Server server = null;
        for (Server s : ModelList.servers) {
            if (s.getId() == id) {
                server = s;
            }
        }
        return server;
    }

    private Person findPerson(int id) {
        Person person = null;
        for (Person p : ModelList.persons) {
            if (p.getId() == id) {
                person = p;
            }
        }
        return person;
    }

}
