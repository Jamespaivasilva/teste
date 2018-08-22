
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <div style="border: 1px solid; border-color: black; width: 350px;height: 250px">

                <div style="margin-top: 15%">
                    <form name="form1" action="valida.jsp?" method="post">
                        <div>
                            Login: <input name="login" type="text" >
                        </div><br><br>
                        <div>
                            Senha: <input name="senha" type="password" >
                        </div><br><br>
                        <input type="submit" value="Entrar">

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
