<?php
if ($set || $individual_update || $pagename !== 'tour' || !isset($banners) || !empty($banners) < 1) {
	return;
}
$headerBanners = array_filter($banners, function (array $banner) use ($current_language) {
	if ($current_language == 2) {
		return strpos($banner['ZoneId'], 'header_it_tour') !== false;
	}
	return strpos($banner['ZoneId'], 'header_en_tour') !== false;
});
?>
<?php if (!empty($headerBanners) > 0) :
?>
	<div data-ride="carousel" style="position: relative">
		<div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
			<div class="swiper-wrapper">
				<?php
				$i = 0;
				foreach ($headerBanners as $banner) : ?>
					<div class="swiper-slide">
						<?php if (!empty($banner['URL'])) : ?>
							<a href="<?php echo $banner['URL']; ?>">
							<?php endif ?>
							<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							<img src="<?php echo cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $banner["Id"] . "-banner." . $banner["FileExt"]) ?>" alt="Banner" data-remote="bannerload.php?zone=<?php echo $banner['ZoneId']; ?>" class="swiper-lazy">
							<?php if (!empty($banner['URL'])) : $i++; ?>
							</a>
						<?php endif ?>
					</div>
				<?php endforeach ?>
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
			var swiper = new Swiper(".mySwiper", {
				slidesPerView: 1,
				spaceBetween: 0,
				loop: true,
				lazy: true,
				autoplay: {
					delay: 2500,
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
<?php endif; ?>