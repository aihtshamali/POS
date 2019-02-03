<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<script>
    
</script>
<?php if ($Owner || $GP['bulk_actions']) {
    echo admin_form_open('customers/customer_actions', 'id="action-form"');
} ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('Deposits'); ?></h2>

        
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                

                <div class="table-responsive">
                    <table id="Deposit" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr class="primary">
                            
                            <th><?= lang("company"); ?></th>
                            <th><?= lang("name"); ?></th>
                            <th><?= lang("email_address"); ?></th>
                            <th><?= lang("phone"); ?></th>
                            <th><?= lang("price_group"); ?></th>
                            <th><?= lang("customer_group"); ?></th>
                            <th><?= lang("vat_no"); ?></th>
                            <th><?= lang("deposit"); ?></th>
                            <th><?= lang("deposit_date"); ?></th>
                            <th><?= lang("paid_by"); ?></th>
                            
                        </tr>
                        </thead>
                        <tbody>
                        
                        <?php 
                        
                        foreach($this->data['deposits'] as $deposit)
                            { 
                                // print_r($deposit);
                                // exit();
                                ?>

                        <tr>
                            <th><?= $deposit->company; ?></th>
                            <th><?= $deposit->name; ?></th>
                            <th><?= $deposit->email; ?></th>
                            <th><?= $deposit->phone; ?></th>
                            <th><?= $deposit->price_group_name; ?></th>
                            <th><?= $deposit->customer_group_name; ?></th>
                            <th><?= $deposit->vat_no; ?></th>
                            <th><?= $deposit->amount; ?></th>
                            <th><?= date('d M Y',strtotime($deposit->date)); ?></th>
                            <th><?= $deposit->paid_by; ?></th>
                            
                        </tr>
                        <?php 
                        }
                         ?>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">

                            
                        </tr>
                        
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>


<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('Refunds'); ?></h2>

        
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                

                <div class="table-responsive">
                    <table id="Refund" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr class="primary">
                            
                            <th><?= lang("company"); ?></th>
                            <th><?= lang("name"); ?></th>
                            <th><?= lang("email_address"); ?></th>
                            <th><?= lang("phone"); ?></th>
                            <th><?= lang("price_group"); ?></th>
                            <th><?= lang("customer_group"); ?></th>
                            <th><?= lang("vat_no"); ?></th>
                            <th><?= lang("refund"); ?></th>
                            <th><?= lang("refund_date"); ?></th>
                            <th><?= lang("paid_by"); ?></th>
                            
                        </tr>
                        </thead>
                        <tbody>
                        
                        <?php 
                        
                        foreach($this->data['refunds'] as $refund)
                            { 
                                // print_r($deposit);
                                // exit();
                                ?>

                        <tr>
                            <th><?= $refund->company; ?></th>
                            <th><?= $refund->name; ?></th>
                            <th><?= $refund->email; ?></th>
                            <th><?= $refund->phone; ?></th>
                            <th><?= $refund->price_group_name; ?></th>
                            <th><?= $refund->customer_group_name; ?></th>
                            <th><?= $refund->vat_no; ?></th>
                            <th><?= $refund->amount; ?></th>
                            <th><?= date('d M Y',strtotime($refund->date)); ?></th>
                            <th><?= $refund->paid_by; ?></th>
                            
                        </tr>
                        <?php 
                        }
                         ?>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">

                            
                        </tr>
                        
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>
<?php if ($Owner || $GP['bulk_actions']) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
<?php } ?>
 <?php //if ($action && $action == 'add') {
  //  echo '<script>$(document).ready(function(){$("#add").trigger("click");});</script>';
//}
?>
	

