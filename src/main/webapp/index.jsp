<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <p>Login name is "abc" and password is "123"</p>
        <form action="login" method="post">
            <input type="hidden" name="action" value="authenticate">
            <table border="0">
                <tr>
                    <td><p align="right"><b>Login : </b></p></td>
                    <td><p><input type="text" name="username" value="jason199794@gmail.com" maxlength="50" size="15"></p></td>
                </tr>
                <tr>
                    <td><p align="right"><b>Password : </b></p></td>
                    <td><p><input type="password" name="password" value="Bb123456" maxlength="20" size="15"></p></td>
                </tr>
                <tr>
                    <td colspan="2"><p align="center"><input type="submit"></p></td>
                </tr>
            </table>
        </form>
    </body>
</html>