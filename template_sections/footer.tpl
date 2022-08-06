<div class="footer">
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
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=hot-deals">Hot deals</a>
				<a href="<?php echo 'https://members.' . str_replace("/", "", $area["AreaURL"]) . '.com' . '/logout'; ?>"><?php echo $templatefields["txtlogout"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title">Partners</div>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=become-a-model">Become a model</a>
				<a href="<?php echo $GLOBALS["areaurl"]; ?>pages.php?id=contacts"><?php echo $templatefields["txtcontacts"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title">Follow Us</div>
				<a href="#">Twitter</a>
				<a href="#">Instagram</a>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img src="<?php echo $GLOBALS["areaurl"]; ?>rta.webp" alt="Restricted To Adults"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?> . <?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</div>
</body>
</html>