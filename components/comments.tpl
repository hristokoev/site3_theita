<?php
$textMaxLength = 250;
?>
<?php if (!empty($plugins["comments"]) && $has_username) { ?>
	<?php if ($settype == "vids") { ?>
		<div class="page-subheader">
			<h3 class="page-title"><?php echo $templatefields["txtcomments"]; ?></h3>
		</div>
	<?php } ?>
	<?php if ($has_username && !isset($trial)) { ?>
		<div class="comments-box">
			<form id="cmnt" method="post" action="commentpost.php" onsubmit="return commentvalidate(this)">
				<input type="hidden" name="contenttype" value="<?php echo $contenttype; ?>" />
				<input type="hidden" name="itemid" value="<?php echo $itemid; ?>" />
				<input type="hidden" name="displayname" type="text" value="<?php echo $_SERVER['PHP_AUTH_USER']; ?>" />
				<textarea maxlength="<?php echo $textMaxLength; ?>" id="commentbox" name="commenttxt" onfocus="expand(this)" placeholder="<?php echo $templatefields["txtwriteacomment"]; ?>"></textarea>
				<span class="characters"><span class="remaining"><?php echo $textMaxLength; ?></span><?php echo ' ' . $templatefields["txtcharactersremaining"]; ?></span>
				<div class="comment-buttons">
					<a onclick="clearCommentbox()" class="button button-cancel"><?php echo $templatefields["txtcancel"]; ?></a>
					<a onclick="$(this).next().click()" class="button button-submit"><?php echo $templatefields["txtsubmit"]; ?></a>
					<input type="submit" style="display: none;" />
				</div>
			</form>
		</div>
	<?php } else { ?>
		<div class="container content">
			<div class="swal2-validation-message" id="swal2-validation-message" style="display: flex; margin: 0;"><?php echo $templatefields["txtmembersonly"]; ?></div>
		</div>
	<?php } ?>
	<?php if (!array_not_empty($comments) && $has_username) { ?>
		<div class="container content"><span><?php echo $templatefields["txtnocomments"]; ?></span></div>
	<?php } else { ?>
		<div class="comments-box">
			<?php
			if (array_not_empty($comments) && $has_username) {
				$comments = array_reverse($comments);
				$length = count($comments);
				$replies = array();
				for ($i = 0; $i < $length; $i++) {
					if (($comments[$i]["parentid"] == $comments[$i + 1]["Id"] || ($comments[$i]["parentid"] > 0 && $comments[$i]["parentid"]  == $comments[$i + 1]["parentid"])) && isset($comments[$i + 1])) {
						$replies[] = $comments[$i];
						continue;
					}
					if ($comments[$i]["Id"] == $comments[$i - 1]["parentid"]) {
						$hasReply = true;
					} else {
						$hasReply = false;
					}
					LoadTemplate("components/comment.tpl", ["comment" => $comments[$i], "replies" => $replies, "hasReply" => $hasReply]);
					array_shift($replies);
				}
			}
			?>
		</div>
	<?php } ?>
	<script>
		<?php if ($has_username && !isset($trial)) { ?>
			inHeight = 18;
			$("#commentbox").on("input", function() {
				$(this).val($(this).val().replace(/[\r\n\v]+/g, ''));
				charLimit = <?php echo $textMaxLength; ?>;
				length = $(this).val().length;
				remaining = charLimit - length;
				if (length > 0) {
					$(".comment-buttons .button-submit").addClass("button-active");
					$(".comment-buttons .button-submit").removeClass("button-submit");
				} else {
					$(".comment-buttons .button-active").addClass("button-submit");
					$(".comment-buttons .button-active").removeClass("button-active");
				}
				$(".remaining").text(remaining);
			});
			$(document).on("click", function(e) {
				if ($(e.target).closest("#cmnt").length === 0) {
					$("#commentbox").height(inHeight);
				}
			});

			function expand(v) {
				$(v).height(80);
			}

			function clearCommentbox() {
				$("#commentbox").val("");
				$(".remaining").text("<?php echo $textMaxLength; ?>");
				$(".comment-buttons .button-active").addClass("button-submit");
				$(".comment-buttons .button-active").removeClass("button-active");
				$("#commentbox").height(inHeight);
			}
			auto_approve = <?php echo $comments_autoapprove; ?>;

			function commentvalidate(v) {
				pss = new Object();
				pss.ajax = 2;
				pss.contenttype = v.contenttype.value;
				pss.itemid = v.itemid.value;
				pss.displayname = v.displayname.value;
				pss.commenttxt = v.commenttxt.value;
				$.ajax({
					type: "POST",
					url: "commentpost.php",
					dataType: "json",
					data: pss,
					success: function(data) {
						if (data.success == "1") {
							if (auto_approve == 1) {
								document.location.reload();
								return;
							}
						}
						Swal.fire({
							icon: 'error',
							title: '<?php echo $templatefields["txtoops"]; ?>',
							text: data.message,
							backdrop: 'rgba(0,0,0,0.9)',
						})
						return;
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						Swal.fire({
							icon: 'error',
							title: '<?php echo $templatefields["txtoops"]; ?>',
							text: "There has been an error submitting your comment.\nPlease contact support if you continue to see this message.\n\nMessage:\n" + XMLHttpRequest.responseText,
							backdrop: 'rgba(0,0,0,0.9)',
						})
					}
				});
				v.commenttxt.value = "";
				return false;
			}
			$(document).ready(function() {
				clearCommentbox();
			});
		<?php } ?>

		function viewReplies(e) {
			e.next().slideToggle();
		}
	</script>
<?php } ?>