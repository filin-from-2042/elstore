</div><?php /*page close*/?>
<footer>
    <div class="container">
        <div class="row">

            <?php if ($informations) { ?>
            <div class="col-sm-2">
                <div class="footer_box">
                    <h5><?php echo $text_information; ?></h5>
                    <ul class="list-unstyled">
                        <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <?php } ?>


            <div class="col-sm-2">
                <div class="footer_box">
                    <h5><?php echo $text_service; ?></h5>
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="footer_box">
                    <h5><?php echo $text_extra; ?></h5>
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="footer_box">
                    <h5><?php echo $text_account; ?></h5>
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="footer_box social">
                    <h5>Мы в соц.сетях</h5>
                    <a href="https://vk.com/elektrika71"><i class="fa fa-vk"></i></a>
                </div>
            </div>
        </div>

    </div>
    <div class="copyright">
        <div class="container">
            Электрика &copy; 2017<!-- [[%FOOTER_LINK]] -->
        </div>
    </div>
</footer>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="catalog/view/theme/elektrika-tools/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/elektrika-tools/js/script.js"></script>
</body>
</html>