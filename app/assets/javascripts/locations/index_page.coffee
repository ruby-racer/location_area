#= require ./show_polygons

$(document).ready ->
  showPolygons()

  $('.js-locations-table').DataTable(
    columnDefs: [
      { orderable: false, targets: -1 }
      { bSearchable: false, aTargets: -1 }
      { width: '12%', targets: -1 }
    ]
  )

  return
