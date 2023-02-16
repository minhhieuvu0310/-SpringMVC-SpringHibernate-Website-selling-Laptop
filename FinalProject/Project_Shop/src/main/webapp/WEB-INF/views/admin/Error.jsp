<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Error Admin</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<style>
    .error-page {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #f7f7f7;
    }

    h1 {
        font-size: 10em;
        margin: 0;
        color: #f44336;
    }

    p {
        font-size: 1.5em;
        margin: 20px 0;
    }

    a {
        font-size: 1.2em;
        padding: 10px 20px;
        background-color: #f44336;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    a:hover {
        background-color: #b71c1c;
    }
</style>

<body>
    <div class="error-page">
        <h1>Error</h1>
        <p>${message }</p>
        <a href="homeBackend">Return to Home</a>
    </div>
</body>

</html>