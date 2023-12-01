<?php if ($content['SEOname'] == "custom-feed") { LoadTemplate("pages/custom_feed.tpl"); exit; } ?>
<?php if ($content['SEOname'] == "custom-feed-menno") { LoadTemplate("pages/custom_feed_menno.tpl"); exit; } ?>
<?php LoadTemplate("tour/template_sections/header.tpl"); ?>
<div class="main">
	<?php
	if ($content['SEOname'] == "404") LoadTemplate("pages/404.tpl");
	else if ($content['SEOname'] == "contacts") LoadTemplate("pages/contacts.tpl");
	else if ($content['SEOname'] == "thanks") LoadTemplate("pages/thanks.tpl");
	else if ($content['SEOname'] == "hot-deals") header("Location: " . $areaurl);
	else if ($content['SEOname'] == "partners") LoadTemplate("pages/partners.tpl", ["arr" => $content["Body"]]);
	else if ($content['SEOname'] == "bug-reports") LoadTemplate("pages/bugs.tpl");
	else { ?>
		<section class="container">
			<div><?php echo $content["Body"]; ?></div>
		</section>
	<?php } ?>
</div>
<?php LoadTemplate("tour/template_sections/footer.tpl"); ?>