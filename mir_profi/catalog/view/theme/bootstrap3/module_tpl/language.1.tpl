<?php if (count($languages) > 1) { ?>
    <!-- LANGUAGE v1 -->
    <a class="dropdown-toggle" data-toggle="dropdown">
        <span><?php echo $text_language; ?></span>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu" role="menu">
        <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] === $language_code) { ?>
                <li>
                    <a>
                        <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />
                        <b><?php echo $language['name']; ?></b>
                    </a>
                </li>
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
    <form class="sr-only" name="language" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="language_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
<?php } ?>