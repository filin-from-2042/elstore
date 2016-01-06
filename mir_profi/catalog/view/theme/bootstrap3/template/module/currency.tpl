<?php if (count($currencies) > 1) { ?>
    <!-- CURRENCY v1 -->
    <a class="dropdown-toggle" data-toggle="dropdown">
        <span><?php echo $text_currency; ?></span>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu" role="menu">
        <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
                <li>
                    <?php if ($currency['symbol_left']) { ?>
                        <a>
                            <b><?php echo $currency['symbol_left']; ?></b>
                            <b><?php echo $currency['title']; ?></b>
                        </a>
                    <?php } else { ?>
                        <a>
                            <b><?php echo $currency['symbol_right']; ?></b>
                            <b><?php echo $currency['title']; ?></b>
                        </a>
                    <?php } ?>
                </li>
            <?php } else { ?>
                <li>
                    <?php if ($currency['symbol_left']) { ?>
                        <a onclick="$('#currency form[name=\'currency\'] input[name=\'currency_code\']').val('<?php echo $currency['code']; ?>'); $('#currency form[name=\'currency\']').submit();">
                            <span><?php echo $currency['symbol_left']; ?></span>
                            <span><?php echo $currency['title']; ?></span>
                        </a>
                    <?php } else { ?>
                        <a onclick="$('#currency form[name=\'currency\'] input[name=\'currency_code\']').val('<?php echo $currency['code']; ?>'); $('#currency form[name=\'currency\']').submit();">
                            <span><?php echo $currency['symbol_right']; ?></span>
                            <span><?php echo $currency['title']; ?></span>
                        </a>
                    <?php } ?>
                </li>
            <?php } ?>
        <?php } ?>
    </ul>
    <form class="sr-only" name="currency" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="currency_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
<?php } ?>