<?php
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
<loc><?= $areaurl . lang_prefix() ?></loc>
<changefreq>monthly</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php foreach ($sitemap["tour"]["sets"] as $set) { ?>
<url>
<loc><?= full_url(Trailer_URL(["type" => $usetype, "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set])); ?></loc>
<changefreq>monthly</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php } ?>
<?php if (isset($sitemap["news"]) && $enable_news_pages) { ?>
<?php for ($pageno = 1; $pageno <= $sitemap["news"]["numpages"]; $pageno++) { ?>
<url>
<loc><?= full_url(News_URL(["page" => $pageno])) ?></loc>
<changefreq>daily</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php foreach ($sitemap["news"]["newspost"] as $key => $newspost) { ?>
<url>
<loc><?= full_url(News_URL(["news" => $newspost])); ?></loc>
<changefreq>daily</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php } ?>
<?php if (isset($sitemap["models"]) && $enable_model_pages) { ?>
<?php $numpages = ceil(count($sitemap["models"]["model"]) / $sitemap["model_numperpage"]); ?>
<?php for ($pageno = 1; $pageno <= 1; $pageno++) { ?>
<?php $pageURL = full_url(Sets_URL(["page" => $pageno, "s" => "n", "sitemapPage" => "Yes"]));
if (strpos($pageURL, 'models.html') === false) { ?>
<url>
<loc><?= full_url(Sets_URL(["page" => $pageno, "s" => "n"])) ?></loc>
<changefreq>daily</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php } ?>
<?php foreach ($sitemap["models"]["letters"] as $letter => $lettercount) { ?>
<?php $numpages = ceil($lettercount / $sitemap["model_numperpage"]); ?>
<?php } ?>
<?php foreach ($sitemap["models"]["model"] as $model) { ?>
<url>
<loc><?= full_url(Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model])); ?></loc>
<changefreq>daily</changefreq>
<priority>1</priority>
</url>
<?php } ?>
<?php } ?>
<?php if (isset($sitemap["categories"]) && $enable_category_pages) { ?>
<?php foreach ($sitemap["categories"]["category"] as $category) { ?>
<?php $numpages = ceil($category["count"] / $sitemap["category_numperpage"]); ?>
<?php $pageURL = full_url(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "n", "page" => 1]));
if (strpos($pageURL, 'models.html') === false) { ?>
<url>
<loc><?= full_url(Category_URL(["id" => $category["Id"], "seoname" => $category["SEOname"], "category" => $category, "sort" => "n", "page" => 1])) ?></loc>
<changefreq>daily</changefreq>
<priority>1</priority>
</url>
<?php } ?>
?>
<?php } ?>
<?php } ?>
</urlset>