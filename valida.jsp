<%@page import="Classes.Media"%>
<%@page import="Classes.Aluno"%>
<%@page import="Dao.AlunoDAO"%>
<%

    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    session.setAttribute("login", login);
    session.setAttribute("senha", senha);
    
    
    String resp = new AlunoDAO().login(login, senha);
    
    Aluno rgm = new Aluno();
    String rgm1 = rgm.getRgm_();
    session.setAttribute("rgm", rgm1);
    
    if (resp.equals("OK")) {
        session.setAttribute("logado", "SIM");

        response.sendRedirect("boletim.jsp?status=" + resp);
    } else {
        
        response.sendRedirect("login.jsp?status=" + resp);
        out.println("ERRO: " + resp);
    }

    
    
    
%>


