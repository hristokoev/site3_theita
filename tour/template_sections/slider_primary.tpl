<?php
$detect = new Mobile_Detect;
if ($set || $individual_update || $pagename !== 'tour') {
	return;
}
$arr = array();
$file = fopen('https://theitalianporn.com/images/banners/header/header.csv', 'r');
while (($line = fgetcsv($file)) !== FALSE) {
	$arr[] = $line;
}
fclose($file);
array_shift($arr);
?>
<div data-ride="carousel" style="position: relative">
	<div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
		<div class="swiper-wrapper">
			<?php
			$i = 0;
			foreach ($arr as $banner) { ?>
				<?php
				$src = "";
				if ($detect->isMobile() && !$detect->isTablet()) {
					$src = $banner[1];
				} else {
					$src = $banner[0];
				}
				$i++;
				?>
				<div class="swiper-slide">
					<a href="<?php echo $banner[2]; ?>">
						<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
						<img src="<?php echo $areaurl . 'images/banners/header/' . $src; ?>" alt="<?php echo $banner[3]; ?>" class="swiper-lazy">
					</a>
				</div>
			<?php } ?>
		</div>
	</div>
	<div id="swiper_button_prev" class="swiper-button-prev" aria-label="Previous slide"></div>
	<div id="swiper_button_next" class="swiper-button-next" aria-label="Next slide"></div>
	<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
		<?php
		foreach ($headerBanners as $banner) : ?>
			<span class="swiper-pagination-bullet"></span>
		<?php endforeach ?>
	</div>
	<script>
		let headerSwiper = new Swiper(".mySwiper", {
			slidesPerView: 1,
			spaceBetween: 0,
			loop: <?php echo $i <= 1 ? 'false' : 'true'; ?>,
			lazy: true,
			autoplay: {
				delay: 5000,
				disableOnInteraction: false,
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			navigation: {
				nextEl: "#swiper_button_next",
				prevEl: "#swiper_button_prev",
			},
		});
	</script>
</div>