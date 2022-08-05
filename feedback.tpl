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
	<div class="title_bar"><?php echo $form["Name"]; ?></div>
	<div align="left">
		<?php if ($thankyou) { ?>
			<span class="feedback_success">
				<p><?php echo $templatefields["txtthankyou"]; ?></p>
				<p><?php echo $form["ThankYou"]; ?></p>
				<p><a href="<?php echo $form["Redirect"]; ?>"><?php echo $templatefields["txtclickhere"]; ?></a> <?php echo $templatefields["if you are not redirected"]; ?></p>
			</span>
			<meta http-equiv="refresh" content="2;url=<?php echo $form["Redirect"]; ?>" />
		<?php } else { ?>
			<!--Start Feedback Table-->
			<form style="margin:0px;" action="<?php echo $form["Action"]; ?>" name="<?php echo $form["Name"]; ?>" id="<?php echo $form["Id"]; ?>" method="POST" class="feedback_form">
				<input type="hidden" name="redirect" value="<?php echo $form["Redirect"]; ?>" />
				<input type="hidden" name="id" value="<?php echo $form["Id"]; ?>" />
				<div class="table">
					<?php if ($form["Message"]) { ?>
						<div class="row">
							<div class="cell feedback_fields" align="left">
								<?php echo $form["Message"]; ?>
							</div>
						</div>
					<?php } ?>
					<?php if ($errmsg) { ?>
						<div class="row">
							<div class="cell" style="color:red;">
								<?php echo $errmsg; ?>
							</div>
						</div>
					<?php } ?>
					<div class="row">
						<div class="cell feedback_fields" style="padding-bottom:6px;" align="left"><?php echo $form["Descr"]; ?>
						</div>
					</div>
					<?php foreach ($form["fields"] as $field) { ?>
						<div class="row" style="color:black;">
							<div class="cell feedback_fields" <?php if (in_array($field["ItemType"], ["radio", "checkbox", "textarea"])) { ?> valign="top" <?php } ?>><?php echo $field["Label"]; ?></div>
							<?php if ($field["ItemType"] == "text") { ?>
								<div class="cell feedback_fields"><input type="<?php echo $field["ItemType"]; ?>" name="<?php echo $field["Name"]; ?>" id="<?php echo $field["Name"]; ?>" size="35" value="<?php echo $field["DefaultValue"]; ?>" /></div>
							<?php } elseif ($field["ItemType"] == "textarea") { ?>
								<div class="cell feedback_fields"><textarea name="<?php echo $field["Name"]; ?>" id="<?php echo $field["Name"]; ?>" style="width:270px;" rows="5"><?php echo $field["DefaultValue"]; ?></textarea></div>
							<?php } elseif ($field["ItemType"] == "radio") { ?>
								<div class="table">
									<?php foreach ($field["ItemOption"] as $itemoption) { ?>
										<div class="row">
											<div class="cell"><input name="<?php echo $field["Name"]; ?>" type="radio" value="<?php echo $itemoption["Value"]; ?>" id="<?php echo $itemoption["OptionId"]; ?>" <?php if ($field["DefaultValue"] == $itemoption["Value"]) echo "checked"; ?> /></div>
											<div class="cell"><?php echo $itemoption["Name"]; ?></div>
										</div>
									<?php } ?>
								</div>
						</div>
					<?php } elseif ($field["ItemType"] == "checkbox") { ?>
						<div class="table">
							<div class="row">
								<div class="cell"><input type="checkbox" name="<?php echo $field["Name"]; ?>" id="<?php echo $field["Name"]; ?>" value="1" /></div>
							</div>
						</div>
				</div>
			<?php } elseif ($field["ItemType"] == "select") { ?>
				<select name="<?php echo $field["Name"]; ?>" id="<?php echo $field["Name"]; ?>">
					<?php foreach ($field["ItemOption"] as $itemoption) { ?>
						<option value="<?php echo $itemoption["Value"]; ?>" <?php if ($field["DefaultValue"] == $itemoption["Value"]) echo "selected"; ?>><?php echo $itemoption["Name"]; ?></option>
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