<?php
$detect = new Mobile_Detect;
$src = "";
if ($detect->isMobile() && !$detect->isTablet()) {
	$src = "banner_footer_mobile.jpg";
} else {
	$src = "banner_footer.jpg";
}
?>
<div class="footer-banner">
	<div class="item">
		<a href="<?php echo $areaurl . 'network/'; ?>">
			<img src="<?php echo $areaurl . 'images/banners/' . $src; ?>" alt="Banner" class="">
		</a>
	</div>
</div>
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
				</div>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img src="<?php echo $areaurl; ?>rta.webp" alt="Restricted To Adults"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?></br><?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</div>
</body>

</html>