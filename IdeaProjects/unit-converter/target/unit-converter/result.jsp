<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Conversion Result</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(14px);
            border-radius: 16px;
            padding: 35px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
            color: #fff;
        }

        .result-value {
            font-size: 34px;
            font-weight: 700;
            color: #ffd200;
        }

        .label {
            color: #dcdcdc;
            font-size: 14px;
        }

        .btn-back {
            background: linear-gradient(90deg, #f7971e, #ffd200);
            color: #000;
            font-weight: 600;
            border-radius: 12px;
            padding: 12px;
            border: none;
            text-decoration: none;
        }

        .btn-back:hover {
            opacity: 0.9;
            transform: scale(1.01);
        }
    </style>
</head>

<body>

<div class="glass-card text-center">

    <i class="bi bi-check-circle-fill text-warning fs-1"></i>

    <h2 class="mt-3">Conversion Successful</h2>

    <p class="label mt-4">Converted Value</p>

    <div class="result-value">
        <%= request.getAttribute("result") %>
    </div>

    <p class="label mt-3">
        From <b><%= request.getAttribute("from") %></b>
        → To <b><%= request.getAttribute("to") %></b>
    </p>

    <a href="index.jsp" class="btn-back mt-4 d-inline-block">
        <i class="bi bi-arrow-left"></i> Convert Another
    </a>

</div>

</body>
</html>
