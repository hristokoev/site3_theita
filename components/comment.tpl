<div class="comment">
	<div class="comment-header">
		<div class="comment-icon<?php echo ($comment["showasadmin"] == 1) ? '-admin' : ''; ?>" style="color: <?php echo randomColor($comment["displayname"], "light"); ?>"><?php echo randomIcon($comment["displayname"]); ?></div>
		<span class="comment-name<?php echo ($comment["showasadmin"] == 1) ? '-admin' : ''; ?>"><?php echo ($comment["showasadmin"] == 1) ? $comment["displayname"] . ' - ' . $templatefields["txtnetwork"] : $comment["displayname"]; ?></span>
		<span class="comment-date"><?php echo $comment["adddate"]; ?></span>
	</div>
	<span class="comment-text"><?php echo $comment["commenttxt"]; ?></span>
	<?php if ($hasReply) { ?>
		<div class="view-replies" onclick="viewReplies($(this))">
			<span><i class="fa-solid fa-comment-dots"></i><?php echo (count($replies) == 1) ? '1 ' . $templatefields["txtreply"] : count($replies) . ' ' . $templatefields["txtreplies"]; ?></span>
		</div>
		<div class="replies" style="display: none;">
			<?php foreach ($replies as $reply) { ?>
				<div class="reply">
					<div class="comment-header">
						<div class="comment-icon<?php echo ($reply["showasadmin"] == 1) ? '-admin' : ''; ?>" style="color: <?php echo randomColor($reply["displayname"], "light"); ?>"><?php echo randomIcon($reply["displayname"]); ?></div>
						<span class="comment-name<?php echo ($reply["showasadmin"] == 1) ? '-admin' : ''; ?>"><?php echo ($reply["showasadmin"] == 1) ? $reply["displayname"] . ' - ' . $templatefields["txtnetwork"] : $reply["displayname"]; ?></span>
						<span class="comment-date"><?php echo $reply["adddate"]; ?></span>
					</div>
					<span class="comment-text"><?php echo $reply["commenttxt"]; ?></span>
				</div>
			<?php } ?>
		</div>
	<?php } ?>
</div>