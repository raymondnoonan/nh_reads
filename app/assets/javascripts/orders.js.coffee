jQuery ->
        $('#orders').dataTable
          sPaginationType: "bootstrap"
          bProcessing: true
          bServerSide: true
          sAjaxSource: $('#orders').data('source')