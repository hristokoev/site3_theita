<?php
if ($pagename == "category") {
	$func = "custom_Category_URL";
	/*if (isset($_REQUEST['subsiteid']) && $_REQUEST['subsiteid']>1) {
		$args = ["id" => $category_selected["Id"], "sw" => $letter, "page" => 1, "subsiteid" => $_REQUEST['subsiteid'], "seoname" => $category_selected["SEOname"], "category" =>$category_selected];
	} else {
		$args = ["id" => $category_selected["Id"], "sw" => $letter, "page" => 1, "subsiteid" => 1, "seoname" => $category_selected["SEOname"], "category" =>$category_selected];
	}*/
	$args = ["id" => $category_selected["Id"], "sw" => $letter, "page" => 1, "seoname" => $category_selected["SEOname"], "category" => $category_selected];
	$sort = $category_sort;
} else if ($pagename == "sets") {
	$func = "custom_Sets_URL";
	$args["sw"] = $letter;
	if (isset($_REQUEST['g']) && $_REQUEST['g'] != '') {
		$args["g"] = $_REQUEST['g'];
	}
} else if ($pagename == "dvds") {
	$func = "DVDS_URL";
	$args = ["sw" => $letter, "sid" => $studio];
} else if ($pagename == "favorites") {
	$favorites_flag = 1;
} else {
	echo "pagename=$pagename";
	return;
}
?>
<div class="dropdown <?php echo $class; ?>">
	<div class="select">
		<span class="select-title"><?php switch ($sort) {
										case ("d"):
											echo $templatefields["txtmostrecent"];
											break;
										case ("p"):
											echo $templatefields["txtmostpopular"];
											break;
										case ("n"):
											echo $templatefields["txtnametitle"];
											break;
										default:
											echo $templatefields["txtmostrecent"];
											break;
									} ?></span>
		<div class="arrow"></div>
	</div>
	<ul class="menu">
		<?php if (!isset($favorites_flag)) { ?>
			<?php $args["s"] = "d"; ?>
			<li><a href="<?php echo $func($args); ?>" class="<?php echo ($sort == "d") ? "active" : ""; ?>"><?php echo $templatefields["txtmostrecent"]; ?></a></li>
			<?php $args["s"] = "p"; ?>
			<li><a href="<?php echo $func($args); ?>" class="<?php echo ($sort == "p") ? "active" : ""; ?>"><?php echo $templatefields["txtmostpopular"]; ?></a></li>
			<?php $args["s"] = "n"; ?>
			<li><a href="<?php echo $func($args); ?>" class="<?php echo ($sort == "n") ? "active" : ""; ?>"><?php echo $templatefields["txtnametitle"]; ?></a></li>
		<?php } else { ?>
			<li><a href="<?php echo $areaurl; ?>favorites.php?s=d" class="<?php echo ($sort == "d") ? "active" : ""; ?>"><?php echo $templatefields["txtmostrecent"]; ?></a></li>
			<li><a href="<?php echo $areaurl; ?>favorites.php?s=p" class="<?php echo ($sort == "p") ? "active" : ""; ?>"><?php echo $templatefields["txtmostpopular"]; ?></a></li>
			<li><a href="<?php echo $areaurl; ?>favorites.php?s=n" class="<?php echo ($sort == "n") ? "active" : ""; ?>"><?php echo $templatefields["txtnametitle"]; ?></a></li>
		<?php } ?>
	</ul>
</div>