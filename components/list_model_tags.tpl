<?php
$tagcount = 0;
$tl = array();
foreach ($cats as $catitem) {
	if (!$taglimit || sizeof($tl) < $taglimit) {
		if ($tags[$catitem]) {
			$tl[] = $tags[$catitem];
		}
	}
}
if (!sizeof($tl)) return;
foreach ($tl as $k => $tag) { ?>
	<a href="<?php echo custom_Category_URL(["id" => $tag["Id"], "seoname" => $tag["SEOname"], "s" => "d", "tag" => $tag]) ?>" class="rounded"><?php echo $tag["Title"]; ?></a>
<?php } ?>