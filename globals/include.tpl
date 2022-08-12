<!-- Favicon -->
<link rel="shortcut icon" href="<?php echo $areaurl; ?>favicon.ico">
<!-- CDN --------- Font Awesome -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6/css/all.min.css">
<!-- CDN --------- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-ui-dist@1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jquery-ui-dist@1.13.1/jquery-ui.min.css">
<?php if ($pagename == "gallery") { ?>
<!-- CDN --------- Plugins\PhotoSwipe -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.min.css">
<!-- CDN --------- Plugins\VideoJS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/video.js@7/dist/video-js.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/videojs-vtt-thumbnails@0.0.13/dist/videojs-vtt-thumbnails.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@silvermine/videojs-quality-selector@1/dist/css/quality-selector.min.css">
<?php } ?>
<!-- CDN --------- Plugins\SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@5.0.11/dark.min.css">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Nunito:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
<!-- Site -->
<script type="text/javascript" defer src="<?php echo $areaurl; ?>js/custom.js"></script>
<script type="text/javascript" defer src="<?php echo $areaurl; ?>js/videohandler.js"></script>
<!-- Style -->
<link href="<?php echo $areaurl; ?>css/main.css" rel="stylesheet" />
<?php if ($templatefields["googleanalyticscode"] != '') { ?>
<script type="text/javascript">
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o),
			m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
	ga('create', '<?php echo $templatefields["googleanalyticscode"]; ?>', 'auto');
	ga('send', 'pageview');
</script>
<?php } ?>