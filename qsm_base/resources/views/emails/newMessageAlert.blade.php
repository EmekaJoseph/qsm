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

        section {
            margin-bottom: 20px;
        }
    </style>


</head>

<body class="container">
    <section>
        <div><b>New Message Alert.</b></div>
        <div>You have a new message on qsmtrainingconsulting.com!</div>
    </section>


    <section>
        <h5><b>Sender Information:</b></h5>
        <div><b>Name:</b> {{$name}}</div>
        <div><b>Email:</b> {{$email}}</div>
        <div><b>Phone:</b> {{$phoneN}}</div>
        <div><b>Message:</b> {{$msg}}</div>
    </section>
</body>

</html>
