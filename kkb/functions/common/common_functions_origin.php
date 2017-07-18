<?php
function calShipParkingFee($ship_id, $fee_type, $count)
{
  global $debug, $connected;
  $sql = 'SELECT * FROM KW0030 WHERE KW03_SENCD = :ship_id';
  $stm = $connected->prepare($sql);
  $stm->bindValue(':ship_id',$ship_id, PDO::PARAM_INT);
  $stm->execute();
  $ship = $stm->fetchAll();
  $tax_percent = $_SESSION['tax'];

  if(isset($ship)){
   $ton = floatval($ship[0]['KW03_TONSU']);
   $kou = $ship[0]['KW03_KOURKBN'];

   if($ton < 20 && $ship[0]['KW03_SENPKBN'] === '3'){
    // free!
    return array('fee'=>0, 'total'=>0);
   }

   if($fee_type === 1)
   {
    if($kou === '11' || $kou === '12')
    {
      $unit = 2;
    }
    else{
      $unit = 3;
    }
    $fee = $count*ceil($ton)*$unit;
    if ($kou === '12' || $kou === '02') {
      $tax = 0;
    }
    else
    {
      $tax = $fee*($tax_percent/100);
    }
    return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
   }
   else if($fee_type === 2){
    $unit = 0;
    if($ton >= 0 && $ton < 5){
      $unit = 150;
    }
    else if($ton >= 5 && $ton < 10){
      $unit = 170;
    }
    else if($ton >= 10 && $ton < 20){
      $unit = 200;
    }
    else if($ton >= 20 && $ton < 50){
      $unit = 300;
    }
    else if($ton >= 50 && $ton < 100){
      $unit = 400;
    }
    else if($ton >= 100 && $ton < 200){
      $unit = 500;
    }
    else{
      if($kou === '11' || $kou === '12'){
        $unit = 2;
      }
      else{
        $unit = 3;
      }
    }

    $fee = $count*ceil($ton)*$unit;
    if($ton < 200){
      $fee = $count*$unit;
    }
    if ($kou === '12' || $kou === '02') {
      $tax = 0;
    }
    else
    {
      $tax = $fee*($tax_percent/100);
    }
    return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
   }
   else if($fee_type === 3){
    $unit = 1.5;
    $fee = $count*ceil($ton)*$unit;
    if ($kou === '12' || $kou === '02') {
      $tax = 0;
    }
    else
    {
      $tax = $fee*($tax_percent/100);
    }
    return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
   }
  }

  return array('fee'=>0, 'total'=>0);
}

function calSpaceFee($fee_type, $size, $count)
{
  $unit = 0;
  $tax_percent = $_SESSION['tax'];
  $vol = ceil($size*10)/10;

  if($fee_type === 1){
    $unit = 30;
  }
  else if($fee_type === 2){
    $unit = 40;
  }
  else if($fee_type === 3){
    $unit = 40;
  }
  else if($fee_type === 4){
    $unit = 40;
  }

  $fee = $count*$vol*$unit;
  $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}

function calLandSpaceFee($type, $size, $count, $cal_params)
{
  $tax_percent = $_SESSION['tax'];
  $unit = 0;
  $fee = 0;
  $tax = 0;
  if($type == 0){
    $unit = 100;
    $start_minus = 0;
    $end_minus = 0;
    if($cal_params){
      if($cal_params['start_ofs'] > 0){
        $start_minus = (int)($unit*$size) - ($unit*$size*((int)$cal_params['last_of_start'] - (int)$cal_params['start_ofs'])/(int)$cal_params['last_of_start']);
      }
      if($cal_params['end_ofs'] > 0){
        $end_minus = (int)($unit*$size) - ($unit*$size*((int)$cal_params['last_of_end'] - (int)$cal_params['end_ofs'])/(int)$cal_params['last_of_end']);
      }
    }

    $fee = ($count*$unit*$size) - (int)$start_minus - (int)$end_minus;
    if($fee < 0){
      $fee = 0;
    }
    $tax = $fee*($tax_percent/100);
  }
  else{
    if($count <= 5){
      $unit = 30;
    }
    else if($count <= 10 && $count >= 6){
      $unit = 60;
    }
    else if($count >= 11){
      $unit = 90;
    }
    $fee = ($count*$unit*$size);
    $tax = $fee*($tax_percent/100);
  }
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}

