package servlet.person;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import modellists.ModelList;
import models.Person;
import models.Server;

public class NewPersonServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./persons/newperson.jsp").forward(request, response);
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
        if (!ModelList.persons.isEmpty()) {
            id = ModelList.persons.get(ModelList.persons.size() - 1).getId() + 1;
        }
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        if (request.getParameter("companyName") != null) {
            String companyName = request.getParameter("companyName");
            if (!checkForEmptyValues(firstName, lastName, address, companyName)) {
                request.setAttribute("error", "Fields can not be empty!");
                processRequest(request, response);
                return;
            }
            Person person = new Person(id, firstName, lastName, address, companyName, new ArrayList<Server>());
            ModelList.persons.add(person);
            request.setAttribute("success", "Successfully added a new Person!");
            processRequest(request, response);
            return;
        }
        if (!checkForEmptyValues(firstName, lastName, address, "companyName")) {
            request.setAttribute("error", "Fields can not be empty!");
            processRequest(request, response);
            return;
        }
        Person person = new Person(id, firstName, lastName, address, new ArrayList<Server>());
        ModelList.persons.add(person);
        request.setAttribute("success", "Successfully added a new Person!");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean checkForEmptyValues(String firstName, String lastName, String address, String companyName) {
        if (firstName != "" && lastName != "" && address != "" && companyName != "") {
            return true;
        }
        return false;
    }

}
