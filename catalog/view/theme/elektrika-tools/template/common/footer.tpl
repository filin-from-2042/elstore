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
                        <?php /* ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php */?>
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
        <div class="row">
            <div class="col-sm-4">
                <!-- Yandex.Metrika informer -->
                <a href="https://metrika.yandex.ru/stat/?id=45408420&amp;from=informer"
                                                   target="_blank" rel="nofollow"><img src="https://informer.yandex.ru/informer/45408420/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
                                                                                       style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" class="ym-advanced-informer" data-cid="45408420" data-lang="ru" /></a>
                <!-- /Yandex.Metrika informer -->
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
<script src="catalog/view/theme/elektrika-tools/js/script-minified.js"></script>
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter45408420 = new Ya.Metrika({
                    id:45408420,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/45408420" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body>
</html>