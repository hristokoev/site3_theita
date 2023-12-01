<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title"><?php echo $templatefields["h1_tags"]; ?></h1>
			<h2 class="page-subtitle"><?php echo $templatefields["h2_tags"]; ?></h2>
		</div>
		<div class="grid grid-tags">
			<?php
			$i = 0;
			foreach ($tags as $tag) {
				$setobj = $api->getSets(["category_filter" => [$tag["Id"]]]);
				$firstLetter = $tag["Title"][0];
				if ($setobj->settotal > 0) {
					$lettersObj[$firstLetter][$tag["Id"]]          = [];
					$lettersObj[$firstLetter][$tag["Id"]]["Title"] = $tag["Title"];
					$lettersObj[$firstLetter][$tag["Id"]]["Count"] = $setobj->settotal;
					$lettersObj[$firstLetter][$tag["Id"]]["URL"]   = $tag["SEOname"];
					$i++;
				}
			}

			foreach ($lettersObj as $letter => $arr) { ?>
				<div class="tags-letter <?php echo $letter; ?>">
					<div class="tags-holder"><span class="letter"><?php echo $letter; ?></span>
						<?php if (!empty($arr)) { ?>
							<?php foreach ($lettersObj[$letter] as $tag) { ?>
								<a href="<?php echo custom_Category_Landing_URL(["id" => $tag, "seoname" => $tag["URL"]]) ?>" class="tag">
									<span class="hover"><?php echo $tag["Title"]; ?></span> <span class="count"><?php echo $tag["Count"]; ?></span>
								</a>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
			<?php } ?>
		</div>
	</section>
</div>
<script>
	function resizeGridItem(item) {
		grid = document.getElementsByClassName("grid grid-tags")[0];
		rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
		rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));
		rowSpan = Math.ceil((item.querySelector('.tags-holder').getBoundingClientRect().height + rowGap) / (rowHeight + rowGap));
		item.style.gridRowEnd = "span " + rowSpan;
	}

	function resizeAllGridItems() {
		allItems = document.getElementsByClassName("tags-letter");
		for (x = 0; x < allItems.length; x++) {
			resizeGridItem(allItems[x]);
		}
	}

	function resizeInstance(instance) {
		item = instance.elements[0];
		resizeGridItem(item);
	}
	window.onload = resizeAllGridItems();
	window.addEventListener("resize", resizeAllGridItems);
</script>