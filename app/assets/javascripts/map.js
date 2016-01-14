var map;
var markers = {};
var bounds;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -25.363, lng: 131.044},
    zoom: 4
  });

  var items = $('#map').data('items')
  bounds = new google.maps.LatLngBounds();

  _(items).each(function(todo_item){
    var marker = addMarker(todo_item.latitude, todo_item.longitude, todo_item.id) 
    markers[todo_item.id] = marker
    adjustBounds(bounds, marker, map)
  });
};

function addMarker(lat, lng, id){
  var myLatLng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({
    id: id,
    position: myLatLng,
    map: map,
  });
  adjustBounds(bounds, marker, map)
  return marker;
};

function removeMarker(markerId){
  marker = markers[markerId]
  marker.setMap(null);
}

function adjustBounds(bounds, marker, map){
  bounds.extend(marker.position)
  map.fitBounds(bounds);
};