
<%@page import="Dao.MediaDAO"%>
<%@page import="Classes.Media"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.AlunoDAO"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String status = request.getParameter("status");

    if (status != null) {
        if (status.equals("OK")) {

            out.println("Registro inserido com sucesso");
        } else {
            out.println("ERRO: " + status);
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <form name="form1" action="gravar.jsp?" method="post">
                <table border="2">
                    <tr>
                        <td colspan ="2" align="center">CADASTRO DE PROVAS</td>
                    </tr>
                    <tr>
                        <td>RGM:   </td>
                        <td>
                            <select name="rgm">
                                <%                               
                                    ArrayList<Aluno> lista = new AlunoDAO().getAlunos();

                                    for (int i = 0; i < lista.size(); i++) {
                                        
                                        out.println("<option value=" + lista.get(i).getRgm() + ">");
                                        out.println("[" + lista.get(i).getRgm() + "] " + lista.get(i).getNome());
                                        out.println("</option>");
                                    }


                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Disciplina:   </td>
                        <td><input name="disciplina" type="text">
                    </tr>
                    <tr>
                        <td>Médias:   </td>
                        <td><input name="media" type="text">
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Gravar"></td>                  
                    </tr>
                    </tr>
                </table>            
            </form>  
            <br><br>                

            <table border="1">
                <tr><td><b>RGM</b></td><td><b>Disciplina</b></td><td><b>Média</b></td></tr>
                <%               
                    ArrayList<Media> media = new MediaDAO().getMedia();

                    for (int i = 0; i < media.size(); i++) {

                        out.println("<tr>");
                        out.println("<td>" + media.get(i).getRgm() + "</td>");
                        out.println("<td>" + media.get(i).getDisciplina() + "</td>");
                        out.println("<td colspan='3'>" + media.get(i).getMedia() + "</td>");
                        out.println("</tr>");

                    }


                %>

            </table> 
        </div>
    </body>
</html>
