<?php
$title = $templatefields["txtfaq"];
if (isset($GLOBALS["tour"])) {
	LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "faq", "title" => $title, "seokey" => "", "seodesc" => ""]);
} else {
	LoadTemplate("template_sections/header.tpl", ["pagename" => "faq", "title" => $title, "seokey" => "", "seodesc" => ""]);
}
?>
<div class="main">
	<section class="container">
		<h2 class="page-title">
		<?php echo $templatefields["txtfaq"]; ?>
		</h2>
		
		<div class="">
			<?php foreach($faqs as $faq) { ?>
				<a name="<?php echo $faq["sublevel"]; ?>"></a>
				<div class="<?php if ($faq === end($faqs)) { echo 'lastborder'; } ?>">
					<div class="">
						<h3><?php echo $faq["sublevel"]; ?>.&nbsp;<?php echo $faq["Title"]; ?></h3>
					</div>
					<div class=""><?php echo $faq["Description"]; ?></div>
				</div>
			<?php } ?>
		</div>
	</section>
</div>
<?php 
	if (isset($GLOBALS["tour"])) { include "tour/template_sections/footer.tpl"; } 
	else { include "template_sections/footer.tpl"; }
?>