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

        /* table.invoice {

            border-collapse: collapse;
            border: 1px solid #fff;
            border-style: hidden;
        } */

        table {
            border-spacing: 2px;
            border: 1px solid #ccc;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 10px;
            /* border-collapse: collapse; */
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
    <div>Hello <b>{{$name}}</b>,</div>

    <section>
        <div>Kindly find below, invoice for the training(s) you just booked:</div>
    </section>

    <section>
        <table class="table">
            <thead>
                <tr>
                    <th>Training</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($list as $li)
                <tr>
                    <td>{{$li['title']}}</td>
                    <td style="text-align: right">{{$li['price']}}</td>
                </tr>
                @endforeach

                <tr>
                    <th>TOTAL:</th>
                    <th style="text-align: right">{{$total}}</th>
                </tr>
            </tbody>
        </table>
    </section>

    <section>
        Please contact us at qsmtrainingconsulting@gmail.com for more info.
        <div>Regards.</div>
    </section>


    <footer>
        <div> <a href="https://qsmtrainingconsulting.com">qsmtrainingconsulting.com</a></div>
    </footer>
</body>

</html>
