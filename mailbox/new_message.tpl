<form method="POST" onsubmit="return msgvalidate(this)">
	<div class="message-inner">
		<div class="mailbox-form">
			<div class="form-receiver">
				<div class="field">
					<span class="label"><?php echo $templatefields["txtto"]; ?></span>
					<div class="dropdown">
						<div class="select">
							<div class="select-title" name="To"><?php echo $admins[0]["AdminName"]; ?></div>
							<div class="arrow"></div>
						</div>
						<ul class="menu">
							<?php foreach ($admins as $admin) { ?>
								<li value="<?php echo $admin["Id"]; ?>"><?php echo $admin["AdminName"]; ?></li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
			<div class="form-subject">
				<div class="field">
					<span class="label"><?php echo $templatefields["txtsubject"]; ?></span>
					<input name="Subject" value="" />
				</div>
			</div>
			<div class="form-email">
				<div class="field">
					<span class="label"><?php echo $templatefields["txtemail"]; ?></span>
					<input name="Email" value="<?php echo $user["Email"]; ?>" />
				</div>
			</div>
			<div class="form-body">
				<div class="body"><textarea name="Body"></textarea></div>
			</div>
			<div class="form-submit">
				<input class="button-message active" name="Send" type="submit" value="<?php echo $templatefields["txtsend"]; ?>" />
			</div>
		</div>
	</div>
</form>