function placeMarkers(data, markers) {
  markers = handler.addMarkers(data);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

function showLocations(dataFromServer) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      markers = [];
      dataFromServer[dataFromServer.length] = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        infowindow: "You!"
      };
      placeMarkers(dataFromServer, markers);
    });
  } else {
    alert("Geolocation is not available");
    placeMarkers(dataFromServer, markers);
  }
}

function createGmap(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {},
    internal: {id: 'apartment_map'}
  },
    function() {
      // markers = handler.addMarkers(data);
      showLocations(data);
      // handler.bounds.extendWith(markers);
      // handler.fitMapToBounds();
      // handler.getMap().setZoom(12);
    }
  );
};

function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#apartment_map').length > 0) {
    // Access the data-apartment-id attribute on the map element
    var apartmentId = $('#apartment_map').attr('data-apartment-id');

    $.ajax({
      dataType: 'json',
      url: '/apartments/' + apartmentId + '/map_location',
      method: 'GET',
      success: function(data) {
        createGmap(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

//$(document).on('ready', loadAndCreateGmap);
$(document).on('turbolinks:load', loadAndCreateGmap);
