import { Observable } from '../../Observable';
import { pairwise } from '../../operator/pairwise';
Observable.prototype.pairwise = pairwise;
