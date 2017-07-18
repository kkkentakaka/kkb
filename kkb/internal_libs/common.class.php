<?php
/**
 * File:        common.class.php
 *
 * 共有するライブラリ
 * @copyright 2015 E-KHMER Technology Co., Ltd.
 * @author Sengtha Chay <sengtha@gmail.com>
 * @version 0.1
 */

class common
{
  function common(){}
  //Get remote content
  function clean_string($str)
  {

  	$str = strip_tags($str);
  	$str = stripslashes($str);
  	return $str;
  }

	function sendMail($to, $subject, $body, $from_email,$from_name)
	{
		$headers  = "MIME-Version: 1.0 \n" ;
		$headers .= "From: " .
		       "".$from_name."" ."<".$from_email."> \n";
		$headers .= "Reply-To: " .
		       "".$from_name."" ."<".$from_email."> \n";


		$headers .= "Content-Type: text/plain;charset=UTF-8 \n";

		/* Mail, optional paramiters. */
		$sendmail_params  = "-f$from_email";

		//mb_language("ja");
		//$subject = mb_convert_encoding($subject, "ISO-2022-JP","AUTO");
		//$subject = mb_encode_mimeheader($subject);

		$result = mail($to, $subject, $body, $headers, $sendmail_params);

		return $result;
	}

  //Upload file
  function upload_file($file, $id, $path, $formname)
  {
    $uploadfile = $path . $id."__".basename($file[$formname]['name']);
    $path_info = pathinfo($uploadfile);
    // if(!in_array($path_info['extension'], $allows["EXT"]))
    //   return 1;
    // if($file[$formname]['size']>$allows["SIZE"][0])
    //   return 2;
    if (move_uploaded_file($file[$formname]['tmp_name'], $uploadfile))
    {
      chmod($uploadfile, 0755);
      return $id."__".basename($file[$formname]['name']);
    }
    return 0;
  }
  //Upload file Array
  function uploadFiles($file, $id, $path, $control_name)
  {
    $result = array();
    foreach($file[$control_name]['name'] as $i => $row){
      $id .= $i; // set unique id for douplicat file name
      $upload_file = $path . $id."__".basename($row);
      $path_info = pathinfo($upload_file);
      if (move_uploaded_file($file[$control_name]['tmp_name'][$i], $upload_file))
      {
        chmod ($upload_file, 0755);
        $result[] = $id . "__" . basename ($row);
      }
    }

    if(0 < count($result)) return $result;

    return 0;
  }

  //upload image
  function upload_image($file, $id, $path, $formname, $allows)
  {
    $uploadfile = $path . $id."__".basename($file[$formname]['name']);
    $path_info = pathinfo($uploadfile);

    if (move_uploaded_file($file[$formname]['tmp_name'], $uploadfile))
    {
      chmod($uploadfile, 0755);
      return $id."__".basename($file[$formname]['name']);
    }
    return 0;
  }

  //validate image file
  function image_validator($file, $id, $path, $formname, $allows)
  {
    $uploadfile = $path . $id."__".basename($file[$formname]['name']);
    $path_info = pathinfo($uploadfile);

    // Check filetype
    if(!in_array($path_info['extension'], $allows["EXT"]))  return 1;

    // Check filesize
    if($file[$formname]['size'] > $allows["SIZE"][0])   return 2;

    // Check for errors
    if($file[$formname]['error'] > 0)   return 3;

    // check file existed
    if(file_exists($path . $file[$formname]['name']))   return 4;
  }
  /**
    * @author: E-KHMER
    * upload image
    * @param $file $_FILES
    * @param $id id in time()
    * @param $path file path in server
    * @param $control_name control name
    * @return int|string
    */
  function uploadFile($file, $id, $path, $control_name)
  {
    $upload_file = $path . $id."__".basename($file[$control_name]['name']);
    $path_info = pathinfo($upload_file);
    if (move_uploaded_file($file[$control_name]['tmp_name'], $upload_file))
    {
      chmod ($upload_file, 0755);
      return $id . "__" . basename ($file[$control_name]['name']);
    }

    return 0;
  }

	function num($num){  return number_format($num, 2, '.', ',');  }


