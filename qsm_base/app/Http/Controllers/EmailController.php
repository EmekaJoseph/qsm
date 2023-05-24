<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

use Illuminate\Support\Facades\Mail;

class EmailController extends BaseController
{
    function sendMessageAlert($obj)
    {
        $data = [
            'name' => $obj->name,
            'email' => $obj->email,
            'msg' => $obj->message,
            'phoneN' => $obj->phone,
        ];

        $template = 'emails/newMessageAlert';
        $topic = 'New Message';
        $to = 'qsmtrainingconsulting@gmail.com';
        $this->sendEmail($topic, $template, $data, $to);
    }

    function newRegistrationAlert()
    {
        $template = 'emails/newRegistrationAlert';
        $topic = 'Training Registration';
        $to = 'qsmtrainingconsulting@gmail.com';
        $this->sendEmail($topic, $template, [], $to);
    }

    function sendDownloadRequest($obj)
    {
        $data = [
            'email' => $obj->email,
            'material' => $obj->material,
        ];

        $template = 'emails/sendDownloadRequest';
        $topic = 'Download Request';
        $to = 'qsmtrainingconsulting@gmail.com';
        $this->sendEmail($topic, $template, $data, $to);
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

    function sendTrainingInvoice($obj)
    {
        $data = [
            'name' => $obj->name,
            'list' => $obj->trainingList,
            'total' => $obj->total,
        ];

        $template = 'emails/sendTrainingInvoice';
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
