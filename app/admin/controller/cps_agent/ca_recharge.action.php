<?php
    	
use DataTables\Editor,
DataTables\Editor\Field,
DataTables\Editor\Format,
DataTables\Editor\Join,
DataTables\Editor\Mjoin,
DataTables\Editor\Validate;

_load("Service_IGame");
/**
 * @Description 管理
 * 
 */

Doris\DApp::loadController("common","cps_common");

class ca_rechargeController extends cps_commonController{
	public function indexAction(){
		//echo 111;die;
		$this->assign("title", _lan('BackgroundUserManagement','CPS代理商充值'));
		$this->render("ca_recharge.tpl");
	}

	public function recharge_payAction(){
		//echo dirname(__FILE__);
		require_once dirname(__FILE__).'/../../../lib/config.php';
		require_once dirname(__FILE__).'/../../../lib/aliservice/AlipayTradeService.php';
		require_once dirname(__FILE__).'/../../../lib/buildermodel/AlipayTradePagePayContentBuilder.php';

		//商户订单号，商户网站订单系统中唯一订单号，必填
		$out_trade_no = trim('123123');

		//订单名称，必填
		$subject = trim('123123');

		//付款金额，必填
		$total_amount = 1;

		//商品描述，可空
		$body = trim('1231231');

		//构造参数
		$payRequestBuilder = new AlipayTradePagePayContentBuilder();
		$payRequestBuilder->setBody($body);
		$payRequestBuilder->setSubject($subject);
		$payRequestBuilder->setTotalAmount($total_amount);
		$payRequestBuilder->setOutTradeNo($out_trade_no);
		$aop = new AlipayTradeService($config);

		/**
		 * pagePay 电脑网站支付请求
		 * @param $builder 业务参数，使用buildmodel中的对象生成。
		 * @param $return_url 同步跳转地址，公网可以访问
		 * @param $notify_url 异步通知地址，公网可以访问
		 * @return $response 支付宝返回的信息
		 */
		$response = $aop->pagePay($payRequestBuilder,$config['return_url'],$config['notify_url']);

		//输出表单
		var_dump($response);
	}

	//游戏区、服列表
	public function game_listAction(){
		$pid = $_GET['pid'];
		$igame = new Service_IGame();
		$game = $igame->gameList(1,'321137',$pid);
		$str = '';
		//print_r($game);die;
		if($game[1]=20000){
			foreach($game[3] as $v){
				$str .= '<option value='.$v['server_id'].'>'.$v['name'].'</option>';
			}
			echo $str;
		}
	}
}