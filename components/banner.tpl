<?php

	if (empty($GLOBALS["plugins"]["banners"])) return;

	$zonename = "top_banner";
	$urllink = "bannerload.php?zone=$zonename";

	if ($subsiteid) {
		$urllink .= "&site=" . $subsiteid;
	}

	if (!empty($contentgroup)) {
		echo "TODO!";
		return;
	}

	if (!empty($allmodels)) {
		$urllink .= "&model=*";
	} elseif (!empty($models["model"]["Id"])) {
		$urllink .= "&model=" . $models["model"]["Id"];
	}

	if (!empty($allcats)) {
		$urllink .= "&cat=*";
	} elseif(!empty($category_selected)) {
		$urllink .= "&cat=" . $category_selected["Id"];
	}

	
?>

<div id="<?= $zonename; ?>">

	<?php foreach ($banners as $banner) {

		$text = "";
		$title = "OUR BIGGEST SALE";	// DEFAULT TITLE
		$button = "JOIN NOW"; 				// DEFAULT TEXT

		$params = explode(",", $banner["Description"]);
		$colorBackground = $params[0] ?? "#000000";
		$colorText = $params[1] ?? "#ffffff";
		$imageHeight = $params[2] ?? "45px";
		
		if ($current_language == 0) {
			$text = $banner["Title"];
		} else {
			$languages = unserialize($banner["langs"]);
			$text = $languages[$current_language]["Title"];
		}
		
		if ($text !== null) {
			$textParts = explode(" | ", $text);
			$title = $textParts[0];
			$button = $textParts[1];
		}

		if ($banner['ZoneId'] == $zonename)
		{
			if ($banner["FileExt"] != "") { ?>
			
			<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>">
				<div class="promo-bar-container animate sticky-promo" id="promo-bar-ref" style="background-color: <?= $colorBackground ?>;" id="<?= $zonename; ?>">
					<div class="promo-bar-contents custom" id="promo-bar-countdown-id">
						<div href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>" class="promo-text-content">
							<img src="<?php echo $GLOBALS["contentdir"] . "contentthumbs/" . $banner["Id"] . "-banner." . $banner["FileExt"]; ?>" id="product-logo-promobar" style="padding: 0px 10px 0px 0px; max-height: <?= $imageHeight ?>"/>
							<div id="promobar-container">
								<div class="promo-desc" style="color: <?= $colorText ?>;"><?= $title ?></div>
								<div class="learnmore" style="color: <?= $colorText ?>;"><?= $button ?></div>
							</div>
							<span class="promo-link">
								<span class="desktop"><?= $button ?></span>
							</span>
						</div>
					</div>
				</div>
			</a>
	
			<?php }
	
			break;
		}
	} ?>

</div>

<script>
<!--
 $(document).ready(function(){
	$.get( "<?= $urllink; ?>" );
 });
-->
</script>

<style>
	.promo-bar-container {
    width: 100%;
    background: #00b24e;
    height: auto;
    max-height: 500px;
    overflow: hidden;
    font-family: arial,sans-serif
}

.promo-bar-container .learnmore {
    display: none
}

.promo-bar-container.sticky-promo {
    position: sticky;
    top: 0;
    z-index: 1020
}

.promo-bar-container.animate {
    animation: slide-in-top .5s cubic-bezier(.25,.46,.45,.94) both
}

.promo-bar-container a {
    text-decoration: none
}

.promo-bar-container a:hover {
    text-decoration: none
}

.promo-bar-container #promobar-container {
    display: flex;
    align-items: center;
    flex-direction: column
}

@keyframes slide-in-top {
    0% {
        transform: translateY(-1000px);
        opacity: 0
    }

    35% {
        transform: translateY(0)
    }

    50% {
        transform: translateY(-7px)
    }

    100% {
        transform: translateY(0);
        opacity: 1
    }
}

.promo-text-content {
    font-family: oswald,sans-serif;
    letter-spacing: 1px;
    font-size: 1.2em;
    width: 100%;
    margin: 0 auto;
    padding: 10px 0;
    text-align: left;
    display: flex;
    align-items: center;
    justify-content: center;
    text-transform: uppercase
}

.promo-text-content .promo-text {
    text-align: left;
    margin-right: .8em;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff
}

