<?php defined('BASEPATH') OR exit('No direct script access allowed');
/*
 *  ==============================================================================
 *  Author  : Mian Saleem
 *  Email   : saleem@tecdiary.com
 *  For     : SMS Lib
 *  ==============================================================================
 */

class Sms
{
    public function __construct()
    {
        $sms_settings = $this->site->getSmsSettings();
        $sms_settings->config = json_decode($sms_settings->config);
        $gateway = $sms_settings->config->gateway;
        $settings = (array) $sms_settings->config->{$gateway};
        $config = ['gateway' => $gateway, $gateway => $settings];
        $this->lang->admin_load('sms', $this->Settings->language);
        $this->load->library('tec_sms', $config);
        $this->load->library('parser');
    }

    public function __get($var)
    {
        return get_instance()->$var;
    }

    public function send($to, $text)
    {
        try {
            $result = $this->tec_sms->send($to, $text);
        } catch (Exception $e) {
            $result = ['sending' => false, 'error' => true, 'message' => $e->getMessage()];
        }
        return $result;
    }

    public function custom($to, $text)
    {
        return $this->send($to, $text);
    }

    public function newSale($sale_id, $text = null)
    {
        if (!$text) {
            $text = lang('new_sale');
        }
        $sale = $this->site->getSaleByID($sale_id);
        $customer = $this->site->getCompanyByID($sale->customer_id);
        $parse_data = [
            'customer' => $customer->company && $customer->company != '-' ? $customer->company : $customer->name,
            'sale_reference' => $sale->reference_no,
            'grand_total' => $this->sma->formatMoney($sale->grand_total),
        ];
        $text = $this->parser->parse_string($text, $parse_data);
        return $this->send($customer->phone, $text);
    }

    public function paymentReceived($sale_id, $reference_no, $amount)
    {
        $parse_data = [
            'payment_reference' => $reference_no,
            'amount' => $this->sma->formatMoney($amount),
        ];
        $text = $this->parser->parse_string(lang('payment_received'), $parse_data);
        return $this->newSale($sale_id, $text);
    }

    public function delivering($sale_id, $reference_no)
    {
        $parse_data = [
            'delivery_reference' => $reference_no
        ];
        $text = $this->parser->parse_string(lang('delivering'), $parse_data);
        return $this->newSale($sale_id, $text);
    }

}
