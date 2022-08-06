<?php if ($seo_urls) { ?>
<base href="<?php echo $areaurl; ?>" />
<?php } ?>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<?php if ($seokey) { ?>
<meta name="keywords" content="<?php echo $seokey; ?>" />
<?php } else if ($templatefields["defaultmetakeywords"]) { ?>
<meta name="keywords" content="<?php echo $templatefields["defaultmetakeywords"]; ?>" />
<?php } ?>
<?php if ($seodesc) { ?>
<meta name="description" content="<?php echo $seodesc; ?>" />
<?php } else if ($templatefields["defaultmetadescription"]) { ?>
<meta name="description" content="<?php echo $templatefields["defaultmetadescription"]; ?>" />
<?php } ?>
<meta name="author" content="mvg">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<?php $followsites = ["tour", "trailer", "vids", "movies", "models", "category"];
if (isset($GLOBALS["tour"])) {
	if (in_array($pagename, $followsites)) {
		echo '<meta name="robots" content="index, follow" />';
	}
}
?>