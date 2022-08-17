<?php
LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "models"]);
$func = "custom_Sets_URL";
if (isset($_REQUEST['sw']) && $_REQUEST['sw'] != '') {
	$args["sw"] = $_REQUEST['sw'];
}
if (isset($_REQUEST['s']) && $_REQUEST['s'] != '') {
	$args["s"] = $_REQUEST['s'];
}
?>
<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title"><?php echo $templatefields["h1_models"]; ?></h1>
			<h2 class="page-subtitle"><?php echo $templatefields["h2_models"]; ?></h2>
			<?php LoadTemplate("components/sort_options.tpl"); ?>
		</div>
		<div class="pagination pagination-top">
			<div class="sort-options">
				<div class="sorting">
					<a href="<?php echo $areaurl; ?>models/1/latest/" class="button <?php if (!isset($_REQUEST['g'])) {
																	echo "button-active";
																} ?>"><?php echo $templatefields["txtall"]; ?></a>
					<?php $args["g"] = "f"; ?>
					<a href="<?php echo $func($args); ?>" class="button <?php if (isset($_REQUEST['g']) && $_REQUEST['g'] == 'f') {
																			echo "button-active";
																		} ?>"><?php echo $templatefields["txtfemale"]; ?></a>
					<?php $args["g"] = "m"; ?>
					<a href="<?php echo $func($args); ?>" class="button <?php if (isset($_REQUEST['g']) && $_REQUEST['g'] == 'm') {
																			echo "button-active";
																		} ?>"><?php echo $templatefields["txtmale"]; ?></a>
				</div>
			</div>
		</div>
		<?php
		$i = 0;
		if (!empty($models)) { ?>
			<div class="grid grid-models">
				<?php
				switch ($args["s"]) {
					case ("d"):
						$sort = "date";
						break;
					case ("p"):
						$sort = "rating";
						break;
					case ("n"):
						$sort = "name";
						break;
					default:
						$sort = "date";
				};
				$args["g"] = $_REQUEST['g'];
				$args["sw"] = $_REQUEST['sw'];
				switch ($args["g"]) {
					case ("f"):
						$gender = "F";
						break;
					case ("m"):
						$gender = "M";
						break;
					default:
						$gender = "F";
				}
				foreach ($models as $model) {
					LoadTemplate("components/thumb_model.tpl", ["model" => $model, "counter" => $i, "total_models" => array_not_empty($models)]);
					$i++;
				}
				?>
				<div class="wrap"></div>
			</div>
			<div class="pagination pagination-bottom">
				<?php LoadTemplate("components/pagenav.tpl"); ?>
			</div>
		<?php } else { ?>
			<div class="errorMsg">
				<h6>Currently there are no models whose name begins with this letter.</h6>
			</div>
		<?php }	?>
	</section>
</div>
<?php include "tour/template_sections/footer.tpl"; ?>