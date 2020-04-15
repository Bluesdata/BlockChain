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
label Province_State='ʡ��'
      Country_Region='����/����'
	  lat='γ��'
	  long='����'
      confirmed='ȷ��'
	  deaths='����'
      recovered='����'
	  date='����'
      incc='����ȷ��'
	  incd='��������'
      incr='��������';
run;

%mend getdata;
%getdata;