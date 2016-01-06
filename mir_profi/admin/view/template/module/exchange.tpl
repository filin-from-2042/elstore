<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

  <div class="box">
  <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
         
          <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
          <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      </div>
  </div>      
<div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"></td>
              <td class="right"></td>

            </tr>
          </thead>


          <tbody id="module-row">
            <tr>
              <td class="left"><select name="exchange_status">
               
                 <?php if ($exchange_status=='1') { ?>
                    <option value="1" selected="selected"><?php echo $text_delete; ?></option>
                    <option value="0"><?php echo $text_delete2; ?></option>
                    <option value="2"><?php echo $text_delete3; ?></option>
                    <option value="3"><?php echo $text_delete4; ?></option>
                  <?php } elseIf($exchange_status=='0') { ?>
                    <option value="1"><?php echo $text_delete; ?></option>
                    <option value="2"><?php echo $text_delete3; ?></option>
                    <option value="3"><?php echo $text_delete4; ?></option>
                    <option value="0" selected="selected"><?php echo $text_delete2; ?></option>
                    <?php } elseIf($exchange_status=='2') { ?>
                    <option value="1"><?php echo $text_delete; ?></option>
                    <option value="0"><?php echo $text_delete2; ?></option>
                    <option value="3"><?php echo $text_delete4; ?></option>
                    <option value="2" selected="selected"><?php echo $text_delete3; ?></option>
                    <?php } elseIf($exchange_status=='3') { ?>
                    <option value="1"><?php echo $text_delete; ?></option>
                    <option value="0"><?php echo $text_delete2; ?></option>
                    <option value="3" selected="selected" ><?php echo $text_delete4; ?></option>
                    <option value="2" ><?php echo $text_delete3; ?></option>
                  <?php }else{ ?>
                     <option value="1"><?php echo $text_delete; ?></option>
                     <option value="0"><?php echo $text_delete2; ?></option> 
                     <option value="3" selected="selected" ><?php echo $text_delete4; ?></option>
                     <option value="2" ><?php echo $text_delete3; ?></option>
                  <?php } ?>
                </select>
              </td>
              
              <td class="left">
                  <label for="exchange_delete_check"><?php echo $exchange_delete_check; ?></label>
                                <input type="checkbox" value="1"  name="exchange_delete_check" id="exchange_delete_check">
              </td>
            </tr>
            <tr>
                <td class="left">
                            <label for="exchange_priority"><?php echo $exchange_priority_text; ?></label>
                                <input type="checkbox" value="1"  name="exchange_priority" id="exchange_priority" <?php echo ($exchange_priority == 1)? 'checked' : '';?>>
                </td>
                
                <td class="left"></td>
                
            </tr>

            
          </tbody>


        </table>
      </form>
    
    <pre>

    
    </pre>
      
   </div>   
      
  
  
  </div>
    
  </div>


</div>
<?php echo $footer; ?>