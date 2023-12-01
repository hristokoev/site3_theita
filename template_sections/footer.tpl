<?php if ($content['SEOname'] !== "hot-deals") { ?>
<div class="footer-banner">
	<div class="item">
		<a href="<?php echo $areaurl . lang_prefix() . 'hot-deals/'; ?>">
			<img src="https://vangoren.com/images/banners/banner_hot_deals.jpg" alt="Hot Deals" class="">
		</a>
	</div>
</div>
<?php } ?>
<div class="footer">
	<section class="container">
		<div class="links">
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol1"]; ?></div>
				<a href="<?php echo $areaurl . lang_prefix(); ?>privacy/">Privacy</a>
				<a href="<?php echo $areaurl . lang_prefix(); ?>terms/">Terms</a>
				<a href="<?php echo $areaurl . lang_prefix(); ?>faq.php">FAQ</a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol2"]; ?></div>
				<a href="<?php echo $areaurl . lang_prefix(); ?>hot-deals/">Hot deals</a>
				<a href="<?php echo 'https://members.vangoren.com' . $area["AreaURL"] . 'logout'; ?>"><?php echo $templatefields["txtlogout"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol3"]; ?></div>
				<a href="<?php echo $areaurl . lang_prefix(); ?>become-a-model/">Become a model</a>
				<a href="<?php echo $areaurl . lang_prefix(); ?>mailbox.php?compose=1"><?php echo $templatefields["txtcontacts"]; ?></a>
			</div>
			<div class="footer-column flex-column">
				<div class="footer-title"><?php echo $templatefields["txtfootercol4"]; ?></div>
				<div class="socials">
					<a href="https://twitter.com/vangoren_com" target="_blank" alt="Twitter" aria-label="Twitter"><i class="fa-brands fa-twitter"></i></a>
					<a href="https://www.instagram.com/vangoren_com" target="_blank" alt="Instagram" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
					<a href="#" alt="Youtube" aria-label="Youtube"><i class="fa-brands fa-youtube"></i></a>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="footer-text"><?php echo $templatefields["txtfooter"]; ?></div>
			<div class="footer-rta"><img src="<?php echo $areaurl; ?>rta.webp" alt="Restricted To Adults" loading="lazy"></div>
			<div class="footer-copyright">&copy; <?php echo date('Y'); ?>&nbsp;<?php echo $templatefields["sitename"]; ?> . <?php echo $templatefields["txtallrightsreserved"]; ?></div>
		</div>
	</section>
</div>
</div>
</body>
</html>