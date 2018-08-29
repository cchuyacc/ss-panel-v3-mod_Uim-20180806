


{include file='user/main.tpl'}
{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">

		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

				{if $user->class !=0}
						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
                                    <p class="card-heading"> <i class="icon icon-md">notifications_active</i>公告栏</p>									 
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
										{if $config["enable_admin_contact"] == 'true'}
										<p class="card-heading">站长联系方式</p>
										{if $config["admin_contact1"]!=null}
										<p>{$config["admin_contact1"]}</p>
										{/if}
										{if $config["admin_contact2"]!=null}
										<p>{$config["admin_contact2"]}</p>
										{/if}
										{if $config["admin_contact3"]!=null}
										<p>{$config["admin_contact3"]}</p>
										{/if}
										{/if}
									</div>

								</div>
							</div>


							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">account_circle</i>账号使用情况</p>
										<dl class="dl-horizontal">
										<p><dt>邮箱帐号</dt>
                                              
											<dd><i class="icon icon-md t4-text">email</i>&nbsp;{$user->email}</dd>
                                          
                                          </p>
										 <p><dt>余额</dt>
											<dd><i class="icon icon-md">monetization_on</i>&nbsp;<code>{$user->money}</code> CNY   ; <a href="/user/code">点我充值</a></dd> </p>
											
											<p><dt>帐号等级</dt>
                                              {if $user->class ==0}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;未激活</dd>											  
											  {elseif $user->class ==16}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;永久会员</dd>
											  {elseif $user->class==17}											  
                                              <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP1</dd>
                                              {elseif $user->class==18}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP2</dd>
											  {elseif $user->class==19}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP3</dd>
											  {elseif $user->class==20}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP4</dd>
											  {elseif $user->class==21}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP5</dd>
											  {elseif $user->class==22}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;月付VIP6</dd>
											  {elseif $user->class==23}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付SVIP1</dd>
											  {elseif $user->class==24}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付SVIP2</dd>
											  {elseif $user->class==25}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付SVIP3</dd>
											  {elseif $user->class==26}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付SVIP4</dd>
											  {elseif $user->class==30}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;预售年付V2ray</dd>
											  {elseif $user->class==31}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付V2ray1</dd>
											  {elseif $user->class==32}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付V2ray2</dd>
											  {elseif $user->class==33}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付V2ray3</dd>
											  {elseif $user->class==34}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付V2ray4</dd>
											  
											  
											  {elseif $user->class==5}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;年付VIP</dd>
											
                                          {else}
                                              <dd><i class="icon icon-md t4-text">stars</i>&nbsp;未知等级</dd>
											  
                                              {/if}
                                          
											{*
											<p><dt>帐号过期时间</dt>
											  <dd><i class="icon icon-md">event</i>&nbsp;{$user->expire_in}</dd>
                                            </p>
                                            <p><dt>账号有效期</dt>
                                              <i class="icon icon-md">event</i>
                                              <span class="label-account-expire">剩余</span>
											  <code><span id="days-account-expire"></span></code>
											  <span class="label-account-expire">天</span>
                                           </p>
										   *}

											<p><dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd><i class="icon icon-md">settings_input_component</i>&nbsp;<code>{$user->node_speedlimit}</code>Mbps</dd>
											{else}
											<dd><i class="icon icon-md">settings_input_component</i>&nbsp;不限速</dd>
											{/if}
											</p>
											
                                           <p><dt>在线设备数</dt>
										    {if $user->node_connector!=0}
											<dd><i class="icon icon-md">phonelink</i>&nbsp;{$user->online_ip_count()} / {$user->node_connector}</dd>
											{else}
                                            <dd><i class="icon icon-md">phonelink</i>&nbsp;{$user->online_ip_count()} / 不限制 </dd>
											{/if}
											</p>
											

											<p><dt>等级过期时间</dt>
                                              {if $user->class_expire!="1989-06-04 00:05:00"}
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->class_expire}</dd>
                                          {else}
                                              <dd><i class="icon icon-md">event</i>&nbsp;不过期</dd>
                                              {/if}
											</p>
                                          	<p><dt>等级有效期</dt>
                                              <i class="icon icon-md">event</i>
                                              <span class="label-level-expire">剩余</span>
											  <code><span id="days-level-expire"></span></code>
                                              <span class="label-level-expire">天</span>
                                            </p>

											<p><dt>帐号注册时间</dt>
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->reg_date}</dd>	
											</p>
											
											{if $user->auto_reset_day > 0}
                                          	<p><dt>重置流量</dt>											
											<dd><i class="icon icon-md">event</i>&nbsp;每月 {$user->auto_reset_day} 日，流量重置为  {$user->auto_reset_bandwidth} GB</dd>																															
											</p>
											{/if}
											
											{*
											<p><dt>上次使用</dt>
                                              {if $user->lastSsTime()!="从未使用喵"}
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->lastSsTime()}</dd>
                                          {else}
                                          <dd><i class="icon icon-md">event</i>&nbsp;从未使用</dd>
                                          {/if}</p>
										  
                                          <p><dt>上次签到时间：</dt>
                                            <dd><i class="icon icon-md">event</i>&nbsp;{$user->lastCheckInTime()}</dd></p>


											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}


									
									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;点我签到&nbsp;<span class="icon">screen_rotation</span>&nbsp;或者摇动手机签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;今日已签到</a></p>
											{/if}
										</div>
									</div>
									*}
										</dl>
									</div>

								</div>
							</div>

							

						</div>

						<div class="col-lg-6 col-md-6">
						
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">phonelink</i> 快速添加节点</p>
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;SSR</a>
												</li>
												{*
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
												*}
												
												{if $user->class >=2}
												<li>
													<a class="waves-attach" data-toggle="tab" href="#all_v2ray"><i class="icon icon-lg">flight_land</i>&nbsp;v2ray</a>
												</li>
												{/if}
												
												<li >
													<a class="waves-attach" data-toggle="tab" href="#all_client"><i class="icon icon-lg">text_format</i>&nbsp;客户端&教程</a>
												</li>
												
											</ul>
										</nav>
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}

													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<!--
                                                          <li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_linux"><i class="icon icon-lg">dvr</i>&nbsp;Linux</a>
															</li>
															-->
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">phone_iphone</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
                                                          <li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_game"><i class="icon icon-lg">videogame_asset</i>&nbsp;游戏端</a>
															</li>
															{*
             												<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															*}
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_by"><i class="icon icon-lg">dvr</i>&nbsp;备用导入</a>
															</li>
															
														</ul>
													</nav>

													<div class="tab-pane fade active in" id="all_ssr_windows">
                                                        {$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														<p><span class="icon icon-lg text-white">filter_1</span><a href="https://raw.githubusercontent.com/esdeathlove/panel-download/master/ssr-win.7z"> 点击我下载</a></p>
                                                        <p><span class="icon icon-lg text-white">filter_2</span> 解压至任意磁盘并运行</p>
														<p><span class="icon icon-lg text-white">filter_3</span> 任务栏右下角右键纸飞机图标->服务器订阅->SSR服务器订阅设置，将订阅链接设置为下面的地址，确定之后再更新SSR服务器订阅（绕过代理）。</p>
														<p> <span class="icon icon-lg text-white">filter_4</span> 然后选择一个合适的服务器，代理规则选“绕过局域网和大陆”，然后即可上网。</p>
														<p><span class="icon icon-lg text-white">filter_5</span> 备用导入节点方法：点击<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这里（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这个(单端口多用户）</a>，然后右键小飞机->从剪贴板复制地址</p>
														
														<p><span class="icon icon-lg text-white">flash_auto</span> SSR订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br></p>
														<!--
														<p><span class="icon icon-lg text-white">flash_auto</span> 单端口订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443">点击拷贝订阅地址</button><br></p>
														-->
														
                                                     <!--  <p><a href="/user/announcement">点击这里查看Windows傻瓜式教程</a></p> -->
													</div>
													
													<div class="tab-pane fade" id="all_ssr_mac">
															<p><span class="icon icon-lg text-white">filter_1</span><a href="https://raw.githubusercontent.com/esdeathlove/panel-download/master/ssr-mac.dmg"> 点击我下载</a></p>
                                                      		<p><span class="icon icon-lg text-white">filter_2</span> 打开下载的Dmg文件</p>
                                                     	    <p><span class="icon icon-lg text-white">filter_3</span> 把ShadowsocksX拖入到Finder的应用程序列表(Applications)</p>
                                                      		<p><span class="icon icon-lg text-white">filter_4</span> 打开Launchapad里的ShadowsocksX</p>
                                                      		<p><span class="icon icon-lg text-white">filter_5</span> 菜单栏的纸飞机图标-服务器-服务器订阅填入以下订阅地址，更新后出现您的节点</p>
                                                      <p><span class="icon icon-lg text-white">filter_6</span> 菜单栏的纸飞机图标-打开shadowsocks</p>
													  
                                        				<p><span class="icon icon-lg text-white">flash_auto</span> SSR订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br></p>
														<!--
														<p><span class="icon icon-lg text-white">flash_auto</span> 单端口订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443">点击拷贝订阅地址</button><br></p>
														-->
                                                    <!--   <p><a href="/user/announcement">点击这里查看Mac傻瓜式教程</a></p>  -->
													</div>
													
													<!--
                                                  <div class="tab-pane fade" id="all_ssr_linux">
                                                     <p><a href="/user/announcement">点击这里查看Linux傻瓜式教程</a></p>  
													</div>
													-->
													
													<div class="tab-pane fade" id="all_ssr_ios">
                                                        <p><span class="icon icon-lg text-white">filter_1</span> 切换至非国区App Store账号，商店搜索<code>Shadowrocket</code>下载安装</p>
														<p><span class="icon icon-lg text-white">filter_2</span> 在 Safari 中点击<a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
                                                      <p><span class="icon icon-lg text-white">filter_3</span> 注意：第一次连接可能不能用，导入后程序退出并重新打开程序后连接即可！</p>
													  <p><span class="icon icon-lg text-white">filter_4</span> 备用导入节点方法“”打开Shadowrocket，点击右上角<span class="icon icon-lg text-white">add</span>，添加类型为<code>Subscribe</code>，URL填写以下地址即可自动更新节点</p>
													  
														<p><span class="icon icon-lg text-white">flash_auto</span> SSR订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br></p>
														<!--
														<p><span class="icon icon-lg text-white">flash_auto</span> 单端口订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443">点击拷贝订阅地址</button><br></p>
														-->
                                                     <!-- <p><a href="/user/announcement">点击这里查看iOS傻瓜式教程</a></p> -->
													</div>
													
													<div class="tab-pane fade" id="all_ssr_android">
														<p><span class="icon icon-lg text-white">filter_1</span><a href="https://raw.githubusercontent.com/esdeathlove/panel-download/master/ssr-android.apk"> 点击我下载</a>并安装</p>
                                                      <p><span class="icon icon-lg text-white">filter_2</span> 打开App，点击右下角的<span class="icon icon-lg text-white">add</span>号图标</p>
                                                        <p><span class="icon icon-lg text-white">filter_3</span> 添加/升级 SSR订阅</p>
                                                          <p><span class="icon icon-lg text-white">filter_4</span> 添加订阅地址，输入以下订阅地址后确定</p>
                                                      <p><span class="icon icon-lg text-white">filter_5</span> 订阅出现系统自带的与{$config["appName"]}，请把系统自带的无效订阅左滑删除（自带影响订阅更新速度）</p>
                                                       <p><span class="icon icon-lg text-white">filter_6</span> 点击确定并升级</p>
                                                      <p><span class="icon icon-lg text-white">filter_7</span> 点击选择任意节点， 路由选择：略过区域网路以及中国大陆</p>
                                                        <p><span class="icon icon-lg text-white">filter_8</span> 点击右上角的纸飞机图标即可连接</p>
														<p><span class="icon icon-lg text-white">filter_9</span> 备用导入节点方法：在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（单端口多用户）</a>，然后点击确定</p>
														
														<p><span class="icon icon-lg text-white">flash_auto</span> SSR订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br></p>
														<!--
														<p><span class="icon icon-lg text-white">flash_auto</span> 单端口订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443">点击拷贝订阅地址</button><br></p>
														-->
                                                    <!--  <p><a href="/user/announcement">点击这里查看Android傻瓜式教程</a></p> -->
													</div>
													
													<div class="tab-pane fade" id="all_ssr_router">
													<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$config['roudeurl']}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$config['roudeurl']}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														这个单端口多用户的<br>
														<code>wget -O- {$config['roudeurl']}/link/{$router_token_without_mu}?is_ss=443 | bash && echo -e "\n0 */3 * * * wget -O- {$config['roudeurl']}/link/{$router_token_without_mu}?is_ss=443 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>
                                                    <div class="tab-pane fade" id="all_ssr_game">
														 <p><span class="icon icon-lg text-white">filter_1</span><a href="https://raw.githubusercontent.com/xcxnig/ssr-download/master/SSTap.7z">点击我下载</a></p>
                                                       <p><span class="icon icon-lg text-white">filter_2</span> 安装，期间会安装虚拟网卡，请点击允许或确认</p>
                                                       <p><span class="icon icon-lg text-white">filter_3</span> 打开桌面程序SSTap</p>
                                                       <p><span class="icon icon-lg text-white">filter_4</span> 齿轮图标-SSR订阅-SSR订阅管理添加以下订阅链接即可</p>
                                                       <p><span class="icon icon-lg text-white">filter_5</span> 更新后选择其中一个节点闪电图标测试节点-测试UDP转发...通过!（UDP通过即可连接并开始游戏），如测试不通过，点击齿轮图标设置DNS，推荐谷歌DNS</p>
													   
														<p><span class="icon icon-lg text-white">flash_auto</span> SSR订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br></p>
														<!--
														<p><span class="icon icon-lg text-white">flash_auto</span> 单端口订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443" readonly="true"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?mu=443">点击拷贝订阅地址</button><br></p>
														-->
                                                     <!-- <p><a href="/user/announcement">点击这里查看游戏客户端傻瓜式教程</a></p> -->
													</div>
													{*
                                                  <div class="tab-pane fade" id="all_ssr_info">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
                                                          <p><dt><code>优先导入普通端口，如果普通端口无法使用再导入单端口</code></dt></p>
															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义协议</dt>
															<dd>{$user->protocol}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>

															<p><dt>自定义混淆参数</dt>
															<dd>{$user->obfs_param}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

															<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

															<p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
														{/if}
													</div>
													*}
													
												   <div class="tab-pane fade" id="all_ssr_by">
												   <p class="card-heading">备用导入节点方式汇总</p>
												   <p>Windows客户端备用导入节点方式：<br>
												   (1)下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=443&is_ss=0">这个（443端口）</a>，右键小飞机 服务器 -- 从配置文件导入服务器，选择这个文件。<br>
												   (2)点击<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这里（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all_mu}">这个（443端口）</a>，然后右键小飞机 -- 从剪贴板复制地址。
												   </p>
												   <p>MAC客户端备用导入节点方式：<br>
												   (1)然后下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个(普通端口)</a>或者<a  href="/user/getpcconf?is_mu=443&is_ss=0">这个（443端口）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，就可以批量添加节点了。</p>
														
												   <p>Android客户端备用导入节点方式：<br>
												   (1)在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（443端口）</a>，然后点击确定，批量添加完节点。
												   </p>
												   
												   <p>Shadowrocket备用导入节点方式：<br>
												   (1)在 Safari 中点击<a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（443端口）</a>，然后点击确定，就可以批量添加节点了。</p>
                                                     
													</div> 



												</div>

												{*
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p>各个节点的地址请到节点列表查看！</p>


															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>

															<p><dt>自定义混淆参数</dt>
															<dd>{$user->obfs_param}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
													</div>
													
													<div class="tab-pane fade" id="all_ss_windows">
														<p><a href="/ssr-download/ss-win.zip">下载</a>，解压，运行程序，然后您有两种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>，放到小飞机的目录下，然后打开小飞机。<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里（普通端口）</a>, 然后右键小飞机 -- 从剪贴板导入 URL<br>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><a href="/ssr-download/ss-mac.zip">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=443&is_ss=1">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，请在左侧菜单栏里提交工单申请已购买软件的美国商店Apple ID自行切换商店账号下载安装，为了您的隐私安全，请不要登录 iCloud 。下载完成后在 Safari 中点击<a href="{$ss_url_all}">这个（普通端口）</a>或者<a href="{$ss_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>iOS 下载<a href="/link/{$ios_token}?is_ss=1">这个（普通端口）</a>或者<a href="/link/{$ios_token}?is_ss=1&is_mu=443">这个（单端口多用户）</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p><a href="/ssr-download/ss-android.apk">下载</a>，再<a href="/ssr-download/ss-android-obfs.apk">下载</a>，然后安装，然后在手机上点击 <a class="copy-text" data-clipboard-text="{$ss_url_all}"> 这个链接（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">这个链接（单端口多用户端口）</a>复制到剪贴板，打开 Shadowsocks 客户端，选择从剪贴板导入，然后选择一个节点，设置一下路由为绕过大陆，点击飞机就可以上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>
												</div>
												*}
										


										
												<div class="tab-pane fade" id="all_v2ray">
												
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<!--
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_v2ray_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															-->
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_v2ray_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_v2ray_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_v2ray_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_v2ray_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
														</ul>
													</nav>
													{*
													<div class="tab-pane fade active in" id="all_v2ray_info">
														{$v2_url_all = URL::getAllVMessUrl($user)}
														
														<p>V2ray客户端下载：<a href="https://client.yunxiao.us/?dir=V2ray" target="_blank">https://client.yunxiao.us</a> </p>

														<a class="copy-text" data-clipboard-text="{$v2_url_all}">点击这里复制全部 VMess 链接</a>
														<p>
														<span class="icon icon-lg text-white">flash_auto</span> 
														V2ray节点订阅地址：
														<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?v2ray=1" readonly="true" />
														<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?v2ray=1">
															点击拷贝订阅地址
														</button>
														<br>
														</p>                                                     
													</div>
													*}
													
													<div class="tab-pane fade active in" id="all_v2ray_windows">
													{$v2_url_all = URL::getAllVMessUrl($user)}
														<p><a href="https://client.yunxiao.us/V2ray/Windows/V2rayN-2.14.7z">下载</a>，解压，运行V2ray程序，然后您有两种方式导入所有节点<br>
															(1)通过下方的v2ray订阅地址添加节点<br>
															(2)<a class="copy-text" data-clipboard-text="{$v2_url_all}">点击这里复制全部 VMess 链接</a>，然后点击服务器，点击添加所有VMess链接<br>
															(3)鼠标右键点击桌面右下角v2ray图标，点击开启http代理，pac代理规则设置为全局或按需求设置，点击服务器，选择一个节点点击一下，配置完成<br>
															(4)打开浏览器试试看能不能打开谷歌等网站吧</p>
													</div>
													<div class="tab-pane fade" id="all_v2ray_mac">
													{$v2_url_all = URL::getAllVMessUrl($user)}
														<p><a href="https://client.yunxiao.us/V2ray/MacOSX/V2RayX.app.zip">下载</a>，安装，<a class="copy-text" data-clipboard-text="{$v2_url_all}">点击这里复制全部 VMess 链接</a>，然后到客户端添加节点吧，具体教程没有</p>
													</div>
													<div class="tab-pane fade" id="all_v2ray_ios">
													{$v2_url_all = URL::getAllVMessUrl($user)}
														<p><span class="icon icon-lg text-white">filter_1</span> 切换至非国区App Store账号，商店搜索<code>Shadowrocket</code>下载安装</p>
														<p><span class="icon icon-lg text-white">filter_2</span> 在 Safari 中<a class="copy-text" data-clipboard-text="{$v2_url_all}">点击这里复制全部 VMess 链接</a>，然后点击确定，就可以批量添加节点。</p>
                                                      <p><span class="icon icon-lg text-white">filter_3</span> 注意：第一次连接可能不能用，导入后程序退出并重新打开程序后连接即可！</p>
													  <p><span class="icon icon-lg text-white">filter_4</span> 备用导入节点方法“”打开Shadowrocket，点击右上角<span class="icon icon-lg text-white">add</span>，添加类型为<code>Subscribe</code>，URL填写v2ray订阅地址即可自动更新节点</p>
													</div>
													<div class="tab-pane fade" id="all_v2ray_android">
													{$v2_url_all = URL::getAllVMessUrl($user)}
														<p><a href="https://client.yunxiao.us/V2ray/Android/V2rayNG-0.5.4.apk">下载</a>，然后安装，然后在手机上<a class="copy-text" data-clipboard-text="{$v2_url_all}">点击这里复制全部 VMess 链接</a>复制到剪贴板，打开 V2rayNG 客户端，选择从剪贴板导入，然后选择一个节点，设置一下路由为绕过大陆，点击飞机就可以上网了。</p>
														<p>备用方法：在软件里面选择服务器订阅，复制下面v2ray订阅地址，在软件里面添加后更新订阅即可获取节点。</p>
													</div>
													
													<div class="card-action">
											        <div class="card-action-btn pull-left">
													{$v2_url_all = URL::getAllVMessUrl($user)}
											        {$user = URL::getSSRConnectInfo($pre_user)}
													{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
													{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
											
												<p>
														<span class="icon icon-lg text-white">flash_auto</span> 
														V2ray节点订阅地址：
														<input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$config['rssresd']}/link/{$ssr_sub_token}?v2ray=1" readonly="true" />
														<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config['rssresd']}/link/{$ssr_sub_token}?v2ray=1">
															点击拷贝订阅地址
														</button>
														<br>
														</p>   
											</div>
										</div>
												</div>										
										
											
										
										<div class="tab-pane fade " id="all_client">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
														
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_clien"><i class="icon icon-lg">text_format</i>&nbsp;客户端&教程</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_shadowrocket"><i class="icon icon-lg">laptop_mac</i>&nbsp;小火箭下载</a>
															</li>
														</ul>
													</nav>
															
															<div class="tab-pane fade active in" id="all_clien">
															<p class="card-heading">教程及客户端下载</p>
											<p>客户端教程：<a href="{$config["jiaocheng1"]}" target="_blank">{$config["jiaocheng1"]}</a><br>客户端下载：<a href="http://t.cn/RYHO1hn" target="_blank">http://t.cn/RYHO1hn</a>
                                          <br>pac文件：<a href="https://client.yunxiao.us/Pac/pac.txt">pac下载</a>，鼠标右键另存为即可直接下载</p>
											
															
															</div>
															
															
												<div class="tab-pane fade" id="all_shadowrocket">
													<p class="card-heading">美区IOS系统小火箭(Shadowrocket)下载账号：</p>
														{if $user->class >=23}
															
											<p>账号： {$config["iosinfo"]}</p>
											<p>密码： {$config["iospasswd"]}</p>
											{else}
											<h5><font color="red">为减少账号出现异常，导致需要经常改密码，现账号仅对年付SVIP用户共享，其他用户请自行前往APP Store中国区以外的区进行购买使用，此App价格介绍：美区价格在2.88美元左右，换算成人民币价格在18元左右，其他区价格差不多，请自行前往购买使用</font></h5>	
											{/if}
											<p>使用方法：登陆APP Store后请搜索Shadowrocket，或者在已购记录里面找到Shadowrocket，然后点击下载安装就行；
											<br>注意：下载完软件，请立即退出登录，为确保账号不被锁定，此账号不定期更新密码。
											<br><font color="red">关于隐私：为了您的隐私安全，禁止使用此账号登录icloud，登陆icloud可能会自动上传通讯录和照片等隐私，并且会有被锁机和抹掉手机数据的风险，如您不听劝告，后果自负。</font></p>	
												
												</div>
											
										</div>
										
										</div>
										
										
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="reset-link btn btn-brand btn-flat waves-attach" ><span class="icon">autorenew</span>&nbsp;重置订阅链接</a></p>
											</div>
										</div>
										
										
												
									</div>

								</div>
							</div>

							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

                                      <script src="/assets/js/canvasjs.min.js"> </script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",



											{
                                         theme: "light1",


												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
													},
												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													startAngle: -15,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
                                                    yValueFormatString: "##0.00\"%\"",
													type: "pie",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100},label: "总已用", legendText:"总已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "总已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100},label: "今日", legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100},label: "剩余可用", legendText:"剩余可用 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余可用 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>

								</div>
							</div>


						{if $enable_duoshuo=='true'}

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0]
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>

								</div>
							</div>

						{/if}

						

					</div>
					
					
						
						{else}
						

					


				

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
                                     <p class="card-heading"> <i class="icon icon-md">notifications_active</i>公告栏</p>
									{* <p>置顶公告：
										<br>1，用户协议(TOS)请<a href="/toos">点击查看</a>；			
										<br>2，历史公告请到<a href="/user/announcement"/>公告面板</a>查看；
										<br>3，本站没有任何中国境内的联系方式。<br></p> *}
										
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>
							
							
							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">account_circle</i>账号使用情况</p>
										<dl class="dl-horizontal">
										
										<p><dt>邮箱</dt>
                                              
											<dd><i class="icon icon-md t4-text">email</i>&nbsp;{$user->email}</dd>
                                          
                                          </p>
											<p><dt>帐号等级</dt>
                                              {if $user->lastSsTime() > 0 && $user->class==0 }
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;已过期</dd>
											  {else}
											  <dd><i class="icon icon-md t4-text">stars</i>&nbsp;未激活</dd>
											  {/if}
                                             
                                          </p>
										  <p><dt>余额</dt>
											<dd><i class="icon icon-md">monetization_on</i>&nbsp;{$user->money} 元；<a href="/user/code">点我充值</a> </dd></p>
											

											
											{if $user->lastSsTime() > 0 && $user->class==0 }
											<p><dt>等级过期时间</dt>
                                              {if $user->class_expire!="1989-06-04 00:05:00"}
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->class_expire}</dd>
                                          {else}
                                              <dd><i class="icon icon-md">event</i>&nbsp;不过期</dd>
                                              {/if}
											</p>
											{/if}
											
											<p><dt>账号注册时间</dt>
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->reg_date}</dd>	
											</p>
										</dl>
									</div>

								</div>
							</div>
							
							
							
							{if $user->class == 0 && $user->lastSsTime() == 0 && $user->ref_by != 1766}
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									<p class="card-heading">新用户使用引导：</p>
									
										<p><font color="blue">1，注册即代表同意并遵守本站<a href="/toos">用户协议（TOS）</a>，<br>2，本站不提供试用,<br>3，请<a href="/user/code">点我充值</a>余额到账户，<br>4，然后通过  <a href="/user/shop">商店</a> 购买激活账号，<br>5，如您未能在注册后  {$config['enable_auto_clean_unused_days']}  天内完成购买，账号将自动删除,<br>6，如您有任何疑问，请 <a href="/user/ticket/create">建立工单</a> 联系管理员</font></p>
																												
									</div>									
								</div>
							</div>
							{/if}
							
							
							
							
							{if $user->lastSsTime() > 0 && $user->class==0 }
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									<p class="card-heading">账号当前状态</p>
										<h5><font color="blue">1，您的账号等级已于 {$user->class_expire} 过期，<br>2，</font>为不影响您的正常使用，请及时通过  <a href="/user/shop">商店</a> 购买套餐重新激活账号；
										<br,3，<font color="blue">请注意，您的账号将在等级过期 {$config['enable_account_expire_delete_days']}  天后自动删除，</font></h5>
										<p>4，如您有任何疑问，请 <a href="/user/ticket/create">建立工单</a> 联系管理员</p>
																												
									</div>									
								</div>
							</div>
							{/if}
							
							

			   	
				

				
				{/if}				
					{include file='dialog.tpl'}
					


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>

