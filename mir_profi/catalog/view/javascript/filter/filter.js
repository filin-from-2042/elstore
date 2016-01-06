/* Functions */
filter.element = {
  button  : $('#filter-button'),
  fields  : $('#product-filter input, #product-filter select option'),
  target  : $('#product-filter input, #product-filter select'),
  labels  : $('#product-filter label'),
  price   : $('#filter-price'), // Price filter block
  options : $('.filter-option'),
  info    : $('#product-filter .option-name a'), // Option desription handler
  scale   : $('#scale'), // Slide scale element
  pFrom   : $('#p-from'),// Price from elemenet
  pTo     : $('#p-to'),  // Price to elemenet
  buttonBottom   : $('#button-bottom'),
  showHideButton : $('#show-hide-options'), // Show/hide options button
  otherOptions   : $('#other-options-hide') // Options block
};

if (filter.php.params) var params = [filter.php.params]; else var params = [];
if (filter.php.price) var price = [filter.php.price]; else var price = [];

$(function(){
  /* Filter handlers base events */
  filter.element.target.live('change', function() {
    if (this.value) params = [this.value]; else params = [];

    var e = $(this);

    /* Marked selected values */
    if (e.attr('type') == 'checkbox') {
      e.parent().toggleClass('selected');
    } else if (e.attr('type') == 'radio') {
      $('label', e.parents('.filter-option')).removeClass('selected');
      e.parent().addClass('selected');
    } else if (e.is('select')) {
      if ($('option:first', e).attr('selected')) {
        e.removeClass('selected');
      } else {
        e.addClass('selected');
      }
    }

    if (filter.php.showButton) {
      filter.scroll(e.parents('.filter-option'));
      filter.preload();
      filter.update();
    } else {
      var p = params.concat(price).join(';');

      url = filter.url.link;

      if (p) url += '&filter_params=' + p;

      window.location = url;
    }

    return false;
  });

  /* Description show/hide */
  filter.element.info.hover(function() {
    $('.description', $(this)).css('display', 'block').animate({'top': $(this).height(), opacity: 1}, {duration: 250, queue: false});
  }, function(){
    $('.description', $(this)).animate({'top': $(this).height()-5, opacity: 0}, {duration: 250, queue: false, complete: function(){ $(this).hide(); }});
  });

  /* Options show/hide */
  filter.element.showHideButton.click(function() {
    $(this).toggleClass('active');

    filter.element.otherOptions.slideToggle(0);
    $('span', $(this)).toggleText(filter.text.show, filter.text.hide);

    return false;
  });

	filter.update();
});

filter.update = function() {
  var p = params.concat(price).join(';');

  $.get('index.php?route=module/filter/callback', 'path=' + filter.php.path + (p ? '&filter_params=' + p : ''), function(json){
    /* Start update */

    if (json['total'] == 0) {
      filter.element.button.removeAttr('href');
      $('span', filter.element.button).text(filter.text.select);
      $('#null', filter.element.price).fadeIn(400);
    } else {
      filter.element.button.attr('href', filter.url.link + (p ? '&filter_params=' + p : '')).removeClass('disabled');
      $('#null', filter.element.price).fadeOut(400);
      $('span', filter.element.button).text(json['text_total']);
    }

    $.each(json['values'], function(key, value) {
      var e = $(filter.tag.vals + key), t = value['products'];

      if (e.is('label')) {
        if (t != '0' || t != 0) e.removeClass('disabled').find('input').removeAttr('disabled');
        $('input', e).val(value['params']);
        if (filter.php.showCounter) $(filter.tag.count, e).text(t);
      } else {
        if (t != '0' || t != 0) e.removeAttr('disabled');
        e.val(value['params']);
      }
    });

    $('#disabled', filter.element.price).fadeTo(300, 0, function(){ $('#disabled', filter.element.price).hide(); });
    /* End update */
  }, 'json');
};

filter.preload = function() {
  filter.element.fields.attr('disabled', true);
  filter.element.labels.addClass('disabled');
  filter.element.button.removeAttr('href').addClass('disabled');

  $('#disabled', filter.element.price).show().fadeTo(200, 0.8);
  $('span', filter.element.button).html(filter.text.load);
};

filter.scroll = function(option) {
  if (!option.hasClass('focus')) {
    filter.element.buttonBottom.animate({opacity:0}, 300, function(){
      filter.element.buttonBottom.css({'top':top,'display':'none'});

      $('.filter-option.focus .option-values').animate({height: '-=30px'}, 100);

      filter.element.options.removeClass('focus');

      option.addClass('focus');

      $('.option-values', option).animate({height: '+=30px'}, 100, 'linear', function(){
        var top = $('.option-values', option).offset().top+$('.option-values', option).height()-$('#product-filter').offset().top-20;

        filter.element.buttonBottom.css({'top':top,'display':'block'}).animate({opacity:1}, 300);
      });
    });
  }
};

$.fn.toggleText = function(t1, t2){
  var t = this.text();
  if (t == t1) this.text(t2); else this.text(t1);
};

if (filter.php.showPrice) {
  filter.slide.onMove = function() {
    filter.element.pFrom.text(this.leftValue);
    filter.element.pTo.text(this.rightValue);
  }

  filter.slide.onSet = function() {
    price = ['p:' + this.leftValue + '-' + this.rightValue];

    filter.scroll($('#filter-price'));
    filter.preload();
    filter.update();
  }

  filter.element.scale.trackbar(filter.slide);
}