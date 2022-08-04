<?php
$ahref = "";
$modelcount = 0;
$mdl = array();
if ($set["info"]["models"]) {
	foreach ($set["info"]["models"] as $model) {
		if (!$modellimit || (!empty($mdl) < $modellimit)) {
			if (!$gender || ($model["gender"] == $gender)) {
				$mdl[] = $model;
			}
		}
	}
}
if (empty($mdl)) return;
foreach ($mdl as $k => $model) {	
	$onclick = "";
	if ($today > $set["AppearDate"]) {
		$ahref = Sets_URL(["id" => $model["id"], "seoname" => $model["seoname"], "model" => $model]);
	} else {
		$onclick = 'javascript:(Swal.fire("' . $templatefields["txtcoming"] . '&nbsp;' . $set["AppearDate"] . '"))';
	}
	if (!$nolink) { ?>
		<a href="<?php echo $ahref; ?>" onclick="<?php echo $onclick; ?>">
			<h2>
		<?php }
	echo $model["name"];
	if (!$nolink) echo "</h2></a>";
	if ($k != !empty($mdl) - 1) echo ", ";
} ?>