<script>

function DateParse(str_date) {
		var str_date_splited = str_date.split(/[^0-9]/);
		return new Date (str_date_splited[0], str_date_splited[1] - 1, str_date_splited[2], str_date_splited[3], str_date_splited[4], str_date_splited[5]);
}

/*
 * Author: neoFelhz & CloudHammer
 * https://github.com/CloudHammer/CloudHammer/make-sspanel-v3-mod-great-again
 * License: MIT license & SATA license
 */
function CountDown() {
    var levelExpire = DateParse("{$user->class_expire}");
    var accountExpire = DateParse("{$user->expire_in}");
    var nowDate = new Date();
    var a = nowDate.getTime();
    var b = levelExpire - a;
    var c = accountExpire - a;
    var levelExpireDays = Math.floor(b/(24*3600*1000));
    var accountExpireDays = Math.floor(c/(24*3600*1000));
    if (levelExpireDays < 0 || levelExpireDays > 315360000000) {
        document.getElementById('days-level-expire').innerHTML = "无限期";
        for (var i=0;i<document.getElementsByClassName('label-level-expire').length;i+=1){
            document.getElementsByClassName('label-level-expire')[i].style.display = 'none';
        }
    } else {
        document.getElementById('days-level-expire').innerHTML = levelExpireDays;
    }
    if (accountExpireDays < 0 || accountExpireDays > 315360000000) {
        document.getElementById('days-account-expire').innerHTML = "无限期";
        for (var i=0;i<document.getElementsByClassName('label-account-expire').length;i+=1){
            document.getElementsByClassName('label-account-expire')[i].style.display = 'none';
        }
    } else {
        document.getElementById('days-account-expire').innerHTML = accountExpireDays;
    }
}
</script>


<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已拷贝订阅链接，请您继续接下来的操作。");
});
$(function(){
	new Clipboard('.reset-link');
});

$(".reset-link").click(function () {
	$("#result").modal();
	$("#msg").html("已重置您的订阅链接，请变更或添加您的订阅链接！");
	window.setTimeout("location.href='/user/url_reset'", {$config['jump_delay']});
});

 {if $user->transfer_enable-($user->u+$user->d) == 0}
window.onload = function() {
    $("#result").modal();
    $("#msg").html("您的流量已经用完或账户已经过期了，如需继续使用，请进入商店选购新的套餐~");
};
 {/if}

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();
  	CountDown()

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>
