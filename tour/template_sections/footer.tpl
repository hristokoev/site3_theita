<?php
$detect = new Mobile_Detect;
$src_jpg = "";
$src_webp = "";
if ($detect->isMobile() && !$detect->isTablet()) {
	$src_jpg = "banner_footer_mobile.jpg";
	$src_webp = "banner_footer_mobile.webp";
} else {
	$src_jpg = "banner_footer.jpg";
	$src_webp = "banner_footer.webp";
}
?>
<div class="button-centered">
	<a href="<?php echo $tour["JoinUrl"]; ?>" class="button button-join cta"><?php echo $templatefields["tourtxtalt"]; ?></a>
</div>
<?php if ($content['SEOname'] !== "thanks") { ?>
<div class="footer-banner">
	<div class="item">
		<?php if (Filter_SFW()) { ?>
			<img src="https://dummyimage.com/1920x480/c6d5d4/000&text=+" alt="">
		<?php } else { ?>
		<a href="<?php echo $areaurl . 'network/'; ?>">
			<picture>
				<source srcset="<?php echo $areaurl . 'images/banners/' . $src_webp; ?>" type="image/webp">
				<img src="<?php echo $areaurl . 'images/banners/' . $src_jpg; ?>" alt="Banner" class="" loading="lazy">
			</picture>
		</a>
		<?php } ?>
	</div>
</div>
<?php } ?>
<?php if (Filter_SFW()) { ?>
<script>
	$('a').each(function() {
		this.href += (/\?/.test(this.href) ? '&' : '?') + 'sfw';
	});
</script>
<?php } ?>
<div class="footer">
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
					<a href="#"><i class="fa-brands fa-youtube"></i></a>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img width="180" height="160" src="<?php echo $areaurl; ?>rta.webp" alt="Restricted To Adults" loading="lazy"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?></br><?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</div>
</body>

</html>