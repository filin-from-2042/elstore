<?php if (count($currencies) > 1) { ?>
    <!-- CURRENCY v2 -->
    <ul class="dropdown-menu" role="menu">
        <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
                <?php $config_currency = $currency; ?>
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
    <a class="dropdown-toggle" data-toggle="dropdown">
        <b class="badge" title="<?php echo $config_currency['title']; ?>"><?php echo $config_currency['symbol_left'] ? $config_currency['symbol_left'] : $config_currency['symbol_right'] ?></b>
        <span><?php echo $text_currency; ?></span>
        <span class="caret"></span>
    </a>
    <form class="sr-only" name="currency" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="currency_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
<?php } ?>