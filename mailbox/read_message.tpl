<?php $message = $messages[0]; ?>
<form method="POST" onsubmit="return msgvalidate(this)">
	<div class="message-inner">
		<div class="message-content title"><?php echo $message["Subject"]; ?></div>
		<div class="message-content user"><?php echo $message["AdminName"]; ?></div>
		<div class="message-content date"><?php echo $message["DateSent"]; ?></div>
		<div class="message-content body">
			<div class="mailbox-message"><?php echo htmlentities($message["Body"]) ?></div>
		</div>
		<?php if ($message["Inbox"] == 1) { ?>
			<div class="message-reply" onclick="$('#replytable').slideToggle();">
				<span><i class="fa-solid fa-reply"></i></span>
				<input type="button" value="<?php echo $templatefields["txtreply"]; ?>" />
			</div>
		<?php } ?>
		<div class="mailbox-form" style="display: none;" id="replytable">
			<div class="form-subject">
				<div class="field">
					<span class="label"><?php echo $templatefields["txtsubject"]; ?></span>
					<input name="Subject" value="Re: <?php echo $message["Subject"]; ?>" />
				</div>
			</div>
			<div class="form-email">
				<div class="field">
					<span class="label"><?php echo $templatefields["txtemail"]; ?></span>
					<input name="Email" value="<?php echo $user["Email"]; ?>" />
				</div>
			</div>
			<div class="form-body">
				<div class="body">
					<textarea name="Body">* <?php echo $message["AdminName"]; ?>&nbsp;<?php echo $templatefields["txtwrote"]; ?>&nbsp;
					<?php
					$body = explode("\n", $message["Body"]);
					foreach ($body as $key => $value)
						$body[$key] = "> " . $value;
					echo join("\n", $body);
					?>
					</textarea>
				</div>
			</div>
			<div class="form-submit">
				<input type="hidden" name="To" value="<?php echo $message["AdminId"]; ?>" />
				<input class="button-message active" name="Send" type="submit" value="<?php echo $templatefields["txtsend"]; ?>" />
				<input name="id" type="hidden" value="<?php echo $message["Id"]; ?>" />
			</div>
		</div>
	</div>
</form>