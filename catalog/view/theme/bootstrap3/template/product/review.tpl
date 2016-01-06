<?php if ($reviews) { ?>
    <ul class="list-unstyled">
        <?php foreach ($reviews as $review) { ?>
            <li>
                <ul class="list-inline">
                    <li><b><?php echo $review['author']; ?></b></li>
                    <li><?php echo $text_on; ?>&nbsp;<?php echo $review['date_added']; ?></li>
                    <li class="pull-right">
                        <img src="<?php echo HTTP_SERVER . 'catalog/view/theme/' . $this->config->get('config_template') . '/image/stars-' . $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
                    </li>
                </ul>
                <br />
                <p><?php echo $review['text']; ?></p>
                <hr />
            </li>
        <?php } ?>
    </ul>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
            <?php echo $pagination; ?>
        </div>
    </div>
<?php } else { ?>
    <h3><?php echo $text_no_reviews; ?></h3>
<?php } ?>