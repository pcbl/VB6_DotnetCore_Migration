import { Component } from '@angular/core';
import { BffService } from './bff.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'ModernClient';
  public customers: string[];

  
  constructor(private bff: BffService) { 
    this.loadData();
  }

  loadData()
  {
    this.bff.getAllCustomers().then(result => this.customers = result);
  }

  reload()
  {
    this.loadData();
  }
}
