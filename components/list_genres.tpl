<?php

$tagcount = 0;
$tl = array();
$cats = $categories['Areas']['cats']['Categories']['cats'];
$set_cats_id = array();
$set_cats_title = array();
$set_cats_seoName = array();

foreach ($cats as $cat) {
	$set_cats_id[] = $cat['Id'];
	$set_cats_title[] = $cat['Title'];
	$set_cats_seoName[] = $cat['SEOname'];
}

foreach ($set["info"]["categories"] as $catitem) {
	if (!$taglimit || sizeof($tl) < $taglimit) {
		if (in_array($catitem, $set_cats_id)) {
			$indx = array_search($catitem, $set_cats_id);
			$tl['id'][] = $set_cats_id[$indx];
			$tl['title'][] = $set_cats_title[$indx];
			$tl['seoName'][] = $set_cats_seoName[$indx];
		}
	}
}

if (!sizeof($tl)) return;

$i = 0;

foreach ($tl['id'] as $k => $tag) { ?>
	<span class="icon">
		<i class="fa-solid fa-tag"></i>
		<a href="<?php echo custom_Category_URL(["id" => $tag, "seoname" => $tl['seoName'][$i], "s" => "d", "tag" => $tag]) ?>" class="rounded"><?php echo $tl['title'][$i]; ?></a>
	</span>
	<?php if ($k != sizeof($tl['id']) - 1) $i++; ?>
<?php } ?>