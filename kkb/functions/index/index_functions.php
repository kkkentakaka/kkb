<?php
/**
 * [userLogin userkkb login]
 * @author Chivey
 * @param  string $id [ID]
 * @param  string $password
 * @return string boolean
 */

function userLogin($id, $password)
{
  //   echo $username, $password;exit;
  global $connected, $debug;
  // echo $email, $password;exit;
  $result = true;
  try
  {
    $sql   = 'SELECT USRID FROM `userkkb` WHERE userkkb.USRID = :id AND userkkb.PASS = :password';
    $query = $connected->prepare($sql);
    $query->bindValue(':id', (string)$id, PDO::PARAM_STR);
    $query->bindValue(':password', (string)$password, PDO::PARAM_STR);
    $query->execute();
    return $query->fetch();
  }
  catch (Exception $e)
  {
    $result = fale;
    if($debug)
    {
      echo 'ERROR: Error at userLogin'. $e->getMessage();
      exit;
    }
  }
  return $result;
}




?>
