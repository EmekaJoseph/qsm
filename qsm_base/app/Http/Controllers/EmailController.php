<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

use Illuminate\Support\Facades\Mail;

class EmailController extends BaseController
{
    function sendMessageAlert($name, $email, $message)
    {
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message
        ];
        $template = 'emails/messageAlert';
        $topic = 'New Message/Enquiry';
        $to = 'qsmtrainingconsulting@gmail.com';
        $this->sendEmail($topic, $template, $data, $to);
    }

    function sendNewsletter($title, $text, $email)
    {
        $data = [
            'text' => $text,
        ];
        $template = 'emails/sendNewsletter';
        $topic = $title;
        $to = $email;
        $this->sendEmail($topic, $template, $data, $to);
    }



    private function sendEmail($topic, $template, $data, $email)
    {
        Mail::send($template, $data, function ($message) use ($email, $topic) {
            $message->to($email)->subject($topic);
            $message->from('support@qsmconsulting.com', 'QSM SUPPORT');
        });
    }
}
