<div class="messages-wrapper">
	<div class="messages">
		<?php
		$onpage = (!empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
		$numperpage = 10;
		$startpos = (($onpage - 1) * $numperpage);
		$total_pages = floor(count($messages) / $numperpage);
		if (count($messages) % $numperpage > 0) {
			$total_pages = $total_pages + 1;
		}
		$arr = array('inbox' => $inbox, 'numberofpages' => $total_pages, 'onpage' => $onpage);
		$messages = array_slice($messages, $startpos, $numperpage);
		?>
		<?php foreach ($messages as $message) { ?>
			<div class="message" id="<?php echo $message["Id"]; ?>">
				<div class="message-content title<?php echo ($message["New"]) ? ' unread' : ''; ?>">
					<?php if ($message["New"]) { ?>
						<strong><?php if ($message["Answered"]) { ?><i class="fa-solid fa-reply"></i><?php } ?><?php echo $message["Subject"]; ?></strong>
					<?php } else { ?>
						<?php if ($message["Answered"]) { ?><i class="fa-solid fa-reply"></i><?php } ?><?php echo $message["Subject"]; ?>
						<?php } ?>
				</div>
				<div class="message-content delete">
					<i class="fa-solid fa-trash-can"></i>
				</div>
				<div class="message-content user"><?php echo $message["AdminName"]; ?></div>
				<div class="message-content date"><?php echo $message["DateSent"]; ?></div>
				<div class="message-content brief"><?php echo $message["Body"]; ?></div>
			</div>
		<?php } ?>
		<?php if (empty($messages)) { ?>
		<div class="content" style="padding: 32px; margin: 32px"><?php echo $templatefields["txtnomessages"]; ?></div>
		<?php } ?>
		<?php ?>
	</div>
</div>
<div class="pagination">
	<?php LoadTemplate("components/pagenav.tpl", ["arr" => $arr]); ?>
</div>