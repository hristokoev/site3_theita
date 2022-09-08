<?php
// Don't show code here if user isn't logged in.
if (!$has_username) return;
$isFav = (isset($user_favorites[$set["Id"]])) ? 1 : 0;
$icon_class = ($isFav) ? "heart_pink" : "heart_grey";
$favtxt = ($isFav) ? "txtremovefromfavorites" : "txtaddtofavorites";
?>
<script>
	<?php if (!isset($trial)) { ?>
	function toggleFavorites(vx, setid) {
		let currstatus = (vx.data("fav") == "1") ? "1" : "0";
		let newstatus = (vx.data("fav") == "1") ? "0" : "1";
		let argu = (currstatus == "0") ? "add" : "del";
		let url = "favorites.php?" + argu + "=" + setid + "&ajax=1";
		let title = (newstatus == "1") ? '<?php echo $templatefields["txtaddedtofavorites"]; ?>' : '<?php echo $templatefields["txtremovedfromfavorites"]; ?>'
		vx.data("fav", newstatus + "");
		let txt = (newstatus == "1") ? "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtremovefromfavorites"]; ?>" : "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtaddtofavorites"]; ?>";
		$(".favtxt", vx).html(txt)
		$.ajax({
				url: url,
				dataType: "json"
			})
			.fail(function(jqXHR, textStatus, errorThrown) {
				vx.data("fav", newstatus + "");
				let txt = (currstatus == "1") ? "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtremovefromfavorites"]; ?>" : "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtaddtofavorites"]; ?>";
				$(".favtxt", vx).html(txt);
				Popup.fire("<?php echo $templatefields["txterror"]; ?>");
			})
			.done(function(data) {
				let newstatus = data.is_favorite;
				vx.data("fav", newstatus + "");
				let txt = (newstatus == "1") ? "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtremovefromfavorites"]; ?>" : "<?php echo "<i class='fa-solid fa-xmark'></i>" . $templatefields["txtaddtofavorites"]; ?>";
				$(".favtxt", vx).html(txt);
				if ($('.refresh_favorites').length > 0) {
					location.reload();
				}
			});
		const Toast = Swal.mixin({
			toast: true,
			position: 'top-right',
			customClass: {
				popup: 'colored-toast'
			},
			showConfirmButton: false,
			timer: 1500,
		})
		Toast.fire({
			icon: 'success',
			title: title
		})
		return false;
	}
	<?php } else if (isset($trial)) { ?>
		function toggleFavorites()	{
			Popup.fire({
				icon: 'error',
				title: '<?php echo $templatefields["txtmembersonly"]; ?>',
				showCloseButton: true,
				timer: 2000,
				timerProgressBar: true,
				didOpen: () => {
					timerInterval = setInterval(() => { window.location.href = "<?php echo GET_Username($trial['videourl']); ?>" }, 2000);
				},
				didDestroy: () => {
					clearInterval(timerInterval);
				}
			})
		}
	<?php } ?>
</script>
<a data-fav="<?php echo $isFav ?>" onclick="return toggleFavorites($(this), '<?php echo $set["Id"]; ?>')">
	<?php if ($show_favtxt || 1) { ?>
		<span class="favtxt"><i class="fa-solid <?php echo ($isFav == 0) ? 'fa-heart-circle-plus' : 'fa-xmark'; ?>"></i><?php echo $templatefields[$favtxt]; ?></span>
	<?php } ?>
</a>