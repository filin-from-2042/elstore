<!-- ADDTHIS -->
<div class="addthis_toolbox addthis_default_style addthis_16x16_style"></div>
<script>
jQuery(function($){
    window.addthis_config = { 'data_track_addressbar': true };
    
    $.getScript('//s7.addthis.com/js/300/addthis_widget.js', function() {
        var addthis = '';
        addthis += '<a class="addthis_button_twitter"></a>';
        addthis += '<a class="addthis_button_facebook"></a>';
        addthis += '<a class="addthis_button_google_plusone_share"></a>';
        addthis += '<a class="addthis_button_vk"></a>';
        addthis += '<a class="addthis_button_odnoklassniki_ru"></a>';
        addthis += '<a class="addthis_button_mymailru"></a>';
        addthis += '<a class="addthis_button_moikrug"></a>';
        addthis += '<a class="addthis_button_email"></a>';
        addthis += '<a class="addthis_button_print"></a>';
        addthis += '<a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style"></a>';
        
        $('.addthis_toolbox').html(addthis);
    });
});
</script>
<!-- AddThis Button END -->