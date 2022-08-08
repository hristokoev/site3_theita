<?php
$footerBanners = array_filter($banners, function (array $banner) use ($current_language) {
	if ($current_language == 2) {
		return strpos($banner['ZoneId'], 'footer_it_tour') !== false;
	}
	return strpos($banner['ZoneId'], 'footer_en_tour') !== false;
});
?>

<div class="footer">
	<?php if (!empty($footerBanners) > 0) : ?>
		<div class="footer-banner">
			<?php
			$i = 0;
			foreach ($footerBanners as $banner) : ?>
				<div class="item <?php if ($i == 0) echo 'active'; ?>">
					<?php if (!empty($banner['FileExt'])) : ?>
						<?php if (!empty($banner['URL'])) : ?>
							<a href="<?php echo 'bannerload.php?track=' . $banner['Id']; ?>">
							<?php endif ?>
							<img src="<?php echo cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $banner["Id"] . "-banner." . $banner["FileExt"]) ?>" alt="Banner" class="">
							<?php if (!empty($banner['URL'])) : $i++; ?>
							</a>
						<?php endif ?>
					<?php else : ?>
						<p><?php echo $banner['Description']; ?></p>
					<?php endif ?>
				</div>
			<?php endforeach ?>
		</div>
	<?php endif; ?>
	<section class="container">
		<div class="links">
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol1"]; ?></div>
				<a href="<?php echo $areaurl; ?>privacy/">Privacy</a>
				<a href="<?php echo $areaurl; ?>terms/">Terms</a>
				<a href="<?php echo $areaurl; ?>faq.php">FAQ</a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol2"]; ?></div>
				<a href="<?php echo $tour["JoinUrl"]; ?>"><?php echo $templatefields["tourtxtjoin"]; ?></a>
				<a href="<?php echo $tour["MembersURL"]; ?>"><?php echo $templatefields["tourtxtlogin"]; ?></a>
				<a href="https://joins.vangoren.com/signup/password.php"><?php echo $templatefields["txtlostpassword"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol3"]; ?></div>
				<a href="https://mvgcash.com/" target="_blank">Webmasters</a>
				<a href="<?php echo $areaurl; ?>network/">Network</a>
				<a href="<?php echo $areaurl; ?>become-a-model/">Become a Model</a>
				<a href="<?php echo $areaurl; ?>partners/">Partners</a>
				<a href="<?php echo $areaurl; ?>contacts/"><?php echo $templatefields["txtcontacts"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol4"]; ?></div>
				<div class="socials">
					<a href="https://twitter.com/vangoren_com" target="_blank"><i class="fa-brands fa-twitter"></i></a>
					<a href="https://www.instagram.com/vangoren_com" target="_blank"><i class="fa-brands fa-instagram"></i></a>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img src="<?php echo $areaurl; ?>rta.webp" alt="Restricted To Adults"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?> . <?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</div>
</body>
</html>