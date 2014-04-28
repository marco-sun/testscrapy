<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>球探比分-即时足球比分、竞彩足球比分、足彩比分直播、足球博彩比分</title>
<meta name="Keywords" content="即时比分，足球比分， 竞彩比分，足彩比分，球探比分，彩票博彩，足球博彩" />
<meta name="Description" content="看足球比分、足球博彩推荐，上球探！球探网比分为您提供最准、最快、最全的足球比分直播。即时比分与比赛现场同步！" />
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="width:950px;">
<div id="Layer1" style="position:absolute; width:100px; height:1px; z-index:5;">
  <div id="Layer2" > 
		<div class="sotit"><span class="title">赛事选择</span><span class="cc"><a style="cursor:pointer;" onClick="MM_showHideLayers('Layer2','','hide')"></a></span></div>
		<div class="rbl">
		  <input type="radio" name="selectType" id="rb0" value="0" onclick="ShowAllMatch()" checked><label for="rb0">所有比赛</label>
		  <input type="radio" name="selectType" id="rb4" value="4" onclick="ShowMatchByMatchState(4)"><label for="rb4">滚球赛事</label>
		  <input type="radio" name="selectType" id="rb3" value="3" onclick="ShowMatchByMatchState(3)"><label for="rb3">未开场　</label>			  
		  <input type="radio" name="selectType" id="rb2" value="2" onclick="ShowMatchByMatchState(2)"><label for="rb2">已完场　</label>
		  <input type="radio" name="selectType" id="rb1" value="1" onclick="ShowMatchByMatchState(1)"><label for="rb1">进行中</label>
		</div>		 
		<div class="font12" id="myleague"></div>
		<div class="bts">
			<input type=button value='一级比赛' onclick='SelectImportant()'> 
			<input type=button value='全选' onclick='SelectAll(true)'> 
			<input type=button value='全不选' onclick='SelectAll(false)'> 
			<input type=button value='确定' onclick='SelectOK(1)'>		
			<input type=button value='关闭' onclick="MM_showHideLayers('Layer2','','hide')">		
		</div>		
  </div>
  
  <div id="DivCountry"  onmouseover="MM_showHideLayers('DivCountry','','show')" onmouseout="MM_showHideLayers('DivCountry','','hidden')">
    <ul class="gamelist" id="countryList"></ul>   
  </div> 
     <div class="pc_win" id="goalDiv">
<h2><span style="float:right; padding-top:5px"><a style="cursor:pointer;" onclick="MM_showHideLayers('goalDiv','','hide')"><img src="image/cc2.gif" width="13" height="13" /></a></span>盘口查询</h2>
<div class="pcwin_tit"><table width="120" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><input type="radio" name="radioGoalType" id="radioGoalType0" value="0"  onclick='makeGoalTable(0)' checked="checked"/>让球</td>
    <td><input type="radio" name="radioGoalType" id="radioGoalType1" value="1" onclick='makeGoalTable(1)' />大小</td>
  </tr>
