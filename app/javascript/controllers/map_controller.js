  import { Controller } from "@hotwired/stimulus";
  import mapboxgl from "mapbox-gl";

  // Connects to data-controller="map"
  export default class extends Controller {
   static values = { apiKey: String, markers: Array, candidatemarkers: Array };
   connect() {
    console.log("Conectado")
    console.log(this.markersValue);
    console.log(this.candidatemarkersValue);
    console.warn(this.apiKeyValue);
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
     container: this.element,
     style: "mapbox://styles/mapbox/streets-v12",
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
   }
   #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
     const popup = new mapboxgl.Popup().setHTML(marker.info_popup_html);
     new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).setPopup(popup).addTo(this.map);
    });
    this.candidatemarkersValue.forEach((marker) => {
     const popup = new mapboxgl.Popup().setHTML(marker.info_candidate_popup_html);
     new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).setPopup(popup).addTo(this.map);
    });
   }
   #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    this.candidatemarkersValue.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
   }
  }
