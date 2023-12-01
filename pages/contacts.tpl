<section class="container contacts">
	<div class="contacts-header">
		<h3>We'd ❤️ to help!</h3>
		<p>We like to create things with fun, open-minded people. Feel free to say hello!</p>
	</div>
	<div class="contacts-left">
		<div class="contacts-1"><i class="fa-solid fa-location-dot"></i><p>Svetova 523/1, Liben, 180 00, Praha – Czech Republic</p></div>
		<div class="contacts-2"><i class="fa-solid fa-envelope"></i><span>info@vangoren.com</span></div>
	</div>
	<div class="mailbox">
		<form role="form" method="post" id="contact_form">
			<div class="mailbox-form">
				<div class="form-name">
					<div class="field">
						<span class="label">Name</span>
						<input type="text" id="name" name="name" required maxlength="50">
					</div>
				</div>
				<div class="form-email">
					<div class="field">
						<span class="label">Email</span>
						<input type="email" id="email" name="email" required maxlength="50">
					</div>
				</div>
				<div class="form-body">
					<div class="body">
						<textarea type="textarea" name="message" id="message" required maxlength="2000" rows="7"></textarea>
					</div>
				</div>
				<div class="captcha">
					<div class="captcha-image">
						<img src="<?php echo $areaurl . 'contact-form/captcha.php'; ?>" id="captcha_image"/>
						<a id="captcha_reload" href="#">reload</a>
					</div>
					<div class="captcha-input">
						<span class="label">Enter the code from the image here</span>
						<input type="text" required id="captcha" name="captcha" >
					</div>
				</div>				
				<div class="form-submit">
					<div class="submit"><input name="Send" type="submit" value="Send Message" class="button button-submit"></div>
				</div>
			</div>
		</form>
		<div id="success_message" style="display:none;"> <h3>Sent your message successfully!</h3> </div>
	</div>
</section>