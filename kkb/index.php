<?php
error_reporting(0);
//error_reporting(E_ALL);
//start session
session_start();
//require configuration file
require_once('setup.php');
//require other files to use in project
require_once(dirname(__FILE__).'/internal_libs/database.class.php');
require_once(dirname(__FILE__).'/internal_libs/common.class.php');
require_once(dirname(__FILE__).'/external_libs/thumbnail.php');
require_once(dirname(__FILE__).'/external_libs/Smarty-3.1.14/libs/SmartyPaginate.class.php');
require_once(dirname(__FILE__).'/functions/index/index_functions.php');
require_once(dirname(__FILE__).'/functions/common/common_functions.php');

//create common class object
$common = new common();
//set initalize parameter
$task = $action = $kwd = $mode = null;
if(!empty($_GET['task'])) $task = $_GET['task'];
if(!empty($_GET['action'])) $action = $_GET['action'];
if(!empty($_GET['kwd'])) $kwd = $_GET['kwd'];
if(!empty($_GET['mode'])) $mode = $_GET['mode'];
if(!empty($_GET['parent_kwd'])) $parent_kwd = $_GET['parent_kwd'];

//Smarty class
$smarty_appform = new KKB_SMARTY();
$smarty_appform->assign('smpaginate','common/paginate.tpl');
$smarty_appform->assign('mode', 'index');
$smarty_appform->assign('index_file', $index_file);

/* Paginate */
if(empty($_SESSION['task'])) $_SESSION['task'] = $task;
if(empty($_SESSION['action'])) $_SESSION['action'] = $action;
if(empty($_SESSION['kwd'])) $_SESSION['kwd'] = $kwd;
if ($_SESSION['task'] != $task) SmartyPaginate::disconnect();
if (($_SESSION['task'] == $task) and ($_SESSION['action'] != $action)) SmartyPaginate::disconnect();
if (($_SESSION['task'] == $task) and ($_SESSION['action'] == $action) and $_SESSION['kwd'] != $kwd) SmartyPaginate::disconnect();
//disconnect pagination of smarty
SmartyPaginate::disconnect();
SmartyPaginate::connect();
SmartyPaginate::setLimit($limit);
if(SmartyPaginate::getCurrentIndex()) $offset = SmartyPaginate::getCurrentIndex();
if(SmartyPaginate::getLimit()) $limit = SmartyPaginate::getLimit();
//url of pagination
$geturl = '?task='.$task.'&action='.$action.'&id='.urlencode($id).'&kwd='.urlencode($kwd).'&parent_kwd='.urlencode($parent_kwd);
SmartyPaginate::setUrl($geturl);
/* End Paginate */
//varriable initialize
$sum_price = null;
$total_data = null;
$error = '';
// Database connection
$database_connect = new database(DB_HOSTNAME, DB_USER, DB_PASSWORD, DB_DATABASE_NAME);
$database_connect->debug = $debug;
$connected = & $database_connect->_Connect;

if('login' === $task)
{
  $error = array();
  if($_POST)
  {
    //get value from form
    $id = $common->clean_string($_POST['id']);
    $password = $common->clean_string($_POST['password']);
    if (empty($_POST['id']))        $error['id']  = 1;
    if (empty($_POST['password']))  $error['password']  = 1;
    //add value to session to use in template
    $_SESSION['index'] = $_POST;

    if(0 === count($error))
    {
      //compare username and password in form
      $user_id  = userLogin($id, $password);
      if ($user_id)
      {
        //assign value to session
        $_SESSION['is_index_login'] = $user_id['USRID'];
        //remove session to clear data
        unset($_SESSION['index']);
        //redirect to admin.php
        header('Location:'.$index_file);
        exit;

      }
      //wrong username and password
      $error['wrong'] = 1;
    }
  }

  //default of login task
  $smarty_appform->assign('error', $error);
  $smarty_appform->display('index/login.tpl');
  exit;
}

//task: logout by clear session
if('logout' === $task)
{
  unset($_SESSION['is_index_login']);
  header('Location:'.$index_file.'?task=login');
  exit;
}

//redirect if no session
if (empty($_SESSION['is_index_login'])) {header('Location:'.$index_file.'?task=login'); exit; }

/**
* KKB0010
* @author Kenta
*
*/
if ('kkb0010' === $task)
{
  $smarty_appform->display('index/kkb0010.tpl');
  exit;
}
$smarty_appform->assign('loginID',$_SESSION['is_index_login' ]);
$smarty_appform->display('index/index.tpl');
exit;
?>
