<?php LoadTemplate("tour/template_sections/header.tpl"); ?>
<div class="main">
	<?php
	if ($content['SEOname'] == "404") LoadTemplate("pages/404.tpl");
	else if ($content['SEOname'] == "contacts") LoadTemplate("pages/contacts.tpl");
	else if ($content['SEOname'] == "thanks") LoadTemplate("pages/thanks.tpl");
	else if ($content['SEOname'] == "hot-deals") header("Location: " . $GLOBALS['areaurl']);
	else { ?>
		<section class="container">
			<div><?php echo $content["Body"]; ?></div>
		</section>
	<?php } ?>
</div>
<?php LoadTemplate("tour/template_sections/footer.tpl"); ?>