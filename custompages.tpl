<?php LoadTemplate("template_sections/header.tpl"); ?>
<div class="main">
	<?php
	if ($content['SEOname'] == "404") LoadTemplate("pages/404.tpl");
	else if ($content['SEOname'] == "contacts") LoadTemplate("pages/contacts.tpl");
	else if ($content['SEOname'] == "hot-deals") LoadTemplate("pages/hot_deals.tpl", ["arr" => $content["Body"]]);
	else { ?>
		<section class="container">
			<div><?php echo $content["Body"]; ?></div>
		</section>
	<?php } ?>
</div>
<?php LoadTemplate("template_sections/footer.tpl"); ?>