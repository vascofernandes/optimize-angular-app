
import {Component} from '@angular/core'

@Component({
  selector: 'd-niiqz',
  template: `
    <span [attr.aria-label]="msg" [hidden]="false">This is a dummy component for Niiqz</span>
    <div (click)="doNothing($event)"></div>
    `,
})
export class Niiqz {
    msg: string = 'nothing to say';
    doNothing(evt: any) {}
}
