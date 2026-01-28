import { Component,inject } from '@angular/core';
import { HousingLocation} from '../housing-location/housing-location';
import { HousingLocationInteface} from '../housing-location-inteface';
import {Housing} from '../housing';

@Component({
  selector: 'app-home',
  imports: [HousingLocation],
  template: `
  <section>
    <form>
      <input type="text" placeholder="Filter by city">
      <button class="primary" type="button">Search</button>
    </form>
    <section class="results">
      @for (housingLocation of housingLocationList; track housingLocation.id) {
        <app-housing-location [housingLocationInterface]="housingLocation"></app-housing-location>
      } @empty {
        <p>No hay ubicaciones disponibles.</p>
      }  </section>
`,  styleUrl: './home.css',
})

export class Home {
  // 1. Declaramos la lista vacía al principio
  housingLocationList: HousingLocationInteface[] = [];

  // 2. Inyectamos el servicio (esto es lo que permite "hablar" con housing.ts)
  private housingService: Housing = inject(Housing);

  constructor() {
    // 3. Al arrancar el componente, le pedimos los datos al servicio
    this.housingLocationList = this.housingService.getAllHousingLocations();
  }
}
