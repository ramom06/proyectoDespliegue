import { Component,Input } from '@angular/core';
import {HousingLocationInteface} from '../housing-location-inteface';
import {RouterLink} from '@angular/router';



@Component({
  selector: 'app-housing-location',
  imports: [
    RouterLink
  ],
  template: `
    <section class="listing">
      <img class="listing-photo" [src]="housingLocationInterface.photo" alt="Exterior photo of {{housingLocationInterface.name}}">
      <h2 class="listing-heading">{{ housingLocationInterface.name }}</h2>
      <p class="listing-location">{{ housingLocationInterface.city}}, {{housingLocationInterface.state }}</p>
      <a [routerLink]="['/details', housingLocationInterface.id]">Learn More</a>
    </section>
  `,  styleUrl: './housing-location.css',
})
export class HousingLocation {
  @Input() housingLocationInterface!: HousingLocationInteface;
}
