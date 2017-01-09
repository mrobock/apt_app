function createGmaps(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {},
    internal: {id: 'apartment_maps'}
  },
    function() {
      markers = handler.addMarkers(data);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(12);
    }
  );
};

function loadAndCreateGmaps() {
  // Only load map data if we have a map on the page
  if ($('#apartment_maps').length > 0) {
    $.ajax({
      dataType: 'json',
      url: '/apartments/map_locations',
      method: 'GET',
      success: function(data) {
        createGmaps(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

$(document).on('ready', loadAndCreateGmaps);
$(document).on('turbolinks:load', loadAndCreateGmaps);
