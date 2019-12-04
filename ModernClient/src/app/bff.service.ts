import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class BffService {

  constructor(private http: HttpClient) { }

  getAllCustomers(): Promise<string[]> {
    const url = 'https://localhost:5001/Bff/Customers';
    return this.http.get<string[]>(url,{ headers: {'client':'modern'}})
        .toPromise()
        .then(data => data);
}
}
