import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  navigator.geolocation.getCurrentPosition(function(position) {
  var user_location = [{"lng": position.coords.longitude,"lat": position.coords.latitude, icon: { url: 'https://res.cloudinary.com/dmnwhkfxu/image/upload/c_scale,h_20,w_20/v1544697984/smtxog6viuz09khc95nw.png', scaledSize: new google.maps.Size(20, 20) }}];

  map.addMarkers(markers.concat(user_location));
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    //map.setCenter(markers[0].lat, markers[0].lng);
    map.setCenter(position.coords.latitude, position.coords.longitude);
    map.setZoom(16);
  } else {
    map.fitLatLngBounds(markers);
  }
});
}

autocomplete();
