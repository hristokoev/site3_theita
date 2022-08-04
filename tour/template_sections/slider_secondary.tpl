<?php
$headerBanners = array_filter($banners, function (array $banner) use ($current_language) {
	if ($current_language == 2) {
		return strpos($banner['ZoneId'], 'header_it_tour') !== false;
	}
	return strpos($banner['ZoneId'], 'header_en_tour') !== false;
});
?>
<?php if (!empty($headerBanners) > 0) :
?>
	<div data-ride="carousel">
		<div class="swiper banner swiper-initialized swiper-horizontal swiper-pointer-events">
			<div class="swiper-wrapper">
				<?php
				$i = 0;
				foreach ($headerBanners as $banner) : ?>
					<div class="swiper-slide">
						<?php if (!empty($banner['URL'])) : ?>
							<a href="<?php echo $banner['URL']; ?>">
							<?php endif ?>
							<?php /* src="<?php echo cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $banner["Id"] . "-banner." . $banner["FileExt"]) ?>" */ ?>
							<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							<img src="https://via.placeholder.com/1440x320" alt="Banner" data-remote="bannerload.php?zone=<?php echo $banner['ZoneId']; ?>" class="swiper-lazy">
							<?php if (!empty($banner['URL'])) : $i++; ?>
							</a>
						<?php endif ?>
					</div>
				<?php endforeach ?>
			</div>
		</div>
		<div id="banner_button_prev" class="swiper-button-prev" aria-label="Previous banner"></div>
		<div id="banner_button_next" class="swiper-button-next" aria-label="Next banner"></div>
		<div class="banner-pagination swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
			<?php
			foreach ($headerBanners as $banner) : ?>
				<span class="swiper-pagination-bullet"></span>
			<?php endforeach ?>
		</div>
		<script>
			var swiper = new Swiper(".banner", {
				slidesPerView: 1,
				spaceBetween: 16,
				loop: true,
				lazy: true,
				autoplay: {
					delay: 2500,
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
<?php endif; ?>