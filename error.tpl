<?php
$title = ($subsite) ? $subsite["Name"] : $templatefields["sitename"];
if (isset($GLOBALS["tour"])) {
	LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "error", "title" => $title, "seokey" => "", "seodesc" => ""]);
} else {
	LoadTemplate("template_sections/header.tpl", ["pagename" => "error", "title" => $title, "seokey" => "", "seodesc" => ""]);
}
?>
<div class="main">
	<section class="container">
		<div class="content">
			<p><?php echo $errormessage; ?></p>
			<a href="javascript:history.go(-1);"><?php echo $templatefields["txtgoback"]; ?></a>
		</div>
	</section>
</div>
<?php
if (isset($GLOBALS["tour"])) {
	include "tour/template_sections/footer.tpl";
} else {
	include "template_sections/footer.tpl";
}
?>