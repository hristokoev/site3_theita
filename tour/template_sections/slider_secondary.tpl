<?php
$detect = new Mobile_Detect;
$fileurl = $areaurl . 'images/banners/middle/middle.json';
if (!URL_Exists($fileurl)) {
	return;
}
$json = file_get_contents($fileurl);
$arr = json_decode($json, true);
?>
<section class="container">
<div data-ride="carousel">
	<div class="swiper banner swiper-initialized swiper-horizontal swiper-pointer-events">
		<div class="swiper-wrapper">
			<?php
			$i = 0;
			foreach ($arr as $banner) { ?>
				<?php
				$src = "";
				if ($detect->isMobile() && !$detect->isTablet()) {
					$src = $banner["mobile"];
				} else {
					$src = $banner["desktop"];
				}
				$i++;
				?>
				<div class="swiper-slide">
					<?php if (Filter_SFW()) { ?>
						<img src="https://dummyimage.com/1440x320/c6d5d4/000&text=+" alt="">
					<?php } else { ?>
					<a href="<?php echo $banner["url"]; ?>">
						<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
						<img src="<?php echo $areaurl . 'images/banners/middle/' . $src; ?>" alt="<?php echo $banner["alt"]; ?>" class="swiper-lazy">
					</a>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	</div>
	<div id="banner_button_prev" class="swiper-button-prev" aria-label="Previous banner"></div>
	<div id="banner_button_next" class="swiper-button-next" aria-label="Next banner"></div>
	<div class="banner-pagination swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
		<?php
		foreach ($arr as $banner) : ?>
			<span class="swiper-pagination-bullet"></span>
		<?php endforeach ?>
	</div>
	<script>
		let middleSwiper = new Swiper(".banner", {
			slidesPerView: 1,
			spaceBetween: 16,
			loop: <?php echo $i <= 1 ? 'false' : 'true'; ?>,
			lazy: true,
			autoplay: {
				delay: 5000,
				disableOnInteraction: false,
			},
			pagination: {
				el: ".banner-pagination",
				clickable: true,
			},
			navigation: {
				nextEl: "#banner_button_next",
				prevEl: "#banner_button_prev",
			},
		});
	</script>
</div>
</section>