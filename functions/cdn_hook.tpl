<?php
/*
 function cdn_hook()
 Input: A string that denotes the filename.
 Returns: A new path to a filename that works with a CDN.
 Requires: This signing method requires HLS manfiest url signing injection
 Mojo Elex HWCDN Plugin
*/
function cdn_hook($file) {
	$enabled = true;
    if (strpos($_SERVER['SERVER_NAME'], "members") !== false) {
        $enabled = false;
    } else if (strpos($_SERVER['SERVER_NAME'], "trial") !== false) {
        $enabled = false;
    }
    $config = array(
        'zone'    => 'g2h4g3s2', // hwcdn zone hash
        'secret'  => 'gwpOcrTx7CBxSqXEYnLUMeUOeb4cenLv', // secret key
        'enabled' => $enabled, // enable cdn urls
        'delay'   => '7200', // delay
    );
    $mediaobjects = array('mp4', 'zip', 'wmv', 'mov', 'wav', 'flv', 'jpeg', 'jpg', 'png', 'webp', 'm3u8'); // accepted file formats array for cdn
    $path_parts = pathinfo($file);
    $extension = $path_parts['extension'];
    if (in_array($extension, $mediaobjects) && ($config['enabled'])) {
        // pre parse to correct common cdn url signing compat issues
        while (strpos(($file = str_replace('//', '/', $file)), '//') !== false);  // strip out double slashes
        $file = str_replace(' ', "%20", $file); // urlencode spaces in file names
        if ($file[0] != '/') {
            $file = '/' . $file . '';
        } // check and prepend a initial / if not present
        $uri = $file;
        $disect = pathinfo($uri);
        $ttl = time() + (1 * 1 * 1 * $config['delay']);
        if ($extension == "m3u8") {
            $pathlen = strlen($disect['dirname']);
            $message = $disect['dirname'] . "?expires=" . $ttl . "&l=" . $pathlen . "&secret=" . $config['secret'];
            $digest = md5($message);
            $token_value = "?expires=" . $ttl . '&l=' . $pathlen . '&token=' . $digest;
            $file = 'https://' . $config['zone'] . '.ssl.hwcdn.net' . $file . '' . $token_value . '';
        } else {
            $urilen = strlen($uri);
            $message = $uri . "?expires=" . $ttl . "&l=" . $urilen . "&secret=" . $config['secret'];
            $digest = md5($message);
            $token_value = "?expires=" . $ttl . '&l=' . $urilen . '&token=' . $digest;
            $file = 'https://' . $config['zone'] . '.ssl.hwcdn.net' . $file . '' . $token_value . '';
        }
        return $file;
    } else {
        return $file;
    }
}