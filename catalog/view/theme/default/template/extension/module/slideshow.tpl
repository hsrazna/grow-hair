<style type="text/css">
  .az-carousel {
    position: relative;
    height: 100%;
    overflow: hidden;
  }
  .az-img-box-preload{
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
  }
  <?php $i=1; ?>
  <?php foreach ($banners as $banner) { ?>
    .az-item<?=$i?>{
        background-image: url('<?php echo $banner['image']; ?>');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
    }
    <?php $i++; ?>
  <?php } ?>
  .az-item0, .az-item1, .az-item2, .az-item3{
      height: 100%;
      width: 100%;
      position: absolute;
      top: 0px;
      left: 0px;
  }
  .az-item{
      height: 100%;
      width: 100%;
      position: absolute;
      top: 0px;
      left: 0px;
      opacity: 0;
      z-index: 2;
  }
  .az-item0{
      opacity: 1;
      z-index: 3;
  }
</style>
<div class="az-slider" style="">
  <div id="az-slider" class="az-carousel owl-theme">
    <div class="az-item az-item0">
      <div class="az-img-box-preload">
        <img src="/image/catalog/loader.gif" alt="">
      </div>
    </div>
    <?php $i=1; ?>
    <?php foreach ($banners as $banner) { ?>
    <div class="az-item az-item<?=$i?>">
    </div>
    <?php $i++; ?>
    <?php } ?>
  </div>
</div>
<div class="az-middle">
  <h1>Grow-Hair</h1>
  <span class="az-h1-subtitle">Новый препарат для восстановления роста волос для мужчин и женщин</span>
</div>
<div class="az-footer">
  <div class="az-call-back"><a href="#az-popup" class="popup-with-move-anim">Закажите звонок</a></div>
  <div class="az-phone"><a href="tel:+79034944280"><i class="fa fa-phone" aria-hidden="true"></i> +7 903 494 42 80</a></div>
</div>
<div class="popup zoom-anim-dialog mfp-hide" id="az-popup">
    <div class="popup-first">
        <span class="popup-title">Заявка на<br>обратный звонок</span>
        <form id="popup-form-audit" class="az-form az-form-popup az-send">
            <input type="text" placeholder="Ваше имя" name="uname">
            <input type="text" placeholder="Номер телефона" class="phone" name="tel">
            <input type="submit" value="Отправить заявку">
        </form>
    </div>
    <div class="popup-thanks">
        <div class="az-center az-margin-bottom25 az-margin-top35"><img src="./img/ok.png" alt="ok"></div>
        <span class="popup-title az-margin-bottom25">Спасибо, заявка передана<br>нашим специалистам</span>
    </div>
</div>
<?php if(0): ?>
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<?php endif; ?>
<script type="text/javascript">
(function($){
  function windowSizeresize(){
    var az_temp_height221122 = $(window).height();
    az_temp_height221122 = (az_temp_height221122>=400)?az_temp_height221122: 400;
    $('.az-slider').height(az_temp_height221122);
  }
  windowSizeresize();
  $('.az-item').css({'opacity': '0', 'z-index': '2', 'transition': 'all 1.2s ease-out'});
  $('.az-item').eq(1).css({'opacity': '1', 'z-index': '3', 'transition': 'all 1.2s ease-in'});

  $(window).on('resize', windowSizeresize);

  var az_slide_num = 1;
  var az_slide_length = $('.az-item').length;
  var az_slides = $('.az-item');
  setInterval(function(){
    az_slide_num++;

    if(az_slide_num>=az_slide_length){
        az_slide_num = 1;
    }
    az_slides.css({'opacity': '0', 'z-index': '2', 'transition': 'all 1.2s ease-out'});
    az_slides.eq(az_slide_num).css({'opacity': '1', 'z-index': '3', 'transition': 'all 1.2s ease-in'});
    if(az_slide_num==az_slide_length-1){
        $('.az-next').fadeOut(0);
    } else if(az_slide_num==2){
        $('.az-prev').fadeIn(0);
    }
  }, 8000);
})(jQuery);

<!--
// $('#slideshow<?php echo $module; ?>').owlCarousel({
// 	items: 6,
//   loop: true,
// 	autoPlay: 2000,
// 	singleItem: true,
// 	navigation: false,
//   animateOut: 'fadeOut',
  // transitionStyle: "fade",
  // slideSpeed: 1000,
	// navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
// 	pagination: false
// });
--></script>