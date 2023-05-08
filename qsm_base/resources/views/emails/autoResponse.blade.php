<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>QSM - noreply</title>
    <style>
        html {
            line-height: 1.15;
            -webkit-text-size-adjust: 100%
        }

        body {
            margin: 20px
        }

        .info {
            margin-bottom: 20px;
        }

        footer {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
    </style>


</head>

<body class="container">
    <h5>Hello <b>{{$name}}</b>,</h5>

    <section class="info">
        <div><b>Thank you for reaching out!</b></div>
        <div>This is a confirmation that we got your message.</div>
    </section>

    <section class="info">
        <div>We will contact you as soon as possible.</div>
    </section>


    <footer>
        <div> <a href="https://qsmtrainingconsulting.com">qsmtrainingconsulting.com</a></div>
    </footer>
</body>

</html>
