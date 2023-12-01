<?php
	header('Content-Type:text/plain; charset=UTF-8');

	// NATS CODE
	$nats = json_decode($content["Body"]);
	$setsobj 	= $api->getSets(["numperpage" => 10000]);
	$modelobj 	= $api->getModels(["numperpage" => 10000]);
	$categoryobj 	= $api->getCategories(["id" => 1, "sort" => "title", "has_sets" => 1]);
	$feed = array();
	$i = 0;
	foreach ($setsobj->sets as $set) {
		$feed[$i]["Id"] 		= $set["Id"];
		$feed[$i]["Username"] 		= "Anonymous";
		$feed[$i]["PublishingDate"] 	= $set["AppearDate"];
		$feed[$i]["VideoURL"] 		= "https://joins." . $area["Sitename"] . ".com/track/" . $nats->{$area["Sitename"]} . "?trailer=" . $set["SEOname"];
		$feed[$i]["Duration"] 		= round($set["info"]["totals"]["names"]["sourcemp4"]["movie_length"]);
		$feed[$i]["Title"] 		= '"' . $set["Title"] . '"';
		$feed[$i]["Categories"] 	= '"' . implode(", ", getTitlesByIds($categoryobj->categories, $set["info"]["categories"], 88)) . '"';
		$feed[$i]["DefaultThumbURL"]	= '"' . "https://g2h4g3s2.ssl.hwcdn.net" . $GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["1x_filename"] . '"';
		$feed[$i]["PreviewImageURL"] 	= '"' . "https://g2h4g3s2.ssl.hwcdn.net" . $GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["3x_filename"] . '"';
		$feed[$i]["TagsChannels"] 	= '"' . implode(", ", getTitlesByIds($categoryobj->categories, $set["info"]["categories"], 3)) . '"';
		$feed[$i]["Models"] 		= '"' . implode(", ", getModelsByIds($modelobj->models, $set["info"]["models"])) . '"';
		$feed[$i]["Description"] 	= '"' . $set["Description"] . '"';
		$feed[$i]["VR"] 		= "0";
		$feed[$i]["Premium"] 		= "1";
		$feed[$i]["PayPerClip"] 	= "1";
		$feed[$i]["PayPerView"] 	= "1";
		$feed[$i]["FanSubscription"] 	= "1";
		$feed[$i]["Studio"] 		= "Vangoren";
		$feed[$i]["PaySiteName"] 	= '"' . implode(", ", getSitesByIds($sites, $set["info"]["sites"])) . '"';
		$feed[$i]["PreviewAvailable"] 	= '"' . $set["info"]["totals"]["names"]["trailer"]["count"] . '"';
		$feed[$i]["XCountries"] 	= "";
		$feed[$i]["UnderReview"] 	= "0";
		$feed[$i]["Price"] 		= "";
		$i++;
	}
	
	echo "unique Item ID,username of the submitter,publishing date,video URL,duration,title,categories,default thumbnail URL,preview image URL,tags / channels,models,description,VR,premium,payperclip,payperview,fan subscription,studio,pay site name,Preview available,banned countries,under review,price" . "\n";
	foreach ($feed as $line)
		echo implode(",", $line) . "\n";

	// echo '<pre>';
	// print_r($feed);
	// echo '</pre>';

	function getTitlesByIds($arr, $ids, $parent) {
		$result = array();
		foreach ($arr as $item) {
			foreach ($ids as $id)
				if ($item["Id"] == $id && $item["Parent"] == $parent)
					$result[] = $item["Title"];
		}
		return $result;
	}

	function getModelsByIds($models, $ids) {
		$result = array();
		foreach ($models as $model) {
			foreach ($ids as $id)
				if ($model["Id"] == $id["id"])
					$result[] = $model["ModelName"];
		}
		return $result;
	}

	function getSitesByIds($sites, $ids) {
		$result = array();
		foreach ($sites as $site) {
			foreach ($ids as $id)
				if ($site["Id"] == $id)
					$result[] = $site["Name"];
		}
		return $result;
	}