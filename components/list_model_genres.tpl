<?php
$tagcount = 0;
$tl1 = array();
$cats = $categories['Areas']['cats']['Categories']['cats'];
$set_cats_id = array();
$set_cats_title = array();
$set_cats_seoName = array();
foreach ($cats as $cat) {
	$set_cats_id[] = $cat['Id'];
	$set_cats_title[] = $cat['Title'];
	$set_cats_seoName[] = $cat['SEOname'];
}
foreach ($m_sets as $info_cates) {
	foreach ($info_cates as $catitem) {
		if (!$taglimit || sizeof($tl) < $taglimit) {
			if (in_array($catitem, $set_cats_id)) {
				$indx = array_search($catitem, $set_cats_id);
				$tl1['id'][] = $set_cats_id[$indx];
				$tl1['title'][] = $set_cats_title[$indx];
				$tl1['seoName'][] = $set_cats_seoName[$indx];
			}
		}
	}
}
if (!sizeof($tl1)) return;
$i = 0;
foreach ($tl1['id'] as $k => $tag) { ?>
	<span class="icon">
		<i class="fa-solid fa-tag"></i>
		<a href="<?php echo custom_Category_URL(["id" => $tag, "seoname" => $tl1['seoName'][$i], "s" => "d", "tag" => $tag]) ?>"><?php echo $tl1['title'][$i]; ?></a>
	</span>
	<?php if ($k != sizeof($tl1['id']) - 1) $i++; ?>
<?php } ?>