<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Aguda</title>
    <style>
        html {
            line-height: 1.15;
            -webkit-text-size-adjust: 100%
        }

        body {
            margin: 0
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
    <h5>You have a new Message from a your <b>{{$name}}</b>.</h5>

    <section class="info">
        <div><b>Message:</b></div>
        <div>{{$message}}</div>
    </section>

    <section class="info">
        <div><b>Sender Email:</b></div>
        <div>{{$email}}</div>
    </section>


    <!-- <footer>
        <div> <a href="https://agudatechy.com">Agudatechy</a> &copy; 2023</div>
    </footer> -->
</body>

</html>
