var map;
function initMap() {
  console.log("Hello from   MAPPY")
  google.maps.event.trigger(map, 'resize');
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
}