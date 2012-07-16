jQuery ->
        $('#orders').dataTable
          sPaginationType: "bootstrap"
          bServerSide: true
          sAjaxSource: $('#orders').data('source')
