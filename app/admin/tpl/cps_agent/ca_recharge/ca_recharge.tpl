<script src="/static/js/jquery/jquery-1.9.1.min.js"></script>
<script src="/static/js/md5.js"></script>

<link href="/static/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script src="/static/js/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<script src="/static/page_js/uploadify_pic.js"></script>
<div class="panel panel-default">
    <div class="panel-body">
        <h1><b class="page-title"<?php echo $title ?></b><b><small class="page-subtitle"><?php echo empty($sub_title)?"":$sub_title;?></small></b></h1>
    </div>
    <br />
    <form role="form" id="linemeta_line" class="form-horizontal text-left" method="post" action="index.php?m=cps_manage&c=cm_attachment&a=createAttachment&game_id=<?php echo $_GET['game_id']; ?>" enctype="multipart/form-data">
        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">游戏: </label>
            <div class="col-sm-10">
                <select name="game" id="game" onchange="game_qu()">
                    <option value="0">请选择</option>
                    <option value="66">屠龙66</option>
                    <option value="99">久久mo</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">请选择充值的大区和服:</label>
            <div class="col-sm-10">
                <select name="server" id="server" onchange="game_qu()"><option value="0">请选择</option></select>
                <select name="type" id="ser">
                    <option value="0">请选择</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="sl_must_known" class="col-sm-1 control-label"></label>
            <div class="col-sm-11">
                <p class="form-control-static" id="file_upload_queue_1"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">请输入充值的角色id<span style="color:red">*</span></label>
            <div class="col-sm-10">
                <p class="form-control-static"><input type="text" name="version" required value="" ></p>
            </div>
        </div>
        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">请选择充值档位<span style="color:red">*</span></label>
            <div class="col-sm-10">
                    <select name="type" id="attachment_type">
                        <option value="SourcePackage">充200返20000</option>
                        <option value="keystore">充200返20000</option>
                    </select>
            </div>
        </div>

        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">充值折扣<span style="color:red">*</span></label>
            <div class="col-sm-10">
                <select>
                    <option value="0.4">0.4</option>
                    <option value="0.5">0.5</option>
                </select>

            </div>
        </div>

        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">充值方式<span style="color:red">*</span></label>
            <div class="col-sm-10">
                <input type="radio" name="version"  value="1" checked>支付宝支付
            </div>
        </div>

        <div class="form-group">
            <label for="sl_must_known" class="col-sm-2 control-label">充值金额<span style="color:red">*</span></label>
            <div class="col-sm-10">
                <p class="form-control-static">0.00</p>
            </div>
        </div>
        <div class="form-group ">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-9">
                <p class="form-control-static">
                    <button class="btn btn-primary">提交</button>
                    <button class="btn btn-primary" onclick="testpay()">测试支付</button>
                </p>
            </div>
        </div>


    </form>

</div>
<style>
    .panel{min-height:400px}
    #linemeta_line{margin-left:50px}
    .form-control{max-width:600px}
</style>
<script>
    //支付
    function  testpay(){
        location.href = "index.php?m=cps_agent&c=ca_recharge&a=recharge_pay";
    }
</script>
<script>
    function game_qu(){
        if($('#game').val() == 0){
            $('#server').html('<option value="0">请选择</option>');
            $('#ser').html('<option value="0">请选择</option>');
        }else{
            pid = $('#server').val();
            if(pid == null){
                pid = 0;
            }
            $.ajax({
                url:"index.php?m=cps_agent&c=ca_recharge&a=game_list",
                type:"get",
                data:"pid="+pid,
                datatype:"json",
                success:function (result){
                    if(pid == 0){
                        $('#server').html(result);
                    }else{
                        $('#ser').html(result);
                    }

                    //for(var i=0;i<)
                }
            })

        }
    }
</script>
<?php $this->display('footer.tpl'); ?>
