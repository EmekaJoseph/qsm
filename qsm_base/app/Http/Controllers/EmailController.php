<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

use Illuminate\Support\Facades\Mail;

class EmailController extends BaseController
{
    function sendMessageAlert($obj)
    {

        $template = 'emails/newMessageAlert';
        $topic = 'New Message';
        $to = 'qsmtrainingconsulting@gmail.com';
        $this->sendEmail($topic, $template, [], $to);
    }

    function autoResponse($obj)
    {
        $data = [
            'name' => $obj->name,
            'email' => $obj->email,
        ];
        $template = 'emails/autoResponse';
        $topic = 'no-reply';
        $to = $obj->email;
        $this->sendEmail($topic, $template, $data, $to);
    }


    private function sendEmail($topic, $template, $data, $email)
    {
        Mail::send($template, $data, function ($message) use ($email, $topic) {
            $message->to($email)->subject($topic);
            $message->from('info@qsmtrainingconsulting.com', 'QSM info');
        });
    }
}
