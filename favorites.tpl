<?php if (!isset($trial)) {
$title = $templatefields["title_favorites"];
LoadTemplate("template_sections/header.tpl", ["pagename" => "favorites", "title" => $title, "seokey" => "", "seodesc" => ""]);
?>
<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title">
				<?php echo $templatefields["h1_favorites"]; ?>
			</h1>	
			<h2 class="page-subtitle">
				<?php echo $templatefields["h2_favorites"]; ?>
			</h2>
			<?php LoadTemplate("components/sort_options.tpl"); ?>
		</div>
		<?php if (!empty($favorites)) { ?>
		<div class="grid grid-videos">
			<?php
			$layout = [
				"skeleton",
				"duration",
				"title",
				"info" => [
					"model",
					"date",
					"stars",
					"title"
				]
			];
			?>
			<?php $i = 0;
			foreach ($favorites as $set) { ?>
				<?php LoadTemplate("components/thumb_video.tpl", ["set" => $set, "favorites_link" => 1, "counter" => $i, "layout" => $layout]); ?>
			<?php $i++;
			} ?>
		</div>
		<?php } else { ?>
			<div class="content" style="padding: 32px; margin: 32px"><?php echo $templatefields["txtnofavorites"]; ?></div>
		<?php } ?>
	</section>
</div>
<?php include "template_sections/footer.tpl"; ?>
<?php } else { 
	header("Location: " . $GLOBALS['areaurl']);
}
?>