<?php
$title = $set["Title"];
$today = date("Y-m-d H:i:s");
LoadTemplate("template_sections/header.tpl", ["pagename" => "gallery", "title" => $title, "seokey" => $set["SEOkey"], "seodesc" => $set["SEOdesc"]]); ?>
<?php
$startpos = (($onpage - 1) * $numperpage + 1);
$endpos   = (($onpage) * $numperpage + 1);
if (isset($trial) && !in_array($onpage, $trial['accesspages'])) {
	header("Location: " . $trial['photourl']);
	die();
}
if (isset($trial) && !in_array($set["Id"], $trial['allowrecent']) && !empty($trial['allowrecent']) && $settype == "vids") {
	header("Location: " . $trial['videourl']);
	die();
}
$bitrates = array();
?>
<?php
// $usetype = ($settype) ? $settype : key($media);
$showbar = 1;
$showbar_zip = 0;
$showbar_watermark = 0;
if (!empty($set["info"]["zips"])) {
	$showbar_zip = 1;
}
if (isset($trial) && $trial['allowzips'] == 0) {
	$showbar_zip = 0;
}
?>
<div class="main">
	<section class="container">
		<?php if ($settype == "vids") { ?>
			<div class="container-inner container-videos">
				<div class="primary">
					<div class="primary-inner">
						<?php LoadTemplate("template_sections/video.tpl"); ?>
					</div>
					<div class="header">
						<h1><?php echo $set["Title"]; ?><?php LoadTemplate("components/bitrate.tpl", ["title" => true]); ?></h1>
					</div>
					<div class="info">
						<div class="buttons">
							<a href="<?php echo Gallery_URL(["type" => "highres", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]); ?>" class="photos"><i class="fa-solid fa-images"></i><?php echo $templatefields["txtphotos"]; ?></a>
							<a href="<?php echo Gallery_URL(["type" => "caps", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]); ?>" class="caps"><i class="fa-solid fa-photo-film"></i><?php echo $templatefields["txtcaps"]; ?></a>
							<a href="javascript:showdownload()" class="download"><i class="fa-solid fa-download"></i><?php echo $templatefields["txtdownload"]; ?></a>
							<?php LoadTemplate("template_sections/favorites_link.tpl", ["set" => $set]); ?>
							<a href="javascript:showreport()" class="report"><i class="fa-solid fa-flag"></i><?php echo $templatefields["txtreport"]; ?></a>
						</div>
						<div class="rating">
							<?php if (empty($voted_sets[$set["Id"]])) { ?>
								<div class="text-s">
									<span><?php echo $templatefields["txtratevideo"]; ?></span>
								</div>
							<?php } ?>
							<?php
							$el1 = (isset($set["PointsRank"]) && $set["PointsRank"] != "") ? $set["PointsRank"] : 10;
							$el2 = (isset($set["PointsTot"]) && $set["PointsTot"] > 0) ? $set["PointsTot"] : 10;
							$rated = round($el1 / $el2 * 10);
							LoadTemplate("components/voteform.tpl", ["id" => $set["Id"], "type" => "set", "rated" => $rated]);
							if (isset($set["PointsTot"])) {
								$rating = $set["PointsRank"] / ($set["PointsTot"] > 0 ? $set["PointsTot"] : 1) * 5;
							}
							?>
						</div>
						<div class="additional">
							<div class="date">
								<span class="text-p"><?php echo date("j F Y", strtotime($set['date'])); ?></span>
							</div>
							<div class="rating-count">
								<?php $rating = $set["plg_ratings_rank"] / (($set["plg_ratings_total"]) ? $set["plg_ratings_total"] : 1) * 10; ?>
								<span><?php echo $rating / 2 ?>/5</span>
							</div>
						</div>
						<div class="pornstars">
							<span class="text-s"><?php echo $templatefields["txtstarring"]; ?>&nbsp;</span><span class="text-p"><?php LoadTemplate("components/list_models.tpl", ["set" => $set, "modellimit" => "999", "today" => $today]); ?></span>
						</div>
						<div class="genres">
							<?php LoadTemplate("components/list_genres.tpl"); ?>
						</div>
						<div class="tags">
							<span class="tags-title"><?php echo $templatefields["txttags"]; ?>:&nbsp;</span><span class="tags-list"><?php LoadTemplate("components/list_tags.tpl", ["class" => "rounded"]); ?></span>
						</div>
						<div class="description">
							<p><?php echo $set["Description"]; ?></p>
						</div>
					</div>
					<?php
					if ($has_username && $plugins["comments"]) {
						LoadTemplate("components/comments.tpl", ["contenttype" => "sets", "settype" => "vids", "itemid" => $set["Id"]]);
					}
					?>
				</div>
				<div class="sidebar">
					<div class="sidebar-inner">
						<?php if ($cms_pro) { ?>
							<div class="title">
								<h3><?php echo $templatefields["txtmoreupdates"]; ?></h3>
							</div>
							<div class="videos">
								<?php
								$layout = [
									"skeleton",
									"bitrate",
									"duration",
									"title",
									"info" => [
										"model",
										"date",
										"stars",
										"title"
									]
								];
								?>
								<?php $i = 0;
								foreach ($relevant as $kex => $relset) { ?>
								<?php
									$media = $api->getContent(["id" => $relset["Id"]]);
									foreach ($media->content['vids'] as $k => $l) {
										foreach ($l as $m => $n) {
											if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
											if ($n['name'] == '4K') $bitrates[] = "4K";
										}
									}
									LoadTemplate("components/thumb_video.tpl", ["set" => $relset, "prefer" => 'vids', "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
									$i++;
									$bitrates = array();
								} ?>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
			<script>
				function download(f) {
					let file = f[f.selectedIndex].value;
					let index = f[f.selectedIndex].index;
					if (file != "" && index != 0) {
						document.location = file;
					}
				}

				function showdownload() {
					<?php if (!isset($trial)) { ?>
						Popup.fire({
							html: `<div class="download-box"><?php
																$usetype = "vids";
																$settype = "vids";
																$media = $api->getContent(["id" => $set["Id"]]);
																foreach ($mediatypes as $mediatype) {
																	foreach ($media->content[$usetype] as $tmp1) {
																		if (isset($tmp1[$mediatype["Name"] . ":" . $mediatype["Type"]]) && ($mediatype["ShowDownload"] >= 1) && ($mediatype["FullVideo"] >= 1)) {
																?><a href="<?php echo $areaurl; ?>?action=download&file=<?php echo $tmp1[$mediatype["Name"] . ":" . $mediatype["Type"]]["fullpath"]; ?>"><?php echo $mediatype["Format"] . ' ' . $mediatype["Label"] .  ' <span>(' . sprintf("%.1f", $tmp1[$mediatype["Name"] . ":" . $mediatype["Type"]]["filesize"] / 1024 / 1024) . ' MB)</span>'; ?></a><?php }
																																																																																																	}
																																																																																																} ?></div>`,
							showCloseButton: true,
							showConfirmButton: false,
							width: '240px'
						})
					<?php } else if (isset($trial)) { ?>
						let timerInterval;
						Popup.fire({
							icon: 'error',
							title: '<?php echo $templatefields["txtmembersonly"]; ?>',
							showCloseButton: true,
							timer: 2000,
							timerProgressBar: true,
							didOpen: () => {
								timerInterval = setInterval(() => {
									window.location.href = "<?php echo $trial['videourl']; ?>"
								}, 2000);
							},
							didDestroy: () => {
								clearInterval(timerInterval);
							}
						})
					<?php } ?>
				}

				function showreport() {
					Popup.fire({
						icon: 'warning',
						title: "<?php echo $templatefields["txtreport"]; ?>",
						html: `<div class="problems active">
							<a class="el" onclick="submitreport(this)"><?php echo $templatefields["txtphotodownload"]; ?></a>
							<a class="el" onclick="submitreport(this)"><?php echo $templatefields["txtphotonotavailable"]; ?></a>
							<a class="el" onclick="submitreport(this)"><?php echo $templatefields["txtphotosmissing"]; ?></a>
							<a class="el" onclick="submitreport(this)"><?php echo $templatefields["txtslowdownload"]; ?></a>
							<a class="el other" onclick="reportother()"><?php echo $templatefields["txtother"]; ?><i class="fa-solid fa-chevron-right"></i></a>
						</div>`,
						showCloseButton: true,
						showConfirmButton: false,
						customClass: {
							htmlContainer: "report-ui"
						}
					})
				}

				function reportother() {
					Popup.fire({
						input: 'textarea',
						inputLabel: '<?php echo $templatefields["txtreport"]; ?>',
						inputPlaceholder: '<?php echo $templatefields["txttypereport"]; ?>',
						inputAttributes: {
							'aria-label': '<?php echo $templatefields["txttypereport"]; ?>'
						},
						showCancelButton: true,
						showClass: {
							backdrop: 'swal2-noanimation',
							popup: '',
							icon: ''
						},
						preConfirm: () => {
							const textarea = Swal.getPopup().querySelector('#swal2-input').value
							if (!textarea) {
								Swal.showValidationMessage('<?php echo $templatefields["txttypereport"]; ?>')
							}
							return textarea;
						}
					}).then((result) => {
						if (result.isConfirmed) {
							submitreport(result.value);
						}
					})
				}

				function submitreport(tx) {
					subject = ($(tx).hasClass("button")) ? "Other" : $(tx).html()
					body = ($(tx).hasClass("button")) ? $("#problem_text").val() : "";
					pss = new Object();
					pss.Subject = "Scene Problem: " + subject;
					pss.Body = body + "\n\n" + "Problem is on this page:\n" + document.location + "\n\nBrowser Information:" + navigator.userAgent;
					pss.Send = "<?php echo $templatefields["txtsend"]; ?>"
					pss.ajax = "2";
					$.post("mailbox.php", pss, function(data) {
						var dtt;
						try {
							dtt = $.parseJSON(data);
						} catch (e) {
							Popup.fire({
								icon: 'error',
								title: '<?php echo $templatefields["txtoops"]; ?>',
								text: '<?php echo $templatefields["txterror"]; ?>: ' + data
							})
							return false;
						}
						Popup.fire({
							text: dtt.message,
							scrollbarPadding: false
						});
					});
				}
			</script>
		<?php } else if ($settype == "highres" || $settype == "caps") { ?>
			<?php LoadTemplate("template_sections/images_loader.tpl"); ?>
			<div class="page-header">
				<h1 class="page-title">
					<?php if ($settype == "highres") { ?>
						<a href="<?php echo Gallery_URL(["type" => "highres", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]); ?>"><?php echo $templatefields["h1_photos"]; ?></a>
					<?php } else if ($settype == "caps") { ?>
						<a href="<?php echo Gallery_URL(["type" => "caps", "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]); ?>"><?php echo $templatefields["h1_caps"]; ?></a>
					<?php } ?>
				</h1>
				<h2 class="page-subtitle"><?php echo $title; ?></h2>
				<?php if ($settype == "highres") { ?>
					<?php if ($showbar) { ?>

						<div class="dropdown">
							<div class="select">
								<span class="select-title"><?php echo $templatefields["txtdownloadphotos"]; ?></span>
								<div class="arrow"></div>
							</div>
							<ul class="menu">
								<?php if ($showbar_zip == 1) { ?>
									<?php foreach ($set["info"]["zips"] as $zip) { ?>
										<li><a href="<?php echo cdn_hook($GLOBALS["contentdir"] . "/upload/" . $set["Directory"] . "/" . $zip["filename"]) ?>"><?php echo $zip["ziptype"]; ?></a></li>
									<?php } ?>
								<?php } else { ?>
									<?php foreach ($set["info"]["zips"] as $zip) { ?>
										<li><a onclick='javascript:(Popup.fire("<?php echo $templatefields["txtmembersonly"]; ?>"))'><?php echo $zip["ziptype"]; ?></a></li>
									<?php } ?>
								<?php } ?>
							</ul>
						</div>

					<?php } ?>
				<?php } ?>
			</div>
			<div class="container-inner container-photos">
				<div class="gallery-block <?php echo ($settype == "highres") ? "photos" : "caps"; ?>" id="photoswipe">
					<?php $cnt = 0; ?>
					<?php foreach ($media[$settype] as $k => $photo) { ?>
						<?php if (($cnt + 1) >= $startpos && ($cnt + 1) < $endpos) { ?>
							<?php $tmpk = $cnt + $column; ?>
							<?php $slc = array_slice($media[$settype], $tmpk, 1); ?>
							<?php $slc = $slc[key($slc)]; ?>
							<?php if ($tmpk + 1 < $endpos && isset($slc)) { ?>
								<?php LoadTemplate("components/photo.tpl", ["photo" => $slc, "n" => $cnt, "pos" => $tmpk]); ?>
							<?php } ?>
						<?php } ?>
						<?php $cnt++; ?>
					<?php } ?>
				</div>
				<div class="pagination">
					<?php LoadTemplate("components/pagenav.tpl"); ?>
				</div>
			</div>
			<script type="module">
				import PhotoSwipeLightbox from 'https://cdn.jsdelivr.net/npm/photoswipe@5.2.8/dist/photoswipe-lightbox.esm.js';
				const galleryEl = document.querySelector('#photoswipe');
				const lightbox = new PhotoSwipeLightbox({
					dataSource: images,
					initialZoomLevel: 'fit',
					maxZoomLevel: 2,
					pswpModule: () => import('https://cdn.jsdelivr.net/npm/photoswipe@5.2.8/dist/photoswipe.esm.js'),
				});
				lightbox.addFilter('thumbEl', (thumbEl, data, index) => {
					const el = galleryEl.querySelector('[data-id="' + data.id + '"] img');
					if (el) {
						return el;
					}
					return thumbEl;
				});
				lightbox.addFilter('placeholderSrc', (placeholderSrc, slide) => {
					const el = galleryEl.querySelector('[data-id="' + slide.data.id + '"] img');
					if (el) {
						return el.src;
					}
					return placeholderSrc;
				});
				lightbox.init();
				window.pswpLightbox = lightbox;
				<?php if (isset($trial) && $trial["clickpages"][0] !== 0) { ?>
					lightbox.on('change', () => {
						if (jQuery.inArray(pswp.currSlide.index + 1, clickpages) == -1) {
							window.location.href = "<?php echo $trial['photourl']; ?>";
						}
					});
				<?php } ?>
			</script>
		<?php } ?>
	</section>
</div>
<?php include "template_sections/footer.tpl"; ?>