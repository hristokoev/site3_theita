<?php LoadTemplate("tour/template_sections/header.tpl"); ?>
<div class="main">
	<?php
	if ($_GET["id"] == "404") LoadTemplate("pages/404.tpl");
	else if ($_GET["id"] == "contacts") LoadTemplate("pages/contacts.tpl");
	else { ?>
		<section class="container">
			<div class="page-header">
				<h1 class="page-title">
					<?php echo $content["Title"]; ?>
				</h1>
			</div>
			<div><?php echo $content["Body"]; ?></div>

		</section>
	<?php } ?>
</div>
<?php LoadTemplate("tour/template_sections/footer.tpl"); ?>