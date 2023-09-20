package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;

public class HomeAction extends Action {

    @Override
    protected String processRequest(HttpServletRequest request) {
        return "home.jsp";
    }
}