function calPortSpaceFee($size, $count, $cal_params)
{
  $tax_percent = $_SESSION['tax'];
  $monthly_unit = 60;
  $daily_unit = 2;
  $fee = 0;
  $tax = 0;
  if($cal_params){
    $fee = ((int)$cal_params['months']*$monthly_unit*$size) + ((int)$cal_params['days']*$daily_unit*$size);
    $tax = $fee*($tax_percent/100);
  }
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}
function calStoringFee($type, $size, $count, $cal_params)
{
  $tax_percent = $_SESSION['tax'];
  $vol = ceil($size*10)/10;
  $unit = 0;
  $fee = 0;
  $tax = 0;

  if($type == 0){
    $unit = 350;
    $start_minus = 0;
    $end_minus = 0;
    if($cal_params){
      if($cal_params['start_ofs'] > 0){
        $start_minus = (int)($unit*$size) - ($unit*$size*((int)$cal_params['last_of_start'] - (int)$cal_params['start_ofs'])/(int)$cal_params['last_of_start']);
      }
      if($cal_params['end_ofs'] > 0){
        $end_minus = (int)($unit*$size) - ($unit*$size*((int)$cal_params['last_of_end'] - (int)$cal_params['end_ofs'])/(int)$cal_params['last_of_end']);
      }
    }

    $fee = ($count*$unit*$size) - (int)$start_minus - (int)$end_minus;
    if($fee < 0){
      $fee = 0;
    }
  }
  else{
    if($count <= 5){
      $unit = 80;
    }
    else if($count >= 6 && $count <= 10){
      $unit = 160;
    }
    else if($count >= 11){
      $unit = 240;
    }
    $fee = $unit*$count*$vol;
  }
  $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
 }

function calWaterSupplyFee($amount1, $amount2)
{
  $tax_percent = $_SESSION['tax'];
  $unit1 = 30;
  $unit2 = 50;
  $unit3 = 215;
  $fee1 = ($amount1*$unit1) + ($amount2*$unit2);
  $tax1 = $fee1*($tax_percent/100);
  $fee2 = ($amount1+$amount2)*$unit3;
  $tax2 = $fee2*($tax_percent/100);

  return array('fee1'=>(int)$fee1, 'total1'=>(int)($fee1+$tax1), 'fee2'=>(int)$fee2, 'total2'=>(int)($fee2+$tax2));
}

function calMoveableBridgeFee($count)
{
  $tax_percent = $_SESSION['tax'];
  $fee = $count*10000;
  $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}
function calSmallBoatFee($type, $zone, $zone_no, $count, $cal_params)
{
  global $debug, $connected;
  $tax_percent = $_SESSION['tax'];
  $fee = 0;
  $tax = 0;
  $unit = 0;
  if($type == 0){
    $sql = 'SELECT * FROM KW0220 WHERE KW22_ZONE = :zone AND KW22_NO = :zone_no ';
    $stm = $connected->prepare($sql);
    $stm->bindValue(':zone', $zone, PDO::PARAM_STR);
    $stm->bindValue(':zone_no', $zone_no, PDO::PARAM_INT);
    $stm->execute();
    $zone = $stm->fetchAll();
    if(isset($zone)){
      $start_unit = 0;
      $end_unit = 0;

      $start_plus = 0;
      $end_plus = 0;
      if($cal_params){
        $start_unit = (int)($zone[0]['KW22_KINGAK']/(int)$cal_params['last_of_start']);
        $end_unit = (int)($zone[0]['KW22_KINGAK']/(int)$cal_params['last_of_end']);
        if($cal_params['start_ofs'] > 0){
          $start_plus = $start_unit*((int)$cal_params['last_of_start'] - (int)$cal_params['start_ofs']);
        }
        if($cal_params['end_ofs'] > 0){
          $end_plus = $end_unit*((int)$cal_params['last_of_end'] - (int)$cal_params['end_ofs']);
        }
      }
      $fee = ($zone[0]['KW22_KINGAK']*$cal_params['months']) + $start_plus + $end_plus;
    }
  }
  else{
    $unit = 450;
    $fee = $unit*$count;
  }
  $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}
