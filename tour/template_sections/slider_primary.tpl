<?php
$detect = new Mobile_Detect;
$fileurl = $areaurl . 'images/banners/header/header.json';
if ($set || $individual_update || $pagename !== 'tour' || !URL_Exists($fileurl)) {
	return;
}
$json = file_get_contents($fileurl);
$arr = json_decode($json, true);
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
					$src_jpg = $banner["mobile_jpg"];
					$src_webp = $banner["mobile_webp"];
					$width = 600;
					$height = 600;
				} else {
					$src_jpg = $banner["desktop_jpg"];
					$src_webp = $banner["desktop_webp"];
					$width = 1920;
					$height = 600;
				}
				$i++;
				?>
				<div class="swiper-slide">
					<?php if (Filter_SFW()) { ?>
						<img src="https://dummyimage.com/1920x660/c6d5d4/000&text=+" alt="">
					<?php } else { ?>
					<a href="<?php echo $banner["url"]; ?>">
						<picture>
							<source type="image/webp" data-srcset="<?php echo $areaurl . 'images/banners/header/' . $src_webp; ?>" />
							<img width="<?php echo $width; ?> height="<?php echo $height; ?> src="<?php echo $areaurl . 'images/banners/header/' . $src_jpg; ?>" alt="<?php echo $banner["alt"]; ?>">
						</picture>
					</a>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	</div>
	<div id="swiper_button_prev" class="swiper-button-prev" aria-label="Previous slide"></div>
	<div id="swiper_button_next" class="swiper-button-next" aria-label="Next slide"></div>
	<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
		<?php
		foreach ($arr as $banner) : ?>
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