</table>
</div>
<div style="padding:6px 0" id="goalTable"></div>
<div id="selectGoals_div" style="text-align:center" class="pcwen_btn"><input name="" type="button" value="全选" onclick="hiddenGoalData(-1,1)"/><input name="" type="button" value="反选" onclick="hiddenGoalData(-1,2)"/><input name="" type="button" value="关闭" onclick="MM_showHideLayers('goalDiv','','hide')" /></div>
</div>
  <div id="Layer3"> 
	<div class="sotit"><span class="title">功能设置</span><span class="cc"><a style="cursor:pointer;" onClick="MM_showHideLayers('Layer3','','hide')"></a></span></div>
		   <div style="line-height:25px;"> 
				<input type="checkbox" name="rank" ID="rank" onClick="CheckTeamRank()">球队排名<br>				
				<input type="checkbox" name="explain" ID="explain" checked onClick="CheckExplain()">文字备注信息<br>
				<input type="checkbox" name="redcard" ID="redcard" checked onClick="CheckFunction('redcard')">红牌弹窗选择<br>
				<input type="checkbox" name="showYellowCard" ID="showYellowCard" checked onClick="CheckFunction('showYellowCard')">显示黄牌<br>
				<input type="checkbox" name="windowCheck" ID="windowCheck" checked onclick="CheckWindow()">提示窗<select name="winLocation" id="winLocation" onclick="CheckWindow()">
				<option value="0" checked>正上方</option>
				<option value="1">正下方</option>
				<option value="2">正左方</option>
				<option value="3">正右方</option>
				<option value="4">左上角</option>
				<option value="5">右上角</option>
				<option value="6">左下角</option>
				<option value="7">右下角</option>
				</select><br>		
				<input type="checkbox" name="oddsSound" ID="oddsSound" onclick="CheckFunction('oddsSound')">指数变化提示音<br>	
				<input type="checkbox" name="showSbOddsDetail" ID="showSbOddsDetail" checked onclick="CheckFunction('showSbOddsDetail')">显示赔率详情<br>	
				<input type="checkbox" name="showLeagueScore" ID="showLeagueScore" checked onclick="CheckFunction('showLeagueScore')">联赛显示积分<br>  
				<input type="checkbox" name="detail" ID="Checkbox1" checked onClick="CheckFunction('detail')">比分显示入球<br>	
				<input type="checkbox" name="vs" ID="Checkbox2" checked onClick="CheckFunction('vs')">半场显示往绩<br>				
				<select name="style" id="style" onChange="ChangeBgColor(this.value)">风 格
				<option value="0">默认配色</option>
				<option value="1">浪漫宝蓝</option>				
				<option value="2">淡雅浅灰</option>				
				<option value="3">清雅浅蓝</option>				
				<option value="4">梦幻天蓝</option>				
				<option value="5">雅致蓝白</option>				
				<option value="6">典雅灰蓝</option>
				</select>
			</div>	
			<div class="bts">
					<input type="button" name="button2" id="button1" value="打印比分" style="cursor:pointer;" onclick="javascript:window.open('http://info.bet007.com/aspx/score_print.aspx','','')";/>
					<input type="button" name="button" id="button5" value="关闭"  style="cursor:pointer;" onclick="MM_showHideLayers('Layer3','','hide')"/>
			</div>
  </div>
  <div id="divMatchType3" onmouseout="MM_showHideLayers('divMatchType3','','hide')" onmousemove="MM_showHideLayers('divMatchType3','','show')">
		<div><a href="http://www.310win.com/info/match/Jingcai.aspx" target=_blank>竞彩足球</a></div>
		<div><a href="http://www.310win.com/info/match/Zucai.aspx?TypeID=1" target=_blank>胜负彩</a></div>
		<div><a href="http://www.310win.com/info/match/Live.aspx" target=_blank>北京单场</a></div>
		<div><a href="http://www.310win.com/buy/jingcai.aspx" target="_blank"><b>快速购彩</b></a></div>
  </div> 
  <div id="divCompany" onmouseout="MM_showHideLayers('divCompany','','hide')" onmousemove="MM_showHideLayers('divCompany','','show')">
		<div><a href="index2in1.aspx?id=3" id="company3">SB</a></div>
		<div><a href="index2in1.aspx?id=31" id="company31">利记</a></div>
		<div><a href="index2in1.aspx?id=24" id="company24">沙巴</a></div>
		<div><a href="index2in1.aspx?id=4" id="company4">立博</a></div>
		<div><a href="index2in1.aspx?id=8" id="company8">Bet365</a></div>
		<div><a href="index2in1.aspx?id=12" id="company12">易胜博</a></div>
		<div><a href="index2in1.aspx?id=17" id="company17">明陞</a></div>
  </div>
  <div id="league" onmousemove="MM_showHideLayers('league','','show')" onmouseout="MM_showHideLayers('league','','hide')">
  <ul>  
