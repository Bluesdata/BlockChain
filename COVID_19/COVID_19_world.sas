%macro getdata;
%let url=https://github.com/Bluesdata/BlockChain/blob/master/COVID_19/world_data.xlsx?raw=true;
filename data "%sysfunc(pathname(work))\covid-19.xlsx";

proc http method="get" url="&url" out=data;
run;

proc import out=world_data file=data dbms=xlsx replace;
getnames=yes;
run;

data world_data;
set world_data;
label Province_State='省份'
      Country_Region='国家/地区'
	  lat='纬度'
	  long='经度'
      confirmed='确诊'
	  deaths='死亡'
      recovered='治愈'
	  date='日期'
      incc='新增确诊'
	  incd='新增死亡'
      incr='新增治愈';
run;

%mend getdata;
%getdata;