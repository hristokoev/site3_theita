<?php

session_start();

$username = "elx";
$password = "9BQXwNbgQNPJ6Gy1HFBf";

if (isset($_GET['logout'])) {
	unset($_SESSION["login"]);
	header("Location: " . $areaurl);
	exit;
}

if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']) || !isset($_SESSION["login"])) {
	header("WWW-Authenticate: Basic realm=\"Test\"");
	header("HTTP/1.0 401 Unauthorized");
	$_SESSION["login"] = true;
?>
	<section class="container">
		<span>[Test page] You are unauthorized...&nbsp;</span><a style="color: #ea1d61; font-weight: 700;" href="<?= $_SERVER['PHP_SELF'] ?>?id=bug-reports">Login</a>
	</section>
	<?php
	exit;
} else {
	if ($_SERVER['PHP_AUTH_USER'] == $username && $_SERVER['PHP_AUTH_PW'] == $password) {
	?>
		<section class="container">
			<span>[Test page] You have logged in...&nbsp;</span><a style="color: #ea1d61; font-weight: 700;" href="<?= $_SERVER['PHP_SELF'] ?>?id=bug-reports&logout">Log out</a>
		</section>
<?php
	} else {
		unset($_SESSION["login"]);
		header("Location: " . $_SERVER['PHP_SELF'] . "?id=bug-reports");
	}
}

?>

<section class="container">
	<div class="page-header">
		<h2 style="text-transform: none" class="page-title">With calling another API (not preferred):</h2>
		<h3 class="page-subtitle">The count of scenes for Anna and Nadine is correct</h3>
	</div>
<pre style="all:revert">
<code style="display: inline-block;padding: 16px;background-color: #fff;color: #000;">
$modelObj = $api->getModels
([
	"sort" => "date",
	"numperpage" => 6,
	"subsiteid" => $subsite['Id']
]);

foreach ($modelObj->models as $model)
{
	$videoObj = $api->getSets(["model_filter" => $model['Id']]);
	...
	echo $videoObj->settotal // count of scenes
}	
</code>
</pre>	
	<div class="grid grid-models-main">
		<?php if (!isset($individual_update) && !empty($toprated['models'])) { ?>
			<?php
			$modelObj = $api->getModels([
				"sort" => "date",
				"numperpage" => 6,
				"subsiteid" => $subsite['Id']
			]);
			foreach ($modelObj->models as $model) {
				$videoObj = $api->getSets(["model_filter" => $model['Id'],]);
			?>
				<div class="wrap">
					<div class="thumb">
						<div class="thumb-holder hover">
							<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
								<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => "103", "loading" => "lazy"]); ?>
							</a>
						</div>
						<div class="secondary">
							<h4><a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>"><?php echo $model["ModelName"]; ?></a></h4>
							<span>
								<?php
								if ($videoObj->settotal == 1) {
									echo $videoObj->settotal . ' ' . $templatefields["txtscene"];
								} else {
									echo $videoObj->settotal . ' ' . $templatefields["txtscenes"];
								}
								?>
							</span>
						</div>
					</div>
				</div>
			<?php } ?>
		<?php } ?>
	</div>
</section>

<section class="container">
	<div class="page-header">
		<h2 style="text-transform: none" class="page-title">With using only getModels() API (preferred):</h2>
		<h3 class="page-subtitle">The count of scenes for Anna and Nadine is incorrect</h3>
	</div>
<pre style="all:revert">
<code style="display: inline-block;padding: 16px;background-color: #fff;color: #000;">
$modelObj = $api->getModels
([
	"sort" => "date",
	"numperpage" => 6,
	"subsiteid" => $subsite['Id']
]);

foreach ($modelObj->models as $model)
{
	...
	echo $model["setcount"] // count of scenes
}	
</code>
</pre>
	<div class="grid grid-models-main">
		<?php if (!isset($individual_update) && !empty($toprated['models'])) { ?>
			<?php $usepriority = 103; ?>
			<?php
			$modelObj = $api->getModels([
				"sort" => "date",
				"numperpage" => 6,
				"subsiteid" => $subsite['Id']
			]);
			foreach ($modelObj->models as $model) {
			?>
				<div class="wrap">
					<div class="thumb">
						<div class="thumb-holder hover">
							<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
								<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => "103", "loading" => "lazy"]); ?>
							</a>
						</div>
						<div class="secondary">
							<h4><a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>"><?php echo $model["ModelName"]; ?></a></h4>
							<span>
								<?php
								if ($model["setcount"] == 1) {
									echo $model["setcount"] . ' ' . $templatefields["txtscene"];
								} else {
									echo $model["setcount"] . ' ' . $templatefields["txtscenes"];
								}
								?>
							</span>
						</div>
					</div>
				</div>
			<?php } ?>
		<?php } ?>
	</div>
</section>