<li style="background-color:#FF3333;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/36.htm" target=_blank style="color:white;">英超</a></li>
<li style="background-color:#cc3300;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/37.htm" target=_blank style="color:white;">英冠</a></li>
<li style="background-color:#FF850B;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/39.htm" target=_blank style="color:white;">英甲</a></li>
<li style="background-color:#0088FF;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/34.htm" target=_blank style="color:white;">意甲</a></li>
<li style="background-color:#66CCFF;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/40.htm" target=_blank style="color:white;">意乙</a></li>
<li style="background-color:#006633;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/31.htm" target=_blank style="color:white;">西甲</a></li>
<li style="background-color:#438E0B;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/33.htm" target=_blank style="color:white;">西乙</a></li>
<li style="background-color:#990099;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/8.htm" target=_blank style="color:white;">德甲</a></li>
<li style="background-color:#CA00CA;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/9.htm" target=_blank style="color:white;">德乙</a></li>
<li style="background-color:#663333;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/11.htm" target=_blank style="color:white;">法甲</a></li>
<li style="background-color:#663333;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/12.htm" target=_blank style="color:white;">法乙</a></li>
<li style="background-color:#008888;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/23.htm" target=_blank style="color:white;">葡超</a></li>
<li style="background-color:#57A87B;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/29.htm" target=_blank style="color:white;">苏超</a></li>
<li style="background-color:#FF6699;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/16.htm" target=_blank style="color:white;">荷甲</a></li>
<li style="background-color:#FC9B0A;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/5.htm" target=_blank style="color:white;">比甲</a></li>
<li style="background-color:#137AAC;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/13.htm" target=_blank style="color:white;">芬超</a></li>
<li style="background-color:#666666;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/22.htm" target=_blank style="color:white;">挪超</a></li>
<li style="background-color:#6969e0;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/7.htm" target=_blank style="color:white;">丹麦超</a></li>
<li style="background-color:#2f3fd2;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/3.htm" target=_blank style="color:white;">奥甲</a></li>
<li style="background-color:#1ba578;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/27.htm" target=_blank style="color:white;">瑞士超</a></li>
<li style="background-color:#004488;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/26.htm" target=_blank style="color:white;">瑞典超</a></li>
<li style="background-color:#006699;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/10.htm" target=_blank style="color:white;">俄超</a></li>
<li style="background-color:#8C8A64;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/32.htm" target=_blank style="color:white;">希腊甲</a></li>
<li style="background-color:#FFCC66;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/30.htm" target=_blank style="color:white;">土超</a></li>
<li style="background-color:#00CCCC;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/2.htm" target=_blank style="color:white;">阿甲春</a></li>
<li style="background-color:#00CCCC;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/602.htm" target=_blank style="color:white;">阿甲秋</a></li>
<li style="background-color:#DDDD00;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/4.htm" target=_blank style="color:white;">巴西甲</a></li>
<li style="background-color:#660033;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/21.htm" target=_blank style="color:white;">美职业</a></li>
<li style="background-color:#0066FF;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/60.htm" target=_blank style="color:white;">中超</a></li>
<li style="background-color:#009900;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/25.htm" target=_blank style="color:white;">日职联</a></li>
<li style="background-color:#15DBAE;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/15.htm" target=_blank style="color:white;">韩国K</a></li>
<li style="background-color:#FF7000;"><a href="http://info.bet007.com/league_match/league_vs/2010-2011/273.htm" target=_blank style="color:white;">澳A联</a></li>
</ul>
</div>
<div id="cup" onmousemove="MM_showHideLayers('cup','','show')" onmouseout="MM_showHideLayers('cup','','hide')">
<ul>
<li style="background-color:#660000;"><a href="http://info.bet007.com/cup_match/2010-2011/cup_match_75.htm" target=_blank style="color:white;">世界盃</a></li>
<li style="background-color:#660033;"><a href="http://info.bet007.com/cup_match/2008-2009/cupmatch_vs/cupmatch_650.htm" target=_blank style="color:white;">欧洲预选</a></li>
<li style="background-color:#f36229;"><a href="http://info.bet007.com/cup_match/2007-2009/cupmatch_vs/cupmatch_652.htm" target=_blank style="color:white;">南美预选</a></li>
<li style="background-color:#448e08;"><a href="http://info.bet007.com/cup_match/2007-2009/cupmatch_vs/cupmatch_653.htm" target=_blank style="color:white;">北美预选</a></li>
<li style="background-color:#49a63d;"><a href="http://info.bet007.com/cup_match/2007-2009/cupmatch_vs/cupmatch_648.htm" target=_blank style="color:white;">亚洲预选</a></li>
<li style="background-color:#2f4e07;"><a href="http://info.bet007.com/cup_match/2007-2009/cupmatch_vs/cupmatch_651.htm" target=_blank style="color:white;">非洲预选</a></li>
<li style="background-color:#2f4e07;"><a href="http://info.bet007.com/cup_match/2007-2009/cupmatch_vs/cupmatch_649.htm" target=_blank style="color:white;">大洋预选</a></li>
<li style="background-color:#CC9900;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_304.htm" target=_blank style="color:white;">世冠盃</a></li>
<li style="background-color:#009933;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_88.htm" target=_blank style="color:white;">洲际盃</a></li>
<li style="background-color:#009933;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_845.htm" target=_blank style="color:white;">世挑赛</a></li>
<li style="background-color:#660000;"><a href="http://info.bet007.com/cup_match/2010-2012/cupmatch_vs/cupmatch_67.htm" target=_blank style="color:white;">欧国盃</a></li>
<li style="background-color:#F75000;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_103.htm" target=_blank style="color:white;">欧冠盃</a></li>
<li style="background-color:#6F00DD;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_113.htm" target=_blank style="color:white;">欧霸盃</a></li>
<li style="background-color:#990044;"><a href="http://info.bet007.com/cup_match/2007-2008/cupmatch_vs/cupmatch_224.htm" target=_blank style="color:white;">美洲盃</a></li>
<li style="background-color:#660000;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_89.htm" target=_blank style="color:white;">南美盃</a></li>
<li style="background-color:#660000;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_232.htm" target=_blank style="color:white;">美金杯</a></li>
<li style="background-color:#CC9933;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_263.htm" target=_blank style="color:white;">南球盃</a></li>
<li style="background-color:#37BE5A;"><a href="http://info.bet007.com/cup_match/2009-2011/cupmatch_vs/cupmatch_95.htm" target=_blank style="color:white;">亚洲盃</a></li>
<li style="background-color:#0000DB;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_192.htm" target=_blank style="color:white;">亚冠盃</a></li>
<li style="background-color:#0000DB;"><a href="http://info.bet007.com/cup_match/2007-2008/cupmatch_vs/cupmatch_187.htm" target=_blank style="color:white;">A3冠军杯</a></li>
<li style="background-color:#567576;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_350.htm" target=_blank style="color:white;">亚协杯</a></li>
<li style="background-color:#567576;"><a href="http://info.bet007.com/cup_match/2010-2012/cupmatch_vs/cupmatch_93.htm" target=_blank style="color:white;">非洲盃</a></li>
<li style="background-color:#660000;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_90.htm" target=_blank style="color:white;">英足总盃</a></li>
<li style="background-color:#808080;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_84.htm" target=_blank style="color:white;">英联盃</a></li>
<li style="background-color:#3c3cff;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_83.htm" target=_blank style="color:white;">意盃</a></li>
<li style="background-color:#006666;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_81.htm" target=_blank style="color:white;">西盃</a></li>
<li style="background-color:#a00800;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_51.htm" target=_blank style="color:white;">德国盃</a></li>
<li style="background-color:#800080;"><a href="http://info.bet007.com/cup_match/2007-2008/cupmatch_vs/cupmatch_52.htm" target=_blank style="color:white;">德联盃</a></li>
<li style="background-color:#297CA5;"><a href="http://info.bet007.com/cup_match/2008-2009/cupmatch_vs/cupmatch_54.htm" target=_blank style="color:white;">法国盃</a></li>
<li style="background-color:#663333;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_55.htm" target=_blank style="color:white;">法联盃</a></li>
<li style="background-color:#009966;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_70.htm" target=_blank style="color:white;">葡盃</a></li>
<li style="background-color:#CB194C;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_505.htm" target=_blank style="color:white;">葡联盃</a></li>
<li style="background-color:#41be76;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_78.htm" target=_blank style="color:white;">苏总盃</a></li>
<li style="background-color:#054594;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_77.htm" target=_blank style="color:white;">苏联盃</a></li>
<li style="background-color:#ff6699;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_59.htm" target=_blank style="color:white;">荷兰盃</a></li>
<li style="background-color:#fc9b0a;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_108.htm" target=_blank style="color:white;">比利时盃</a></li>
<li style="background-color:#004488;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_73.htm" target=_blank style="color:white;">瑞典盃</a></li>
<li style="background-color:#004488;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_226.htm" target=_blank style="color:white;">芬兰杯</a></li>
<li style="background-color:#666666;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_64.htm" target=_blank style="color:white;">挪威盃</a></li>
<li style="background-color:#8d8abf;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_50.htm" target=_blank style="color:white;">丹麦盃</a></li>
<li style="background-color:#669900;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_96.htm" target=_blank style="color:white;">奥地利杯</a></li>
<li style="background-color:#669900;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_74.htm" target=_blank style="color:white;">瑞士杯</a></li>
<li style="background-color:#669900;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_153.htm" target=_blank style="color:white;">俄杯</a></li>
<li style="background-color:#669900;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_181.htm" target=_blank style="color:white;">里约锦标</a></li>
<li style="background-color:#DDDD00;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_186.htm" target=_blank style="color:white;">巴西盃</a></li>
<li style="background-color:#6699ff;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_340.htm" target=_blank style="color:white;">阿夏赛</a></li>
<li style="background-color:#6699ff;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_483.htm" target=_blank style="color:white;">美公开赛</a></li>
<li style="background-color:#4B8C51;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_72.htm" target=_blank style="color:white;">日联盃</a></li>
<li style="background-color:#003306;"><a href="http://info.bet007.com/cup_match/2009-2010/cupmatch_vs/cupmatch_162.htm" target=_blank style="color:white;">日皇盃</a></li>
<li style="background-color:#78ef28;"><a href="http://info.bet007.com/cup_match/2010-2011/cupmatch_vs/cupmatch_437.htm" target=_blank style="color:white;">韩联盃</a></li>
  </ul>
  </div>