  function resolve_url($base, $url, $use_query= false, $use_fragment= false) {
	if(!$use_fragment)
	{
		$base = $this->unparse_url(parse_url($base), $use_query, $use_fragment);
		$url = $this->unparse_url(parse_url($url), $use_query, $use_fragment);
	}

	$__parts = parse_url($base);
	if($__parts["scheme"]."://".$__parts["host"] == $base){  $base = $base."/"; }
  if (!strlen($base)) return $url;
  // Step 2
  if (!strlen($url)) return $base;
  if (strstr($url,"http")) return $url;
  // Step 3
  if (preg_match('!^[a-z]+:!i', $url)) return $url;
  $base = parse_url($base);
  if($use_fragment)
  {
    if ($url{0} == "#") {
          // Step 2 (fragment)
          $base['fragment'] = substr($url, 1);
          return $this->unparse_url($base, $use_query, $use_fragment);
    }
  }
        unset($base['fragment']);
        unset($base['query']);
        if (substr($url, 0, 2) == "//") {
                // Step 4
                return $this->unparse_url(array(
                        'scheme'=>$base['scheme'],
                        'path'=>substr($url,2),
                ), $use_query, $use_fragment);
        } else if ($url{0} == "/") {
                // Step 5
                $base['path'] = $url;
        } else {
                // Step 6
                $path = explode('/', $base['path']);
                $url_path = explode('/', $url);
                // Step 6a: drop file from base
                array_pop($path);
                // Step 6b, 6c, 6e: append url while removing "." and ".." from
                // the directory portion
                $end = array_pop($url_path);
                foreach ($url_path as $segment) {
                        if ($segment == '.') {
                                // skip
                        } else if ($segment == '..' && $path && $path[sizeof($path)-1] != '..') {
                                array_pop($path);
                        } else {
                                $path[] = $segment;
                        }
                }
                // Step 6d, 6f: remove "." and ".." from file portion
                if ($end == '.') {
                        $path[] = '';
                } else if ($end == '..' && $path && $path[sizeof($path)-1] != '..') {
                        $path[sizeof($path)-1] = '';
                } else {
                        $path[] = $end;
                }
                // Step 6h
                $base['path'] = join('/', $path);

        }
        // Step 7
        return $this->unparse_url($base, $use_query, $use_fragment);
	}


