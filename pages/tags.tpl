<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title"><?php echo $templatefields["h1_tags"]; ?></h1>
			<h2 class="page-subtitle"><?php echo $templatefields["h2_tags"]; ?></h2>
		</div>
		<div class="grid grid-tags">
			<?php
			$i = 0;
			$a_z = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
			$lettersArr = explode(",", $a_z);
			$lettersObj = [];
			foreach ($lettersArr as $letter) {
				$lettersObj[$letter] = 0;
			}
			foreach ($tags as $tag) {
				$setobj = $api->getSets(["category_filter" => [$tag["Id"]], "numperpage" => 10000]);
				$firstLetter = $tag["Title"][0];
				if ($setobj->settotal > 0) {
					$lettersObj[$firstLetter] += 1;
					$i++;
				}
			}
			$foundArr = array_keys($lettersObj);
			foreach ($foundArr as $letter) {
				if ($lettersObj[$letter] > 0) { ?>
					<div class="tags-letter <?php echo $letter; ?>">
						<div class="tags-holder"><span class="letter"><?php echo $letter; ?></span>
							<?php
							$i = 0;
							foreach ($tags as $tag) {
								$setobj = $api->getSets(["category_filter" => [$tag["Id"]]]);
								if ($tag["Title"][0] == $letter && $setobj->settotal > 0) { ?>
									<a href="<?php echo custom_Category_Landing_URL(["id" => $tag["Id"], "seoname" => $tag["SEOname"], "s" => "d", "category" => $tag]) ?>" class="tag">
										<span class="hover"><?php echo $tag["Title"]; ?></span> <span class="count"><?php echo $setobj->settotal; ?></span>
									</a>
							<?php $i++;
								}
							}
							?>
						</div>
					</div> <?php
						}
					} ?>
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