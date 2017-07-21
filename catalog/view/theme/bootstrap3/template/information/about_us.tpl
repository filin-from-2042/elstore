<!-- header -->
<?php echo $header; ?>
<!-- notification -->
<div id="notification" class="container hidden-print">
    <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/notification.tpl'); ?>
</div>
<!-- main -->
<?php $bootstrap = new Bootstrap((bool)$column_left, (bool)$column_right, (bool)$content_top, (bool)$content_bottom); ?>
<div id="main" class="container inform-page">
    <div class="row">
        <!-- center -->
        <div class="<?php echo $bootstrap->center; ?>">
            <!-- top -->
            <?php if ($content_top) { ?>
            <div id="top" class="row"><div class="<?php echo $bootstrap->top; ?>"><?php echo $content_top; ?></div></div>
            <?php } ?>
            <!-- breadcrumbs -->
            <?php include(DIR_APPLICATION .'view/theme/bootstrap3/template/module/breadcrumbs.tpl'); ?>
            <!-- content -->
            <div id="content" class="row">
                <div class="<?php echo $bootstrap->content; ?>" role="main">
                    <!-- heading title -->
                    <div class="row about-page">	<div class="col-sm-4">		<h3>Почему выбирают нас?</h3>

                            <!-- .clear (end) -->		<span class="dropcap"><i class="fa fa-money" aria-hidden="true"></i></span><!-- .dropcap (end) -->		<div class="extra-wrap">			<h4>Цены.</h4>
                                <p>Именно благодаря  низким ценам мы завоевываем расположение наших покупателей уже вот 25 лет!</p>
                            </div>
                            <div class="clearfix"></div>

                            <!-- .clear (end) -->		<span class="dropcap"><i class="fa fa-file-text-o" aria-hidden="true"></i></span><!-- .dropcap (end) -->		<div class="extra-wrap">			<h4>Работаем с НДС.</h4>
                                <p>Предоставляем весь спектр документов при работе по безналичному расчету. Все официально. Все прозрачно.</p>
                            </div>
                            <div class="clearfix"></div>

                            <span class="dropcap"><i class="fa fa-truck" aria-hidden="true"></i></span><!-- .dropcap (end) -->		<div class="extra-wrap">			<h4>Доставка</h4>
                                <p>Отправим товар в любую точку России через "Деловые линии"</p>
                            </div>

                            <div class="clearfix"></div>
                            <!-- .clear (end) -->	</div>
                        <div class="col-sm-8">		<h3>Немного о нас</h3>
                            <h4>ИП Кондратьев А.С. учреждено в 1992г.</h4>
                            <p>На сегодняшний день наша организация активно развивается, чтобы удовлетворять потребности наших покупателей.</p>
                            <p>  </p>
                        </div>
                        <div class="col-sm-12"><div class="sm_hr"></div>
                        </div>
                        <div class="col-sm-4">		<h3>Отзывы</h3>
                            <div class="testimonials ">			<div class="testi-item">				<blockquote class="testi-item_blockquote">					<a href="">Aenean nonummy hendrerit mau phasellu porta. Fusce suscipit varius mi sed. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.... </a>					<div class="clear"></div>
                                    </blockquote>				<small class="testi-meta">					<div class="user">Tim Barkley</div>
                                        <a href="https://demolink.org">https://demolink.org</a>				</small>			</div>
                                <div class="testi-item">				<blockquote class="testi-item_blockquote">					<a href="">Aenean nonummy hendrerit mau phasellu porta. Fusce suscipit varius mi sed. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.... </a>					<div class="clear"></div>
                                    </blockquote>				<small class="testi-meta">					<div class="user">Lisa Whistler</div>
                                        <a href="https://demolink.org">https://demolink.org</a>				</small>			</div>
                            </div>
                        </div>
                        <div class="col-sm-8">		<h3>Наша команда</h3>
                            <div class="recent-posts row">			<div class="col-sm-4">				<figure class="thumbnail featured-thumbnail">					<a title="Robert Johnson" href="index.php?route=information/information&amp;information_id=7">						<img alt="Robert Johnson" src="image/catalog/article/Depositphotos_6325694_original-230x240.jpg">					</a>				</figure>				<h5>					<a title="Robert Johnson" href="index.php?route=information/information&amp;information_id=7">Robert Johnson</a>				</h5>
                                    <div class="excerpt">Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in... </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry (end) -->			<div class="col-sm-4">				<figure class="thumbnail featured-thumbnail">					<a title="Jessica Priston" href="index.php?route=information/information&amp;information_id=8">						<img alt="Jessica Priston" src="image/catalog/article/Depositphotos_10953362_EL4-230x240.jpg">					</a>				</figure>				<h5>					<a title="Jessica Priston" href="index.php?route=information/information&amp;information_id=8">Jessica Priston</a>				</h5>
                                    <div class="excerpt">Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in... </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry (end) -->			<div class="col-sm-4">				<figure class="thumbnail featured-thumbnail">					<a title="Sam Kromstain" href="index.php?route=information/information&amp;information_id=9">						<img alt="Sam Kromstain" src="image/catalog/article/Depositphotos_1382984_original-230x240.jpg">					</a>				</figure>				<h5>					<a title="Sam Kromstain" href="index.php?route=information/information&amp;information_id=9">Sam Kromstain</a>				</h5>
                                    <div class="excerpt">Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in... </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry (end) -->			<div class="col-sm-4">				<figure class="thumbnail featured-thumbnail">					<a title="Edna Barton" href="index.php?route=information/information&amp;information_id=10">						<img alt="Edna Barton" src="image/catalog/article/Depositphotos_28394885_original-230x240.jpg">					</a>				</figure>				<h5>					<a title="Edna Barton" href="index.php?route=information/information&amp;information_id=10">Edna Barton</a>				</h5>
                                    <div class="excerpt">Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in... </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry (end) -->			<div class="col-sm-4">				<figure class="thumbnail featured-thumbnail">					<a title="Julie Herzigova" href="index.php?route=information/information&amp;information_id=11">						<img alt="Julie Herzigova" src="image/catalog/article/Depositphotos_1961767_original-230x240.jpg">					</a>				</figure>				<h5>					<a title="Julie Herzigova" href="index.php?route=information/information&amp;information_id=11">Julie Herzigova</a>				</h5>
                                    <div class="excerpt">Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in... </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry (end) -->		</div>
                            <div class="spacer"></div>
                        </div>
                    </div>


                    <br />
                </div>
            </div>
            <br />
            <!-- bottom -->
            <?php if ($content_bottom) { ?>
            <div id="bottom" class="row"><div class="<?php echo $bootstrap->bottom; ?>"><?php echo $content_bottom; ?></div></div>
            <?php } ?>
        </div>
        <!-- left -->
        <?php if ($column_left) { ?>
        <div id="left" class="<?php echo $bootstrap->left; ?>"><?php echo $column_left; ?></div>
        <?php } ?>
        <!-- right -->
        <?php if ($column_right) { ?>
        <div id="right" class="<?php echo $bootstrap->right; ?>"><?php echo $column_right; ?></div>
        <?php } ?>
    </div>
</div>
<!-- footer -->
<?php echo $footer; ?>
</body>
</html>