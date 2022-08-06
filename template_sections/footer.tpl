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
				<a href="<?php echo $areaurl; ?>hot-deals/">Hot deals</a>
				<a href="<?php echo 'https://members.vangoren.com' . $area["AreaURL"] . 'logout'; ?>"><?php echo $templatefields["txtlogout"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol3"]; ?></div>
				<a href="<?php echo $areaurl; ?>become-a-model/">Become a model</a>
				<a href="<?php echo $areaurl; ?>mailbox.php"><?php echo $templatefields["txtcontacts"]; ?></a>
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