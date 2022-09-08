<?php
$numberofpages = (!empty($arr["numberofpages"])) ? $arr["numberofpages"] : $GLOBALS["numberofpages"];
$onpage        = (!empty($arr["onpage"]))        ? $arr["onpage"]        : $GLOBALS["onpage"];
$pagename      = (!empty($arr["pagename"]))      ? $arr["pagename"]      : "page";
$args          = (!empty($arr["args"]))          ? $arr["args"]          : array();
$inbox         = (!empty($arr["inbox"]))         ? $arr["inbox"]         : 0;
if (isset($arr["funcname"])) {
	$funcname = $arr["funcname"];
} else if ($GLOBALS["pagename"] == "index") {
	$funcname = "Index_URL";
} else if ($GLOBALS["pagename"] == "bonus") {
	$funcname = "Bonus_URL";
	$args["fc"] = (isset($arr["fc"])) ? $arr["fc"] : $GLOBALS["bonuscategory"];
} else if ($GLOBALS["pagename"] == "category") {
	$funcname = "Category_URL";
	$args["id"] = $GLOBALS["category_selected"]["Id"];
	$args["category"] = $GLOBALS["category_selected"];
	$args["seoname"] = $GLOBALS["category_selected"]["SEOname"];
	$args["s"] = ($GLOBALS["category_sort"]) ? $GLOBALS["category_sort"] : $GLOBALS["category_sort_default"];
	if (isset($_REQUEST['subsiteid']) && $_REQUEST['subsiteid'] > 1) {
		$args["subsiteid"] = $_REQUEST['subsiteid'];
	} else {
		$args["subsiteid"] = 1;
	}
} else if ($GLOBALS["pagename"] == "dvds") {
	$funcname = "DVDS_Url";
	$args["sid"] = $GLOBALS["studio"];
	$args["sw"] = $GLOBALS["letter"];
	$args["s"] = ($GLOBALS["sort"]) ? $GLOBALS["sort"] : "";
} else if ($GLOBALS["pagename"] == "news") {
	$funcname = "News_URL";
	if ($GLOBALS["news_tag"]) {
		$args["tag"] = $GLOBALS["news_tag"];
	}
} else if ($GLOBALS["pagename"] == "search") {
	$funcname = "Search_URL";
} else if ($GLOBALS["pagename"] == "sets") {
	$funcname = "custom_Sets_URL";
	$args["sw"] = $GLOBALS["letter"];
	if (isset($_REQUEST['g']) && $_REQUEST['g'] != '') {
		$args["g"] = $_REQUEST['g'];
	}
	if (isset($_REQUEST['s']) && $_REQUEST['s'] != '') {
		$args["s"] = $_REQUEST['s'];
	} else {
		$args["s"] = ($GLOBALS["sort"]) ? $GLOBALS["sort"] : "";
	}
	if (isset($_REQUEST['subsiteid']) && $_REQUEST['subsiteid'] > 1) {
		$args["subsiteid"] = $_REQUEST['subsiteid'];
	} else {
		$args["subsiteid"] = 1;
	}
	if (isset($model)) {
		$args["model"] = $model;
		$args["id"] = $model["Id"];
		$args["seoname"] = $model["SEOname"];
	}
} else if ($GLOBALS["pagename"] == "gallery") {
	$funcname = "Gallery_Url";
	$args["id"] = $GLOBALS["set"]["Id"];
	$args["type"] = $GLOBALS["settype"];
} else if ($GLOBALS["pagename"] == "mailbox") {
	$funcname = "Mailbox_URL";
	$args["inbox"] = $inbox;
} else {
	echo "Undefined pagename in " . __FILE__ . " on line " . __LINE__;
	return;
}
$templatefields = $GLOBALS["templatefields"];
?>
<?php if ($numberofpages > 1) {
	if ($onpage != 1) {
		$args[$pagename] = 1; ?>
		<a class="prev" href="<?php echo call_user_func($funcname, $args); ?>"><i class="fa-solid fa-angles-left"></i></a>
		<?php $args[$pagename] = $onpage - 1; ?>
		<a class="button prev" href="<?php echo call_user_func($funcname, $args); ?>"><i class="fa-solid fa-angle-left"></i></a>
	<?php } ?>
	<div class="pages"><?php
		for ($page = 1; $page <= $numberofpages; $page++) {
			if ($page >= ($onpage - 5) && $page <= ($onpage + 4)) {
				$args[$pagename] = $page;
				if ($page == $onpage) {
					echo '<a href="' . call_user_func($funcname, $args) . '" class="button button-active">' . $page . '</a>';
				} else {
					// In trial area limit access to gallery pages
					if ($GLOBALS["pagename"] == "gallery" && isset($trial) && in_array($page, $trial["accesspages"])) {
						echo '<a href="' . GET_Username($trial['photourl']) . '" class="button button-outline">' . $page . '</a>';
					} else {
						echo '<a href="' . call_user_func($funcname, $args) . '" class="button button-outline">' . $page . '</a>';
					}
				}
			}
		}

		if (!empty($GLOBALS['tour'])) {
			$plusOnePage = $numberofpages + 1;
			for ($iPage = $plusOnePage; $iPage <= 5; $iPage++) {
				echo '<a href="' . $tour["JoinUrl"] . '" class="button button-outline">' . $iPage . '</a>';
			}
		}
		?></div>
	<?php if ($onpage != $numberofpages) {
		$args[$pagename] = $onpage + 1; ?>
		<a class="button next" href="<?php echo call_user_func($funcname, $args); ?>"><i class="fa-solid fa-angle-right"></i></a>
		<?php $args[$pagename] = $numberofpages; ?>
		<a class="next" href="<?php echo call_user_func($funcname, $args); ?>"><i class="fa-solid fa-angles-right"></i></a>
<?php }
} ?>