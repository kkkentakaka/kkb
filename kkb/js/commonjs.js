$(function() {
  $(document).on("keypress", "input:not(.allow_submit)", function(event) {
    return event.which !== 13;
  });
});

// Convert japan date
/**
 * [ConvertDate description]
 * @param {[string]} txtDate [4280501]
 */
function ConvertDate(txtDate)
{
	var qi;
	var headname;
	// get value from input field;
	// substr the first value of japan year
	var head = txtDate.substr(0, 1);
	// substr the year of japan year
	var year = txtDate.substr(1, 2);
	// substr the month
	var month = txtDate.substr(3,2);

	if(month ==04) qi = "1";
	if(month ==05) qi = "2";
	if(month ==06) qi = "3";
	if(month ==07) qi = "4";
	if(month ==08) qi = "5";
	if(month ==09) qi = "6";
	if(month ==10) qi = "7";
	if(month ==11) qi = "8";
	if(month ==12) qi = "9";
	if(month ==01) qi = "10";
	if(month ==02) qi = "11";
	if(month == 03) qi ="12";

	if(head == 1) headname = "明治";
	if(head == 2) headname = "大正";
	if(head == 3) headname = "昭和";
	if(head == 4) headname = "平成";
	return headname+year+" 年度 "+month+" 月　（第 "+qi+" 期）";

}
/**
 * [ConvertFromJapanDateFormateYYYYMMDD description]
 * @param {[date]} txtDate [Format 4280422]
 * @return YYYYMMDD
 */
function ConvertFromJapanDateFormateYYYYMMDD(txtDate){
  if(txtDate.length != 7){
    return false;
  }

	var year 	= txtDate.substr(0, 3);
	var month = txtDate.substr(3, 2);
	var day   = txtDate.substr(5, 2);
	var stlen = year.strlen;
	var g = year.substr(0, 1);
	var y = year.substr(1, stlen);

	if (y === '01') y = 1;
	y = parseInt(y);
	if (g === '4') y = y + 1988;
	if (g === '3') y = y + 1925;
	if (g === '2') y = y + 1911;
	if (g === '1') y = y + 1868;
	return y+month+day;
}
/**
 * [ConvertFromJapanDate description]
 * @param {[date]} txtDate [Format 4280422]
 * @return m/d/Y 04/22/2016
 */
function ConvertFromJapanDate(txtDate){
  if(txtDate.length != 7){
    return false;
  }

	var year 	= txtDate.substr(0, 3);
	var month = txtDate.substr(3, 2);
	var day   = txtDate.substr(5, 2);
	var stlen = year.strlen;
	var g = year.substr(0, 1);
	var y = year.substr(1, stlen);

	if (y === '01') y = 1;
	y = parseInt(y);
	if (g === '4') y = y + 1988;
	if (g === '3') y = y + 1925;
	if (g === '2') y = y + 1911;
	if (g === '1') y = y + 1868;
	return month+'/'+day+'/'+y;
}
/**
 * [ToYear description]
 * @param {[string]} japanYear [Format 428]
 * @return Y-m-d 2016-04-26
 */
function ToYear(japanYear)
{
  var g = japanYear.substr(0, 1);
  var y = parseInt(japanYear);
  if (g === '4') y = y + 1988;
  if (g === '3') y = y + 1925;
  if (g === '2') y = y + 1911;
  if (g === '1') y = y + 1868;

  return y;
}


function ConvertFromJapanDateformate(txtDate){

	var year 	= txtDate.substr(0, 3);
	var month = txtDate.substr(3, 2);
	var day   = txtDate.substr(5, 2);
	var stlen = year.strlen;
	var g = year.substr(0, 1);
	var y = year.substr(1, stlen);

	if (y === '01') y = 1;
	y = parseInt(y);
	if (g === '4') y = y + 1988;
	if (g === '3') y = y + 1925;
	if (g === '2') y = y + 1911;
	if (g === '1') y = y + 1868;
	// return month+','+day+','+y;
	// return y+','+month+','+day;
	return month+'/'+day+'/'+y;
	// return y+'-'+month+'-'+day;
}

var DateDiff = {

    inDays: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2-t1)/(24*3600*1000));
    },

    inWeeks: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2-t1)/(24*3600*1000*7));
    },

    inMonths: function(d1, d2) {
        var d1Y = d1.getFullYear();
        var d2Y = d2.getFullYear();
        var d1M = d1.getMonth();
        var d2M = d2.getMonth();

        return (d2M+12*d2Y)-(d1M+12*d1Y);
    },

    inFullMonths: function(d1, d2) {
        var d1Y = d1.getFullYear();
        var d2Y = d2.getFullYear();
        var d1M = d1.getMonth();
        var d2M = d2.getMonth();
        var d1d = d1.getDate();
        var d2d = d2.getDate();
        var last_of_d1 = new Date(d1Y, d1M+1, 0).getDate();
        var last_of_d2 = new Date(d2Y, d2M+1, 0).getDate();

        var months = (d2M+12*d2Y) - (d1M+12*d1Y);
        var days = 0;
        if(d1d == 1 && d2d == last_of_d2){
          months++;
          days = 0;
        }
        else if(d1d != 1 && d2d != last_of_d2){
          months--;
          if(d1M != d2M){
            days = last_of_d1 - d1d + d2d + 1;
          }
          else{
           days = d2d - d1d + 1;
          }
        }
        else if(d1d == 1 && d2d != last_of_d2){
          days = d2d;
        }
        else if(d1d != 1 && d2d == last_of_d2){
          days = last_of_d1 - d1d + 1;
        }

        if(months < 0){
          months = 0;
        }

        return {months: months, days: days, start_ofs: d1d - 1, end_ofs: last_of_d2 - d2d, last_of_start: last_of_d1, last_of_end: last_of_d2 };
    },

    inYears: function(d1, d2) {
        return d2.getFullYear()-d1.getFullYear();
    }
}

