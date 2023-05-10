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
        <div><b>New Download Request.</b></div>
        <div>You have a new Request on qsmtrainingconsulting.com!</div>
        <div>A this user wants to download a material.</div>
    </section>


    <section>
        <h4><b>Sender Information:</b></h4>
        <div><b>Email:</b> {{$email}}</div>
        <div><b>Material:</b> {{$material['name']}}</div>
        <div><b>Material-Code:</b> {{$material['material_code']}}</div>
    </section>
</body>

</html>
