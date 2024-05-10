import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cep"
export default class extends Controller {
  connect() {
    console.log('conectado')
  }

  updateAddress() {
    const cep = document.getElementById('cepSelect');
    const address = document.getElementById('addressSelect');
    const neighborhood = document.getElementById('neighborhoodSelect');
    const city = document.getElementById('citySelect');
    const state = document.getElementById('stateSelect');
    const long = document.getElementById('longSelect');
    const lat = document.getElementById('latSelect');


    // Consult API to get CEP values
    fetch(`https://cep.awesomeapi.com.br/json/${cep.value}`)
      .then(response => response.json())
      .then(data => {
          if (data.code !== "not_found" ) {
            address.value = data.address;
            neighborhood.value = data.district;
            city.value = data.city;
            state.value = data.state;
            long.value = data.lng;
            lat.value = data.lat
          } else {
              address.value = "Cep não encontrado"
              city.value = "Cep não encontrado"
            }
        })
      .catch(error => console.error('Error fetching ceps:', error));
  }
}