function calcDayDiff(currentNendo, japanStartDateId, japanEndDateId, resultId)
{
  var startDate = $('#'+japanStartDateId).val();
  var endDate = $('#'+japanEndDateId).val();
  // check valid date
  if(!isJapaneseDate(startDate) ||
     !isJapaneseDate(endDate)){
    if(resultId){
      $('#'+resultId).val(0);
    }
    return 0;
  }

  // check if in target year
  if(!isInTargetJapaneseYear(startDate, currentNendo) ||
     !isInTargetJapaneseYear(endDate, currentNendo)){
    $('#'+resultId).val(0);
    return 0;
  }

  // check start date must be smaller than end date
  var dayDiff = 0;
  if(startDate <= endDate)
  {
    var start = new Date(ConvertFromJapanDate(startDate));
    var end = new Date(ConvertFromJapanDate(endDate));
    dayDiff = DateDiff.inDays(start, end)+1;

    if(resultId){
      $('#'+resultId).val(dayDiff);
    }
  }
  return dayDiff;
}

function calcMonthDiff(currentNendo, japanStartDateId, japanEndDateId, resultId)
{
  var startDate = $('#'+japanStartDateId).val();
  var endDate = $('#'+japanEndDateId).val();
  // check valid date
  if(!isJapaneseDate(startDate) ||
     !isJapaneseDate(endDate)){
    if(resultId){
      $('#'+resultId).val(0);
    }
    return 0;
  }

  // check if in target year
  if(!isInTargetJapaneseYear(startDate, currentNendo) ||
     !isInTargetJapaneseYear(endDate, currentNendo)){
    $('#'+resultId).val(0);
    return 0;
  }

  // check start date must be smaller than end date
  var monthDiff = 0;
  if(startDate <= endDate)
  {
    var start = new Date(ConvertFromJapanDate(startDate));
    var end = new Date(ConvertFromJapanDate(endDate));
    var dayDiff = DateDiff.inDays(start, end);
    monthDiff = DateDiff.inMonths(start, end);

    if(dayDiff >= 0){
      monthDiff++;
    }
    if(resultId){
      $('#'+resultId).val(monthDiff);
    }
  }
  return monthDiff;
}

function calFullMonthDiff(currentNendo, japanStartDateId, japanEndDateId, resultId)
{
  var startDate = $('#'+japanStartDateId).val();
  var endDate = $('#'+japanEndDateId).val();
  // check valid date
  if(!isJapaneseDate(startDate) ||
     !isJapaneseDate(endDate)){
    if(resultId){
      $('#'+resultId).html('(0ヶ月 0日)');
    }
    return null;
  }

  // check if in target year
  if(!isInTargetJapaneseYear(startDate, currentNendo) ||
     !isInTargetJapaneseYear(endDate, currentNendo)){
    $('#'+resultId).html('(0ヶ月 0日)');
    return null;
  }

  if(startDate <= endDate){
    var start = new Date(ConvertFromJapanDate(startDate));
    var end = new Date(ConvertFromJapanDate(endDate));
    var ret = DateDiff.inFullMonths(start, end);
    $('#'+resultId).html('('+ret.months+'ヶ月 '+ret.days+'日)');
    return ret;
  }
  return null;
}

function isInTargetJapaneseYear(target_date, target_year)
{
  // last day of march
  var next_year = parseInt(target_year)+1;
  var last_day_of_month = new Date(ToYear(next_year.toString()), 3, 0).getDate();
  var target = parseInt(target_date);
  var current_year_start = target_year+'0401';
  var current_year_year = next_year.toString()+'03'+last_day_of_month;
  return target >= current_year_start && target <= current_year_year
}

function isJapaneseDate(txtDate)
{
  _date = ConvertFromJapanDate(txtDate);
  return isDate(_date);

}

function isDate(txtDate)
{
    var currVal = txtDate;
    if(currVal == '' || currVal == false) return false;

    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null) return false;

    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[1];
    dtDay= dtArray[3];
    dtYear = dtArray[5];

    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay> 31)
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31)
        return false;
    else if (dtMonth == 2)
    {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap))
                return false;
    }
    return true;
}
/**
 * [NumOnly Input Only number]
 * @param {[type]} e     [description]
 * @param {[type]} field [description]
 */
function NumOnly(event, field)
{
  // m = String.fromCharCode(event.keyCode);
	if(
      (event.keyCode >= 96 && event.keyCode <= 105) // number on keypad
      || event.keyCode == 9 //Tab key
      || event.keyCode == 8 //backspace key
      || event.keyCode == 46//delete key
      || (event.keyCode >= 48 && event.keyCode <= 57) //number on keyboard
      || (event.keyCode >= 35 && event.keyCode <= 40)// arrow keys/home/end
    )
  {
    return true;
  }
  else
  {
    return false;
  }
  // if("0123456789\b\r%'".indexOf(m, 0) < 0) return false;
  return true;

}

function NumAndTwoDecimals(event, field)
 {
	if(event.keyCode >= 96 && event.keyCode <= 105 || event.keyCode === 190 || event.keyCode === 110) return true;
  // dot
  // if(event.keyCode === 190) return true;
  // numbers
  m = String.fromCharCode(event.keyCode);
  if("0123456789\b\r%'".indexOf(m, 0) < 0) return false;
  return true;
}

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
