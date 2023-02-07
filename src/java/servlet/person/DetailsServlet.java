package servlet.person;

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

public class DetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./persons/details.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = findPerson(id);
        request.setAttribute("person", person);
        request.setAttribute("leasedDedicatedServers", person.getAllLeasedDedicatedServers(id));
        request.setAttribute("leasedVirtualServers", person.getAllLeasedVirtualServers(id));
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("personId"));
        String startDateString = request.getParameter("dateStart");
        String endDateString = request.getParameter("dateEnd");
        Date startDate;
        Date endDate;
        SimpleDateFormat parse = new SimpleDateFormat("yyyy-MM-dd");
        try {
            startDate = parse.parse(startDateString);
            endDate = parse.parse(endDateString);
            String output = Person.getAllLeasedVirtualServersByDate(id, startDate, endDate);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(output);
        } catch (ParseException ex) {
            Logger.getLogger(DetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