</div>
</div>
<div class="select_d1" id="TimeZoneList_div" style="width: 660px;height: 480px; display: none;">
	<div class="select_d2" style="width: 660px">
		<p class="select_v1">时区设置</p>
		<p class="select_v2"><a href="javascript:CloseTimeZoneList()" title="点击关闭">[x] 关闭</a></p>
	</div>
	<div class="select_d3" id="TimeZoneList"></div>
	<div class="select_c1"></div>
</div>
<script language="javascript" type="text/javascript" src="http://bf.bet007.com/NewTop.js" charset="gb2312"></script>
<script language="javascript" src="live.htm" charset="gb2312" type="text/javascript"></script>
<div id="web_top2" style="clear:both;">
<div id="new2menu">
  <ul>
	<li class="gs"><a href="http://bf.bet007.com/Over1_cn.htm" target="_blank">完场比分</a></li>
	<li class="gs"><a href="http://bf.bet007.com/Next1_cn.htm" target="_blank">下日赛程</a></li>
	<li class="gs"><a href="javascript:"  onmousemove="MM_showHideLayers('league','','show')" onmouseout="MM_showHideLayers('league','','hide')" >热门联赛</a></li>
	<li class="gs"><a href="javascript:"  onmousemove="MM_showHideLayers('cup','','show')" onmouseout="MM_showHideLayers('cup','','hide')" >热门杯赛</a></li>	
	<li class="greens" style="margin-left:10px;"><a href="javascript:SetLanguage(0);" id="Language0" title="显示赛事和球队名称的国语译音">国语</a></li>
	<li class="greens"><a title="显示赛事和球队名称的粤语译音" href="javascript:SetLanguage(1);" id="Language1">粤语</a></li>
	<li class="greens"><a title="显示赛事和球队名称的皇冠简体名" href="javascript:SetLanguage(2);" id="Language2">王冠</a></li>	
	<li class="greens2"><a href="http://www.nowgoal.com" target="_blank">EN</a></li>
	<li class="greens3" style="margin-left:5px;"><a href="javascript:"  onClick="MM_showHideLayers('Layer3','','show','Layer2','','hidden')">功能选择</a></li>
	<li class="greens3" style="margin-left:5px;"><a href="javascript:"  onClick="MM_showHideLayers('goalDiv','','show')">盘口查询</a></li>
  </ul>
  <div style="float:left; width:340px; padding-left:8px;border:">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td><input type="checkbox" name="soundCheck" ID="soundCheck" checked onclick="CheckSound()"></td>
		<td>进球声</td>
		<td>主队</td>
		<td><select name="sound" id="sound" onChange="CheckSound()">
				<option value="0">默认</option>
				<option value="1">警报</option>
				<option value="2">贝司</option>
				<option value="3">嘟嘟</option>
				<option value="4">无声</option>
				</select></td>
		<td>客队</td>
		<td><select name="guestSound" id="guestSound" onChange="CheckSound()">
				<option value="0">默认</option>
				<option value="1">警报</option>
				<option value="2">贝司</option>
				<option value="3">嘟嘟</option>
				<option value="4">无声</option>
				</select></td>
		<td><a href="http://app.bet007.com/" target="_blank" style="color:Red">客户端下载</a></td>
	  </tr>
	</table>
  </div>
 
  <div style="clear:both"></div>
