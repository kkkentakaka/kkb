<?php
date_default_timezone_set('Asia/Tokyo');

//Database setting
define('DB_HOSTNAME', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '@dm1n');
define('DB_DATABASE_NAME', 'kkb');

/* we can use it anywhere */
/* global varriable */
$admin_file = 'admin.php';
$index_file = 'index.php';

$debug = true;
$offset = 0;
$limit = 10;

//Username and password for admin
$admin_username = 'admin';
$admin_password = '098f6bcd4621d373cade4e832627b4f6';

$site_url = 'http://localhost/kkb';

define("FILES_PATH", dirname(__FILE__)."/files/");
$allows   =   array(
  'EXT'   =>  array('jpg', 'png','jpeg', 'gif', 'tiff', 'bmp', 'ico', 'flv', 'mp4', 'ogg', 'webm', 'qt', 'mp3', 'wav', 'acc', 'pdf',
                'doc', 'mov', 'txt', 'xml', 'zip', 'rar'),
  'SIZE'  =>  array('8388608'),
  'TYPE'  =>  array(
        'image' =>  array('image/jpeg', 'image/png', 'image/jpeg', 'image/gif', 'image/bmp', 'image/vnd.microsoft.icon', 'image/tiff'),
        'video' =>  array('video/quicktime', 'video/x-flv', 'video/mp4', 'video/ogg', 'video/webm'),
        'audio' =>  array('audio/mpeg', 'audio/mp4', 'audio/ogg', 'audio/wav', 'audio/aac', 'audio/webm'),
        'document'  =>  array('text/plain', 'application/pdf', 'application/txt', 'application/msword', 'application/xml', 'application/zip', 'application/x-rar-compressed')
  )
);

//Thumbnail
$thumbnail_width= 140;
$thumbnail_height = 140;


//require smarty class
require_once('external_libs/Smarty-3.1.14/libs/Smarty.class.php');
//create new class extend from Smarty Class
class KKB_SMARTY extends Smarty
{
  function __construct()
  {
		parent::__construct();
		$this->template_dir = 'designs/templates/';
		$this->compile_dir = 'designs/templates_c/';
		$this->config_dir = 'designs/configs/';
		$this->cache_dir = 'designs/cache/';

		$this->assign('app_name', 'kkb');

  }
}
