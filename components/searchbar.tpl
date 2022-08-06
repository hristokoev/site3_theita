<script>
	$(function() {
		$.widget("custom.catcomplete", $.ui.autocomplete, {
			_create: function() {
				this._super();
				this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
			},
			_renderMenu: function(ul, items) {
				let that = this,
					currentCategory = "";
				$.each(items, function(index, item) {
					let li;
					if (item.category != currentCategory) {
						ul.append("<li class='ui-autocomplete-category'>" + item.category + "</li>");
						currentCategory = item.category;
					}
					li = that._renderItemData(ul, item);
					if (item.category) {
						if (item.scenes >= 1) {
							li.html(`<span>${item.value}</span> <span class="ui-menu-item-sub">(${item.scenes} ${item.scenes == 1 ? "scene" : "scenes"})</span>`);
						}
						li.attr("aria-label", item.category + ":" + item.label);
					}
				});
			}
		});
		$("#autosuggest").catcomplete({
			delay: 0,
			source: function(req, add) {
				$.get('<?php echo $GLOBALS["areaurl"]; ?>advancedsearch.php?q=' + req.term, function(data) {
					let foundObj = JSON.parse(data);
					let resultObj = [];
					let counter = 0;
					let unique = 0;
					for (const [key, value] of Object.entries(foundObj)) {
						unique = 0;
						for (let i = 0; i < value.length; i++) {
							if (unique >= 10) break;
							if (counter < 12) {
								resultObj[counter] = {};
								let titleUrl = value[i].split("|");
								resultObj[counter].label = titleUrl[0];
								resultObj[counter].scenes = titleUrl[2];
								switch (key) {
									case "models":
										resultObj[counter].href = "models/" + titleUrl[1] + ".html";
										break;
									case "categories":
										resultObj[counter].href = "categories/" + titleUrl[1] + ".html";
										break;
									case "tags":
										resultObj[counter].href = "categories/" + titleUrl[1] + ".html";
										break;
								}
								resultObj[counter].category = key;
								if (key == "categories") resultObj[counter].category = "genres";
								unique++;
							}
							counter++;
						}
					}
					$(".search-input .close").show();
					add(resultObj);
				});
			},
			minLength: 2,
			classes: {
				"ui-autocomplete": "header"
			},
			focus: function(event, ui) {
				$("#autosuggest").val(ui.item.value);
			},
			select: function(event, ui) {
				if (ui.item.scenes >= 1) {
					window.location.href = ui.item.href
				} else {
					let form = $(this).parents('form:first').submit();
				}
			}
		});
		$(".search-input .close").on("click", function() {
			$("#autosuggest").val('');
			$(".search-input .close").hide();
		});
		$(document).on("click", function(e) {
			let searchform = $("#searchform");
			let uibox = $("#ui-id-1");
			if (!searchform.is(e.target) && !uibox.is(e.target) && searchform.has(e.target).length === 0 && uibox.has(e.target).length === 0) {
				$("#autosuggest").val('');
				$(".search-input .close").hide();
			}
		});
	});
</script>
<div class="searchbar">
	<form id="searchform" action="search.php" method="get">
		<div class="search-input">
			<input id="autosuggest" placeholder="Search..." autocomplete="off" class="input" name="query" />
			<span class="close"><i class="fa-solid fa-xmark"></i></span>
		</div>
		<div class="search-icon">
			<button class="search-toggle" aria-label="Open search"><i class="fa-solid fa-magnifying-glass"></i><?php echo $templatefields["txtsearch"]; ?></button>
		</div>
	</form>
	<div class="search-close"></div>
</div>