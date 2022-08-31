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
							li.html(`<span>${item.value}</span> <span class="ui-menu-item-sub">(${item.scenes} ${item.scenes == 1 ? "<?php echo $templatefields["txtscene"]; ?>" : "<?php echo $templatefields["txtscenes"]; ?>"})</span>`);
						}
						li.attr("aria-label", item.category + ":" + item.label);
					}
				});
			}
		});
		$("#autosuggest_mobile").catcomplete({
			delay: 0,
			source: function(req, add) {
				$.get('<?php echo $areaurl; ?>advancedsearch.php?q=' + req.term, function(data) {
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
								if (key == "models") resultObj[counter].category = "<?php echo $templatefields["txtmodels"]; ?>";
								if (key == "categories") resultObj[counter].category = "<?php echo $templatefields["txtgenres"]; ?>";
								if (key == "tags") resultObj[counter].category = "<?php echo $templatefields["txttags"]; ?>";
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
				$("#autosuggest_mobile").val(ui.item.value);
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
			$("#autosuggest_mobile").val('');
			$(".search-input .close").hide();
		});
		$(document).on("click", function(e) {
			let searchform = $("#searchform");
			let uibox = $("#ui-id-1");
			if (!searchform.is(e.target) && !uibox.is(e.target) && searchform.has(e.target).length === 0 && uibox.has(e.target).length === 0) {
				$("#autosuggest_mobile").val('');
				$(".search-input .close").hide();
			}
		});
	});
</script>
<form class="search-form" action="search.php" method="get">
	<div class="search-input ui-front">
		<input id="autosuggest_mobile" type="search" name="query" autocomplete="off" placeholder="Type to search...">
	</div>
	<div class="search-icon">
		<button class="search-toggle-mobile" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
	</div>
</form>