</div>
</div>
<script language=javascript>
	ShowTop30pxAd();
</script>
<div align="center" id="loading" style='position:absolute; width:95%; top:250px; left:1px; z-index:8;'> 
<table border="1" align=center width="300" height="120" bgcolor="#EEEEEE" style="border-collapse:collapse;" bordercolor="black">
 <tr>
	<td align="center">
	正在载入比分数据，请稍候……<br>
	<br><img src="image/loading.gif" border="0"><BR><br>
	载入成功后，系统会自动刷新，无需手动刷新<BR><BR>
	<a href="http://bf.bet007.com/download.htm" target="_blank">如果不能正常打开，请安装XML组件，点击进入...</a>
	</td>
 </tr>
</table>
</div>

<table width="950" border="0" cellpadding="0" cellspacing="0" align=center bgcolor="#FFFDF3">
  <tr>
	<td width="100" valign="top" style="line-height:50%" align=center><br><span id="left_ad"></span><div id='id_left_layer' align=center></div></td>
	<td align="center" valign="top">
	  <div style="padding:6px 0px 0px 0px;">
			<ul class="ri_menu">
			  <li><a href="javascript:void(0)" onclick="javascript:setOldOrNew(2);return false;" title="显示当天所有比赛"><font color="red">新版</font></a></li>
			  <li><a href="javascript:void(0)" onclick="javascript:setOldOrNew(1);return false;" title="显示当天所有比赛">旧版</a></li>
			  <li><a href="http://www.310win.com/live/" target=_blank title="显示足彩比赛"  id="liZC" onmousemove="MM_showHideLayers('divMatchType3','','show')" onmouseout="MM_showHideLayers('divMatchType3','','hide')">足彩</a></li>
			  <li><a href="index2in1.aspx?id=1" id="company1">澳门</a></li>
			  <li><a style="cursor:pointer;" onmousemove="MM_showHideLayers('divCompany','','show')" onmouseout="MM_showHideLayers('divCompany','','hide')">更多</a></li>
			</ul>
			<div style="float:left; padding:3px 4px 0 1px"><img src="image/uji.gif" width="18" height="19"></div>
			<div style="float:left">
			<input type="button" name="button3" id="button" value="保留选中" class="btn22"  onclick="HiddenSelected(false)">
			<input type="button" name="button4" id="button2" value="删除选中" class="btn22" onclick="HiddenSelected(true)">
			<input type="button" name="button5" id="button3" value="赛事选择" class="btn22" onClick="MM_showHideLayers('Layer2','','show','Layer3','','hidden')">
			<input type="button" name="button5" id="button4" value="国家选择" class="btn22"  onmouseover="MM_showHideLayers('DivCountry','','show')" onmouseout="MM_showHideLayers('DivCountry','','hidden')"></div>
			<div style="float:left; padding-left:6px;">
			  <input type="button" name="orderbyChange" id="orderbyChange" value="按联赛选择" class="btn3" onclick="setOrderby()">
			</div>
			 <div class="hmunber">隐藏<span class="td_scoreR" id="hiddencount">0</span>场 <a href="javascript:ShowAllMatch()" style="cursor:pointer;" title="显示隐藏的比赛" class="blueff">[显示]</a></div>
			 <div  style="clear:both"><div>
		 </div>
		
		<table width='100%' border="0" cellpadding="0" cellspacing="0"><tr><td align="left" height=16><font color=#6666FF><B>入球提示：</b></font><span id="notify"></span></td></tr></table>

		<span id=live></span>
			<table width='100%' border="0" cellpadding="0" cellspacing="0"  style="background-image:url('image/khot3.gif');"><tr style="height:30px;vertical-align:middle;">
		   <td style="text-align:right;width:140px;font-size:14px;"><b>我关注的赛事</b>(<span id="concernCount">0</span>)</td>
		   <td style="text-align:center;width:460px;"><input type="text" id="searchCorcen" style="width:440px;" onclick="if(this.value=='输入当天赛事中您关注的赛事或球队,例如：西甲、曼联'){this.value=''}"  value="输入当天赛事中您关注的赛事或球队,例如：西甲、曼联" /></td>
		   <td  style="text-align:center;width:120px;"><a href="javascript:addMoreConcern(10);" style="text-align:right;"><img src="image/khot1.gif"  align="absmiddle" /></a></td>
		   		   <td><a href="javascript:deleteAllConcern();"  style="text-align:center;" title="清除所有置顶"><img src="image/khot2.gif" /></a></td></tr></table>
		<span id=flashsound></span>
		<div align="center" style="line-height:20px;">		
		点击球队：球队战绩， 点击比分：事件数据， 点击联赛名：联赛资料  <img src="image/fx2.gif" />--情报分析 <img src="image/tv.gif" />--电视直播<br />
		 鼠标指向半、全场比分可显示相应数据 
		 [<a href='http://bf.bet007.com/free.aspx' target=_blank style="color:Blue"><b>比分调用</b></a>]
		 [<a href='http://Help.bet007.com/Help/CommonHelpList.aspx?kind=1&type=3' target="_blank" style="color:Blue"><b>弹窗设置</b></a>]
		 [<a href='http://wap.bet007.com/wap.htm' target="_blank" style="color:Blue"><b>手机比分</b></a>]
		 [<a href='http://help.bet007.com/Help/ComplaintsViews.aspx' target="_blank" style="color:Blue"><b>建议征集</b></a>]
		 [<a href='http://play.bet007.cn/winner.aspx' target="_blank" style="color:Blue"><b>专家团</b></a>]
		 [<a href='http://ads.bet007.com/Market/MarketAdvantagesList.aspx?type=2' target="_blank" style="color:Blue"><b>数据租用</b></a>]
		 [<a href='http://play.bet007.cn/' target="_blank" style="color:Blue"><b>博彩竞猜</b></a>]
		 [<a href='http://forum.bet007.com/' target="_blank" style="color:Blue"><b>博彩推荐</b></a>]
		 </div>
		 <script language=javascript>
			  ShowBottomAd();
		 </script>			
	</td>
	<td width="100" valign="top" style="line-height:50%" align=center><br><span id="right_ad"></span><div id='id_right_layer'  align=center></div></td>
  </tr>
