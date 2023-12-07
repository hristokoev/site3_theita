<?php
/*
    Function cdn_download()
    Modified cdn_hook() by Koev. 
    > Sets the download URLs to redirect to CDN.
    > Adds action to index.
    */
function cdn_download($file) {
    $config = array(
        'zone'    => 'c773fdff60', // cdn77 zone hash
        'secret'  => 'oTICQQcLEkPXdXoUCxOoePTstIV9HzoQ', // secret key
        'enabled' => true, // enable cdn urls
        'delay'   => '7200', // delay
    );
    $mediaobjects = array('mp4', 'zip', 'wmv', 'mov', 'wav', 'flv', 'jpeg', 'jpg', 'png', 'webp'); // accepted file formats array for cdn
    $path_parts = pathinfo($file);
    $extension = $path_parts['extension'];
    if (in_array($extension, $mediaobjects) && $config['enabled']) {
        // pre parse to correct common cdn url signing compat issues
        while (strpos(($file = str_replace('//', '/', $file)), '//') !== false);  // strip out double slashes
        $file = str_replace(' ', "%20", $file); // urlencode spaces in file names
        if ($file[0] != '/') {
            $file = '/' . $file . '';
        } // check and prepend a initial / if not present
        $uri = $file;
        $disect = pathinfo($uri);
        $ttl = time() + (1 * 1 * 1 * $config['delay']);
        $urilen = strlen($uri);
        $message = $uri . "?expires=" . $ttl . "&l=" . $urilen . "&secret=" . $config['secret'];
        $digest = md5($message);
        $token_value = "?expires=" . $ttl . '&l=' . $urilen . '&token=' . $digest;
        $file = 'https://' . $config['zone'] . '.mjedge.net' . $file . '' . $token_value . '';
        return $file;
    } else {
        return $file;
    }
}
$site_url = $_SERVER['REQUEST_URI'];
$site_url = str_replace('?e=', "&e=", $site_url);
$parameters = parse_url($site_url);
if ($parameters['query'] !== null) {
	parse_str($parameters['query'], $p);
}
$exp = "~(?<=\/)[^\/\?#]+(?=[^\/]*$)~";
if ($p["file"] !== null) {
	preg_match($exp, $p["file"], $match);
}
$file_name = $match[0];
$url_action = $p["action"];
$fp = $p["file"];
if ($url_action == "download") {
    $exp = "~([^\/]+(?=\/[^\/]+\/?$))\/([\w-]*)(\.\w*)~";
    preg_match($exp, $fp, $match);
    $fn = $match[2] . "_" . $match[1] . $match[3];
	$file_url = cdn_download($fp);
    header('Content-Type: octet/stream');
    header("Content-Transfer-Encoding: Binary");
    header("Content-disposition: attachment; filename=\"" . $fn . "\"");
    readfile($file_url);
}