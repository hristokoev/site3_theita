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
	<?php /* TO DO: Put deals and announcements on top, connect with NATS or ELX Admin?
	<div class="header-top">
		<div class="header-wrapper">
			<ul>
				<li><a href="<?php echo $areaurl; ?>network/"><?php echo $templatefields["txtnetwork"]; ?></a></li>
			</ul>			
			<ul>
				<li><a style="cursor: default"><i class="fa-solid fa-clapperboard"></i>&nbsp;<?php echo $totalVideos . " " . $templatefields["txtvideos"]; ?></a></li>
				<li><a style="cursor: default"><i class="fa-solid fa-camera"></i>&nbsp;<?php echo $totalPhotos . " " . $templatefields["txtphotos"]; ?></a></li>
				<li><a style="cursor: default"><i class="fa-solid fa-venus-mars"></i>&nbsp;<?php echo $totalModels . " " . $templatefields["txtmodels"]; ?></a></li>
			</ul>
		</div>
	</div>
	*/ ?>
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
							<li><a href="<?php echo $areaurl . 'network/'; ?>"><i class="fa-solid fa-sitemap"></i><?php echo $templatefields["txtsites"]; ?></a></li>
						</ul>
						<div class="members">
							<a href="<?php echo $tour['MembersURL']; ?>" class="button button-log-in button-outline mobile"><?php echo $templatefields["tourtxtlogin"]; ?></a>
							<a href="<?php echo $tour["JoinUrl"]; ?>" class="button button-join-short mobile"><?php echo $templatefields["tourtxtjoin"]; ?></a>
						</div>	
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
						<li class="nav-item"><a href="<?php echo $areaurl . 'network/'; ?>"><?php echo $templatefields["txtsites"]; ?></a></li>
					</ul>
				</div>
			<div class="header-end">
					<?php if (isset($_GET["test"])) { ?>
					<div class="dropdown">
						<div class="select">
							<span class="select-title us">EN</span>
						</div>
						<ul class="menu">
							<li class="us">EN</li>
							<li class="it">IT</li>
							<li class="de">FR</li>
							<li class="fr">DE</li>
							<li class="ru">ES</li>
							<li class="bg">PT</li>
							<li class="bg">RU</li>
							<li class="bg">JA</li>
						</ul>
					</div>
					<?php } ?>				
					<a onclick="$('.searchbar').toggleClass('on')" class="button button-icon search"><i class="fa-solid fa-magnifying-glass"></i></a>
					<a href="<?php echo $tour['MembersURL']; ?>" class="button button-log-in button-outline"><?php echo $templatefields["tourtxtlogin"]; ?></a>
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
<div class="body" style="margin-top: 65px;">
	<script>
		let hh = $("header").outerHeight(true);
		$(".body").css("margin-top", hh + 'px');
	</script>
	<?php include "tour/template_sections/slider_primary.tpl"; ?>