.promo-text-content .promo-link {
    border: 2px solid;
    color: #fff;
    padding: 3px 15px;
    white-space: nowrap;
    margin-left: 15px
}

.promo-text-content .promo-link:hover {
    background: #000;
    color: #fff;
    border: 2px solid #000
}

#promo-bar-countdown-id .mobile {
    display: none
}

#promo-bar-countdown-id .countdown {
    display: flex
}

#promo-bar-countdown-id .countdown .countdown-data {
    border: 1px solid #d3d3d3;
    background-color: #d3d3d3;
    color: #000;
    font-size: 1.5em;
    font-weight: 400;
    padding: 5px;
    border-radius: 5px;
    margin-right: 10px;
    min-width: 50px;
    text-align: center
}

#promo-bar-countdown-id .countdown .countdown-data .countdown-text {
    font-size: 8px;
    margin-top: 5px
}

#promo-bar-countdown-id.custom .promo-text {
    display: block;
    margin-left: 5px
}

#promo-bar-countdown-id.custom .learnmore {
    text-align: center;
    margin-top: 2px;
    font-size: .7em;
    display: none;
    text-decoration: underline
}

#promo-bar-countdown-id.custom .promo-text-content .countdown {
    margin: 0
}

#promo-bar-countdown-id.custom .countdown-data {
    background-color: transparent;
    border: 0;
    margin-right: 0
}

#promo-bar-countdown-id.custom .countdown-days-counter::after {
    content: ":";
    position: absolute;
    margin-left: 6px
}

#promo-bar-countdown-id.custom .countdown-hours-counter::after {
    content: ":";
    position: absolute;
    margin-left: 5px
}

#promo-bar-countdown-id.custom .countdown-minutes-counter::after {
    content: ":";
    position: absolute;
    margin-left: 6px
}

@media(max-width: 1200px) {
    .promo-text-content {
        font-size:1em;
        padding: 10px;
        margin-left: 5px
    }
}

@media(max-width: 991.98px) {
    .promo-text-content {
        font-size:.7em
    }

    #promo-bar-countdown-id .promo-link {
        border: 0
    }

    #promo-bar-countdown-id .promo-text {
        max-width: 100%;
        font-size: 14px;
        font-weight: 400
    }

    #promo-bar-countdown-id .mobile {
        display: block!important
    }

    #promo-bar-countdown-id .desktop {
        display: none!important
    }

    #promo-bar-countdown-id.custom .countdown-data {
        background-color: transparent;
        border: 0
    }

    #promo-bar-countdown-id.custom .learnmore {
        display: block
    }

    #promo-bar-countdown-id.custom .promo-link {
        display: none!important
    }
}

@media(max-width: 767.98px) {
    a.promo-text-content {
        padding-bottom:10px;
        margin-left: 0
    }

    .promo-text-content {
        font-size: .7em;
        padding: 5px;
        line-height: 1.2em
    }

    .promo-text-content .countdown {
        margin: 5px 0 12px
    }

    .promo-text-content .promo-text {
        margin-right: 0;
        text-align: center
    }

    .promo-text-content .promo-link {
        padding: 3px 5px
    }

    #product-logo-promobar {
        max-width: none;
        max-height: 30px
    }

    #promobar-container {
        max-width: 65%;
        text-align: center
    }

    #promo-bar-countdown-id.custom a.promo-text-content {
        padding-bottom: 5px
    }

    #promo-bar-countdown-id.custom .promo-text .promo-desc {
        font-size: 12px;
        line-height: 16px;
        text-align: center
    }
}

@media(max-width: 575.98px) {
    .promo-text-content .promo-link {
        padding:3px 5px
    }

    .promo-text-content #product-logo-promobar {
        max-height: 30px
    }

    #promo-bar-countdown-id .countdown .countdown-data {
        font-size: 1.5em;
        padding: 5px 0;
        margin-right: 5px;
        min-width: 30px
    }
}

@media only screen and (max-width: 568px) {
    .promo-text-content {
        font-size:.7em;
        padding: 5px;
        line-height: 1em
    }

    .promo-text-content .promo-text {
        margin-right: 0
    }

    .promo-text-content .promo-link {
        padding: 3px 5px
    }
}

body .promo-bar-container.sticky-promo {
    z-index: 99999
}
</style>