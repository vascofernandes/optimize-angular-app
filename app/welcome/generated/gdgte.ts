
import {Component} from '@angular/core'

@Component({
  selector: 'd-gdgte',
  template: `
    <span [attr.aria-label]="msg" [hidden]="false">This is a dummy component for Gdgte</span>
    <div (click)="doNothing($event)"></div>
    `,
})
export class Gdgte {
    msg: string = 'nothing to say';
    doNothing(evt: any) {}
}
