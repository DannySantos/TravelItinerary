var map;
var markers = {};

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -25.363, lng: 131.044},
    zoom: 8
  });

  var items = $('#map').data('items')
  var bounds = bounds = new google.maps.LatLngBounds();

  _(items).each(function(todo_item){
    console.log(todo_item)
    var marker = addMarker(todo_item.latitude, todo_item.longitude, todo_item.id) 
    markers[todo_item.id] = marker
    adjustBounds(bounds, marker)
  });
    console.log(markers)
};

function addMarker(lat, lng, id){
  var myLatLng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({
    id: id,
    position: myLatLng,
    map: map,
  });
  return marker;
  adjustBounds(bounds, marker)
};

function removeMarker(markerId){
  marker = markers[markerId]
  marker.setMap(null);
}

function adjustBounds(bounds, marker){
  bounds.extend(marker.position)
  map.fitBounds(bounds);
};