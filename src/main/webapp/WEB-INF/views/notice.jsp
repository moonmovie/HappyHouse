<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>HAPPYHOUSE</title>

    <!--   <script src="/vendor/jquery/jquery.min.js"></script> -->
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="${root}/favicon.png"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="icon" href="favicon.ico" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
    <link href="css/app.css" rel="preload" as="style" />
    <link href="js/app.js" rel="preload" as="script" />
    <link href="css/app.css" rel="stylesheet" />
  </head>
  <link href="${root}/vendor/icofont/icofont.min.css" rel="stylesheet" />
  <link href="${root}/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
  <link href="${root}/vendor/remixicon/remixicon.css" rel="stylesheet" />
  <link href="${root}/vendor/venobox/venobox.css" rel="stylesheet" />
  <body>
    <%@ include file="./include/header.jsp"%>
    <div id="app"></div>
    <script src="js/app.js"></script>
    <%@ include file="./include/footer.html"%>
  </body>
</html>