</table>
<div id="winScore" style='position:absolute; z-index:8;top:100px;left:100px;border:solid 1px #666;'></div>
<div id="sbOddsDetail" class="livetab" style='position:absolute; z-index:8;top:100px;left:100px;' onmouseover="showSbDetail()" onmouseout="hiddenSbDetail()"></div>
<input type="hidden" id="ifShow" value="0" />
<span id="allDate"><script language="javascript" type="text/javascript" defer="defer"></script></span>
<script language="javascript" src="http://bf.bet007.com/vbsxml/alias2.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="common.js"></script>
<script language="javascript" type="text/javascript" src="common2.js"></script>
<script language="javascript" src="func.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
var difftime=new Date()-new Date(2013,10,18,15,38,54);

function showodds() {
    try {
        var j=0;
        var root = oddsHttp.responseXML.documentElement.childNodes[0];
        var D = new Array();
        var odds, old = new Array();
        var needSound = false;
        for (var i = 0; i < root.childNodes.length; i++) {
            if (document.all && parseInt(ieNum) < 10)
                odds = root.childNodes[i].text; //id,oddsid,goal,home,away,oddsid,hw,st,gw,oddsid,up,goal,down
            else
                odds = root.childNodes[i].textContent;
            D = odds.split(",");
            tr = document.getElementById("tr1_" + D[0]);
            if (tr == null) continue;
            var  matchindex = tr.attributes["index"].value;
            old = tr.attributes["odds"].value.split(",");
            if (old.length == 14 && old != odds) {
                for (var j = 3; j < 5; j++) {
                    if (old[j] != "") {
                        if (D[j] > old[j]) D[j] = "<span class=up>" + D[j] + "</span>";
                        else if (D[j] < old[j]) D[j] = "<span class=down>" + D[j] + "</span>";
                    }
                }
                window.setTimeout("restoreOddsColor(" + D[0] + ")", 30000);
                if (Config.oddsSound == 1) {
                    if (tr.style.display != "none")
                        needSound = true;
                }
            }
            if (old.length == 14 && old != odds && old[2] != "") {
                if (D[2] > old[2]) D[2] = "<span class=up>" + Goal2GoalCn(D[2]).replace("受","<font color='red'>*</font>") + "</span>";
                else if (D[2] < old[2]) D[2] = "<span class=down>" + Goal2GoalCn(D[2]).replace("受","<font color='red'>*</font>") + "</span>";
                else D[2] = Goal2GoalCn(D[2]).replace("受","<font color='red'>*</font>");
            }
            else D[2] = Goal2GoalCn(D[2]).replace("受","<font color='red'>*</font>");
            var tmp = "<div class=odds"+(D[13] == "2"?4:2)+">" + D[3] + "</div>";
			tr.cells[8].innerHTML = tmp;
            tmp = "<div class=odds"+(D[13] == "2"?4:2)+">" + D[2] + "</div>";
			tr.cells[9].innerHTML = tmp;

            tmp = "<div class=odds"+(D[13] == "2"?4:2)+">" + D[4] + "</div>";
			tr.cells[10].innerHTML = tmp;
            tmp = "";
            if (D[13] == "1") tmp = "<img src='image/zd.gif' height=10 width=10 title='有走地赛事'>";
            if (D[13] == "2") tmp = "<img src='image/zd2.gif' height=10 width=10 title='正在走地'>";           
			tr.cells[11].innerHTML = tmp;	
            tr.attributes["odds"].value = odds;
        }
        if (needSound) ShowOddsSound();
    } catch (e) { }
}

