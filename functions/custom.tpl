<?php
define("DBHOST", "localhost");
define("DBUSER", "vangoren");
define("DBPASS", "j90a930rfe");
define("DBNAME", "vangoren");
function custom_template_area($section) {
	//custom function to alternate between all custom templates.
	switch ($section) {
		case 'tour':
			$return = '//vangoren.com/';
			break;
		case 'members':
			$return = 'http://members.vangoren.com/';
			break;
		default:
			$return = '//vangoren.com/';
	}
	return $return;
}
// NOT USED
function section_path() {
	$actual_link = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
	$explode = explode('/', $actual_link);
	//the members is [3]
	echo $explode[3];
}
function get_from_scheduled_updates($category_id = 5, $limit = 999, $orderby = 'DESC', $current_page = 1, $parent_category = false, $exclude_category = false, $subsite_id = false) {
	global $api;
	global $subsiteid;
	$arr = [];
	$arr["page"] = $current_page;
	$arr["numperpage"] = floor($limit);
	if (isset($subsite_id) && $subsite_id != false) {
		$arr["subsiteid"] = $subsite_id;
	} else {
		// Get from globals
		if (isset($subsiteid)) $arr["subsiteid"] = $subsiteid;
	}
	//$arr["subsiteid"] = ($subsite_id) ? $subsite_id : 0;
	if ($exclude_category) {
		$arr["category_exclude"] = $exclude_category;
	}
	if (is_array($category_id)) {
		$category_id = implode(',', $category_id);
	}
	if ($category_id)
		$arr["category_filter"] = [$category_id];
	if ($parent_category) {
		global $all_categories;
		if (isset($all_categories[$parent_category]["children"])) {
			$arr["category_filter"][] = (!empty($all_categories[$parent_category]["children"])) ? $all_categories[$parent_category]["children"] : [0];
		}
	}
	if (!empty($GLOBALS['TOUR_ID'])) {
		$arr["tourid"] = floor($GLOBALS["TOUR_ID"]);
	}
	if ($orderby == "DESC" || $orderby == "d") {
		$arr["sort"] = "date";
	} else if ($orderby == "RANDOM") {
		$arr["sort"] = "random";
	} else if ($orderby == "TITLE" || $orderby == "n") {
		$arr["sort"] = "title";
	} else if ($orderby == "RATING" || $orderby == "p") {
		$arr["sort"] = "rating";
	}
	$setobj = $api->getSets($arr);
	if (empty($setobj->sets))
		return array();
	// Original interface fetched smarty extra fields, so this rebuilds
	// from the PHP template interface.
	foreach ($setobj->sets as &$set) {
		$exf = [];
		$exf["extras"] = [];
		foreach ($set["extrafields"] as $key => $value) {
			$exf["extras"][$key] = [$value];
		}
		$set["extrafields"] = $exf;
	}
	if (!empty($setobj->sets))
		return $setobj->sets;
	else
		return array();
}
// NOT USED
function get_comments_count($item_id, $content_type) {
	global $api;
	if ($content_type == 'sets') {
		$content_type = 'set';
	}
	$ctypes = ["set", "news", "model", "dvd", "custompages", "store"];
	if (!in_array($content_type, $ctypes)) return 0;
	$arr = [];
	$arr["contenttype"] = $content_type;
	$arr["itemid"] = $item_id;
	$arr["sort_reverse"] = 1;
	$arr["countonly"] = 1;
	$r = $api->getComments($arr);
	return $r->commentcount;
}
// NOT USED
function get_the_niches($wid = 0, $subsite_id = 'all') {
	global $tags_category;
	global $api;
	$arr["parentid"] = $tags_category['Id'];
	if ($subsite_id == 'all' || $subsite_id == '') {
		$arr["subsiteid"] = "";
	} else {
		$arr["subsiteid"] = floor($subsite_id);
	}
	$arr["has_sets"] = 1;
	$arr["sort"] = "title";
	$r = $api->getCategories($arr);
	return $r->categories;
}
function custom_get_trailer_url($tour_ID = 1, $set_ID = 1) {
	global $api;
	$ret = $api->getSets([
		"id" => $set_ID,
		"tourid" => $tour_ID
	]);
	if (!$ret->setcount)
		return "no_trailer";
	if (empty($ret->sets[0]["trailer_url"]))
		return "no_trailer";
	return $ret->sets[0]["trailer_url"];
}
// NOT USED
function custom_get_member_trailer_url($set_ID = 1) {
	global $api;
	$ret = $api->getContent([
		"id" => $set_ID
	]);
	return $ret;
}
// NOT USED
function custom_get_member_media_contents($set_ID = 1) {
	global $api;
	$ret = $api->getContent([
		"id" => $set_ID
	]);
	return $ret;
}
function GetStdImageSrc($arr) {
	$usep = explode(",", $arr["usepriority"]);
	$done = 0;
	$pexists = 0;
	$cdir = $GLOBALS["contentdir"];
	if (isset($arr["set"]["info"]["thumbs"][$usep[0]])) {
		$pexists = 1;
		$pelement = $arr["set"]["info"]["thumbs"][$usep[0]];
	}
	if ($pexists) {
		$cnt = 0;
		foreach ($usep as $k => $up) {
			if (!$arr["set"]["info"]["thumbs"][$up]) continue;
			// Uncomment this if you want src tags within stdimage for SEO purposes **}
			if ($cnt == 0) {
				if ($arr["set"]["info"]["thumbs"][$up]["1x_width"]) {
					//return $cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["1x_filename"];
					return cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["1x_filename"]);
				} else {
					return cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["filename"]);
				}
			}
			$cnt++;
		}
	} else {
		return $usep[0] . '.jpg';
	}
}
// NOT USED
function getFileSize($bytes) {
	$decimals = 2;
	$size = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
	$factor = floor((strlen($bytes) - 1) / 3);
	return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$size[$factor];
}
// NOT USED
function custom_get_category_tags($wid = 0, $subsite_id = 'all') {
	global $tags_category;
	global $api;
	$arr["parentid"] = $tags_category['Id'];
	if ($subsite_id == 'all' || $subsite_id == '') {
		$arr["subsiteid"] = "";
	} else {
		$arr["subsiteid"] = floor($subsite_id);
	}
	$arr["has_sets"] = 1;
	$arr["sort"] = "title";
	$r = $api->getCategories($arr);
	return $r->categories;
}
function custom_Category_URL($arr = array()) {
	$ret = $areaurl;
	$seo_urls = $GLOBALS["seo_urls"];
	if ($arr["seoname"] != "" && $seo_urls) {
		$ret .= "categories/" . $arr["seoname"];
		if ($arr["page"] > 1) {
			$ret .= "/" . $arr["page"];
		} else if ($arr["s"] || $arr["sw"]) {
			$ret .= "/1";
		} else {
			$ret .= "/1";
		}
		/*if ($arr["subsiteid"])
		{
			$ret .= "/" . $arr["subsiteid"];
		}*/
		if ($arr["s"]) {
			if ($arr["s"] == 'd') {
				$ret .= '/latest';
			}
			if ($arr["s"] == 'p') {
				$ret .= '/popular';
			}
			if ($arr["s"] == 'n') {
				$ret .= '/name';
			}
		} else if ($arr["sw"]) {
			$ret .= "/";
		}
		if ($arr["sw"]) {
			$ret .= "/" . $arr["sw"];
		}
		$ret .= "/";
	} else {
		$ret .= "category.php";
		$arrpush = array();
		if ($arr["id"] != "") $arrpush[] = "id=$arr[id]";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		/*if ($arr["subsiteid"]>0) $arrpush[] = "subsiteid=$arr[subsiteid]";*/
		if ($arr["s"] != "")  $arrpush[] = "s=$arr[s]";
		if ($arr["sw"] != "")  $arrpush[] = "s=$arr[s]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function custom_Category_Landing_URL($arr = array()) {
	$ret = $areaurl;
	$seo_urls = $GLOBALS["seo_urls"];
	if ($arr["seoname"] != "" && $seo_urls) {
		$ret .= "categories/" . $arr["seoname"];
		$ret .= ".html";
	} else {
		$ret .= "category.php";
		$arrpush = array();
		if ($arr["id"] != "") $arrpush[] = "id=$arr[id]";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		/*if ($arr["subsiteid"]>0) $arrpush[] = "subsiteid=$arr[subsiteid]";*/
		if ($arr["s"] != "")  $arrpush[] = "s=$arr[s]";
		if ($arr["sw"] != "")  $arrpush[] = "s=$arr[s]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function custom_Sets_URL($arr = array()) {
	$ret = $areaurl;
	$seo_urls = $GLOBALS["seo_urls"];
	if ((!$arr["id"] || $arr["seoname"] != "") && $seo_urls) {
		if ($arr["id"]) {
			$ret .=  "models/";
			$ret .= $arr["seoname"];
			if ($arr["page"] > 1) {
				$ret .= "_" . $arr["page"];
			} else {
				$ret .= "_1";
			}
		} else {
			$ret .= "models";
			//if ($arr["page"] > 1) $ret .= "/" . $arr["page"];
			if ($arr["g"]) {
				if ($arr["g"] == "f") {
					$ret .= "/female";
				}
				if ($arr["g"] == "m") {
					$ret .= "/male";
				}
			}
			if ($arr["page"] > 1) {
				$ret .= "/" . $arr["page"];
			} else {
				$ret .= "/1";
			}
			//if ($arr["s"] && ($arr["s"] != $GLOBALS["model_defaultsort"])) {
			if ($arr["s"]) {
				if ($arr["s"] == "d") {
					$ret .= "/latest";
				}
				if ($arr["s"] == "p") {
					$ret .= "/popular";
				}
				if ($arr["s"] == "n") {
					$ret .= "/name";
				}
			}
			if ($arr["sw"]) $ret .= "/" . strtolower($arr["sw"]);
		}
		if ($arr["id"]) {
			$ret .= ".html";
		} else {
			$ret .= "/";
		}
	} else {
		$arrpush = array();
		$ret .= "sets.php";
		if ($arr["id"]) $arrpush[] = "id=$arr[id]";
		if ($arr["g"]) $arrpush[] = "g=$arr[g]";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if ($arr["sw"]) $arrpush[] = "sw=$arr[sw]";
		if ($arr["s"]) $arrpush[] = "s=$arr[s]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
// NOT USED
function tourCurrentUrl($lang = 'en') {
	//$currentUrl = currentUrl();
	$currentUrl = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
	if (!$lang) {
		return $currentUrl;
	}
	if ($lang === 'en' && strpos($currentUrl, '/it/') !== false) {
		$currentUrl = str_replace('/it/', '/', $currentUrl);
	} else if ($lang === 'it' && strpos($currentUrl, '/it/') === false) {
		$currentUrl = str_replace($areaurl, $areaurl . "it/", $currentUrl);
	}
	return $currentUrl;
}