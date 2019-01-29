<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
 *  ==============================================================================
 *  Author  : Mian Saleem
 *  Email   : saleem@tecdiary.com
 *  For     : SMS APIs
 *  ==============================================================================
 */

use Tecdiary\Sms\Sms;

class Tec_sms
{
    public function __construct($config)
    {
        $config['log'] = ['path' => APPPATH.'logs/sms.log', 'level' => 100];
        $this->sms = new Sms($config);
    }

    public function send($to, $text)
    {
        return $this->sms->send($to, $text)->response();
    }
}
