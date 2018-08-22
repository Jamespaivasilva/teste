<%@page import="Dao.MediaDAO"%>
<%@page import="Classes.Media"%>
<%

    //Captura os dados do formulário index
    String rgm = request.getParameter("rgm");
    String disciplina = request.getParameter("disciplina");
    String media = request.getParameter("media");

    //Monta o objeto aluno
    Media aluno = new Media();
   
    aluno.setDisciplina(disciplina);
    aluno.setMedia(Float.parseFloat(media));
   
        String resp = new MediaDAO().inserirDisciplina(aluno, rgm);
        response.sendRedirect("index.jsp?status=" + resp);
        


    //Manda de volta para o index com uma mensagem (sucesso)

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de dados</title>
    </head>
    <body>

    </body>
</html>
