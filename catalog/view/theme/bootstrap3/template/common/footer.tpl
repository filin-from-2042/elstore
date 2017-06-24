</div>
<?php $col = $informations ? 3 : 4; ?>
<div id="footer">
    <div class="container hidden-print">
        <div class="row">
            <?php if ($informations) { ?>
                <div id="footer_information" class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <h4><?php echo $text_information; ?></h4>
                    <ul class="list-unstyled">
                        <?php foreach ($informations as $information) { ?>
                            <li><i class="fa fa-angle-right"></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <div class="LiveInternetCounter">
                        <!--LiveInternet counter--><script type="text/javascript"><!--
                            document.write("<a href='//www.liveinternet.ru/click' "+
                            "target=_blank><img src='//counter.yadro.ru/hit?t12.6;r"+
                            escape(document.referrer)+((typeof(screen)=="undefined")?"":
                            ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
                                    screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
                            ";"+Math.random()+
                            "' alt='' title='LiveInternet: показано число просмотров за 24"+
                            " часа, посетителей за 24 часа и за сегодня' "+
                            "border='0' width='88' height='31'><\/a>")
                            //--></script><!--/LiveInternet-->

                    </div>

                </div>

            <?php } ?>
            <div id="footer_support" class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h4><?php echo $text_service; ?></h4>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
            </div>
            <div id="footer_additional" class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h4><?php echo $text_extra; ?></h4>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <!--<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
            </div>
            <div id="footer_personal_page" class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h4><?php echo $text_account; ?></h4>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><i class="fa fa-angle-right"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
        </div>
    </div>

<!-- powered -->



<!-- modal -->
<?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/modal.tpl'); ?>

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter36428995 = new Ya.Metrika({
                    id:36428995,
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
<noscript><div><img src="https://mc.yandex.ru/watch/36428995" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-36425569-3', 'auto');
    ga('send', 'pageview');

</script>