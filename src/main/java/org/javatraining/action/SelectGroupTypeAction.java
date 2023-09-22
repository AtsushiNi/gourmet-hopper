package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;

public class SelectGroupTypeAction extends Action {

    @Override
    protected String processRequest(HttpServletRequest request) {
        return "selectGroupType.jsp";
    }
}
