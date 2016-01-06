<!-- INFORMATION -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo $heading_title; ?></h3>
    </div>
    <div class="panel-body">
        <ul class="list-unstyled">
            <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
    </div>
</div>