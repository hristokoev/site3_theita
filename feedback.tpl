<?php

/****
	PLEASE BACK UP FILE BEFORE EDITING!!!
	TEXT EDITING NOTE:
	All text can be edited inside the admin panel to preserve  multi-language site functionality. All tags prefixed with "$templatefields" can be edited inside the CMS admin panel.
 ****/
// Header
// LoadTemplate("template_sections/header.tpl", ["pagename" => "feedback", "title" => "Feedback"]);
?>
<div class="left_column">
	<!--Title-->
	<div class="title_bar"><?= $form["Name"] ?></div>
	<div align="left">
		<?php if ($thankyou) { ?>
			<span class="feedback_success">
				<p><?= $templatefields["txtthankyou"]; ?></p>
				<p><?= $form["ThankYou"] ?></p>
				<p><a href="<?= $form["Redirect"] ?>"><?= $templatefields["txtclickhere"]; ?></a> <?= $templatefields["if you are not redirected"]; ?></p>
			</span>
			<meta http-equiv="refresh" content="2;url=<?= $form["Redirect"] ?>" />
		<?php } else { ?>
			<!--Start Feedback Table-->
			<form style="margin:0px;" action="<?= $form["Action"] ?>" name="<?= $form["Name"] ?>" id="<?= $form["Id"] ?>" method="POST" class="feedback_form">
				<input type="hidden" name="redirect" value="<?= $form["Redirect"] ?>" />
				<input type="hidden" name="id" value="<?= $form["Id"] ?>" />
				<div class="table">
					<?php if ($form["Message"]) { ?>
						<div class="row">
							<div class="cell feedback_fields" align="left">
								<?= $form["Message"] ?>
							</div>
						</div>
					<?php } ?>
					<?php if ($errmsg) { ?>
						<div class="row">
							<div class="cell" style="color:red;">
								<?= $errmsg ?>
							</div>
						</div>
					<?php } ?>
					<div class="row">
						<div class="cell feedback_fields" style="padding-bottom:6px;" align="left"><?= $form["Descr"] ?>
						</div>
					</div>
					<?php foreach ($form["fields"] as $field) { ?>
						<div class="row" style="color:black;">
							<div class="cell feedback_fields" <?php if (in_array($field["ItemType"], ["radio", "checkbox", "textarea"])) { ?> valign="top" <?php } ?>><?= $field["Label"] ?></div>
							<?php if ($field["ItemType"] == "text") { ?>
								<div class="cell feedback_fields"><input type="<?= $field["ItemType"] ?>" name="<?= $field["Name"] ?>" id="<?= $field["Name"] ?>" size="35" value="<?= $field["DefaultValue"] ?>" /></div>
							<?php } elseif ($field["ItemType"] == "textarea") { ?>
								<div class="cell feedback_fields"><textarea name="<?= $field["Name"] ?>" id="<?= $field["Name"] ?>" style="width:270px;" rows="5"><?= $field["DefaultValue"] ?></textarea></div>
							<?php } elseif ($field["ItemType"] == "radio") { ?>
								<div class="table">
									<?php foreach ($field["ItemOption"] as $itemoption) { ?>
										<div class="row">
											<div class="cell"><input name="<?= $field["Name"] ?>" type="radio" value="<?= $itemoption["Value"] ?>" id="<?= $itemoption["OptionId"] ?>" <?php if ($field["DefaultValue"] == $itemoption["Value"]) echo "checked"; ?> /></div>
											<div class="cell"><?= $itemoption["Name"] ?></div>
										</div>
									<?php } ?>
								</div>
						</div>
					<?php } elseif ($field["ItemType"] == "checkbox") { ?>
						<div class="table">
							<div class="row">
								<div class="cell"><input type="checkbox" name="<?= $field["Name"] ?>" id="<?= $field["Name"] ?>" value="1" /></div>
							</div>
						</div>
				</div>
			<?php } elseif ($field["ItemType"] == "select") { ?>
				<select name="<?= $field["Name"] ?>" id="<?= $field["Name"] ?>">
					<?php foreach ($field["ItemOption"] as $itemoption) { ?>
						<option value="<?= $itemoption["Value"] ?>" <?php if ($field["DefaultValue"] == $itemoption["Value"]) echo "selected"; ?>><?= $itemoption["Name"] ?></option>
					<?php } ?>
				</select>
	</div>
<?php } ?>
</div>
<?php } ?>
<div class="row">
	<div class="cell feedback_submit">
		<input type="submit" name="submitfeedback" value="Submit Form" />
	</div>
</div>
</div>
</form>
<!--End Feedback Table-->
<?php } ?>
</div>
</div>
<!--Footer-->
<?php // include "template_sections/footer.tpl"; ?>