function updateTimeZone() {
	document.location.reload();
}
Config.getCookie("index");
//changeOldOrNew(Config.oldOrNew);
changeUrl2(Config.language);
Config.setStates("index");
var sys_time_zone = GetCurrentTimeZone();
document.getElementById("TimeZone").innerHTML = GetTimeZone(0, sys_time_zone);
LoadLiveFile();
window.setTimeout("gettime()",2000);
//window.setTimeout("gettime()",3000);
window.setTimeout("check()" , 300000);
</script>

<script language="javascript" src="http://img2.bet007.com/img/bottom.js" charset="gb2312"></script>
<span id="span_detail"><script language="javascript" charset="gb2312" type="text/javascript"></script></span>
<span id="span_sbDetail"><script language="javascript" charset="utf-8" type="text/javascript"></script></span>
<span id="span_score"><script language="javascript" charset="utf-8" type="text/javascript"></script></span>
<span id="span_panlu"><script language="javascript" charset="gb2312" type="text/javascript"></script></span>

<script language="javascript">
    set_image_ad();
    window.setTimeout("LoadDetailFile()", 1000);
    window.setTimeout("LoadSbDetailFile()", 1000);
    window.setTimeout("LoadPanluFile()", 1000);
    clearNotify("");
</script>
</body>
</html>
