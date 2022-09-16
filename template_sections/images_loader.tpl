<?php
$siteurl = isset($trial) ? 'https://trial.vangoren.com' : 'https://members.vangoren.com';
$usetype = ($settype) ? $settype : key($media);
$size = "1024";
?>
<script>
	<?php if (!isset($trial)) { ?>
		const images = [<?php foreach ($media[$usetype] as $k => $photogroup) {
							if ($photogroup["watermark:$usetype:$size"]) { ?> {
						src: "<?php echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $photogroup["watermark:$usetype:$size"]["fullpath"]) ?>",
						width: <?php echo $photogroup["watermark:$usetype:$size"]["width"]; ?>,
						height: <?php echo $photogroup["watermark:$usetype:$size"]["height"]; ?>
					}, <?php echo "\n";
							} else if ($photogroup["jpg:$usetype"]) { ?> {
						src: "<?php echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $photogroup["jpg:$usetype"]["fullpath"]) ?>",
						width: <?php echo $photogroup["jpg:$usetype"]["width"]; ?>,
						height: <?php echo $photogroup["jpg:$usetype"]["height"]; ?>
					},
			<?php
								echo "\n";
							}
						}
			?>
		];
	<?php } ?>

	<?php if (isset($trial)) { ?>
		const images = [
			<?php
			$cnt = 1;
			foreach ($media[$usetype] as $k => $photogroup) {
					if ($photogroup["watermark:$usetype:$size"]) {
			?> {
						src: "<?php if (in_array($cnt, $trial["clickpages"]) || $trial["clickpages"][0] == 0) {
									echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $photogroup["watermark:$usetype:$size"]["fullpath"]);
								} ?>",
						width: <?php echo $photogroup["watermark:$usetype:$size"]["width"]; ?>,
						height: <?php echo $photogroup["watermark:$usetype:$size"]["height"]; ?>,
						index: <?php echo $cnt; ?>
					},
				<?php
						echo "\n";
					} else if ($photogroup["jpg:$usetype"]) {
				?> {
						src: "<?php if (in_array($cnt, $trial["clickpages"]) || $trial["clickpages"][0] == 0) {
									echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $photogroup["jpg:$usetype"]["fullpath"]);
								} ?>",
						width: <?php echo $photogroup["jpg:$usetype"]["width"]; ?>,
						height: <?php echo $photogroup["jpg:$usetype"]["height"]; ?>,
						index: <?php echo $cnt; ?>
					},
			<?php
						echo "\n";
					}
				$cnt++;
			}
			?>
		];
		<?php if ($trial["clickpages"][0] !== 0) { ?>
		const clickpages = [<?php foreach ($trial["clickpages"] as $clickpage) {
								echo $clickpage;
								if ($clickpage !== end($trial["clickpages"])) {
									echo ", ";
								}
							} ?>];
		<?php } ?>
	<?php } ?>
</script>