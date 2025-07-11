import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GetTaskById } from './get-task-by-id';

describe('GetTaskById', () => {
  let component: GetTaskById;
  let fixture: ComponentFixture<GetTaskById>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GetTaskById]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GetTaskById);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
