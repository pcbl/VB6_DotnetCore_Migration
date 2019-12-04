import { TestBed } from '@angular/core/testing';

import { BffService } from './bff.service';

describe('BffService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BffService = TestBed.get(BffService);
    expect(service).toBeTruthy();
  });
});
