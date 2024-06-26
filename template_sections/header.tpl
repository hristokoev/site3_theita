<?php
include "globals/globals.tpl";
echo "\n";
$detect = new Mobile_Detect;
$parse = parse_url($areaurl);
$url = "https://" . $parse['host'] . '/';
?>
<header>
	<div class="header-top <?php echo (isset($trial)) ? 'trial-area' : 'member-area'; ?>">
		<div class="header-wrapper">
			<span><?php echo (isset($trial)) ? $templatefields["txttrialarea"] : $templatefields["txtmembersarea"]; ?></span>
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
					<div class="buttons">
						<?php if (!empty($plugins["privatemessage"]) && $has_username) { ?>
							<a href="<?php echo GET_Username($trial['videourl']); ?>" class="button button-outline"><i class="fa-solid fa-envelope"></i><?php echo $templatefields["txtmessages"]; ?></a>
						<?php } ?>
						<?php if (!empty($plugins["favorites"]) && $has_username && !isset($trial)) { ?>
							<a href="<?php echo GET_Username($trial['videourl']); ?>" class="button button-outline"><i class="fa-solid fa-star"></i><?php echo $templatefields["txtfavorites"]; ?></a>
						<?php } ?>
					</div>
					<?php include "components/searchbar_mobile.tpl"; ?>
					<ul>
						<li><a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><i class="fa-solid fa-video"></i><?php echo $templatefields["txtvideos"]; ?></a></li>
						<li><a href="<?php echo $areaurl . lang_prefix() . 'categories/photos/1/latest/'; ?>"><i class="fa-solid fa-camera"></i><?php echo $templatefields["txtphotos"]; ?></a></li>
						<li><a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/"><i class="fa-solid fa-face-grin-tongue-wink"></i><?php echo $templatefields["txtmodels"]; ?></a></li>
						<li><a href="<?php echo $areaurl . lang_prefix() . 'categories/categories.html'; ?>"><i class="fa-solid fa-boxes-stacked"></i><?php echo $templatefields["txtgenres"]; ?></a></li>
						<li><a href="<?php echo $areaurl . lang_prefix() . 'categories/tags.html'; ?>"><i class="fa-solid fa-hashtag"></i><?php echo $templatefields["txttags"]; ?></a></li>
						<li><a href="<?php echo $areaurl . lang_prefix() . 'sites/'; ?>"><i class="fa-solid fa-sitemap"></i><?php echo $templatefields["txtsites"]; ?></a></li>	
					</ul>
					<h6><?php echo $templatefields["txtnetwork"]; ?></h6>
					<ul class="sites">
						
						<?php foreach ($sites as $site) { ?>
							<li class="subsite <?php echo ($site["Name"] == $area['Sitename']) ? 'active' : ''; ?>"><a href="<?php echo $url . $site["Name"] . '/' . lang_prefix(); ?>"><?php echo $site["Name"]; ?></a></li>
						<?php } ?>
					</ul>
					<?php include "components/lang_switcher_mobile.tpl"; ?>
				</div>
				<div class="mobile-close"></div>
			</div>
			<div id="logo" class="header-start nav-item sub">
				<?php if (isset($sites) && array_not_empty($sites)) { ?>
					<span onclick="blockReveal()" class="menu-down"></span>
				<?php } ?>
				<a href="<?php echo $areaurl . lang_prefix(); ?>" title="<?php echo $templatefields["sitename"]; ?>"><img src="<?php echo $areaurl; ?>images/logo.png" alt="<?php echo $templatefields["sitename"]; ?>"></a>
			</div>
			<div class="header-middle">
				<ul class="nav-wrapper">
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtvideos"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix() . 'categories/photos/1/latest/'; ?>"><?php echo $templatefields["txtphotos"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/"><?php echo $templatefields["txtmodels"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix() . 'categories/categories.html'; ?>"><?php echo $templatefields["txtgenres"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix() . 'categories/tags.html'; ?>"><?php echo $templatefields["txttags"]; ?></a></li>
					<li class="nav-item"><a href="<?php echo $areaurl . lang_prefix() . 'sites/'; ?>"><?php echo $templatefields["txtsites"]; ?></a></li>
				</ul>
			</div>
			<div class="header-end bottom">
				<div class="dropdown languages" id="switcher">
					<div class="select">
						<span class="flag flag-sm flag-<?php if (lang_prefix() == "") echo 'en'; else echo substr(lang_prefix(), 0, 2); ?>"></span>
					</div>
				</div>
				<button type="button" onclick="$('.searchbar').toggleClass('on');" class="button button-icon search"><i class="fa-solid fa-magnifying-glass"></i></button>
				<?php if (!empty($plugins["privatemessage"]) && $has_username) { ?>
					<a href="<?php echo $areaurl . lang_prefix(); ?>mailbox.php" class="button button-icon"><i class="fa-solid fa-envelope <?php if ($new_privatemessage) { ?>dot<?php } ?>" aria-hidden="true"></i></a>
				<?php } ?>
				<?php if (!empty($plugins["favorites"]) && $has_username && !isset($trial)) { ?>
					<a href="<?php echo $areaurl . lang_prefix(); ?>favorites.php" class="button button-icon"><i class="fa-solid fa-star"></i></a>
				<?php } ?>
				<?php if (isset($trial)) { ?>
					<a href="<?php echo GET_Username($trial['videourl']); ?>" class="button button-join"><?php echo $templatefields["trialtxtupgradeshort"]; ?></a>
					<a href="<?php echo GET_Username($trial['videourl']); ?>" class="button button-join-short"><?php echo $templatefields["trialtxtupgradeshort"]; ?></a>
				<?php } ?>
			</div>
			<div id="block" class="nav-block" style="width: 100%;">
				<div class="nav-block-wrapper">
					<div class="nav-block-left">
						<ul>
							<?php foreach ($sites as $site) { ?>
								<li class="subsite <?php echo ($site["Name"] == $area['Sitename']) ? 'active' : ''; ?>"><a href="<?php echo $url . $site["Name"] . '/' . lang_prefix(); ?>"><?php echo $site["Name"]; ?></a></li>
							<?php } ?>
						</ul>
					</div>
					<div class="nav-block-main">
						<?php
						$layout = [
							"skeleton",
							"duration",
							"title",
							"info" => [
								"date",
								"model",
								"title"
							]
						];
						// TO DO: Get videos via AJAX, currently they're pre-loaded into the HTML and then hidden
						foreach ($sites as $site) {
							$siteurl = $url . $site["Name"] . '/';
						?><div class="site" id="site-<?php echo $site["Name"]; ?>" <?php if ($site["Name"] !== $area['Sitename']) { ?>style="display: none;" <?php } ?>>
								<div class="sub-image"><a href="<?php echo $siteurl . lang_prefix(); ?>"><img id="banner" src="<?php echo 'https://' . $site["Name"] . '.com/images/banners/banner_992x155.jpg'; ?>" alt="" width="992" height="155"></a></div>
								<h3 class="subsite-title"><span><?php echo $templatefields["txtlatestvideos"]; ?>&nbsp;&#8212;&nbsp;</span><span class="sitename"><?php echo $area['Sitename']; ?></span></h3>
								<div class="sub-videos"><?php
														$siteName = strval($site["Name"]);
														$$siteName = get_from_scheduled_updates(5, 4, 'DESC', 1, false, false, $site["Id"]);
														$i = 0;
														foreach ($$siteName as $set) {
															LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout, "url" => $siteurl]);
															$i++;
														}
														?></div>
							</div><?php }
									?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-search">
		<?php include "components/searchbar.tpl"; ?>
	</div>
	<div class="lang-switch">
	<?php include "components/lang_switcher.tpl"; ?>
	</div>
	<script>
		function blockReveal() {
			$("#block").toggle();
			$(".menu-down").toggleClass("pressed");
		}

		$(".subsite").hover(function() {
			$(".site").hide();
			$(".subsite.active").removeClass("active");
			$(".sitename").text($(this).text());
			$(this).toggleClass("active");
			let last = $(this).text();
			$("#site-" + last).show();
			$(".nav-block-main").prepend('<div class="loading lds-dual-ring"></div>');

			$("#site-" + last + " img").one("load", function() {
				$(".loading").remove();
			}).each(function() {
				if (this.complete) {
					$(this).trigger('load');
				}
			});
		});

		$(document).on("click", function(e) {
			if ($(e.target).closest("#logo").length === 0 && $(e.target).closest("#block").length === 0) {
				$("#block").hide();
				$(".menu-down").removeClass("pressed");
			}
		});

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