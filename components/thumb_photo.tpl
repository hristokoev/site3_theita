<?php
$ahref = "";
if (!isset($usepriority)) {
	if (isset($GLOBALS["tour"])) {
		$usepriority = "101";
	} else {
		$usepriority = "101";
	}
}
if (isset($GLOBALS["tour"])) {
	$ahref = $tour["JoinUrl"] . lang_join_suffix();
} else {
	if (isset($trial)) {
		if (in_array($set["Id"], $trial['allowrecent']) || empty($trial['allowrecent'])) {
			$ahref = Gallery_URL(["type" => "highres", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]);
		} else {
			$ahref = GET_Username($trial['photourl']);
		}
	} else {
		$ahref = Gallery_URL(["type" => "highres", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]);
	}
}
?>
<div class="wrap">
	<div class="thumb">
		<div class="thumb-holder hover">
			<a href="<?php echo $ahref; ?>" title="<?php echo $set["Title"]; ?>">
				<?php if (Filter_SFW()) { ?>
					<img src="https://dummyimage.com/800x1067/c6d5d4/000&text=+" alt="">
				<?php } else { ?>
				<?php StdImage(array("set" => $set, "usepriority" => $usepriority, "alt" => "", "class" => "thumbs", "loading" => "lazy")); ?>
				<?php } ?>
			</a>
		</div>
		<div class="secondary">
			<h4><?php echo $set["Title"]; ?></h4>
			<div>
				<span class="count"><?php echo $set['info']['totals']['types']['highres']['count']; ?></span>
				<span><?php echo $templatefields["txtphotos"]; ?></span>
			</div>
		</div>
	</div>
</div>