$(function () {
    $("#add").click(
        function () {
           $("#name").text($("#pre_name").text())
            $("#Address").text($("#pre_Address").text())
            $("#tell").text($("#pre_tell").text())
            $("#add").css(
                {
                    border: '2px dashed red'
                }
            )
            $("#add_2").css(
                {
                    border: '2px solid #cccccc'
                }
            )
        }
    )
    $("#dj").click(function () {
        $(".address_4").css(
            {
                display: 'block'
            }
        )
    })
    	    $("#add_2").click(
        function () {
            $("#name").text($("#pre_name_1").text())
            $("#Address").text($("#pre_Address_1").text())
            $("#tell").text($("#pre_tell_1").text())
            $("#add_2").css(
                {
                    border: '2px dashed red'
                }
            )
            $("#add").css(
                {
                    border: '2px dashed #cccccc'
                }
            )
        }
    )
})