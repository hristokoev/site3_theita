<?php
// Get total videos
$link = mysqli_connect("localhost", "vangoren", "j90a930rfe", "vangoren");
$sqlvids = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'types' AND `MinorType` = 'vids' AND `siteid` IS NULL LIMIT 1";
$sqlhighres = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'types' AND `MinorType` = 'highres' AND `siteid` IS NULL LIMIT 1";
$sqlmodels = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'models' AND `siteid` IS NULL LIMIT 1";
$resultvids = mysqli_query($link, $sqlvids);
while($row = mysqli_fetch_array($resultvids)) {
    $totalVideos = $row['Num']; 
}
mysqli_free_result($resultvids);
$resulthighres = mysqli_query($link, $sqlhighres);
while($row = mysqli_fetch_array($resulthighres)) {
    $totalPhotos = $row['Num']; 
}
mysqli_free_result($resulthighres);
$resultmodels = mysqli_query($link, $sqlmodels);
while($row = mysqli_fetch_array($resultmodels)) {
    $totalModels = $row['Num']; 
}
mysqli_free_result($resultmodels);
mysqli_close($link);
?>
<?php
// Work In Progress Page
// if (isset($_GET["ex"])) {
// 	LoadTemplate("pages/wip.tpl");
// 	exit();
// }
?>
<?php
if (isset($_GET["trailer"])) {
	header("Location: " . $areaurl . 'trailers/' . $_GET["trailer"] . ".html" . "?nats=" . $_GET["nats"]);
}
?>
<?php include "tour/globals/globals.tpl";
echo "\n"; ?>
<header>
	<div class="header-top">
		<div class="header-wrapper">
			<span><?php echo $templatefields["txtsites"]; ?></span>
			<ul>
				<li><a style="cursor: default"><i class="fa-solid fa-clapperboard"></i>&nbsp;<?php echo $totalVideos . " " . $templatefields["txtvideos"]; ?></a></li>
				<li><a style="cursor: default"><i class="fa-solid fa-camera"></i>&nbsp;<?php echo $totalPhotos . " " . $templatefields["txtphotos"]; ?></a></li>
				<li><a style="cursor: default"><i class="fa-solid fa-venus-mars"></i>&nbsp;<?php echo $totalModels . " " . $templatefields["txtmodels"]; ?></a></li>
			</ul>
		</div>
	</div>
	<div class="header-bottom">
		<div class="header-wrapper">			
				<div class="header-mobile">
					<div class="icon-hamburger">
						<div class="bar1"></div>
						<div class="bar2"></div>
						<div class="bar3"></div>
					</div>
					<div class="sidebar-menu">
						<?php include "components/searchbar_mobile.tpl"; ?>
						<ul>
							<li><a href="<?php echo $areaurl . 'categories/movies/1/latest/'; ?>"><i class="fa-solid fa-video"></i><?php echo $templatefields["txtvideos"]; ?></a></li>
							<li><a href="<?php echo $areaurl . 'categories/photos/1/latest/'; ?>"><i class="fa-solid fa-camera"></i><?php echo $templatefields["txtphotos"]; ?></a></li>
							<li><a href="<?php echo $areaurl; ?>models/1/latest/"><i class="fa-solid fa-face-grin-tongue-wink"></i><?php echo $templatefields["txtmodels"]; ?></a></li>
							<li><a href="<?php echo $areaurl . 'categories/categories.html'; ?>"><i class="fa-solid fa-boxes-stacked"></i><?php echo $templatefields["txtgenres"]; ?></a></li>
							<li><a href="<?php echo $areaurl . 'categories/tags.html'; ?>"><i class="fa-solid fa-hashtag"></i><?php echo $templatefields["txttags"]; ?></a></li>
						</ul>
					</div>
					<div class="mobile-close"></div>
				</div>
			<div class="header-start">
				<a href="<?php echo Index_URL(); ?>" title="<?php echo $templatefields["sitename"]; ?>"><img src="<?php echo $GLOBALS["tourarea"]; ?>images/logo.png" alt="<?php echo $templatefields["sitename"]; ?>"></a>
			</div>
				<div class="header-middle">
					<ul class="nav-wrapper">
						<li class="nav-item"><a href="<?php echo $areaurl . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtvideos"]; ?></a></li>
						<li class="nav-item"><a href="<?php echo $areaurl . 'categories/photos/1/latest/'; ?>"><?php echo $templatefields["txtphotos"]; ?></a></li>
						<li class="nav-item"><a href="<?php echo $areaurl; ?>models/1/latest/"><?php echo $templatefields["txtmodels"]; ?></a></li>
						<li class="nav-item"><a href="<?php echo $areaurl . 'categories/categories.html'; ?>"><?php echo $templatefields["txtgenres"]; ?></a></li>
						<li class="nav-item"><a href="<?php echo $areaurl . 'categories/tags.html'; ?>"><?php echo $templatefields["txttags"]; ?></a></li>
					</ul>
				</div>
			<div class="header-end">
					<a onclick="$('.searchbar').toggleClass('on')" class="button button-icon search"><i class="fa-solid fa-magnifying-glass"></i></a>
					<?php /* TO DO: Languages
				div class="dropdown">
					<div class="select">
						<span class="select-title us"></span>
					</div>
					<ul class="menu">
						<li class="us"></li>
						<li class="it"></li>
						<li class="de"></li>
						<li class="fr"></li>
						<li class="ru"></li>
						<li class="bg"></li>
					</ul>
				</div>
				*/ ?>
					<a href="<?php echo $tour['MembersURL']; ?>" class="button button-log-in button-outline"><?php echo $templatefields["tourtxtlogin"]; ?></a>
					<a href="<?php echo $tour['MembersURL']; ?>" class="button button-icon"><i class="fa-solid fa-user dot" aria-hidden="true"></i></a>
					<?php if ($content['SEOname'] !== "thanks") { ?>
						<a href="<?php echo $tour["JoinUrl"]; ?>" class="button button-join"><?php echo $templatefields["tourtxtjoin"]; ?></a>
						<a href="<?php echo $tour["JoinUrl"]; ?>" class="button button-join-short"><?php echo $templatefields["tourtxtjoinshort"]; ?></a>
					<?php } ?>
			</div>
		</div>
	</div>
	<div class="header-search">
		<?php include "components/searchbar.tpl"; ?>
	</div>
	<script>
		const Popup = Swal.mixin({
			backdrop: 'rgba(0,0,0,0.9)',
			scrollbarPadding: false
		})
	</script>
</header>
<div class="body">
	<?php include "tour/template_sections/slider_primary.tpl"; ?>