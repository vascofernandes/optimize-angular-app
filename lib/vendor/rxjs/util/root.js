/**
 * window: browser in DOM main thread
 * self: browser in WebWorker
 * global: Node.js/other
 */
export const /** @type {?} */ root = (typeof window == 'object' && window.window === window && window
    || typeof self == 'object' && self.self === self && self
    || typeof global == 'object' && global.global === global && global);
if (!root) {
    throw new Error('RxJS could not find any global context (window, self, global)');
}
