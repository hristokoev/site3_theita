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
							<a href="<?php echo $banner['URL']; ?>">
							<?php endif ?>
							<img src="<?php echo cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $banner["Id"] . "-banner." . $banner["FileExt"]) ?>" alt="Banner" class="" data-remote="bannerload.php?zone=<?php echo $banner['ZoneId']; ?>">
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
				<div class="footer-title">Information</div>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=privacy">Privacy</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=terms">Terms</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>faq.php">FAQ</a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title">Account</div>
				<a href="<?php echo $tour["JoinUrl"]; ?>"><?php echo $templatefields["tourtxtjoin"]; ?></a>
				<a href="<?php echo $tour["MembersURL"]; ?>"><?php echo $templatefields["tourtxtlogin"]; ?></a>
				<a href="https://joins.vangoren.com/signup/password.php"><?php echo $templatefields["txtlostpassword"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title">Partners</div>
				<a href="https://mvgcash.com/" target="_blank">Webmasters</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=our-network">Network</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=become-a-model">Become a Model</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=partners">Partners</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=contacts"><?php echo $templatefields["txtcontacts"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title">Follow Us</div>
				<a href="https://twitter.com/vangoren_com" target="_blank">Twitter</a>
				<a href="https://www.instagram.com/vangoren_com/" target="_blank">Instagram</a>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img src="<?php echo $GLOBALS["areaurl"]; ?>rta.webp" alt="Restricted To Adults"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?> . <?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</body>
</html>