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

public class NewServerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String type = request.getParameter("type");
        if (type.equals("dedicated")) {
            request.setAttribute("persons", ModelList.persons);
            request.getRequestDispatcher("./server/dedicatedserver.jsp").forward(request, response);
        } else if (type.equals("virtual")) {
            request.setAttribute("persons", ModelList.persons);
            request.getRequestDispatcher("./server/virtualserver.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        if (!ModelList.servers.isEmpty()) {
            id = ModelList.servers.get(ModelList.servers.size() - 1).getId() + 1;
        }
        int personId = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("serverType");
        float price = Float.parseFloat(request.getParameter("price"));
        String cpu = request.getParameter("cpu");
        String ram = request.getParameter("ram");
        String diskSpace = request.getParameter("diskSpace");
        String bandwidth = request.getParameter("bandwidth");
        String raid = request.getParameter("raid");
        String os = request.getParameter("os");
        Date startDate = new Date();
        Person person = findPerson(personId);
        if (type.equals("dedicated")) {
            Server server = new Server(id, type, price, cpu, ram, diskSpace, bandwidth, raid, os, startDate);
            person.getServletList().add(server);
            ModelList.servers.add(server);
            return;
        } else if (type.equals("virtual")) {
            Date endDate;
            try {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                endDate = format.parse(request.getParameter("endDate"));
                Server server = new Server(id, type, price, cpu, ram, diskSpace, bandwidth, raid, os, startDate, endDate);
                person.getServletList().add(server);
                ModelList.servers.add(server);
            } catch (ParseException ex) {
                Logger.getLogger(NewServerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            return;
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Person findPerson(int id) {
//        return ModelList.persons
//                .stream()
//                .filter(person -> person.getId().equals(id))
//                .findAny()
//                .orElse(null);
        Person person = null;
        for (Person p : ModelList.persons) {
            if (p.getId() == id) {
                person = p;
            }
        }
        return person;
    }
}
