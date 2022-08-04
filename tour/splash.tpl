<div class="warning-container">
	<div class="warning-wrapper" <?php if (!empty($_COOKIE["warn"])) { ?>style="display: none;" <?php } ?>>
		<div class="warning-title">
			<h1><?php echo $templatefields["splashtxtwarning"]; ?></h1>
		</div>
		<div class="warning-text"><?php echo $templatefields["splashtxtmessage"]; ?></div>
		<div class="warning-agree">
			<a href="#" class="button button-enter close">
				<?php echo $templatefields["splashtxtenter"]; ?>
			</a>
		</div>
		<div class="warning-disagree">
			<?php echo $templatefields["splashtxtdisagree"]; ?>
			<a href="http://www.google.com">
				<?php echo $templatefields["splashtxtexit"]; ?>
			</a>
		</div>
	</div>
	<div class="info">
		<?php echo $templatefields["txtlinks"]; ?><br />
		&copy; <?php echo date('Y'); ?><?php echo $templatefields["sitename"]; ?>. <?php echo $templatefields["txtallrightsreserved"]; ?>
	</div>
</div>