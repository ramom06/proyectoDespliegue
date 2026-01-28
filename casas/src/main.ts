import {bootstrapApplication, provideProtractorTestingSupport} from '@angular/platform-browser';
import {provideRouter} from '@angular/router';
import {routes} from './app/app.routes';
import {App} from './app/app';

bootstrapApplication(App,
  {
    providers: [
      provideProtractorTestingSupport(),
      provideRouter(routes)
    ]
  }
).catch(err => console.error(err));
