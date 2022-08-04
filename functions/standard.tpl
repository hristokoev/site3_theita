<?php
function LoadTemplate($file, $vars = array()) {
	extract($GLOBALS["variablelist"]);
	extract($vars);
	if (file_exists($file)) {
		include $file;
	} else {
		$db = debug_backtrace();
		foreach ($db as $dbb) {
			echo "<BR>File not found: $file";
			echo "<P>Call to file in $dbb[file] LINE $dbb[line]";
			break;
		}
	}
}
function Trailer_URL($arr = array()) {
	$useseo = $GLOBALS["seo_urls"];
	$areaurl = $GLOBALS["areaurl"];
	if ($useseo) {
		if ($arr["id"] && $arr["set"]["SEOname"]) {
			$seoname = "trailers/" . $arr["set"]["SEOname"] . ".html";
		} else {
			$useseo = 0;
		}
	}
	if ($useseo) {
		$ret = $GLOBALS["areaurl"];
		if ($seoname) $ret .= $seoname;
	} else {
		$ret = "trailer.php";
		if ($arr["id"]) $ret .= "?id=" . $arr["id"];
	}
	if ($arr["anchor"]) {
		$ret .= "#" . $arr["anchor"];
	}
	return $ret;
}
function Gallery_URL($arr = array()) {
	$ret = "";
	if (isset($GLOBALS["tour"])) {
		$useseo = $GLOBALS["seo_urls"];
		$areaurl = $GLOBALS["areaurl"];
		if ($GLOBALS["tour"]["LinkThumb"] == 0) {
			// Update Page: Use Logic below
		}
		if ($GLOBALS["tour"]["LinkThumb"] == 1) {
			// Trailer Page
			return Trailer_URL($arr);
		}
		if ($GLOBALS["tour"]["LinkThumb"] == 2) {
			// Join Page
			return $GLOBALS["tour"]["JoinUrl"];
		}
		if ($useseo) {
			if ($arr["id"] && !empty($arr["set"]["SEOname"])) {
				$seoname = "updates/" . $arr["set"]["SEOname"] . ".html";
			} else if ($arr["template"]) {
				$seoname = $arr["template"] . "/";
			} else if (in_array($arr["page"], array('', '1'))) {
				$seoname = "";
			} else if ($arr["page"]) {
				$seoname = "updates/page_" . $arr["page"] . ".html";
			} else if ($arr["id"]) {
				$useseo = 0;
			}
		}
		if ($useseo) {
			$ret = $GLOBALS["areaurl"];
			if ($seoname) $ret .= $seoname;
		} else {
			$arrpush = [];
			$ret = $GLOBALS["areaurl"] . "index.php";
			if ($arr["id"]) $arrpush[] = "id=" . $arr["id"];
			if ($arr["page"] > 1) $arrpush[] = "page=" . $arr["page"];
			if ($arr["template"]) $arrpush[] = "template=" . $arr["template"];
			if (!empty($arrpush)) $ret .= "?";
			$ret .= join("&", $arrpush);
		}
		if ($arr["anchor"]) {
			$ret .= "#" . $arr["anchor"];
		}
		return $ret;
	}
	$seo_urls = $GLOBALS["seo_urls"];
	if ($arr["seoname"] != "" && $seo_urls) {
		$ret .= $GLOBALS["areaurl"] . "scenes/" . $arr["seoname"];
		if ($arr["type"]) {
			$ret .= "_" . $arr["type"];
		}
		if ($arr["page"] > 1) {
			$ret .= "_" . $arr["page"];
		} else if ($arr["mt"]) {
			$ret .= "_1";
		}
		if ($arr["mt"]) {
			$ret .= "_" . $arr["mt"];
		}
		$ret .= ".html";
	} else {
		$ret .= "gallery.php";
		if ($arr["id"])  $arrpush[] = "id=$arr[id]";
		if ($arr["type"])  $arrpush[] = "type=$arr[type]";
		if ($arr["page"] > 1)  $arrpush[] = "page=$arr[page]";
		if ($arr["mt"])  $arrpush[] = "mt=$arr[mt]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function Search_URL($arr = array()) {
	$ret = "search.php";
	$arrpush = array();
	if ($GLOBALS["search_query"]) $arrpush[] = "query=" . $GLOBALS["search_query"];
	if ($GLOBALS["search_any"]) $arrpush[]   = "qany=" . $GLOBALS["search_any"];
	if ($GLOBALS["search_phrase"]) $arrpush[] = "qex=" . $GLOBALS["search_phrase"];
	if ($GLOBALS["search_none"]) $arrpush[] = "none=" . $GLOBALS["search_none"];
	if ($GLOBALS["search_all"]) $arrpush[] = "qall=" . $GLOBALS["search_all"];
	if ($GLOBALS["search_type"] == "advanced") $arrpush[] = "st=" . $GLOBALS["search_type"];
	foreach ($GLOBALS["search_categories"] as $s) $arrpush[] = "cat[]=$s";
	foreach ($GLOBALS["search_models"] as $s) $arrpush[] = "site[]=$s";
	if ($arr["page"] > 1) {
		$arrpush[] = "page=$arr[page]";
	}
	if (!empty($arrpush)) {
		$ret .= "?" . join("&", $arrpush);
	}
	return $ret;
}
function Index_URL($arr = array()) {
	$ret = "";
	if (isset($GLOBALS["tour"])) {
		$useseo = $GLOBALS["seo_urls"];
		$areaurl = $GLOBALS["areaurl"];
		if ($useseo) {
			if ($arr["id"] && !empty($arr["set"]["SEOname"])) {
				$seoname = "updates/" . $arr["set"]["SEOname"] . ".html";
			} else if ($arr["template"]) {
				$seoname = $arr["template"] . "/";
			} else if (in_array($arr["page"], array('', '1'))) {
				$seoname = "";
			} else if ($arr["page"]) {
				$seoname = "updates/page_" . $arr["page"] . ".html";
			} else if ($arr["id"]) {
				$useseo = 0;
			}
		}
		if ($useseo) {
			$ret = $GLOBALS["areaurl"];
			if ($seoname) $ret .= $seoname;
		} else {
			$arrpush = [];
			$ret = $GLOBALS["areaurl"] . "index.php";
			if ($arr["id"]) $arrpush[] = "id=" . $arr["id"];
			if ($arr["page"] > 1) $arrpush[] = "page=" . $arr["page"];
			if ($arr["template"]) $arrpush[] = "template=" . $arr["template"];
			if (!empty($arrpush))
				$ret .= "?" . join("&", $arrpush);
		}
		if ($arr["anchor"]) {
			$ret .= "#" . $arr["anchor"];
		}
		return $ret;
	}
	$seo_urls = $GLOBALS["seo_urls"];
	if ($seo_urls) {
		$seoname = ($arr["page"] > 1) ? "updates/page_$arr[page].html" : "";
		$ret .= $GLOBALS["areaurl"] . $seoname;
		if ($arr["mobile"]) $ret .= "?mobile=1";
	} else {
		$arrpush = array();
		$ret .= "index.php";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if ($GLOBALS["template_attribute"]) $arrpush[] = "template=" . $GLOBALS["template_attribute"];
		if ($arr["mobile"])  $arrpush[] = "mobile=1";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function Sets_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ((!$arr["id"] || $arr["seoname"] != "") && $seo_urls) {
		$ret = $GLOBALS["areaurl"];
		$ret .=  "models/";
		if ($arr["id"]) {
			$ret .= $arr["seoname"];
		} else {
			if ($arr["sw"]) $ret .= strtolower($arr["sw"]) . "/";
			$ret .= "models";
			if ($arr["page"] > 1) $ret .= "_" . $arr["page"];
			if ($arr["s"] && ($arr["s"] != $GLOBALS["model_defaultsort"])) {
				$ret .= "_" . $arr["s"];
			}
		}
		$ret .= ".html";
	} else {
		$arrpush = array();
		$ret .= "sets.php";
		if ($arr["id"]) $arrpush[] = "id=$arr[id]";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if ($arr["sw"]) $arrpush[] = "sw=$arr[sw]";
		if ($arr["s"]) $arrpush[] = "s=$arr[s]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function DVDS_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ($seo_urls) {
		if ($arr["id"] && $arr["dvd"]["SEOname"]) {
			$seoname = $arr["dvd"]["SEOname"] . ".html";
		} else if ($arr["page"] == "1" || $arr["page"] == "") {
			$seoname = "dvds.html";
		} else if ($arr["page"] > 1) {
			$seoname = "dvds_page_$arr[page].html";
		} else if ($arr["id"]) {
			$seo_urls = 0;
		} else {
			$seoname = "dvds.html";
		}
	}
	$arrpush = array();
	if ($arr["sw"]) $arrpush[] = "sw=$arr[sw]";
	if ($arr["sid"]) $arrpush[] = "sid=$arr[sid]";
	if ($arr["s"] != "" && $arr["s"] != "n") $arrpush[] = "s=$arr[s]";
	if ($seo_urls) {
		$ret .= $GLOBALS["areaurl"] . "dvds/" . $seoname;
	} else {
		$ret .= "dvds.php";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if ($arr["id"]) $arrpush[] = "id=$arr[id]";
	}
	if (!empty($arrpush)) {
		$ret .= "?" . join("&", $arrpush);
	}
	return $ret;
}
function Bonus_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	$seon = "";
	$ll = array();
	$ll[1] = "our-sites/";
	$ll[2] = "video-feeds/";
	$ll[3] = "erotic-stories/";
	$ll[4] = "audio-files/";
	$ll[5] = "live-cams/";
	$ll[6] = "friends/";
	if ($seo_urls) {
		if (isset($ll[$arr["fc"]])) {
			$seon = $ll[$arr["fc"]];
		}
		if ($arr["page"] > 1) {
			$seon .= "page_$arr[page].html";
		} else if ($arr["id"] && $arr["seoname"]) {
			$seon .= $arr["seoname"] . ".html";
		} else if ($arr["id"] && !$arr["seoname"]) {
			$seo_urls = 0;
		}
	} else {
		$seo_urls = 0;
	}
	if ($seo_urls) {
		$ret .= $GLOBALS["areaurl"];
		if ($seon) $ret .= $seon;
	} else {
		$ret .= "bonus.php";
		$arrpush = array();
		if ($arr["fc"]) $arrpush[] = "fc=$arr[fc]";
		if ($arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if ($arr["id"]) $arrpush[] = "id=$arr[id]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function News_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ($seo_urls) {
		$ret .= $GLOBALS["areaurl"];
		if ($arr["tag"]) {
			if ($arr["page"] > 1) {
				$seoname = "tags/" . $arr["tag"] . "-page" . $arr["page"] . ".html";
			} else {
				$seoname = "tags/" . $arr["tag"] . ".html";
			}
		} else if (!empty($arr["news"]["SEOname"])) {
			$seoname = $arr["news"]["SEOname"] . ".html";
		} else if ($arr["page"] > 1) {
			$seoname = "blog_page_" . $arr["page"] . ".html";
		} else if ($id) {
			$seo_urls = 0;
		} else {
			$seoname = "blog.html";
		}
	}
	if ($seo_urls) {
		$ret .= "blog/";
		if ($seoname) {
			$ret .= $seoname;
		}
	} else {
		$arrpush = array();
		$ret .= "news.php";
		if (isset($arr["page"]) && $arr["page"] > 1) $arrpush[] = "page=$arr[page]";
		if (!empty($arr["news"]["Id"])) $arrpush[] = "id=" . $arr["news"]["Id"];
		if (!empty($arr["tag"])) $arrpush[] = "tag=$arr[tag]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function FAQ_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ($seo_urls) {
		$ret .= $GLOBALS["areaurl"] . "faq/faq.html";
	} else {
		$ret .= "faq.php";
	}
	return $ret;
}
function Calendar_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ($seo_urls) {
		$seon = "calendar";
		if ($arr["month"] && $arr["year"]) {
			$seon = "$seon/$arr[year]_$arr[month].html";
		} else if ($arr["id"] && $arr["seoname"]) {
			$seon = "$seon/$arr[seoname].html";
		} else if ($arr["id"]) {
			$seo_urls = 0;
		} else {
			$seon = "calendar/";
		}
	}
	if ($seo_urls) {
		$ret .= $GLOBALS["areaurl"];
		if ($seon) $ret .= $seon;
	} else {
		$ret .= "calendar.php";
		if (!empty($arr["year"])) $arrpush[] = "year=$arr[year]";
		if (!empty($arr["month"])) $arrpush[] = "month=$arr[month]";
		if (!empty($arr["id"])) $arrpush[] = "id=$arr[id]";
		if (!empty($arrpush)) {
			$ret .= "?" . join("&", $arrpush);
		}
	}
	return $ret;
}
function Category_URL($arr = array()) {
	$ret = "";
	$seo_urls = $GLOBALS["seo_urls"];
	if ($arr["seoname"] != "" && $seo_urls) {
		$ret = $GLOBALS["areaurl"];
		$ret .= "categories/" . $arr["seoname"];
		if ($arr["page"] > 1) {
			$ret .= "_" . $arr["page"];
		} else if ($arr["s"] || $arr["sw"]) {
			$ret .= "_1";
		}
		/*if ($arr["subsiteid"])
		{
			$ret .= "_" . $arr["subsiteid"];
		}*/
		if ($arr["s"]) {
			$ret .= "_" . $arr["s"];
		} else if ($arr["sw"]) {
			$ret .= "_";
		}
		if ($arr["sw"]) {
			$ret .= "_" . $arr["sw"];
		}
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
function StdImage($arr) {
	/*
	if (!empty($GLOBALS["tour"]) && empty($arr["memberthumb"]))
	{
		if ($arr["set"]["wc_id"])
		{
			$content = "content/webmastercentral_" . $arr["set"]["wc_id"] . "/" . $arr["usepriority"] . ".jpg";
		}
		else
		{
			$content = "content/" . $arr["set"]["Directory"] . "/" . $arr["usepriority"] . ".jpg";
		}
		echo '<img alt="' . $content . '" src="' . cdn_hook($content) . '" ';
		if ($arr["width"])  echo 'width="' . $arr["width"] . '" ';
		if ($arr["height"]) echo 'height="' . $arr["height"] . '" ';
		if ($arr["class"])  echo 'class="' . $arr["class"] . '" ';
		if ($arr["style"])  echo 'style="' . $arr["style"] . '" ';
		echo '/>';
		return;
	}
	*/
	$usep = explode(",", $arr["usepriority"]);
	$done = 0;
	$pexists = 0;
	$cdir = $GLOBALS["contentdir"];
	if (isset($arr["set"]["info"]["thumbs"][$usep[0]])) {
		/*if($arr["set"]["info"]["thumbs"][$usep[0]]["id"]==1772){
			print_r($arr);
		}*/
		$pexists = 1;
		$pelement = $arr["set"]["info"]["thumbs"][$usep[0]];
	}
	if ($pexists && $pelement["hasmp4"]) {
		echo "<video loop=\"\" muted=\"\" playsinline=\"\" preload=\"none\" ";
		if ($pelement["width"] > 0) {
			echo 'width="' . $pelement["width"] . '" ';
		}
		if ($pelement["height"] > 0) {
			echo 'height="' . $pelement["height"] . '" ';
		}
		if (isset($arr["alt"])) {
			echo 'alt="' . $arr["alt"] . '" ';
		}
		if (isset($arr["style"])) {
			echo 'style="' . $arr["style"] . '" ';
		}
		if (isset($arr["class"])) {
			echo 'class="' . $arr["class"] . ' stdvideo" ';
		}
		// Uncomment this if you want src tags within stdimage for SEO purposes **}
		if ($cnt == 0) {
			if ($pelement["1x_width"]) {
				echo 'poster="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["1x_filename"]) . '" ';
			} else {
				echo 'poster="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["filename"]) . '" ';
			}
		}
		if ($pelement["1x_width"]) {
			echo 'poster' . $cnt . '_1x="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["1x_filename"]) . '" ';
			echo 'poster' . $cnt . '_1x_width="' . $pelement["1x_width"] . '" ';
		}
		if ($pelement["2x_width"]) {
			echo 'poster' . $cnt . '_2x="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["2x_filename"]) . '" ';
			//			echo 'poster' . $cnt . '_2x_width="' . $pelement["2x_width"] . '" ';
		}
		if ($pelement["3x_width"]) {
			echo 'poster' . $cnt . '_3x="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["3x_filename"]) . '" ';
			//			echo 'poster' . $cnt . '_3x_width="' . $pelement["3x_width"] . '" ';
		}
		if ($pelement["4x_width"]) {
			echo 'poster' . $cnt . '_4x="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["4x_filename"]) . '" ';
			//			echo 'poster' . $cnt . '_4x_width="' . $pelement["4x_width"] . '" ';
		}
		if (!$pelement["1x_width"] && $pelement["filename"]) {
			echo 'poster' . $cnt . '="' . cdn_hook($cdir . '/contentthumbs/' . $pelement["filename"]) . '" ';
			//			echo 'poster' . $cnt . '_4x_width="' . $pelement["4x_width"] . '" ';
		}
		$src =  $cdir . '/contentthumbs/' . $pelement["mp4file"];
		echo 'src="' . $src . '" >';
		echo ' <source src="' . $src . '" type="video/mp4">';
		echo '</video>';
	} else if ($pexists) {
		echo "<img ";
		echo 'id="set-target-' . $arr["set"]["Id"] . '-' . rand(100, 9999999);
		if ($arr["postfix"]) {
			echo "_" . $arr["postfix"];
		}
		echo '" ';
		if (isset($arr["loading"])) {
			echo 'loading="' . $arr["loading"] . '" ';
		}
		if ($pelement["width"] > 0) {
			echo 'width="' . $pelement["width"] . '" ';
		}
		if ($pelement["height"] > 0) {
			echo 'height="' . $pelement["height"] . '" ';
		}
		if (isset($arr["alt"])) {
			echo 'alt="' . $arr["alt"] . '" ';
		}
		if (isset($arr["style"])) {
			echo 'style="' . $arr["style"] . '" ';
		}
		if (isset($arr["class"])) {
			echo 'class="' . $arr["class"] . ' stdimage" ';
		}
		$cnt = 0;
		foreach ($usep as $k => $up) {
			if (!$arr["set"]["info"]["thumbs"][$up]) continue;
			// Uncomment this if you want src tags within stdimage for SEO purposes **}
			if ($cnt == 0) {
				if ($arr["set"]["info"]["thumbs"][$up]["1x_width"]) {
					//echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["1x_filename"]) . '" ';
				} else {
					echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["filename"]) . '" ';
				}
			}
			if (isset($arr["set"]["info"]["thumbs"][$up]["mp4file"]) && $cnt == 1) {
				//echo "video_url='".$arr["set"]["info"]["thumbs"][$up]["mp4file"]."'";
				echo "video_url='" . $arr["set"]["info"]["thumbs"][$up]["mp4file"] . "'";
			}
			if ($arr["set"]["info"]["thumbs"][$up]["1x_width"])
				echo 'src' . $cnt . '_1x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["1x_filename"]) . '" ';
			if ($arr["set"]["info"]["thumbs"][$up]["2x_width"])
				echo 'src' . $cnt . '_2x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["2x_filename"]) . '" ';
			if ($arr["set"]["info"]["thumbs"][$up]["3x_width"])
				echo 'src' . $cnt . '_3x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["3x_filename"]) . '" ';
			if (!$arr["set"]["info"]["thumbs"][$up]["1x_width"] && $arr["set"]["info"]["thumbs"][$up]["filename"])
				echo 'src' . $cnt . '="' . cdn_hook($cdir . '/contentthumbs/' . $arr["set"]["info"]["thumbs"][$up]["filename"]) . '" ';
			$cnt++;
		}
		echo 'cnt="' . $cnt . '" v="0" />';
	} else {
		echo '<img ';
		if ($arr["class"]) {
			echo 'class="' . $arr["class"] . '" ';
		}
		if (isset($arr["style"])) {
			echo 'style="' . $arr["style"] . '" ';
		}
		echo ' src="images/p' . $usep[0] . '.jpg" />';
	}
}
function StdCatImage($arr) {
	$usep = explode(",", $arr["usepriority"]);
	$done = 0;
	$pexists = 0;
	$cdir = $GLOBALS["contentdir"];
	if (isset($arr["category"]["info"]["thumbs"][$usep[0]])) {
		$pexists = 1;
		$pelement = $arr["category"]["info"]["thumbs"][$usep[0]];
	}
	if ($pexists) {
		echo "<img ";
		echo 'id="set-target-' . $arr["category"]["Id"];
		if ($arr["postfix"]) {
			echo "_" . $arr["postfix"];
		}
		echo '" ';
		if ($pelement["width"] > 0) {
			echo 'width="' . $pelement["width"] . '" ';
		}
		if ($pelement["height"] > 0) {
			echo 'height="' . $pelement["height"] . '" ';
		}
		if (isset($arr["alt"])) {
			echo 'alt="' . $arr["alt"] . '" ';
		}
		if (isset($arr["style"])) {
			echo 'style="' . $arr["style"] . '" ';
		}
		if (isset($arr["class"])) {
			echo 'class="' . $arr["class"] . ' stdimage" ';
		}
		$cnt = 0;
		foreach ($usep as $k => $up) {
			if (!$arr["category"]["info"]["thumbs"][$up]) continue;
			// Uncomment this if you want src tags within stdimage for SEO purposes **}
			/*
			if ($cnt == 0)
			{
			   if ($arr["category"]["info"]["thumbs"][$up]["1x_width"])
			   {
			   	 echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["1x_filename"]) . '" ';
			   }
			   else
			   {
			   	 echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["filename"]) . '" ';
			   }
			}
			*/
			if ($arr["category"]["info"]["thumbs"][$up]["1x_width"])
				echo 'src' . $cnt . '_1x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["1x_filename"]) . '" ';
			if ($arr["category"]["info"]["thumbs"][$up]["2x_width"])
				echo 'src' . $cnt . '_2x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["2x_filename"]) . '" ';
			if ($arr["category"]["info"]["thumbs"][$up]["3x_width"])
				echo 'src' . $cnt . '_3x="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["3x_filename"]) . '" ';
			if (!$arr["category"]["info"]["thumbs"][$up]["1x_width"] && $arr["category"]["info"]["thumbs"][$up]["filename"])
				echo 'src' . $cnt . '="' . cdn_hook($cdir . '/contentthumbs/' . $arr["category"]["info"]["thumbs"][$up]["filename"]) . '" ';
			$cnt++;
		}
		echo 'cnt="' . $cnt . '" v="0" />';
	} else {
		echo '<img src="images/p' . $usep[0] . '.jpg" />';
	}
}
