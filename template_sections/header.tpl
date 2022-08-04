<?php include "globals/globals.tpl"; ?>
<header>
	<div class="header-top <?php echo (isset($GLOBALS["trial"])) ? 'trial-area' : 'member-area'; ?>">
	<div class="header-wrapper">
		<span><?php echo (isset($GLOBALS["trial"])) ? $templatefields["txttrialarea"] . 'You have ' . ' videos left to watch.' : $templatefields["txtmembersarea"]; ?></span>
	</div>		
	</div>
	<div class="header-bottom header">
		<div class="wrapper header-wrapper">
			<div class="header-mobile">
				<div class="icon-hamburger">
					<div class="bar1"></div>
					<div class="bar2"></div>
					<div class="bar3"></div>
				</div>
				<div class="sidebar-menu">
					<form class="search-form" action="search.php" method="get">
						<div class="search-input">
							<input type="search" name="query" autocomplete="off" placeholder="Type to search...">
						</div>
						<div class="search-icon">
							<button class="search-toggle-mobile" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</form>
					<ul>
						<li><a href="<?php echo $GLOBALS["areaurl"] . 'categories/movies/1/latest/' ?>"><i class="fa-solid fa-video"></i><?php echo $templatefields["txtvideos"]; ?></a></li>
						<li><a href="<?php echo $GLOBALS["areaurl"] . 'categories/photos.html' ?>"><i class="fa-solid fa-camera"></i><?php echo $templatefields["txtphotos"]; ?></a></li>
						<li><a href="<?php echo $GLOBALS["areaurl"]; ?>models/1/latest/"><i class="fa-solid fa-face-grin-tongue-wink"></i><?php echo $templatefields["txtmodels"]; ?></a></li>
						<li><a href="<?php echo $GLOBALS["areaurl"] . 'categories/categories.html' ?>"><i class="fa-solid fa-boxes-stacked"></i><?php echo $templatefields["txtgenres"]; ?></a></li>
						<li><a href="<?php echo $GLOBALS["areaurl"] . 'categories/tags.html' ?>"><i class="fa-solid fa-hashtag"></i><?php echo $templatefields["txttags"]; ?></a></li>
					</ul>
				</div>
				<div class="mobile-close"></div>
			</div>
			<div id="logo" class="header-start nav-item sub">
				<a href="<?php echo Index_URL(); ?>" title="<?php echo $templatefields["sitename"]; ?>"><img src="https://theitalianporn.com/images/logo.png" alt="<?php echo $templatefields["sitename"]; ?>"></a>
				<?php if (isset($sites) && !empty($sites)) { ?>
					<span class="menu-down"></span>
				<?php } ?>
			</div>
			<div class="header-middle">
				<ul class="nav-wrapper">
					<li class="nav-item"><a href="<?php echo $GLOBALS["areaurl"] . 'categories/movies/1/latest/' ?>"><?php echo $templatefields["txtvideos"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $GLOBALS["areaurl"] . 'categories/photos.html' ?>"><?php echo $templatefields["txtphotos"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $GLOBALS["areaurl"]; ?>models/1/latest/"><?php echo $templatefields["txtmodels"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $GLOBALS["areaurl"] . 'categories/categories.html' ?>"><?php echo $templatefields["txtgenres"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $GLOBALS["areaurl"] . 'categories/tags.html' ?>"><?php echo $templatefields["txttags"]; ?></a></li>
				</ul>
			</div>
			<div class="header-end bottom">
				<?php include "components/searchbar.tpl"; ?>
				<?php if (!empty($plugins["privatemessage"]) && $has_username) { ?>
					<a href="<?php echo $GLOBALS["areaurl"]; ?>mailbox.php" class="button button-icon button-circle"><i class="fa-solid fa-envelope <?php if ($new_privatemessage) { ?>dot<?php } ?>" aria-hidden="true"></i></a>
				<?php } ?>
				<?php if (!empty($plugins["favorites"]) && $has_username) { ?>
					<a href="<?php echo $GLOBALS["areaurl"]; ?>favorites.php" class="button button-icon button-circle"><i class="fa-solid fa-star"></i></a>
				<?php } ?>
			</div>
			<div id="block" class="nav-block">
				<div class="nav-block-wrapper">
					<div class="nav-block-left">
						<ul>
							<?php $site_name = explode('/', $_SERVER['REQUEST_URI'])[1]; ?>
							<?php foreach ($sites as $site) { ?>
								<li class="subsite <?php echo ($site["Name"] == $site_name) ? 'active' : ''; ?>"><a href="<?php echo 'https://members.vangoren.com/' . $site["Name"]; ?>"><?php echo $site["Name"]; ?></a></li>
							<?php } ?>
						</ul>
					</div>
					<div class="nav-block-main">
						<div class="sub-image"><img id="banner" src="https://via.placeholder.com/991x120/a1acc0/FFFFFF" alt=""></div>
						<h3 class="subsite-title"><span><?php echo $templatefields["txtmostpopular"]; ?>&nbsp;from&nbsp;</span><span class="sitename"><?php echo $site_name; ?></span></h3>
						<?php
						$layout = [
							"skeleton",
							"duration",
							"title",
							"info" => [
								"date",
								"title"
							]
						];
						// TO DO: Get videos via AJAX, currently they're pre-loaded into the HTML and then hidden
						foreach ($sites as $site) {
						?><div class="sub-videos" id="site-<?php echo $site["Name"]; ?>" <?php if ($site["Name"] !== $site_name) { ?>style="display: none;" <?php } ?>><?php
						$$site = get_from_scheduled_updates(5, 4, 'DESC', 1, false, false, $site["Id"]);
						$i = 0;
						foreach ($$site as $set) {
							LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout]);
							$i++;
						}
						?></div><?php } 
					?></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(".subsite").hover(function() {
			$(".sub-videos").hide();
			$(".subsite.active").removeClass("active");
			$(".sitename").text($(this).text());
			//$("#banner").attr("src", `https://${$(this).text()}.com/images/banner_header.jpg`)
			$(this).toggleClass("active");
			let last = $(this).text();
			$("#site-" + last).show();
		});
	</script>
</header>