	function unparse_url($parsed, $use_query= false, $use_fragment= false)
	{
		if (! is_array($parsed)) return false;
	       $uri = $parsed['scheme'] ? $parsed['scheme'].':'.((strtolower($parsed['scheme']) == 'mailto') ? '':'//'): '';
	       $uri .= $parsed['user'] ? $parsed['user'].($parsed['pass']? ':'.$parsed['pass']:'').'@':'';
	       $uri .= $parsed['host'] ? $parsed['host'] : '';
	       $uri .= $parsed['port'] ? ':'.$parsed['port'] : '';
	       $uri .= $parsed['path'] ? $parsed['path'] : '';
	       if ($use_query) $uri .= $parsed['query'] ? '?'.$parsed['query'] : '';
	       if ($use_fragment) $uri .= $parsed['fragment'] ? '#'.$parsed['fragment'] : '';
	  	return $uri;
	}
  //Get remote content
  function get_remote_contents($url)
	{
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.0; ja; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6");
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
		$str = curl_exec($curl);
		curl_close($curl);
		return $str;
	}
	//Post data
	function postData($url, $data)
	{
		 $ch = curl_init($url);
		 curl_setopt($ch, CURLOPT_POST,1);
		 curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.0; ja; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6");
		 curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
		 curl_setopt($ch, CURLOPT_FOLLOWLOCATION  ,1);
		 curl_setopt($ch, CURLOPT_HEADER,0);  // DO NOT RETURN HTTP HEADERS
		 curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);  // RETURN THE CONTENTS OF THE CALL
		 $Rec_Data = curl_exec($ch);
		 return $Rec_Data;
	}

  public function is_valid_email($email)
  {
    return (preg_match('/^[a-zA-Z0-9_\.\-]+@[A-Za-z0-9_\.\-]+\.[A-Za-z0-9_\.\-]+$/', $email) ? true : false);
  }

  public function is_valid_phone($phone)
  {
    return (preg_match('/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{3,4}$/', $phone) ? true : false);
  }

  public function is_only_number($value)
  {
    return (preg_match('/^[0-9]*$/' , $value) ? true : false);
  }

  //Check password
  function checkPassword($pwd) {
    if (strlen($pwd) < 8) {
        //'Password too short!'
        return false;
    }
    if (!preg_match("#[0-9]+#", $pwd)) {
        //'Password must include at least one number!';
        return false;
    }
    if (!preg_match("#[a-zA-Z]+#", $pwd)) {
        //'Password must include at least one letter!';
        return false;
    }
    return true;
  }

  /**
   * Globle Save function
   * @author Mr. Chheun bunrath
   * @param  string $table
   * @param  array $columns
   * @return integer last inserted id
   */
  function save($table, &$columns)
  {
    global $connected;
    try {
      $sql = 'INSERT INTO ' . $table . '(' . implode(',', array_keys($columns)) . ')
            VALUES(:' . implode(',:', array_keys($columns)) . ')';
      $stm = $connected->prepare($sql);
      // var_dump($stm);exit;
      if ($stm === false) throw new Exception('Error sql statement');

      foreach ($columns as $key => $value) {
        $stm->bindValue(':' . $key, $value, PDO::PARAM_STR);
      }
      $stm->execute();
      return $connected->lastInsertId();
    } catch (Exception $e) {
      // echo $e;exit;
      throw $e;

    }
  }

  /**
   * Globle Update function
   * @author Mr. Chheun bunrath
   * @param  string $table
   * @param  array $columns
   * @param array condition
   * @return boolean
   */
  function update($table, &$columns, $condition = null)
  {
    global $connected;
    try {
      $arr = [];
      foreach ($columns as $key => $value) {
        array_push($arr, $key . ' = :' . $key);
      }
      $sql = 'UPDATE ' . $table . ' SET ' . implode(',', $arr);
      if ($condition != null) {
        $str_condition = ' WHERE ';
        $where = [];
        foreach ($condition as $key => $value) {
          array_push($where, $key . ' = :' . $key);
        }
        if (!empty($where)) {
          $sql .= $str_condition . implode(' AND ', $where);
        }
      }
      $stm = $connected->prepare($sql);
      foreach ($columns as $key => $value) {
        $stm->bindValue(':' . $key, $value, PDO::PARAM_STR);
      }
      if ($condition != null) {
        foreach ($condition as $key => $value) {
          $stm->bindValue(':' . $key, $value, PDO::PARAM_STR);
        }
      }
      return $stm->execute();
    } catch (Exception $e) {
      // echo $e;exit;
      throw $e;
      // throw $e;
    }
  }

  /**
   * Globle Delete function
   * @author Mr. Chheun bunrath
   * @param  string $table
   * @param array condition
   * @return boolean
   */
   function delete($table_name, $condition = null)
   {
     global $connected;
     try {
       if ($table_name == '') throw new Exception('Table name is require');
       $where = ' WHERE ';
       if ($condition != null) {
         $arr_c = [];
         foreach ($condition as $key => $value) {
           array_push($arr_c, $key . '=:' . $key);
         }
         $where .= implode(' AND ', $arr_c);
       }
       $delete = $connected->prepare('DELETE FROM ' . $table_name . $where);
       if ($delete == false) throw new Exception('Error Sql');
       if ($condition != null) {
         foreach ($condition as $key => $value) {
           if ($delete->bindValue(':' . $key, $value, PDO::PARAM_STR) == false) throw new Exception('Error bind value');
         }
       }
       return $delete->execute();
     } catch (PDOException $e) {
      //  echo $e->getMessage();
      //  return false;
      throw $e;
     }
   }

  /**
   * Globle find function
   * @author Mr. Chheun bunrath
   * @param $table table Name
   * @param null $condition
   * @param string $type one or many
   */
  function find($table, $condition = null, $type = 'one')
  {
    global $connected;
    try {
      $arr = [];
      $where = '';
      if ($condition !== null) {
        foreach ($condition as $key => $value) {
          array_push($arr, $key . ' = :' . $key);
        }
        $where = ' WHERE ' . implode(' AND ', $arr);
      }
      $sql = 'SELECT * FROM ' . $table . $where;
      $stm = $connected->prepare($sql);
      if ($where !== '') {
        foreach ($condition as $key => $value) {
          $stm->bindValue(':' . $key, $value, PDO::PARAM_STR);
        }
      }
      $stm->execute();
      return ('one' === $type) ? $stm->fetch(PDO::FETCH_ASSOC) : $stm->fetchAll();
    } catch (Exception $e) {
      // echo $e->getMessage();
      throw $e;

    }
  }

  /**
   * select field name from table
   * @author: CHHOM CHHUNMENG
   * created: 04-03-2016
   * @param  string $table     table name
   * @param  array $columns   field name in array
   * @param  array $condition conditon of sql
   * @return array of one record
   */
  function selectField($table, &$columns, $condition = null, $type = 'one')
  {
    global $connected;
    try {
      $arr = [];
      foreach ($columns as $key) {
        array_push($arr, $key);
      }
      $sql = 'SELECT '. implode(',', $arr).' FROM '.$table;
      if ($condition != null) {
        $str_condition = ' WHERE ';
        $where = [];
        foreach ($condition as $key => $value) {
          array_push($where, $key . ' = :' . $key);
        }
        if (!empty($where)) {
          $sql .= $str_condition . implode(' AND ', $where);
        }
      }
      $stm = $connected->prepare($sql);
      if ($condition != null) {
        foreach ($condition as $key => $value) {
          $stm->bindValue(':' . $key, $value, PDO::PARAM_STR);
        }
      }
      $stm->execute();
      return ('one' === $type) ? $stm->fetch(PDO::FETCH_ASSOC) : $stm->fetchAll();
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  /*
  * Convert date to Japanese date
  * Modified from https://gist.github.com/kazua/8135329
  * @param string $date Date format YYYY/MM/DD
  * @return int  Return only Japanese year
  */
 function convToJapanDate($date) {
     list($year, $month, $day) = explode('/', $date);
     if (!@checkdate($month, $day, $year) || $year < 1869 || strlen($year) !== 4
             || strlen($month) !== 2 || strlen($day) !== 2) return false;
     $date = str_replace('/', '', $date);
     if ($date >= 19890108) {
         $gengo = 4;
         $wayear = $year - 1988;
     } elseif ($date >= 19261225) {
         $gengo = 3;
         $wayear = $year - 1925;
     } elseif ($date >= 19120730) {
         $gengo = 2;
         $wayear = $year - 1911;
     } else {
         $gengo = 1;
         $wayear = $year - 1868;
     }
     switch ($wayear) {
         case 1:
              $wadate = $gengo.'01';
             break;
         default:
             $wadate = $gengo.sprintf("%02d", $wayear);
     }
     return $wadate;
 }
 /*
* Convert Japanese date to normal date
* Modified from https://gist.github.com/kazua/8135329
* @param int $date Japanese year Ex: 425
* @return string Return normal year
*/
function convFromJapanDate($date) {
   $g = substr($date, 0, 1);
   $y = substr($date, 1, strlen($date));

   if ($y === '01') $y = 1;
   if ($g === '4') $y += 1988;
   if ($g === '3') $y += 1925;
   if ($g === '2') $y += 1911;
   if ($g === '1') $y += 1868;

   return $y;
}
/**
 * @author Kimhoun
 * @param $date format japan year date ex: 428
 * @return String
 */
function japanYearHeadName($date)
{
  $head = substr($date, 0, 1);
  $year = substr($date, 1, 2);
  if($head == 1) $headname = "明治".$year;
  if($head == 2) $headname = "大正".$year;
  if($head == 3) $headname = "昭和".$year;
  if($head == 4) $headname = "平成 ".$year;

  return $headname;
}

/**
 * @author Kimhoun
 * @param $month
 * @return String
 */

function japanMonthQi($month)
{
  // echo $month;exit;
  if($month =="04") $qi = "1";
  if($month =="05") $qi = "2";
  if($month =="06") $qi = "3";
  if($month =="07") $qi = "4";
  if($month =="08") $qi = "5";
  if($month =="09") $qi = "6";
  if($month =="10") $qi = "7";
  if($month =="11") $qi = "8";
  if($month =="12") $qi = "9";
  if($month =="01") $qi = "10";
  if($month =="02") $qi = "11";
  if($month =="03") $qi ="12";

  return $qi;
}
/**
 * @author Kimhoun
 * @param $month
 * @return String
 */

// function toEnMonth($month)
function toEnMonth($qi)
{
  if( $qi == 1) $month = "04";
  if( $qi == 2) $month = "05";
  if( $qi == 3) $month = "06";
  if( $qi == 4) $month = "07";
  if( $qi == 5) $month = "08";
  if( $qi == 6) $month = "09";
  if( $qi == 7) $month = "10";
  if( $qi == 8) $month = "11";
  if( $qi == 9) $month = "12";
  if( $qi == 10) $month = "01";
  if( $qi == 11) $month = "02";
  if( $qi == 12) $month = "03";

  return $month;
}
/**
 * [validateIsDate description]
 * @param  [string] $date [format 4280423]
 * @return [boolean]       [True false]
 */
function validateIsDate($date) {
  $year = substr($date, 0, 3);
  $month = substr($date, 3, 2);
  $day = substr($date, 5, 2);

  $g = substr($year, 0, 1);
  $y = substr($year, 1, strlen($date));

  if ($y === '01') $y = 1;
  if ($g === '4') $y += 1988;
  if ($g === '3') $y += 1925;
  if ($g === '2') $y += 1911;
  if ($g === '1') $y += 1868;

  $validate = checkdate($month, $day, $year);

  return $validate;
}
/**
 * [validateIsENDate description]
 * @param  [string] $date [format 20160101]
 * @return [boolean]       [True false]
 */
function validateIsENDate($date) {
  $year = substr($date, 0, 4);
  $month = substr($date, 4, 2);
  $day = substr($date, 6, 2);

  $validate = checkdate($month, $day, $year);

  return $validate;
}
/*
* convFromJapanDatefull
* Modified from https://gist.github.com/kazua/8135329
* @param int $date Japanese year Ex: 4280203
* @return string Return Format 2016-02-03;
*/
function convFromJapanDatefull($date) {
   $year = substr($date, 0, 3);
   $month = substr($date, 3, 2);
   $day = substr($date, 5, 2);

   $g = substr($year, 0, 1);
   $y = substr($year, 1, strlen($date));

   if ($y === '01') $y = 1;
   if ($g === '4') $y += 1988;
   if ($g === '3') $y += 1925;
   if ($g === '2') $y += 1911;
   if ($g === '1') $y += 1868;

   $validate = checkdate($month, $day, $year);

   if($validate === true)
   {
     return $y.'-'.$month.'-'.$day;
     exit;
   }
   else
   {
     echo '';
     exit;
   }
}

/**
* day_diff
* @author Senghak
* @param $date1 format 2016-02-03
* @param $date2 format 2016-02-03
**/
function day_diff($date1, $date2) {
    // 日付をUNIXタイムスタンプに変換
    $timestamp1 = strtotime($date1);
    $timestamp2 = strtotime($date2);
  // echo $timestamp1.' test '.$timestamp2.' and '.$seconddiff = abs($timestamp2 - $timestamp1).' and '.$daydiff = $seconddiff / (60 * 60 * 24);exit;
    // 何秒離れているかを計算
    $seconddiff = abs($timestamp2 - $timestamp1);

    // 日数に変換
    $daydiff = $seconddiff / (60 * 60 * 24);

    // 戻り値
    return $daydiff;

}
/**
*@param $date format 20160101
*@return date format 428.01.01
*/
function convToJPDate($date) {
  $year = substr($date, 0, 4);
  $month = substr($date, 4, 2);
  $day = substr($date, 6, 2);

    // list($year, $month, $day) = explode('/', $date);
    if (!@checkdate($month, $day, $year) || $year < 1869 || strlen($year) !== 4
            || strlen($month) !== 2 || strlen($day) !== 2) return false;
    // $date = str_replace('/', '', $date);
    if ($date >= 19890108) {
        $gengo = 4;
        $wayear = $year - 1988;
    } elseif ($date >= 19261225) {
        $gengo = 3;
        $wayear = $year - 1925;
    } elseif ($date >= 19120730) {
        $gengo = 2;
        $wayear = $year - 1911;
    } else {
        $gengo = 1;
        $wayear = $year - 1868;
    }
    switch ($wayear) {
        case 1:
             $wadate = $gengo.'01';
            break;
        default:
            $wadate = $gengo.sprintf("%02d", $wayear);
    }
    return $wadate.$month.$day;

}
function convFromJPDate($date) {
   $year = substr($date, 0, 3);
   $month = substr($date, 3, 2);
   $day = substr($date, 5, 2);

   $g = substr($year, 0, 1);
   $y = substr($year, 1, strlen($date));

   if ($y === '01') $y = 1;
   if ($g === '4') $y += 1988;
   if ($g === '3') $y += 1925;
   if ($g === '2') $y += 1911;
   if ($g === '1') $y += 1868;

   $validate = checkdate($month, $day, $year);

   if($validate === true)
   {
     return $y.$month.$day;
     exit;
   }
   else
   {
     return false;
   }
}

}
 ?>
