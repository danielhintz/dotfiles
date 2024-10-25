// ==UserScript==
// @name Cookie Monster
// @namespace Cookie
// @include http://orteil.dashnet.org/cookieclicker/
// @include https://orteil.dashnet.org/cookieclicker/
// @version 1
// @grant none
// ==/UserScript==
(function() {
    const checkReady = setInterval(function() {
        if (typeof Game.ready !== 'undefined' && Game.ready) {
            Game.LoadMod('https://aktanusa.github.io/CookieMonster/CookieMonster.js');
            clearInterval(checkReady);
        }
    }, 1000);
})();