/*
* calTerminalFee This fee do not need fee
* @author Viraneath
*/
function calTerminalFee($type, $monthly_fee, $count, $cal_params)
{
  $tax_percent = $_SESSION['tax'];
  $fee = 0;
  $tax = 0;

  $start_unit = 0;
  $end_unit = 0;

  $start_plus = 0;
  $end_plus = 0;
  if($cal_params){
    $start_unit = (int)($monthly_fee/(int)$cal_params['last_of_start']);
    $end_unit = (int)($monthly_fee/(int)$cal_params['last_of_end']);
    if($cal_params['start_ofs'] > 0){
      $start_plus = $start_unit*((int)$cal_params['last_of_start'] - (int)$cal_params['start_ofs']);
    }
    if($cal_params['end_ofs'] > 0){
      $end_plus = $end_unit*((int)$cal_params['last_of_end'] - (int)$cal_params['end_ofs']);
    }
  }

  $fee = ($cal_params['months']*$monthly_fee) + (int)$start_plus + (int)$end_plus;
  if($fee < 0){
    $fee = 0;
  }
  // $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}
function calCarPrkingFee($type, $monthly_fee, $count, $cal_params)
{
  $tax_percent = $_SESSION['tax'];
  $fee = 0;
  $tax = 0;

  $start_unit = 0;
  $end_unit = 0;

  $start_plus = 0;
  $end_plus = 0;
  if($cal_params){
    $start_unit = (int)($monthly_fee/(int)$cal_params['last_of_start']);
    $end_unit = (int)($monthly_fee/(int)$cal_params['last_of_end']);
    if($cal_params['start_ofs'] > 0){
      $start_plus = $start_unit*((int)$cal_params['last_of_start'] - (int)$cal_params['start_ofs']);
    }
    if($cal_params['end_ofs'] > 0){
      $end_plus = $end_unit*((int)$cal_params['last_of_end'] - (int)$cal_params['end_ofs']);
    }
  }

  $fee = ($cal_params['months']*$monthly_fee) + (int)$start_plus + (int)$end_plus;
  if($fee < 0){
    $fee = 0;
  }
  // $tax = $fee*($tax_percent/100);
  return array('fee'=>(int)$fee, 'total'=>(int)($fee+$tax));
}
/**
 * [getAndInsertUKENNO description]
 * @param  [int] $currentyear [description]
 * @return [int] $data             [description]
 */
function getAndInsertUKENNO($currentyear)
{
  global $debug, $connected;
  $result = true;

  try
  {
    $current = date('Ymdhis');
    $currentWithUserID = $current.$_SESSION['is_index_login'];


    $sql = 'SELECT *, COUNT(*) as total FROM KW0300  WHERE KW30_JIGNEN =:currentyear';
    $stm = $connected->prepare($sql);
    $stm->bindValue(':currentyear',(int)$currentyear, PDO::PARAM_INT);
    $stm->execute();
    $row =  $stm->fetchAll();

    // var_dump($row);exit;
    if($row[0]['total'] >= 1){

      //get current year and renban+1
      $data = $currentyear."00000"+$row[0]['KW30_RENBAN']+1;
      $incresRenban = $row[0]['KW30_RENBAN']+1;

      $sql1 = 'UPDATE KW0300 SET KW30_RENBAN = '.$incresRenban.', KW30_UPDINF = :currentWithUserID WHERE KW30_JIGNEN =:currentyear';
      $stmt = $connected->prepare($sql1);
      $stmt->bindValue(':currentyear',(int)$currentyear, PDO::PARAM_INT);
      $stmt->bindValue(':currentWithUserID',(int)$currentWithUserID, PDO::PARAM_INT);
      $stmt->execute();
      // echo $data;exit;
    } else{

      $sql1 = "INSERT INTO KW0300 (KW30_JIGNEN, KW30_RENBAN, KW30_INSINF)
                VALUES(':currentyear', '1', ':currentWithUserID')";
      $stmt = $connected->prepare($sql1);
      $stmt->bindValue(':currentyear',(int)$currentyear, PDO::PARAM_INT);
      $stmt->bindValue(':currentWithUserID',(int)$currentWithUserID, PDO::PARAM_INT);
      $stmt->execute();
    }

    return $data;
  }
  catch (Exception $e)
  {
    $result = false;
    if ($debug)
    {
      echo 'ERROR: ' . $e->getMessage();
      exit;
    }
  }

  return $result;
}
/**
* @author Kimhoun
* @param string $enyearmonth
* @return float Tax
*/
function getTaxByYear($enyearmonth){
  global $debug, $connected;
  $result = '';
  try {

    $sql = 'SELECT KW99_SUUTI FROM KW0990 WHERE DATE_FORMAT(KW99_STRYMD, "%Y%m") <= :enyearmonth ORDER BY KW99_STRYMD DESC LIMIT 1';
    $stm = $connected->prepare($sql);
    $stm->bindValue(':enyearmonth', (string)$enyearmonth, PDO::PARAM_STR);
    $stm->execute();
    $row = $stm->fetch();
    // var_dump($row);exit;
    return $row;
  }
  catch (Exception $e)
  {
      $result = false;
      if ($debug)
      {
        echo 'ERROR: ' .$e->getMessage();
        exit;
      }
  }
  return $result;
}
/**
 * [listKWNOTE ]
 * @author Pann Saradeth
 * @param  string $limit Limit list perpage
 * @return [array]
 */
 function listKWNOTE($field, $id)
 {
   global  $debug, $connected, $total_data, $offset, $limit;
   $result = true;
   try
   {

     $sql = 'SELECT * FROM KWNOTE WHERE '.$field.' = :id';
     $stm = $connected->prepare($sql.' ORDER BY CREATED_AT DESC');
     $stm->bindValue(':id',(int)$id, PDO::PARAM_INT);
     $stm->execute();
     $row =  $stm->fetchAll();
     return $row;
   }
   catch(PDOException $e)
   {
     $result = false;
     if ($debug)
     {
       echo 'ERROR: at list KWNOTE' . $e->getMessage();
       exit;
     }
   }
   return $result;
 }
//end funtion KWNOTE
/**
 * [Function getKW0600By$KW60_KEIYAKU]
 * @author PANN SARADETH
 * @param string $KW60_KEIYAKU
 * @return array
 */
function getKWNOTEById($ID)
{
	//these values are set in setup.php
	global $debug, $connected;
	$result = true;
	try
	{
		$sql = "SELECT * FROM `KWNOTE` WHERE ID = :ID";
		$stmt = $connected->prepare($sql);
		$stmt->bindValue(':ID', (int)$ID, PDO::PARAM_STR);
		$stmt->execute();
		return $stmt->fetch();
	}
	catch(PDOException $e)
	{
		$result = false;
		if ($debug)
		{
			echo 'ERROR: ' . $e->getMessage();
			exit;
		}
	}
	return $result;
}
/**
* [Function isKW0100Exist]
* @author Kimhoun
* @param int $KW20_JIGNEN
* @param int $KW20_JIGSYACD
* @param string $KW20_CHOKBN
* @param string $KW20_KIBETU
* @return number count
*/
function isKW0100Exist($KW20_JIGNEN, $KW20_JIGSYACD, $KW20_CHOKBN='', $KW20_KIBETU='')
{

  global  $debug, $common, $connected;
  $result = true;
  try
  {
    $sql = 'SELECT KW10_CHOGAK, COUNT(*) as total FROM `KW0100`
            WHERE KW10_JIGNEN= :KW20_JIGNEN
            AND KW10_CHOKBN=:KW20_CHOKBN
            AND KW10_JIGSYACD = :KW20_JIGSYACD
            AND KW10_KIBETU=:KW20_KIBETU';
    $stm = $connected->prepare($sql);

    $stm->bindValue(':KW20_JIGNEN',(int)$KW20_JIGNEN, PDO::PARAM_INT);
    $stm->bindValue(':KW20_JIGSYACD',(int)$KW20_JIGSYACD, PDO::PARAM_INT);
    $stm->bindValue(':KW20_CHOKBN',(string)$KW20_CHOKBN, PDO::PARAM_STR);
    $stm->bindValue(':KW20_KIBETU',(int)$KW20_KIBETU, PDO::PARAM_INT);
    $stm->execute();
    $row =  $stm->fetch();
    return $row;
  }
  catch(PDOException $e)
  {
    $result = false;
    if ($debug)
    {
      echo 'ERROR: ' . $e->getMessage();
      exit;
    }
  }
  return $result;
}
?>
