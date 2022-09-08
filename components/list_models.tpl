<?php
$ahref = "";
$mdl = array();
if ($set["info"]["models"]) {
	foreach ($set["info"]["models"] as $model) {
		if (!$modellimit || (array_not_empty($mdl) < $modellimit)) {
			if (!$gender || ($model["gender"] == $gender)) {
				$mdl[] = $model;
			}
		}
	}
}
if (!array_not_empty($mdl)) return;
foreach ($mdl as $k => $model) {	
	$onclick = "";
	if ($today > $set["AppearDate"]) {
		$ahref = Sets_URL(["id" => $model["id"], "seoname" => $model["seoname"], "model" => $model]);
	} else {
		$ahref = "";
		$onclick = "javascript:(Popup.fire('" . $templatefields["txtcoming"] . '&nbsp;' . date("j F Y", strtotime($set["AppearDate"])) . "'))";
	}
	if (!$nolink) { ?>
		<a <?php if ($ahref !== "") { echo "href=" . $ahref; } ?> onclick="<?php echo $onclick; ?>"><?php }
	echo $model["name"];
	if (!$nolink) echo "</a>";
	if ($k != array_not_empty($mdl) - 1) echo ", ";
} ?>