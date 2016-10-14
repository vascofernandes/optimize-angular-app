
import {Component} from '@angular/core'

@Component({
  selector: 'd-uvbqi',
  template: `
    <span [attr.aria-label]="msg" [hidden]="false">This is a dummy component for Uvbqi</span>
    <div (click)="doNothing($event)"></div>
    `,
})
export class Uvbqi {
    msg: string = 'nothing to say';
    doNothing(evt: any) {}
}
