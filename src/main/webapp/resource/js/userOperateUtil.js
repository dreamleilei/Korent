/*用户预订按钮的点击*/
(function(){
    $(':button[value="预订"]').click(function (event) {
        event.preventDefault();
        var button = $(this);
        $.ajax({
            url: "/korent/orderRent.action",
            type: "get",
            data: "rid=" + encodeURIComponent($(this).next().text()),
            success: function (html) {
                button.attr("disabled", "disabled");
                button.val('取消预定');
            },
            error: function () {
                alert('网络连接超时,请检查网络');
            }
        });
    });


    /*用户取消预订按钮的点击*/
    $(':button[value="取消预订"]').click(function (event) {
        event.preventDefault();
        var button = $(this);
        $.ajax({
            url: "/korent/cancelFollowGoods.action",
            type: "get",
            data: "rid=" + encodeURIComponent($(this).next().text()),
            success: function (html) {
                button.val("预订");
            },
            error: function () {
                alert('网络连接超时,请检查网络');
            }
        });
    });


    /*用户关注按钮的点击*/
    $(':button[value="关注"]').click(function () {
        var button = $(this);
        $.ajax({
            url: "/korent/followGoods.action",
            data: "rid=" + encodeURIComponent($('#rid').text()),
            type: "post",
            success: function () {
                button.val("取消关注");

            },
            error: function () {    /*用户预定按钮的点击*/
                alert('网络连接超时,请检查网络是否良好');
            }

        })
    });

    /*用户关注按钮的点击*/
    $(':button[value="取消关注"]').click(function () {
        var button = $(this);
        $.ajax({
            url: "/korent/cancelFollowGoods.action",
            data: "rid=" + encodeURIComponent($('#rid').text()),
            type: "post",
            success: function () {
                button.attr("disabled", "disabled");
                button.val("关注");

            },
            error: function () {    /*用户预定按钮的点击*/
                alert('网络连接超时,请检查网络是否良好');
            }

        })
    });


    /*用户下架按钮的点击*/
    $(':button[value="下架"]').click(function (event) {
        event.preventDefault();
        var button = $(this);
        $.ajax({
            url: "/korent/cancelRent.action",
            type: "get",
            data: "rid=" + encodeURIComponent($(this).next().text()),
            success: function (html) {
                button.attr("disabled", "disabled");
                button.val('成功下架');
            },
            error: function () {
                alert('网络连接超时,请检查网络');
            }
        });
    });
})();


