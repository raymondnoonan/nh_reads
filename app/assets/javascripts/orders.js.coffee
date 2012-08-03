jQuery ->
        $('#orders').dataTable
          sPaginationType: "bootstrap"
          bProcessing: true
          bDeferRender: true
          bServerSide: true
          sAjaxSource: $('#orders').data('source')