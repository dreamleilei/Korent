/**
 * Created by lei on 15-9-7.
 */
function  operateSuccessTip()  {jSuccess("操作成功",{
    VerticalPosition : 'top',
    HorizontalPosition : 'center'
})
}

function operateErrorTip(){
    jError("操作失败，请重试!!",
        {
            VerticalPosition : 'center',
            HorizontalPosition : 'center'
        });
}

