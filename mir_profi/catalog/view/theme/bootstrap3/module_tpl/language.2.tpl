<?php if (count($languages) > 1) { ?>
    <!-- LANGUAGE v2 -->
    <ul class="dropdown-menu" role="menu">
        <?php foreach ($languages as $language) { ?>
            <?php if($language['code'] === $language_code){ ?>
                <?php $config_language = $language; ?>
            <?php } else { ?>
                <li>
                    <a onclick="$('#language form[name=\'language\'] input[name=\'language_code\']').val('<?php echo $language['code']; ?>'); $('#language form[name=\'language\']').submit();">
                        <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />
                        <span><?php echo $language['name']; ?></span>
                    </a>
                </li>
            <?php } ?>
        <?php } ?>
    </ul>
    <a class="dropdown-toggle" data-toggle="dropdown">
        <img src="image/flags/<?php echo $config_language['image']; ?>" alt="<?php echo $config_language['name']; ?>" title="<?php echo $config_language['name']; ?>" />
        <span><?php echo $text_language; ?></span>
        <span class="caret"></span>
    </a>
    <form class="sr-only" name="language" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="language_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
<?php } ?>