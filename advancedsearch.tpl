<?php
	$site_url = $_SERVER['REQUEST_URI'];
	$parameters = parse_url($site_url);
	parse_str($parameters['query'], $p);
	header('Content-type: Application/JSON');
	$models = $api->getModels(["page" => 1, "numperpage" => 10000, "sort" => "date"]);
	$categories = $api->getCategories(["id" => 1, "sort" => "title", "has_sets" => 1]);
	$object = new stdClass();
	$object->models = array();
	$object->categories = array();
	$object->tags = array();
	if ($p['q'] != "") {
		foreach($models->models as $model) {
			if (preg_grep("/" . $p['q'] . "/i", [$model['ModelName']])) {
				$object->models[] = $model['ModelName'] . '|' . $model['SEOname'] . '|' . $model['setcount']; 
			}		   
		}
		foreach($categories->categories as $category) {
			$setobj = $api->getSets(["category_filter" => [$category["Id"]]]);
			if (preg_grep("/" . $p['q'] . "/i", [$category['Title']])) {
				if ($category["Parent"] == "88") {
					$object->categories[] = $category['Title'] . '|' . $category['SEOname'] . '|' . $setobj->setcount;
				} else if ($category["Parent"] == "3") {
					$object->tags[] = $category['Title'] . '|' . $category['SEOname'] . '|' . $setobj->setcount;
				}
			}
		}
		
		$data = json_encode($object, JSON_PRETTY_PRINT);
		echo $data;
	}
	exit();