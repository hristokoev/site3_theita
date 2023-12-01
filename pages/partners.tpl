<?php $arr = json_decode($arr, true); $src = ""; ?>

<style>
	.wrap .thumb .logo {
		min-height: 72px;
	}

	.wrap .thumb .logo:hover {
		transform: scale(1.05);
	}	

	.wrap .thumb .logo img {
		margin-inline: auto;
	}

	.wrap .thumb .title {
		text-align: center;
	}
</style>

<section class="container">
	<div class="page-header">
		<h1 style="text-transform: none" class="page-title"><?php echo $content['Title']; ?></h1>
		<h3 class="page-subtitle">Our partners in business</h3>
	</div>
	<div class="grid grid-deals">
		<?php foreach ($arr as $partner) { $src = ($partner["image"] !== "") ? $partner["image"] : "images/partners/dummy.jpg" ?>
		<div class="wrap">
			<div class="thumb">
				<div class="logo">
					<a href="<?php echo $partner["redirect"]; ?>" target="_blank">
						<img src="<?php echo "https://vangoren.com/" . $src ?>" alt="<?php echo $partner["title"]; ?>">						
					</a>
				</div>
				<div class="title">
					<span><a href="<?php echo $partner["redirect"]; ?>" target="_blank"><?php echo $partner["title"]; ?></a></span>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
</section>