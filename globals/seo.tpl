<?php
$seokey = "";
$seodesc = $templatefields["tourdefaultmetadescription"];

// TOUR PAGE
if ($pagename == "tour") {
	$title = $templatefields["title_site"] . ' | ' .  $templatefields["sitename"];
	$seokey = $templatefields["tourdefaultmetakeywords"];
	$seodesc = $templatefields["tourdefaultmetadescription"];
	if (isset($individual_update)) {
		$title = $individual_update["Title"] . " - " . $templatefields["sitename"];
		$seokey = $individual_update["SEOkey"];
		$seodesc = $individual_update["SEOdesc"];
	}
} 

// VIDEOS PAGE
else if ($pagename == "movies" || $pagename == "vids") {
	$title = $templatefields["title_videos"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $category_selected["SEOdesc"];
}

// PHOTOS PAGE
else if ($pagename == "photos" || $pagename == "highres") {
	$title = $templatefields["title_photos"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $category_selected["SEOdesc"];	
}

// MODELS PAGE
else if ($pagename == "models" && !isset($model)) {
	$title = $templatefields["title_models"] . ' | ' . $templatefields["sitename"];
}

// SINGLE MODEL PAGE
else if ($pagename == "models" && isset($model)) {
	$title = $model["ModelName"] . " " . $templatefields["title_model"] . " | " . $templatefields["sitename"];
	$seokey = $templatefields["txtmodelkeywords"] . ", " . $model["ModelName"];
	if ($model['extrafields']['bio'] !==  "") {
	$seodesc = $model["ModelName"] . ", " . $model['extrafields']['bio'];
	} else {
		$seodesc = $model["ModelName"];
	}
} 

// GENRES/CATEGORIES PAGE
else if ($pagename == "category" && $category_selected["Title"] == "Categories") {
	$title = $templatefields["title_genres"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $category_selected["SEOdesc"];
}

// SINGLE GENRE/TAG/CATEGORY PAGE
else if ($pagename == "category" && $category_selected["Title"] !== "Categories") {
	$title = $category_selected["Title"] . ' ' . $templatefields["title_genre"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $category_selected["SEOdesc"];
}

// TAGS PAGE
else if ($pagename == "tags" && $category_selected["Title"] == "Tags") {
	$title = $templatefields["title_tags"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $individual_update["SEOdesc"];
}

// SINGLE TAG PAGE
else if ($pagename == "tags" && $category_selected["Title"] !== "Tags") {
	$title = $category_selected["Title"] . ' ' . $templatefields["title_tag"] . ' | ' . $templatefields["sitename"];
	$seokey  = $category_selected["SEOkey"];
	$seodesc = $category_selected["SEOdesc"];
}

// TRAILER PAGE
else if ($pagename == "trailer") {
	$title = $set["Title"] . " | " . $templatefields["sitename"];
	$seokey = $set["SEOkey"];
	$seodesc = $set["SEOdesc"];
} 

// CUSTOM PAGE
else if ($pagename == "pages") {
	$title = $content['Title'];
	$seokey = $set["SEOkey"];
	$seodesc = $set["SEOdesc"];
}