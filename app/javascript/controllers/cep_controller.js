import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cep"
export default class extends Controller {
  connect() {
  }

  updateAddress() {
    const cep = document.getElementById('cepSelect');
    const address = document.getElementById('addressSelect');
    const city = document.getElementById('citySelect');

    // Consult API to get CEP values
    fetch(`https://viacep.com.br/ws/${cep.value}/json/`)
      .then(response => response.json())
      .then(data => {
          if (data.erro !== "true" ) {
            address.value = data.logradouro;
            city.value = data.localidade;
          } else {
              address.value = "Cep não encontrado"
              city.value = "Cep não encontrado"
            }
        })
      .catch(error => console.error('Error fetching ceps:', error));
  }
}
