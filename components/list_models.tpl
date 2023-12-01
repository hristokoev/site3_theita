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
		$day = date("j", strtotime($set["AppearDate"])); 
		$month = date("m", strtotime($set["AppearDate"])); 
		$year = date("Y", strtotime($set["AppearDate"])); 
		if ($month==1) {
			$month = $templatefields["txtjanuary"];
		} else if ($month==2) {
			$month = $templatefields["txtfebruary"];
		} else if ($month==3) {
			$month = $templatefields["txtmarch"];
		} else if ($month==4) {
			$month = $templatefields["txtapril"];
		} else if ($month==5) {
			$month = $templatefields["txtmay"];
		} else if ($month==6) {
			$month = $templatefields["txtjune"];
		} else if ($month==7) {
			$month = $templatefields["txtjuly"];
		} else if ($month==8) {
			$month = $templatefields["txtaugust"];
		} else if ($month==9) {
			$month = $templatefields["txtseptember"];
		} else if ($month==10) {
			$month = $templatefields["txtoctober"];
		} else if ($month==11) {
			$month = $templatefields["txtnovember"];
		} else if ($month==12) {
			$month = $templatefields["txtdecember"];
		}
		$onclick = "javascript:(Popup.fire('" . $templatefields["txtcoming"] . '&nbsp;</br>' . $day . '-' . $month . '-' . $year . "'))";
	}
	if (!$nolink) { ?>
		<a <?php if ($ahref !== "") { echo "href=" . $ahref; } ?> onclick="<?php echo $onclick; ?>"><?php }
	echo $model["name"];
	if (!$nolink) echo "</a>";
	if ($k != array_not_empty($mdl) - 1) echo ", ";
} ?>