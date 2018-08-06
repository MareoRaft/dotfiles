import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { FormlyModule } from '@ngx-formly/core';
import { FormlyBootstrapModule } from '@ngx-formly/bootstrap';

import { AppComponent } from './app.component';
import { MyFormComponent } from './my-form/my-form.component';
import { FormlyFieldCustomInput } from './custom-input/custom-input.component';

@NgModule({
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    FormlyBootstrapModule,
    FormlyModule.forRoot({
      validationMessages: [
        { name: 'required', message: 'This field is required' },
      ],
      types: [
        { name: 'custom', component: FormlyFieldCustomInput, wrappers: ['form-field'] },
      ],
    }),
  ],
  declarations: [
    AppComponent,
    MyFormComponent,
    FormlyFieldCustomInput,
  ],
  bootstrap: [ AppComponent ],
})
export class AppModule { }
