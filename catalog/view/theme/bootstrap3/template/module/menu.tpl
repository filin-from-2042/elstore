<!-- MENU -->
<div class="navbar navbar-inverse ">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand visible-xs" href="<?php echo $home; ?>"><?php echo $name; ?></a>
    </div>
    <div id="menu-collapse" class="navbar-collapse collapse container">
        <ul class="nav navbar-nav " role="menu">
               <li class="menu-item"><a href="/">Главная</a></li>
               <!--<li class="menu-item" id="catalog-btn"><a  href="/index.php?route=product/category">Каталог</a></li>-->
               <li class="menu-item"><a href="./index.php?route=product/special">Акции</a></li>
               <li class="menu-item"><a href="./index.php?route=information/contact">Контакты</a></li>
               <li class="menu-item"><a href="./index.php?route=information/information&information_id=6">Доставка</a></li>
        </ul>
    </div>
</div>