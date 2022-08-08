<?php
$prefix = $current_language == 0 ? '' : 'it';
if ($prefix) {
	$GLOBALS["areaurl"] = $GLOBALS["areaurl"] . "" . $prefix . "/";
}
function esc($string) {
	return htmlentities($string, ENT_XML1, 'UTF-8');
}
$enable_tour_pages = 1;
$enable_news_pages = 1;
$enable_model_pages = 1;
$enable_category_pages = 1;
echo '<' . '?xml version="1.0" encoding="UTF-8"?' . '>' . "\n"; ?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xmlns:video="http://www.google.com/schemas/sitemap-video/1.1" xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
	<?php if (isset($sitemap["tour"]) && $enable_tour_pages) { ?>
		<?php for ($pageno = 1; $pageno <= $sitemap["tour"]["numpages"]; $pageno++) { ?>
			<url>
				<loc><?= esc(Index_URL(["page" => $pageno])) ?></loc>
				<changefreq>monthly</changefreq>
				<priority>1</priority>
			</url>
		<?php } ?>
		<?php foreach ($sitemap["tour"]["sets"] as $set) { ?>
			<url>
				<loc><?= esc(Trailer_URL(["type" => $usetype, "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set])); ?></loc>
				<changefreq>monthly</changefreq>
				<priority>1</priority>
				<?php /* 
					<image:image>
					<image:loc><?= full_url(cdn_hook($GLOBALS["areaurl"] . "content/" . esc($set["Directory"]) . "/0.jpg")) ?></image:loc>
					<image:title><?= esc($set["Title"]) ?></image:title>
					<image:caption><?= esc($set["Description"]) ?></image:caption>
					</image:image>
				*/ ?>
				<?php /* if ($set["trailer_url"]){ ?>
	    <video:video>
		<video:content_loc><?= full_url($set["trailer_url"]) ?></video:content_loc>
		<video:thumbnail_loc><?= full_url(cdn_hook($GLOBALS["areaurl"] . "content/" . esc($set["Directory"]) . "/0.jpg")) ?></video:thumbnail_loc>
		<video:title><?= esc($set["Title"]) ?></video:title>
		<video:description><?= esc($set["Description"]) ?></video:description>
		<video:family_friendly>no</video:family_friendly>
	    </video:video>
		<?php }  */ ?>
			</url>
		<?php } ?>
	<?php } ?>
	<?php if (isset($sitemap["news"]) && $enable_news_pages) { ?>
		<?php for ($pageno = 1; $pageno <= $sitemap["news"]["numpages"]; $pageno++) { ?>
			<url>
				<loc><?= esc(News_URL(["page" => $pageno])) ?></loc>
				<changefreq>daily</changefreq>
				<priority>1</priority>
			</url>
		<?php } ?>
		<?php foreach ($sitemap["news"]["newspost"] as $key => $newspost) { ?>
			<url>
				<loc><?= esc(News_URL(["news" => $newspost])); ?></loc>
				<changefreq>daily</changefreq>
				<priority>1</priority>
				<?php /* Disable by default */ ?>
				<?php /*
	    <news:news>
	      <news:publication>
	        <news:name><?= $templatefields["titletxtindex"] ?></news:name>
	        <news:language>en</news:language>
	      </news:publication>
	      <news:genres>Blog,Adult</news:genres>
	      <news:publication_date><?= $newspost["AppearDate"] ?></news:publication_date>
	      <news:title><?= esc($set["Title"]) ?></news:title>
	    </news:news>
	    */ ?>
			</url>
		<?php } ?>
	<?php } ?>
	<?php if (isset($sitemap["models"]) && $enable_model_pages) { ?>
		<?php $numpages = ceil(count($sitemap["models"]["model"]) / $sitemap["model_numperpage"]); ?>
		<?php for ($pageno = 1; $pageno <= 1; $pageno++) { ?>
			<?php $pageURL = esc(Sets_URL(["page" => $pageno, "s" => "n", "sitemapPage" => "Yes"]));
			if (strpos($pageURL, 'models.html') === false) { ?>
				<url>
					<loc><?= esc(Sets_URL(["page" => $pageno, "s" => "n"])) ?></loc>
					<changefreq>daily</changefreq>
					<priority>1</priority>
				</url>
			<?php } ?>
			<?php /* Commented out separate sorting orders */ ?>
			<?php /*
	  <url>
	    <loc><?= esc(Sets_URL(["page" => $pageno, "s" => "p"])) ?></loc>
	  </url>
	  <url>
	    <loc><?= esc(Sets_URL(["page" => $pageno, "s" => "d"])) ?></loc>
	  </url>
	  */ ?>
		<?php } ?>
		<?php foreach ($sitemap["models"]["letters"] as $letter => $lettercount) { ?>
			<?php $numpages = ceil($lettercount / $sitemap["model_numperpage"]); ?>
			<?php //for ($pageno = 1; $pageno <= $numpages; $pageno++){ 
			?>
			<?php /* <url>
				<loc><?= esc(Sets_URL(["page" => $pageno, "sw" => $letter, "s" => "n"])) ?></loc>
				<changefreq>daily</changefreq>
				<priority>1</priority>
			</url> */ ?>
			<?php /* Commented out separate sorting orders */ ?>
			<?php /*
			<url>
				<loc><?= esc(Sets_URL(["page" => $pageno, "sw" => $letter, "s" => "p"])) ?></loc>
			</url>
			<url>
				<loc><?= esc(Sets_URL(["page" => $pageno, "sw" => $letter, "s" => "d"])) ?></loc>
			</url>
			*/ ?>
			<?php //} 
			?>
		<?php } ?>
		<?php foreach ($sitemap["models"]["model"] as $model) { ?>
			<url>
				<loc><?= esc(Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model])); ?></loc>
				<changefreq>daily</changefreq>
				<priority>1</priority>
				<?php /* if (isset($model["info"]["thumbs"])) foreach ($model["info"]["thumbs"] as $thumb)	{ ?>
			<image:image>
			<?php $thumbkey = ($thumb["1x_filename"]) ? "1x_filename" : "filename"; ?>
			<image:loc><?= full_url( cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" .  $thumb[$thumbkey]) ) ?></image:loc>
			<image:title><?= $model["ModelName"] ?></image:title>
			<image:caption><?= $model["ModelName"] ?></image:caption>
			</image:image>
		<?php } */ ?>
			</url>
		<?php } ?>
	<?php } ?>
	<?php if (isset($sitemap["categories"]) && $enable_category_pages) { ?>
		<?php foreach ($sitemap["categories"]["category"] as $category) { ?>
			<?php $numpages = ceil($category["count"] / $sitemap["category_numperpage"]); ?>
			<?php //for ($pageno = 1; $pageno <= $numpages; $pageno++){ 
			?>
			<?php $pageURL = esc(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "n", "page" => 1]));
			if (strpos($pageURL, 'models.html') === false) { ?>
				<url>
					<loc><?= esc(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "n", "page" => 1])) ?></loc>
					<changefreq>daily</changefreq>
					<priority>1</priority>
				</url>
			<?php } ?>
			<?php /* Commented out separate sorting orders */ ?>
			<?php /*
		  <url>
		    <loc><?= esc(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "p"])) ?></loc>
		  </url>
		  <url>
		    <loc><?= esc(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "d"])) ?></loc>
		  </url>
		  */ ?>
			<?php //} 
			?>
		<?php } ?>
	<?php } ?>
</urlset>