<?php
$tagcount = 0;
$tl = array();
shuffle($tags);
if ($pagename == "category") {
	foreach ($tags as $tag) {
		$setobj = $api->getSets(["category_filter" => [$tag["Id"]], "numperpage" => 10000]);
		if ($setobj->settotal > 0 && $tagcount <= 25) {
			$tl[] = $tag;
			$tagcount++;
		}		
	}
} else if ($pagename == "trailer" || $pagename == "gallery"){ 
	foreach ($set["info"]["categories"] as $catitem) {
		if (!$taglimit || sizeof($tl) < $taglimit) {
			if ($tags[$catitem]) {
				$tl[] = $tags[$catitem];
			}
		}
	}
}
if (!sizeof($tl)) return;
foreach ($tl as $k => $tag) { ?>
	<a href="<?php echo custom_Category_URL(["id" => $tag["Id"], "seoname" => $tag["SEOname"], "s" => "d", "tag" => $tag]) ?>" class="<?php echo $class; ?>"><?php echo $tag["Title"]; ?></a>
<?php } ?>