<?php
$title = $templatefields["title_messages"];
// Header
LoadTemplate("template_sections/header.tpl", ["pagename" => "messaging", "title" => $title]);
?>
<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title"><?php echo $templatefields["h1_messages"]; ?></h1>
			<h2 class="page-subtitle"><?php echo $templatefields["h2_messages"]; ?></h2>
		</div>
		<div class="mailbox">
			<div class="mailbox-menu">
				<a href="<<?php echo $GLOBALS["areaurl"]; ?>mailbox.php?inbox=1" class="button-message <?php echo ($inbox == 1 && $compose == 0) ? 'active' : '' ?>"><span><?php echo $templatefields["txtinbox"]; ?></span></a>
				<a href="<<?php echo $GLOBALS["areaurl"]; ?>mailbox.php?inbox=0" class="button-message <?php echo ($inbox == 0 && $compose == 0) ? 'active' : '' ?>"><span><?php echo $templatefields["txtsent"]; ?></span></a>
				<a href="<<?php echo $GLOBALS["areaurl"]; ?>mailbox.php?compose=1" class="button-message <?php echo ($compose == 1) ? 'active' : '' ?>"><span><?php echo $templatefields["txtnew"]; ?><i class="fa-solid fa-plus"></i></span></a>
			</div>
			<?php
			if ($compose) {
				LoadTemplate("mailbox/new_message.tpl");
			} else if ($messageid) {
				LoadTemplate("mailbox/read_message.tpl");
			} else {
				LoadTemplate("mailbox/view_mailbox.tpl");
			}
			?>
		</div>
	</section>
</div>
<script>
	function msgvalidate(v) {
		subj = "<?php echo $templatefields["txtmailjssubj"]; ?>";
		body = "<?php echo $templatefields["txtmailjsbody"]; ?>";
		if (v.Subject.value == "") {
			Swal.fire({
				icon: 'error',
				title: '<?php echo $templatefields["txtoops"]; ?>',
				text: subj,
				backdrop: 'rgba(0,0,0,0.9)',
			})
			v.Subject.focus();
			return false;
		}
		if (v.Body.value == "") {
			Swal.fire({
				icon: 'error',
				title: '<?php echo $templatefields["txtoops"]; ?>',
				text: body,
				backdrop: 'rgba(0,0,0,0.9)',
			})
			v.Body.focus();
			return false;
		}
		pss = new Object();
		if (v.To.selectedIndex) {
			pss.To = v.To[v.To.selectedIndex].value;
		} else {
			pss.To = v.To.value;
		}
		pss.Subject = v.Subject.value;
		pss.Email = v.Email.value;
		pss.Body = v.Body.value;
		pss.Send = "Send Message";
		pss.ajax = "2";
		if (v.id) {
			pss.id = v.id.value;
		}
		pss.GetEmail = (v.GetEmail.checked) ? 1 : 0;
		$.post("mailbox.php", pss, function(data) {
			var dtt;
			try {
				dtt = $.parseJSON(data);
			} catch (e) {
				Swal.fire({
					icon: 'error',
					title: '<?php echo $templatefields["txtoops"]; ?>',
					text: data,
					backdrop: 'rgba(0,0,0,0.9)',
				})
				return false;
			}
			if (dtt.success == "1") {
				document.location = "mailbox.php";
			} else {
				Swal.fire({
					text: dtt.message,
					backdrop: 'rgba(0,0,0,0.9)',
				});
			}
		});
		return false;
	}
</script>
<script>
	page = <?php echo (!empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1; ?>;
	function confirmdel(id) {
		Swal.fire({
			title: 'Are you sure?',
			text: "You won't be able to revert this!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: 'Yes, delete it!',
			backdrop: 'rgba(0,0,0,0.9)',
		}).then((result) => {
			if (result.isConfirmed) {
				if ($(".messages").children().length > 1 && page >= 1) {
					$.ajax("mailbox.php?delete=" + id);
					$(`#${id}`).remove();
				} else {
					window.location.href = "mailbox.php" + location.search.split("&")[0] + "&delete=" + id + "&page=" + Number(page - 1);
				}
			}
		});
	}
	$(document).ready(function() {
		$(".message").on("click", function() {
			window.location.href = "mailbox.php?inbox=<?php echo $_REQUEST['inbox']; ?>" + "&id=" + this.id;
		})
		$(".delete").on("click", function() {
			event.stopPropagation();
			confirmdel($(this).closest('.message').attr('id'));
		})
	});
</script>
<?php include "template_sections/footer.tpl"; ?>