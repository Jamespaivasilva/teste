<%@page import="Dao.MediaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Media"%>
<%

    String logado = (String) session.getAttribute("logado");
    if (logado == null) {
        response.sendRedirect("login.jsp");
        out.println("Usuário sem sessão");

    } else {
        out.println("Logado com sucesso");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="border:1px solid; width:350px; margin-left: 40%;margin-top: 5%">
            <div align="center">BOLETIM DO ALUNO</div>
            <div>
                <table>

                    <%                        
                        
                        String rgm = (String) session.getAttribute("rgm");
                        ArrayList<Media> media = new MediaDAO().getMediaBoletim(rgm);

                        out.println(
                                "<td> Aluno: " + media.get(0).getNome() + "</td>");
                        out.println(
                                "<td> Rgm: " + media.get(0).getRgm() + "</td>");
                        out.println(
                                "<tr>");
                        out.println(
                                "<td>Disciplina</td>");
                        out.println(
                                "<td>Média</td>");

                        for (int i = 0;
                                i < media.size();
                                i++) {
                            out.println("<tr>");
                            out.println("<td>" + media.get(i).getDisciplina() + "</td>");
                            out.println("<td colspan='3'>" + media.get(i).getMedia() + "</td>");
                            out.println("</tr>");

                        }


                    %>

                </table> 
            </div>
        </div>
    </body>
</html>
